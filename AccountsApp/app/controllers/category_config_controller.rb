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

  # def self.get_all_category_grp
  #   ctg_grp = CategoryGrp.all
  #   return ctg_grp
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
