# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

story = Story.where(title: "A magic tale of foxes in the woods").first_or_create

sentence1 = Sentence.where(story: story, content: "One upon a time, in the great black forest, there lived a great big great fox.", position: 1).first_or_create
sentence2 = Sentence.where(story: story, content: "The fox spent his days hunting for food, and bathing in the large falls.", position: 2).first_or_create