# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 新增一名用户
puts "新建一名 user"
User.delete_all
User.create(email: "chanweiyan007@gmail.com",
            password: "12345678",
            password_confirmation: "12345678")

puts "新增10个group"
Group.delete_all
10.times do |i|
  Group.create(title: "No.#{i + 1} group",
               description: "#{i + 1} group's description",
               user_id: User.last.id)
end

puts "为每个group新增10个post"
Post.delete_all
Group.all.each do |group|
  10.times do |i|
    Post.create(content: "post #{i}: This is post content.",
                group_id: group.id,
                user_id: User.last.id)
  end
end
