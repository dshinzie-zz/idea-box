User.destroy_all
Idea.destroy_all
Category.destroy_all

IDEAS = ["Make a startup", "Don't make a startup", "Get a Job", "Stay unemployed", "Drink Coffee"]
CATEGORIES = ["Personal", "Finance", "Career", "Hobbies", "Funny"]

CATEGORIES.each do |catg|
  Category.create!(name: catg, description: catg)
end

admin = User.create!(name: "admin", password: "admin", email: "admin", is_admin: true)
default = User.create!(name: "default", password: "default", email: "default", is_admin: false)

IDEAS.each do |idea|
  admin.ideas.create!(name: idea, description: "What an okay idea!", category: Category.all.sample)
  default.ideas.create!(name: idea, description: "What an okay idea!", category: Category.all.sample)
end
