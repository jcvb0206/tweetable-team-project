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
t1 = Tweet.create(body:"Mi primer tweet de usuario 1",user_id: u1.id)
t2 = Tweet.create(body:"Mi segundo tweet de usuario 1",user_id: u1.id)
t3 = Tweet.create(body:"Mi primer tweet de usuario 2",user_id: u2.id)
t4 = Tweet.create(body:"Mi segundo tweet de usuario 2",user_id: u2.id)
t5 = Tweet.create(body:"Mi tercer tweet de usuario 2",user_id: u2.id)
t6 = Tweet.create(body:"Mi tweet de usuario 2 sin parent_id",user_id: u2.id)
# rails db:reset -> rails db:seeds
# sudo service postgresql restart

t1.replies << t3
t1.replies << t4
t1.replies << t5