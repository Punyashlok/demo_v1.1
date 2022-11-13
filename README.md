# README

Dev Dependecies

- Ruby 2.7.0
- Postgres

App Features

- Currently one can add an alias name and paste a link greater than 30 characters in the home page
- View All Created links will show alias, tiny URL and long URL of all links created
- Clicking tiny URL, re-directs to long URL
- tiny URL can be pasted like -> localhost:3000/tinyURL , will redirect to long URL
- Shows the number of times a link is visited

Notes

- The click counter renders double the number of the times the link is actually visited.
- Using RSpec for tests and shoulda matchers. https://github.com/thoughtbot/shoulda-matchers#rspec
