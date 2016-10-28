User.destroy_all
Idea.destroy_all
Category.destroy_all

USERS = ["test1", "test2", "test3", "tes4", "test5"]
IDEAS = ["idea1", "idea2", "idea3", "idea4", "idea5"]
CATEGORIES = ["catg1", "catg2", "catg3", "catg4", "catg5"]
IS_ADMIN = [true, false]

CATEGORIES.each do |catg|
  Category.create!(name: CATEGORIES.sample)
end

USERS.each do |name|
  user = User.create!(name: name, password: name, email: name, is_admin: IS_ADMIN.sample)
  5.times do |num|
    user.ideas.create!(name: IDEAS.sample, description: "What a great idea!", category: Category.all.sample)
  end
end
