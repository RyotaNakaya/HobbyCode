# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Postdatum.create(category:"サンプル1", amount:1000 , date:"1/1")
# Postdatum.create(category:"サンプル2", amount:2000 , date:"1/2")
# Postdatum.create(category:"サンプル3", amount:3000 , date:"1/3")

# CategoryConfig.create(category1:"大分類1", category2:"小分類1", disp_order: 1)
# CategoryConfig.create(category1:"大分類2", category2:"小分類2", disp_order: 2)
# CategoryConfig.create(category1:"大分類3", category2:"小分類3", disp_order: 3)

CategoryGrp.create(category_grp_name:"食費", disp_order: 1)
CategoryGrp.create(category_grp_name:"日用雑貨", disp_order: 2)
CategoryGrp.create(category_grp_name:"交通費", disp_order: 3)

CategoryConfig.create(category_name:"朝食", disp_order: 1, category_grp_id:1)
CategoryConfig.create(category_name:"昼食", disp_order: 2, category_grp_id:1)
CategoryConfig.create(category_name:"夕食", disp_order: 3, category_grp_id:1)
CategoryConfig.create(category_name:"食料品", disp_order: 4, category_grp_id:1)
CategoryConfig.create(category_name:"消耗品", disp_order: 1, category_grp_id:2)
CategoryConfig.create(category_name:"タクシー代", disp_order: 1, category_grp_id:3)
CategoryConfig.create(category_name:"鉄道", disp_order: 2, category_grp_id:3)