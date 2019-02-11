# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create! email: 'nelson@mail.com',
                     password: '123',
                     name: 'Nelson',
                     role: 'admin'

primary = User.create! email: 'visitor@ext.com',
                       password: '123',
                       name: 'Tom',
                       role: 'registered'

secondary = User.create! email: 'visitor2@ext.com',
                         password: '123',
                         name: 'Bob',
                         role: 'registered'

alt = User.create! email: 'visitor3@ext.com',
                   password: '123',
                   name: 'Dick',
                   role: 'registered'

images = ['https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/747964/pexels-photo-747964.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://www.outdoorphotographer.com/images/stories/2016/may/landscapes/lead.jpg']

5.times do |x|
  Idea.create! title: "Idea #{x}",
               done_count: x,
               description: "This is an idea created by #{primary.name} and is his number #{x} idea",
               photo_url: images[x],
               user: primary
end
5.times do |x|
  Idea.create! title: "Idea #{x}",
               done_count: x,
               description: "This is an idea created by #{secondary.name} and is his number #{x} idea",
               photo_url: images[x],
               user: secondary
end
5.times do |x|
  Idea.create! title: "Idea #{x}",
               done_count: x,
               description: "This is an idea created by #{alt.name} and is his number #{x} idea",
               photo_url: images[x],
               user: alt
end

admin.goals << primary.ideas.first
admin.goals << secondary.ideas.first
admin.goals << alt.ideas.first
