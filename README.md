# clone-my-repositories
Clone all my repositories from GitHub

- http://addyosmani.com/blog/backing-up-a-github-account/
  - Option 1 rewritten as [gitback.rb](gitback.rb) to practice in ruby
  - Option 2 is great (it also backs up gists and wikis)
  - Option 3 is what I need
    - there is `github-backup` package in Ubuntu for this option
    - which is broken in 15.04
      - and [fixed upsteam][opt-parsing-fix]

[opt-parsing-fix]: https://github.com/joeyh/github-backup/commit/4d98ee317ddc62e410a5294528e3ce5eaf17e25f
