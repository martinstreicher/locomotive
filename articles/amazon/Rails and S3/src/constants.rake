require 'fileutils'

def move( file_name )
  directory = File.dirname( file_name ) 
  basename  = File.basename( file_name )
  extension = File.extname( basename )
  rootname  = File.basename( file_name, extension )
  time_code = File.stat( file_name ).mtime.strftime( "%m%d%Y%H%M%S" )
  
  new_name  = File.join( directory, "#{rootname}_#{time_code}#{extension}" )
  FileUtils.mv( file_name, new_name )
  
  [ basename, new_name ]
end

def list( file_name, excluded = [] )
  ( modified = Array.new ) << if File.directory?( file_name )
    Dir.open( "#{ file_name }" ).map do | file |
      next if file.match(/^\.+/)
      next if excluded.include?( File.extname( file ).downcase )
      
      list( "#{ file_name }/#{ file }", excluded )
    end
  else
    file_name 
  end
end  

namespace :constants do
  source = File.join( RAILS_ROOT, 'app', 'assets' )
  destination = File.join( RAILS_ROOT, 'public' )
  target = File.join( RAILS_ROOT, 'config', 'initializers', 'constants.rb' )
  excluded = %w( cgi html rb fcgi ico txt ).map { |ext| ".#{ext}".downcase }
  
  desc "Generate a list of constants, one for each static asset"
  task :generate do 
    FileUtils.rm_f ( target )
    FileUtils.cp_r( source, destination )
    target_file = File.new( target, 'w' )

    list( destination, excluded ).flatten.compact.map { 
      |file| move( file ) }.each { | c |
        constant = c.first.to_s.gsub( '.', '_' ).upcase
        value = c.last.gsub( "#{RAILS_ROOT}/public", '' )
        target_file.puts "#{constant} = '#{value}'" }
  end
  
  desc "Delete your public folder"
  task :clean do 
    FileUtils.rm_f ( target )
    FileUtils.rm_r( destination, { :force => true } )
  end
end
