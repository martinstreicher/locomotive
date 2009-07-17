#/ 
# Initializers
#
initializer 'object_mods.rb', <<-OBJECT
  class Object
    def isnt_a?( klass )
      !self.is_a?( klass )
    end
  
    def not_blank?
      !self.blank?
    end  
  
    def not_nil?
      !self.nil?
    end
  end
OBJECT

initializer 'string_mods.rb', <<-STRING
  class String
    def not_blank?
      !self.blank?
    end
  end
STRING

initializer 'array_mods.rb',  <<-ARRAY
  class Array
    def not_empty?
      !self.empty?
    end
  
    def includes?( *list )
      return false if self.empty?
      list = [ list ] unless list.is_a?( Array )
      return false if list.empty?
      return !( list.collect { | item | self.include?( item ) }.include?( false ) )
    end
  end
ARRAY

initializer 'float_mods.rb'   <<-FIXNUM
  class Fixnum  
    def not_zero?
      !self.zero?
    end
  end
FIXNUM

initializer 'hash_mods.rb'    <<-HASH
  class Hash
    def not_empty?
      !self.empty?
    end
  end
HASH

