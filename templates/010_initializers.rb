#/ 
# Initializers
#

initializer 'object_mods.rb', <<-CODE
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
CODE

initializer 'string_mods.rb', <<-CODE
class String
  def not_blank?
    !self.blank?
  end
end
CODE

initializer 'array_mods.rb',  <<-CODE
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
CODE

initializer 'float_mods.rb',  <<-CODE
class Float
  def not_zero?
    !self.zero?
  end
end
CODE

initializer 'hash_mods.rb',   <<-CODE
class Hash
  def not_empty?
    !self.empty?
  end
end
CODE