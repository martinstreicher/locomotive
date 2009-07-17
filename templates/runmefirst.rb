
run "gem sources -a http://gems.github.com"
run "rm public/index.html"

inside( 'config' ) do 
  run "cp database.yml database.yml.default"  
  run "cp environment.rb environment.rb.default"  
end  

