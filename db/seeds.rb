Category.delete_all
Weapon.delete_all

puts "Generating records of categories and weapons..."

# {Category: [Weapon1, Weapon2, ...]}
WEAPONS_WITH_CATEGORIES = [
  {"Roller"    => ["Carbon Roller", "Splat Roller", "Dynamo Roller", "Flingza Roller", "Hero Roller Replica"]},
  {"Shooter"   => ["Splat Shooter", "Aerospray MG"]},
  {"Charger"   => ["Splat Charger"]},
  {"Dualies"   => ["Splat Dualies"]},
  {"Splatling" => ["Heavy Splatling"]},
  {"Brella"    => ["Splat Brella"]},
  {"Slosher"   => ["Tri-Slosher"]}
]

WEAPONS_WITH_CATEGORIES.each do |weapons_with_category|
  ActiveRecord::Base.transaction do
    weapons_with_category.each do |category, weapons|
      created_category = Category.create!(name: category)
      weapons.each do |weapon|
        created_category.weapons.create!(name: weapon)
      end
    end
  end
end

puts "Done."
