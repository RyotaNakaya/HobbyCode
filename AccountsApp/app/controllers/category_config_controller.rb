class CategoryConfigController < ApplicationController
  layout "category"

  def index
    @title = "家計簿ホーム"
    @category = CategoryConfig.order("disp_order ASC").all
  end

  def self.get_all_category
    ctg = CategoryConfig.all
    return ctg
  end

  def self.get_all_category_grp
    ctg_grp = CategoryGrp.all
    return ctg_grp
  end

  def self.get_category_array
    ctg = CategoryConfig.order("disp_order ASC").all
    ctg_array = Array.new
    for obj in ctg do
      ctg_array.push(Array.new([obj.category_name, obj.id]))
    end
    return ctg_array
  end

  def self.get_category_array(ctg_grp_id)
    all_ctg = CategoryConfig.order("disp_order ASC").all
    ctg_array = Array.new
    for obj in all_ctg do
      if (obj.category_grp_id == ctg_grp_id)
          ctg_array.push(Array.new([obj.category_name, obj.id]))
      end
    end
    return ctg_array
  end

  def self.get_category_grp_array
    ctg_grp = CategoryGrp.order("disp_order ASC").all
    ctg_grp_array = Array.new
    for obj in ctg_grp do
      ctg_grp_array.push(Array.new([obj.category_grp_name, obj.id]))
    end
    return ctg_grp_array
  end

  # Ajax処理を行う処理
  def change_ctg
    # render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
    # render json: self.get_category_array(data)
    @ctg_array = get_category_array(params[:ctg_grp_id])
  end


end
