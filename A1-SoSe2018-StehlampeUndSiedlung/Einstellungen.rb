$BYE = 'bye'
$PADX = 5
$METHODS = :Methoden
$INSTANCES = :Instanzen
$BACKGROUND_COLOR = 'white'
$INSPECTOR = 'Inspektor'
$FILEMENU = 'Datei'
$CLASSMENU = 'Klassen'

require './EinstellungenStehlampeUndSiedlung'

# DIE REIHENFOLGE DARF NICHT GEÄNDERT WERDEN
# VARIABLE $CLASSES MUSS DEFINIERT SEIN
# Metaprogrammierung: generischer Instancecount

class Object
  def intern_to_s()
    to_s()
  end
end

class InstanceCounter
  class << self
    attr_reader :instances
    attr_writer :instances
  end

  def instance_count()
    self.class.instances ||=0
    self.class.instances +=1
  end

end


# Hier wird für alle registrierten Klassen in $CLASSES
# der  InstanceCounter  eingebunden
# Metaprogrammierung: generischer Instancecount

$CLASSES.each do |class_sym|
  self.class.const_set(class_sym, Class.new(InstanceCounter) {
    def intern_to_s()
      string = self.class.to_s()
      string[0] = string[0,1].downcase
      return "#{string}_#{@nummer}"
    end

    def self.method_added(p)
      # Ergänzt initialize um den Instance Count
      if (p == :initialize)
        if (!@initialize_hooked)
          @initialize_hooked = true
          module_eval{
            alias :alias_initialize :initialize
            define_method(:initialize) {|*args|
              alias_initialize(*args)
              @nummer = instance_count() if !@nummer
            }
          }
        end
      end
    end
  })
end

require './StehLampe'
require './Haus'
require './Siedlung'

