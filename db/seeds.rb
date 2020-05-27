# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

musical_adjectives = ["Jazz", "Country", "Latin", "Blues", "Classical", "Rap", "Disco", "Instrumental", "Ambient",
                      "Soul", "Gospel", "Reggae", "Alternative", "Indie", "Rock", "Metal", "Baroque", "Romantic",
                      "Renaissance", "Ceremonial", "Folk", "World", "Bluegrass", "Electronic", "Opera", "Choral", "Blues",
                      "Pop", "Punk", "Loud", "Soft", "Brassy", "Gentle", "Natural", "Melodious", "Raucous",
                      "Strong", "Smooth", "Rich", "Distinct", "Deep", "Thick", "Mellow", "Shrill", "Reedy",
                      "Thin", "Breathy", "Rounded", "Full", "Clear", "Piercing", "Strident", "Harsh", "Warm",
                      "Resonant", "Bright", "Dark", "Flat", "Light", "Soothing", "Exciting", "Relaxing", "Stimulating",
                      "Calm", "Enlightening", "Frighten", "Invigorating", "Rejuvenating", "Restoritive", "Healing",
                      "Empowering", "Stiring", "Exhilarating", "Uplifting"]

musical_adjectives = musical_adjectives.collect{|adjective| adjective.downcase}

roots = [ "B", "C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb" ]
modes = ["I", "II", "III", "IV", "V", "VI", "VII"]

# will make at most 6300 and at minimum 168 feeling records in database
def get_feelings(musical_adjectives)
  [].tap do |a|
    rand(2..15).times do
      adjective = musical_adjectives.sample
      rand(1..5).times do
        a << adjective
      end
    end
  end
end

roots.each do |root|
  modes.each do |mode|
    scale = Scale.find_or_create_by("root" => root, "mode" => mode)
    get_feelings(musical_adjectives).each do |feeling|
      scale.feelings.create("adjective" => feeling)
    end
  end
end
