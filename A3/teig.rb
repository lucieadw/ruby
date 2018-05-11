class Teig
  def initialize()
    @teig = %w(Mürbeteig Blätterteig Biskuitteig Rührteig).sample
  end

  def to_string()
     "besteht aus #{@teig}"
  e