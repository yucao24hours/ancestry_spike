Category.delete_all
Weapon.delete_all

puts "Generating records of categories and weapons..."

CATEGORY_A = {
  category: "CATEGORY_A",
  weapons_with_categories: [
    {category: "Roller", weapons: ["Carbon Roller", "Splat Roller", "Dynamo Roller", "Flingza Roller", "Hero Roller Replica"]},
    {category: "Shooter", weapons: ["Splat Shooter", "Aerospray MG"]},
    {category: "Charger", weapons: ["Splat Charger"]}
  ]
}

CATEGORY_B = {
  category: "CATEGORY_B",
  weapons_with_categories: [
    {category: "Dualies", weapons: ["Splat Dualies"]},
    {category: "Splatling", weapons: ["Heavy Splatling"]}
  ]
}

CATEGORY_C = {
  category: "CATEGORY_C",
  weapons_with_categories: [
    {category: "Brella", weapons: ["Splat Brella"]},
    {category: "Slosher", weapons: ["Tri-Slosher"]}
  ]
}

[CATEGORY_A, CATEGORY_B, CATEGORY_C].each do |cate|
  ActiveRecord::Base.transaction do
    root_category = Category.create!(name: cate[:category])

    cate[:weapons_with_categories].each do |weapons_with_category|
      child_category = root_category.children.create!(name: weapons_with_category[:category])

      weapons_with_category[:weapons].each do |weapon|
        child_category.weapons.create!(name: weapon)
      end
    end
  end
end

puts "Done."
