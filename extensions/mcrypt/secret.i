%module secret

%include "typemaps.i"

%{
#include "ruby.h"
%}

%newobject encode;
%newobject decode;
%apply (char *STRING, int LENGTH) { ( char *string, int length ) };

char *encode( char *string, int length );
char *decode( char *string, int length );
void echo( char *string, int length );
