# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Organization.create([
	{name:'Other Institutes'},
	{name:'XYZ Public Service', address: 'Nungambakkam,Chennai', phone: '044-23329232'},
	{name:'Akshaya Patra', address:'Adyar,Chennai',phone: '044-23235467'}
])
