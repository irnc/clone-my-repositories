#gitback 0.1
#credits: Walter White, Updates: Addy Osmani
#!/usr/bin/env ruby
# dependencies
require "json"
require "open-uri"
# your github username
username = "irnc"
time = Time.new
# feel free to comment out the option you don't wish to use.
backupDirectory = "~/backups/github/#{time.year}.#{time.month}.#{time.day}"
#or simply: backupDirectory = "/backups/github/"
#repositories =
# .map{|r| %Q[#{r[:name]}] }
#FileUtils.mkdir_p #{backupDirectory}

# https://developer.github.com/v3/repos/#list-user-repositories
JSON.load(open("https://api.github.com/users/#{username}/repos")).map{|repository|
  puts "discovered repository: #{repository["name"]} ... backing up ..."
  system "git clone git@github.com:#{username}/#{repository["name"]}.git #{backupDirectory}/#{repository["name"]}"
}
