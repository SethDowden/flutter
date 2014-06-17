task :populate => :environment do
	password = "password"
	User.populate 100 do |user|
	  user.full_name = Faker::Name.name
	  user.username = Faker::Internet.user_name.gsub(/(\.)/, ' ')
	  user.location = Faker::Address.city
	  user.website = Faker::Internet.url
	  user.bio = Faker::Lorem.sentences(1, true)
	  user.email = Faker::Internet.email
	  user.encrypted_password = User.new(:password => password).encrypted_password   
	  user.sign_in_count = 0
	end
end

task :tweet => :environment do
	User.all.each do |user|
		rand = Random.new.rand(3..20)
		Tweet.populate rand do |tweet|
			tweet.tweet = user.bio = Faker::Lorem.sentences(2)
			tweet.created_at = (rand(400)).days.ago
			tweet.user_id = user.id
		end 
	end
end

task :fallow => :environment do 
	User.all.each do |user|
		User.all.count
		rand(3..20).times do |t|
			
			fallowing = []
			user.following.each do |u|
				fallowing << u.id
			end

			x = rand(0..User.all.count)
			while fallowing.any? { |int| int == x }
					x = rand(0..User.all.count)
			end
			rel = Relationship.new 
			rel.follower_id = user.id
			rel.followed_id = x
			rel.save
		end
	end
end