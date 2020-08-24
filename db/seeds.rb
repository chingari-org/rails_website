# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all()

PASSWORD = "supersecret" 

admin = User.create( 
    name: "Sansa Stark", 
    username: "sansastark",
    email: "ladysansa@winterfell.gov", 
    password: PASSWORD,
    role: 10,
    tier: 1
) 

moderator = User.create( 
    name: "Arya Stark", 
    username: "aryastark",
    email: "noone@winterfell.gov", 
    password: PASSWORD,
    role: 8,
    tier: 1
) 

premium_user = User.create( 
    name: "Robb Stark", 
    username: "robbstark",
    email: "robb@winterfell.gov", 
    password: PASSWORD,
    role: 0,
    tier: 1
) 

free_user = User.create( 
    name: "Jon Snow", 
    username: "jonsnow",
    email: "jon@winterfell.gov", 
    password: PASSWORD,
    role: 0,
    tier: 0
) 
