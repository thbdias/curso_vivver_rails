# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando os tipos de contatos(Kinds)..."
Kind.create!([{description: "Amigo"}, 
    {description: "Contato"}, 
    {description: "Comercial"}])
puts "Gerando os tipos de contatos(Kinds)...[OK]"


puts "Gerando os contatos(Contacts)..."
10.times do |i|    
    Contact.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email,
        kind: Kind.all.sample, #pegando um kind aleatório como exemplo
        rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample) #escolhendo de 1 a 5 paragrafos
    )
end
puts "Gerando os contatos(Contacts)...[OK]"