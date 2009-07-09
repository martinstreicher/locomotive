require 'base64'
require 'secret'

def compare( s1, s2 )
  a1 = Array.new
  a2 = Array.new
  s1.each_byte { |b| a1 << b }
  s2.each_byte { |b| a2 << b }
  a1.each_index { |i| 
    puts "#{a1[i].chr} #{a2[i].chr} differ" if a1[i] != a2[i]
  }  
end


#
# Problem 1: Decode an encrypted message 
#
plaininput = '<16445.1233423914@montague.terra.com>'
secret = 'FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jviXLBgOlwwnWA=='
plainout = Secret.decode( Base64.decode64( secret ) )
puts "Problem 1: " + ( ( plainout == plaininput )  ? 'Success' : 'Failure' )


#
# Problem 2: Decode a short message that is first encoded
#
plaininput = '<16445.1233423914@montague.terra.com>'
secret = Base64.decode64( Secret.encode( plaininput ) ).unpack('c*')
plainout = Secret.decode( secret.pack('c*') )
puts "Problem 2: " + ( ( plainout == plaininput )  ? 'Success' : 'Failure' )


#
# Problem 3: Decode a long encrypted message
# 
plaininput = '<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email=|user_pop=POA|pop_assinante=POA|timezone=|dt_nascimento=17/12/76|cidade=strCity|uf=RS|pais=|sexo=|cd_area_interesse=|rango_edad=4|antispam=T+T+T|mail_autoreply=T|antivirus=T+T|mail_imap=2_ALLOWED+T|mail_smart=T+T|mail_manage_mailboxes=F|mail_redirect=T|mail_filter_sms=-1|quota_caixa=5000|mail_folders_limit=|cd_nic_datacenter=MOC|'
secret = 'FidtGuIXX29mFQIwTSJuTWvYNQ3VkAbgOHn4gSG/jvj9n5DQakPFD07VzkRUzmu0QhkrPct6XoawrMqrxUsOjH7sJZnIowy5LoDm5Umf+3797FZW4oD5P3mB8fzfPxuDAUg8SJIApO2mL+cTjFmtrMmbEZSrPa6G+D+sXfUx75zyUxA13meCW7IEOv6+VbI0ifHfThcMjR6EGWVJgVoHSrVD3lpzWxImacTCfezgaEyq2wy/zlNeBU3deRmSKSQEQfSifpgD+t/E4RZO/Ia1KSYqjHc+h1eS9/9pK+kpqZknUn6+P09B3pqQr58Z2fJJbh2JtTJ9aRRnLfN4hveaIYuPs19HMYccJd9YcbGHdleLkJIRZDrhxqeD/Su79vd4cxj9XO5/ODjoXw1rn0ZCzlZSTyW2E36g7QEPD9aMv5zGzy7gXB4bbnNSSd5wbWJCh8b2J1V8sqYKhbLboDdgH+TBvkBMUeM0b8CSg8F7WRJCbO1NAg2zkdKRrjg8PQ3h0uCZJOEma9AObZJRgKGb/0EneOMYvz9D/aYdIiD6X1yFqiBJbyv9IqWfxCFdVpNQ'
plainout = Secret.decode( Base64.decode64( secret ) )
puts "Problem 3: "  + ( ( plainout.eql? plaininput )  ? 'Success' : 'Failure' )


#
# Problem 4: Decode a long message that is first encoded 
#
plaininput = "<16445.1233423914@montague.terra.com>|id_perm=38937485#perm!terra|short_name=coredot|nome=|email=|user_pop=POA|pop_assinante=POA|timezone=|dt_nascimento=17/12/76|cidade=strCity|uf=RS|pais=|sexo=|cd_area_interesse=|rango_edad=4|antispam=T+T+T|mail_autoreply=T|antivirus=T+T|mail_imap=2_ALLOWED+T|mail_smart=T+T|mail_manage_mailboxes=F|mail_redirect=T|mail_filter_sms=-1|quota_caixa=5000|mail_folders_limit=|cd_nic_datacenter=MOC|"
secret = Base64.decode64( Secret.encode( plaininput ) ).unpack( 'c*' )
plainout = Secret.decode( secret.pack( 'c*' ) )
puts "Problem 4: " + ( ( plainout == plaininput )  ? 'Success' : 'Failure' )

# puts plainout


#
# EXTRA TESTS
# 
plaininput = "Loremipsumdolorsitamet,consecteturadipiscingelit.Crasetegestaspurus.Pellentesqueeuerattortor.Praesentduinulla,gravidacongueiaculiseget,convallisvitaelibero.Etiaminterdumsemquismaurisfaucibuscongue.Curabiturconsequatmaurisnonlectuscommodoatlobortismassadignissim.Duistemporullamcorpermetus,atporttitorrisusvolutpatet.Aliquameratvolutpat.Integernisilorem,pretiuminmetus."
secret = Base64.decode64( Secret.encode( plaininput ) ).unpack( 'c*' )
plainout = Secret.decode( secret.pack( 'c*' ) )
puts "Extra 1: " + ( ( plainout == plaininput )  ? 'Success' : 'Failure' )
# puts plainout

plaininput = 'x' * 428
secret = Base64.decode64( Secret.encode( plaininput ) ).unpack( 'c*' )
plainout = Secret.decode( secret.pack( 'c*' ) )
puts "Extra 2: " + ( ( plainout == plaininput )  ? 'Success' : 'Failure' )
