#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mcrypt.h>

char *encode( char *string, int length );
char *decode( char *string, int length );

MCRYPT start() {
	MCRYPT td = mcrypt_module_open( "des", NULL, "ecb", NULL );
  if ( td == MCRYPT_FAILED ) {
  	return( MCRYPT_FAILED );
	}
	
	if ( mcrypt_enc_self_test( td ) != 0 ) {
		return( MCRYPT_FAILED );
	}

  int i;
	char *IV;
	int iv_size = mcrypt_enc_get_iv_size( td );
	if ( iv_size != 0 ) {
		IV = calloc( 1, iv_size );
		for ( i = 0; i < iv_size; i++ ) {
	    IV[ i ] = rand();
		}
	}

	int keysize = mcrypt_enc_get_key_size( td );
	char *key = calloc( 1, keysize );
	memcpy(key, "hzdC50ZX", keysize);
	
	i = mcrypt_generic_init ( td, key, keysize, IV );
	if ( i < 0 ) {
		mcrypt_perror( i );
		exit(1);
	}

	return( td );
}


void end( MCRYPT td ) {
	mcrypt_generic_deinit( td );
	mcrypt_module_close( td );
}


#define B64_DEF_LINE_SIZE   72
#define B64_MIN_LINE_SIZE    4

/*
** encode 3 8-bit binary bytes as 4 '6-bit' characters
*/
void encodeblock( unsigned char in[3], unsigned char out[4], int len ) {
    static const char cb64[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    out[0] = cb64[ in[0] >> 2 ];
    out[1] = cb64[ ((in[0] & 0x03) << 4) | ((in[1] & 0xf0) >> 4) ];
    out[2] = (unsigned char) (len > 1 ? cb64[ ((in[1] & 0x0f) << 2) | ((in[2] & 0xc0) >> 6) ] : '=');
    out[3] = (unsigned char) (len > 2 ? cb64[ in[2] & 0x3f ] : '=');
}


char *base64encode( char *input, int size ) {
    int i, x, len;
    unsigned char in[3], out[4];
    char *target = calloc( 1, ( ( size + 2 ) / 3 ) * 4 + 1 );
    char *t = target;
    
    for ( x = 0; x < size; ) {
        len = 0;

        for( i = 0; i < 3; i++ ) {
            if ( x < size ) {
                len++;
	            in[i] = input[x++];
            }
            else {
                in[i] = 0;
            }
        }
        
        if( len ) {
            encodeblock( in, out, len );
            for( i = 0; i < 4; i++ ) {
                *t++ = out[i];
            }
        }
    }
    
    return( target );
}


char *encode( char *string, int length ) {
	MCRYPT td = start();
	int blocksize = mcrypt_enc_get_block_size( td );
	int cryptsize = ( ( length  + blocksize - 1 ) / blocksize ) * blocksize;
	char *target = calloc( 1,  cryptsize );

	memcpy( target, string, length );
		
	if ( mcrypt_generic( td, target, cryptsize ) != 0 ) {
			fprintf( stderr, "Code failing" );
	}
	
	end( td );
	
	char* result = base64encode( target, cryptsize );
	
	free( target );
	return result;
}

char *decode( char *string, int length ) {
	MCRYPT td = start();
	int blocksize = mcrypt_enc_get_block_size( td );
	char *block_buffer = calloc( 1, blocksize );
  int decryptlength = (length + blocksize - 1) / blocksize * blocksize;
	char *target = calloc( 1, decryptlength );

  memcpy(target, string, length);

	mdecrypt_generic( td, target, decryptlength ); 

	end( td );

	free(block_buffer);
	return( target );
}


