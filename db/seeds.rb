# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.destroy_all
Project.create!([{
  title: "build a rails project",
  tasks:[{
      title: "design the database",
      content: "make at least 4 tables",
      status: "start"
      }]
},
{
  title: "practise devops",
  tasks:[{
      title: "watch past videos",
      content: "download first",
      status: "no"
      }]
},
{
  title: "make an iphone app",
  tasks:[{
      title: "look at the design",
      content: "check if it's usable",
      status: "no"
      }]
}
]);
Note.destroy_all
Note.create!([{
  content: "efficient today"
},
{
  content: "it's snowing"
},
{
  content: "so difficult"
}
]);
