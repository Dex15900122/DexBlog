10.times do |blog|
  Blog.create!(title:"My Blog Post #{blog}",
                body:"If you're used to using raw SQL to find database records, then you will generally find that there are better ways to carry out the same operations in Rails. Active Record insulates you from the need to use SQL in most cases. "
                )
end

puts "10 blog post created"

5.times do |skill|
  Skill.create!(title: "rails #{skill}",
                percent_utilized: 15
                )
end                  

puts "5 skill created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: "My great service",
    body: "qwewqeqweqwdstyht",
    main_image: "http://via.placeholder.com/600x300",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "9 portfolio items created"
