# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

warehouses = Warehouse.create(
  [
    { 
      city: 'Windsor',
      zipcode: 'N9B2N6',
      address: '779 Partington Ave',
      contact_number: '2269754175' 
    },
    { 
      city: 'Brampton',
      zipcode: 'NY765H',
      address: 'Hamilton Towers',
      contact_number: '9417840075' 
    }
  ]
)
