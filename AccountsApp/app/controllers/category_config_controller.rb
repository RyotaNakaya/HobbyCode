class CategoryConfigController < ApplicationController
  layout "category"

  def index
    @title = "家計簿ホーム"
    @category = Category.order("disp_order ASC").all
  end

  def self.get_all_category
    ctg = Category.where("sub_flg=?", 0).order("disp_order ASC")
    return ctg
  end

  def self.get_all_sub_category
    ctg = Category.where("sub_flg=?", 1).order("disp_order ASC")
    return ctg
  end

  def self.get_parent_category_id(sub_ctg_id)
    parent_id = Category.select("parent_id").find(sub_ctg_id)
    return parent_id
  end

  # def self.get_category_with_parent(postArray)
  #   category_with_parent = Category.select("categories.*, B.ctg_name AS parent_name, B.disp_order AS parent_order").joins("LEFT OUTER JOIN categories AS B ON categories.parent_id = B.id")
  #   puts "結合したテーブルの中身は"
  #   puts category_with_parent
  #   # for obj in category_with_parent do
  #   #   puts "カテゴリ名は"
  #   #   puts obj.ctg_name
  #   #   puts "親カテゴリ名は"
  #   #   puts obj.parent_name
  #   # end
  #   posts_array = []
  #   for post in postArray do
  #     post_hash = post.attributes
  #     for obj in category_with_parent do
  #       if (post_hash["category_id"] == obj.id)
  #         post_hash["parent_name"] = obj.parent_name
  #         puts "カテゴリ名は"
  #         puts post_hash["parent_name"]
  #       end
  #     end
  #     posts_array.push(post_hash)
  #   end
  #   puts posts_array
  # end

  def self.get_category_array
    ctg = Category.where("sub_flg=?", 0).order("disp_order ASC").all
    ctg_array = Array.new
    for obj in ctg do
      ctg_array.push(Array.new([obj.ctg_name, obj.id]))
    end
    return ctg_array
  end

  def self.get_sub_category_array
    ctg = Category.where("sub_flg=?", 1).order("disp_order ASC").all
    sub_ctg_array = Array.new
    for obj in ctg do
      sub_ctg_array.push(Array.new([obj.ctg_name, obj.id]))
    end
    return sub_ctg_array
  end

  def self.get_sub_category_array(parent_id)
    all_ctg = Category.order("disp_order ASC").all
    sub_ctg_array = Array.new
    for obj in all_ctg do
      if (obj.parent_id == parent_id)
        sub_ctg_array.push(Array.new([obj.ctg_name, obj.id]))
      end
    end
    return sub_ctg_array
  end

  # def self.get_category_grp_array
  #   ctg_grp = CategoryGrp.order("disp_order ASC").all
  #   ctg_grp_array = Array.new
  #   for obj in ctg_grp do
  #     ctg_grp_array.push(Array.new([obj.category_grp_name, obj.id]))
  #   end
  #   return ctg_grp_array
  # end


end
