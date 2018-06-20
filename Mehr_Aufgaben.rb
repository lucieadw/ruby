numbers = [8,[[0]],9,[7,2,[6,4,[10],4],1],[[[4]]],[]]

class Array
    # Alle Zahlen zusammen addieren
    def sum
        # TODO
    end
    
    # Alle Zahlen flach und sortiert
    def flat_sort
        # TODO
    end
    
    # Kleinste Zahl
    def deep_min
        # TODO
    end
    
    # Den Durchschnitt errechnen
    def deep_avg
        # TODO
    end
end

p numbers.sum # => 55
p numbers.flat_sort # => [0, 1, 2, 4, 4, 4, 6, 7, 8, 9, 10]
p numbers.deep_min # => 0
p numbers.deep_avg # => 5

##################################################
##################################################
##################################################

random_hash = {6=>2, 4=>{5=>{9=>1}}, {{{9=>1}=>7}=>54}=>{67=>{3=>5}}, {}=>{}}

class Hash
    # Alle Zahlen zusammen addieren
    def sum
        # TODO
    end
    
    # Alle Zahlen flach und sortiert
    def flat_sort
        # TODO
    end
    
    # Kleinste Zahl
    def deep_min
        # TODO
    end
    
    # Den Durchschnitt errechnen
    def deep_avg
        # TODO
    end
end

p random_hash.sum # => 173
p random_hash.flat_sort # => [1, 1, 2, 3, 4, 5, 5, 6, 7, 9, 9, 54, 67]
p random_hash.deep_min # => 1
p random_hash.deep_avg # => 13.307692307692308
