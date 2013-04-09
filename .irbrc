IRB.conf[:AUTO_INDENT] = true

def ls
  Dir.entries '.'
end

def pwd
  Dir.pwd
end

def cd(path)
  Dir.chdir(path)
end

class Object
  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

