# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Farmer.create!(username:"richard", name:"richard chang", password:"password")
Farmer.create!(username:"dan", name:"dan kane", password:"password1")
Farmer.create!(username:"likable", name:"uberdanger", password:"password2")

Comment.create!(content:"The tomatos are good.")
Comment.create!(content:"The corn is expensive.")
Comment.create!(content:"Lots of fresh food as always.")

Item.create!(name:"tomato", value: "1.23", weight: "100", location: "Red Hollow", farmer_id: 1)
Item.create!(name:"potato", value: "0.50", weight: "200", location: "Grounds Up Farm", farmer_id: 1)
Item.create!(name:"lemon", value: "0.33", weight: "300", location: "Yellow Farm", farmer_id: 1)

