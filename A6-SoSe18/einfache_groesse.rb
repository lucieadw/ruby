require_relative './einheiten_groesse'

module EinfacheGroesse
  include EinheitenGroesse

  def von_basis(wert)
    self.class.new(wert / spezifischer_faktor.to_f)
  end

  def superclass_check(klazz)
    raise ArgumentError, "#{klazz} ist entweder keine Klasse oder keine
Subklasse von #{common_supertype()}" if !klazz.is_a?(Class) ||
        !klazz.ancestors.include?(common_supertype)
  end

  def umrechnen_in(ziel_groesse_typ)
    superclass_check(ziel_groesse_typ)
    ziel_groesse_typ.new.von_basis(in_basis())
  end
end