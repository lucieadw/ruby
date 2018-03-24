# puts "Hello World!"
# #puts "Penis"
#
# print "Wie heißt du: "
# name = gets.chomp
#
# print "Wie alt bist du: "
# age = gets.to_i
#
# print "Wo wohnst du: "
# place = gets.chomp
#
# puts "-------------"
#
# puts "Name: " + name + "\nAlter: " + age.to_s + "\nWohnort: " + place
#
# if place.downcase == "hamburg"
#   puts "Herzlichen Glückwunsch!"
# end

# people = ["Lucie","Ponnes"]
#
# visitor = ""
# while visitor != "-" do
#   visitor = gets.chomp
#   people << visitor
# end
#
# puts "---------------"
# puts "Heute sind da:"
# for person in people
#   puts person
# end

def pali(word)
  for i in 0..((word.length - 1) / 2)
    if word[i] != word[word.length - 1 - i]
      return false
    end
  end
  true
end

word1 = "annaq"
word2 = "ottos"

puts pali word1
puts pali word2
