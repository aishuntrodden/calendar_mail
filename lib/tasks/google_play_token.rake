namespace :google_play_token do
    desc "Refresh google play access token"
    task :refresh => :environment do
        puts "Refreshing..."
        GooglePlayToken.first.refresh!
        puts "Done"
    end

end	