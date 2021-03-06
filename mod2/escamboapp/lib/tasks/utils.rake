namespace :utils do


  desc "Setup Development"
  task setup_dev: :environment do
    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD...  #{%x(rake db:drop)} "  #system ou backticks ou %x
    puts "CRIANDO BD... #{%x(rake db:create)} "
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake utils:generate_admins)
    puts %x(rake utils:generate_members)
    puts %x(rake utils:generate_ads)

    puts "Setup executado com sucesso!"
  end

  

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando o Administradores Padrão..."

    10.times do
      Admin.create!(
        name: Faker::Name.name, 
        email: Faker::Internet.email, 
        password: "123456",
        password_confirmation: "123456",
        role: [0,1].sample 
      )
    end

    puts "Administradores cadastrados com sucesso!"
  end



  desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando o Membros..."

    10.times do
      Member.create!(        
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
      )
    end

    puts "Membros cadastrados com sucesso!"
  end




  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando o Anúncios..."

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)}, #{Random.rand(99)}",
        #avatar: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpeg",), 'r')
        avatar: File.new(Rails.root.join('public', 'templates', 'images-for-ads', '0.jpeg',), 'r')
      )
    end

    puts "Anúncios cadastrados com sucesso!"
  end

end
