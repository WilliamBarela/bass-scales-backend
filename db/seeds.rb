# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roots = [ "B", "C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb" ]
modes = ["I", "II", "III", "IV", "V", "VI", "VII"]

roots.each do |root|
  modes.each do |mode|
    Scale.find_or_create_by("root" => root, "mode" => mode)
  end
end
