class CategoryConfigController < ApplicationController
  layout "category"

  def index
    @title = "家計簿ホーム"
    @category = Category.order("disp_order ASC").all
  end

  def self.get_all_category
    ctg = Category.all
    return ctg
  end

  def self.get_category_array
    ctg = Category.order("disp_order ASC").all
    ctgArray = Array.new
    for obj in ctg do
      ctgArray.push(Array.new([obj.category1, obj.category2, obj.id]))
    end
    return ctgArray
  end


end
