# README

* This is a very simple API app, including only one controller with two methods:
GET /api/v1/pages - this method does not need any params, it presents all of the pages created by the next method
POST /api/v1/pages- this method needs page param with url param (a proper url). Then it does its magic in the background (downloading all of the needed info like link hrefs and h1, h2 and h3 inner html content)

* There is no special configuration, just use Ruby 2.x, migrate the database and run rails server.

* There are some tests written as well, you can launch them just by calling rake.
