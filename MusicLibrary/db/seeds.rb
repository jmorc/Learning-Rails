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

lazy_j = Band.find_by_name("Lazy Janey")
lazy_j.albums.create( name: "Sleepy Day", year: 1978, live: true )
lazy_j.albums.create( name: "Sunny Nap", year: 1989, live: false )
lazy_j.albums.create( name: "Dream Pudding", year: 2004, live: true )

old97s = Band.find_by_name("Old 97s")
a = old97s.albums.create( name: "Too Far too care", year: 1978, live: true )
b = old97s.albums.create( name: "Drag it up", year: 1989, live: false )
c = old97s.albums.create( name: "Knock knock", year: 2004, live: true )

a.tracks.create( name: "Dandy Dancer", bonus: false, lyrics: "la la do" )
b.tracks.create( name: "Soleme", bonus: false, lyrics: "do wa la do" )
c.tracks.create( name: "Cha Cha Time", bonus: true, lyrics: "do do dum dum" )