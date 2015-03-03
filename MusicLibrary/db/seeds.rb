# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bands = Band.create([{ name: "Filmore Slim"}, 
	                 { name: "Lazy Janey"}, 
	                 { name: "Old 97s"}])

filmore_slim = Band.find_by_name("Filmore Slim")
filmore_slim.albums.create( name: "Groovey Time", year: 1978, live: true )
filmore_slim.albums.create( name: "Funky Time", year: 1982, live: false )
filmore_slim.albums.create( name: "All the Time", year: 1986, live: true )