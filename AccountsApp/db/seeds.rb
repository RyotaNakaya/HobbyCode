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

# CategoryGrp.create(category_grp_name:"食費", disp_order: 1)
# CategoryGrp.create(category_grp_name:"日用雑貨", disp_order: 2)
# CategoryGrp.create(category_grp_name:"交通費", disp_order: 3)
CategoryGrp.create(category_grp_name:"交際費", disp_order: 4)
CategoryGrp.create(category_grp_name:"エンタメ", disp_order: 5)
CategoryGrp.create(category_grp_name:"教育・教養", disp_order: 6)

# CategoryConfig.create(category_name:"朝食", disp_order: 1, category_grp_id:1)
# CategoryConfig.create(category_name:"昼食", disp_order: 2, category_grp_id:1)
# CategoryConfig.create(category_name:"夕食", disp_order: 3, category_grp_id:1)
# CategoryConfig.create(category_name:"食料品", disp_order: 4, category_grp_id:1)
# CategoryConfig.create(category_name:"消耗品", disp_order: 1, category_grp_id:2)
Category.create(category_name:"子供関連", disp_order: 2, category_grp_id:2)
Category.create(category_name:"ペット関連", disp_order: 3, category_grp_id:2)
# CategoryConfig.create(category_name:"タクシー代", disp_order: 1, category_grp_id:3)
# CategoryConfig.create(category_name:"鉄道", disp_order: 2, category_grp_id:3)
Category.create(category_name:"バス", disp_order: 3, category_grp_id:3)
Category.create(category_name:"飛行機", disp_order: 4, category_grp_id:3)
Category.create(category_name:"飲み会", disp_order: 1, category_grp_id:4)
Category.create(category_name:"プレゼント", disp_order: 2, category_grp_id:4)
Category.create(category_name:"ご祝儀・香典", disp_order: 3, category_grp_id:4)
Category.create(category_name:"レジャー", disp_order: 1, category_grp_id:5)
Category.create(category_name:"イベント", disp_order: 2, category_grp_id:5)
Category.create(category_name:"映画", disp_order: 3, category_grp_id:5)
Category.create(category_name:"書籍", disp_order: 4, category_grp_id:5)
Category.create(category_name:"習い事", disp_order: 1, category_grp_id:6)
Category.create(category_name:"新聞", disp_order: 2, category_grp_id:6)
Category.create(category_name:"参考書", disp_order: 3, category_grp_id:6)
Category.create(category_name:"受験料", disp_order: 4, category_grp_id:6)
Category.create(category_name:"学費", disp_order: 5, category_grp_id:6)