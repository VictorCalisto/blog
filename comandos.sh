rails generate scaffold Article title:string body:text  publication_date:date
rails generate scaffold Category name:string --plural=categories
rails generate migration AddCategoryIdToArticles category:references
