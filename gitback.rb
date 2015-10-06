#gitback 0.1
#credits: Walter White, Updates: Addy Osmani
#!/usr/bin/env ruby
# dependencies
require "json"
require "open-uri"
require "uri"
# your github username
username = "irnc"
time = Time.new
# feel free to comment out the option you don't wish to use.
backupDirectory = "~/backups/github/#{time.year}.#{time.month}.#{time.day}"
#or simply: backupDirectory = "/backups/github/"
#repositories =
# .map{|r| %Q[#{r[:name]}] }
#FileUtils.mkdir_p #{backupDirectory}

page = 1
per_page = 30

total = 0

loop do
  # https://developer.github.com/v3/repos/#list-user-repositories
  params = URI.encode_www_form("page" => page, "per_page" => per_page)
  repositories = JSON.load(open("https://api.github.com/users/#{username}/repos?#{params}"))
  repositories.map{|repository|
    puts "discovered repository: #{repository["name"]} ... backing up ..."
    system "git clone git@github.com:#{username}/#{repository["name"]}.git #{backupDirectory}/#{repository["name"]}"
  }

  total += repositories.count
  page += 1

  break if repositories.count < per_page
end

puts "Total number of received repositories: #{total}"
