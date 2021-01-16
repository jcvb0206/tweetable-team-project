# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u1 = User.create!({:name=>"guy",
                   :username=>"guyi",
                   :email => "guy@gmail.com",
                   :role => 0, :password => "123456",
                   :password_confirmation => "123456",
                   })
u2 = User.create!({:name=>"leo",
                    :username=>"leodan",
                    :email => "leo@gmail.com",
                    :role => 0, :password => "123456",
                    :password_confirmation => "123456" 
                   })
 
#t1 = Tweet.create(body: "haha i am u1")
#t1.user_id = u1.id
t1 = Tweet.create(body:"haha",user_id: u1.id)
t2 = Tweet.create(body:"haha2",user_id: u2.id)

# rails db:reset -> rails db:seeds
# sudo service postgresql start

t1.replies << t2