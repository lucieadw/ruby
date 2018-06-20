class Object

  def abstract()
    # ermittelt den Namen der aufrufenden Methode
    caller()[0]=~/.*`(.*)'/
    raise AbstractMethodError, "Methode #{$1.to_sym()} muss für #{self.class} implementiert sein"
  end

end

class AbstractMethodError < Exception
end