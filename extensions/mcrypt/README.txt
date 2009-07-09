[O] Problem Statement #1.

Given...

... the encryption key... 
hzdC50ZX

... and an encrypted and base64-encoded string...
FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jviXLBgOlwwnWA==

... the Ruby code should produce the plain text string:
<16445.1233423914@montague.terra.com>



[O] Problem Statement #2. 

Given...

... the same encryption key as before...

... and the plain text string....

<16445.1233423914@montague.terra.com>

... the Ruby code should encrypt and decrypt the plain text string to produce...

<16445.1233423914@montague.terra.com>



[O] Problem Statement #3. 

Given ...

... the same encryption key as before...

... and the base64-encoded, encrypted string...

FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jvj9n5DQakPFD07VzkRUzmu0QhkrPct6XoawrMqrxUsOjH7sJZnIowy5LoDm5Umf+3797FZW4oD5P3mB8fzfPxuDAUg8SJIApO2mL+cTjFmtrMmbEZSrPa6G+D+sXfUx75zyUxA13meCW7IEOv6+VbI0ifHfThcMjR6EGWVJgVoHSrVD3lpzWxImacTCfezgaEyq2wy/zlNeBU3deRmSKSQEQfSifpgD+t/E4RZO/Ia1KSYqjHc+h1eS9/9pK+kpqZknUn6+P09B3pqQr58Z2fJJbh2JtTJ9aRRnLfN4hveaIYuPs19HMYccJd9YcbGHdleLkJIRZDrhxqeD/Su79vd4cxj9XO5/ODjoXw1rn0ZCzlZSTyW2E36g7QEPD9aMv5zGzy7gXB4bbnNSSd5wbWJCh8b2J1V8sqYKhbLboDdgH+TBvkBMUeM0b8CSg8F7WRJCbO1NAg2zkdKRrjg8PQ3h0uCZJOEma9AObZJRgKGb/0EneOMYvz9D/aYdIiD6X1yFqiBJbyv9IqWfxCFdVpNQ

.. the Ruby code should decrypt the string to produce the plain text:

<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email=|user_pop=POA|pop_assinante=POA|timezone=|dt_nascimento=17/12/76|cidade=strCity|uf=RS|pais=|sexo=|cd_area_interesse=|rango_edad=4|antispam=T+T+T|mail_autoreply=T|antivirus=T+T|mail_imap=2_ALLOWED+T|mail_smart=T+T|mail_manage_mailboxes=F|mail_redirect=T|mail_filter_sms=-1|quota_caixa=5000|mail_folders_limit=|cd_nic_datacenter=MOC|



[X] Problem Statement #4

Given...

... the same encryption string as before

... and the plain text string....

<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email=|user_pop=POA|pop_assinante=POA|timezone=|dt_nascimento=17/12/76|cidade=strCity|uf=RS|pais=|sexo=|cd_area_interesse=|rango_edad=4|antispam=T+T+T|mail_autoreply=T|antivirus=T+T|mail_imap=2_ALLOWED+T|mail_smart=T+T|mail_manage_mailboxes=F|mail_redirect=T|mail_filter_sms=-1|quota_caixa=5000|mail_folders_limit=|cd_nic_datacenter=MOC|

... the Ruby code should encrypt and decrypt the plain text string to produce:

<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email=|user_pop=POA|pop_assinante=POA|timezone=|dt_nascimento=17/12/76|cidade=strCity|uf=RS|pais=|sexo=|cd_area_interesse=|rango_edad=4|antispam=T+T+T|mail_autoreply=T|antivirus=T+T|mail_imap=2_ALLOWED+T|mail_smart=T+T|mail_manage_mailboxes=F|mail_redirect=T|mail_filter_sms=-1|quota_caixa=5000|mail_folders_limit=|cd_nic_datacenter=MOC|

BUT THIS FAILS. IT EMITS

<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email??????N?

where ??????N? are (or are likely) non-ascii characters.



[] Other stuff

On Mac...

Given... mcrypt v2.6.8 installed in /opt/local/lib/libmcrypt.dylib and /opt/local/include/mcrypt.h...

# Compile
$ cc -o mcrypt mcrypt.c -L/opt/local/lib -I/opt/local/include -lmcrypt

# mcrypt is reflexive
$ ./mcrypt < data/prob1_output.txt | ./mcrypt -d 
<16445.1233423914@montague.terra.com>

# Base64 decode and then decryption works OK? Yes
$ openssl enc -dcrypt -d < data/prob1_input.txt | ./mcrypt 
<16445.1233423914@montague.terra.com>
$ cat data/prob1_output.txt
<16445.1233423914@montague.terra.com>

# Encryption and then Base64 encoding is OK? MAYBE
$ ./mcrypt < data/prob1_output.txt | openssl enc -base64 
FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jvj0U1xzmvlsoA==
$ cat data/prob1_input.txt
FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jviXLBgOlwwnWA==

# Encryption to Base64 encoding to Base64 decoding to decryption works OK? Yes
$ ./mcrypt < data/prob1_output.txt | openssl enc -base64 \
  | openssl enc -d -base64 | ./mcrypt -d
<16445.1233423914@montague.terra.com>


Oddly... 

Given another string of 428 characters... 

Problem #4 works fine. 



