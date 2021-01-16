
# User.all[0]

U = User.find(0)
@u1 = User.find(1)
@u2 = User.find(2)
@t1 = Tweet.find(1)
@t2 = Tweet.find(2)
@t1.replies << @t2

# load 'test.rb'
# @u = User.where('last_name = ?', 'Spock').first

# User.find(1).Tweet.create(body: "defrente")
# User.find(1).tweets << Tweet.create(body: "defrente")


# Tweet.create(body: "defrente").users << User.find(3)    # works and make sense

# User.find(2).tweets << Tweet.create(body: "rttj")    # does not works but seems to be close
# User.find(1).liked_tweets << Tweet.find(2)

User.find(2).tweets << Tweet.create(body: "tercero")

Tweet.find(2).replies << User.find(1).tweets.create(body: "astronomico")
# rails db:seed
# puts JSON.pretty_generate User.find(2).tweets.map(&:attributes)
# Each tweet_count should not count parent -> how ?