class CategoryConfigController < ApplicationController
  layout "category"

  def index
    @title = "家計簿ホーム"
    @category = Category.order("disp_order ASC").all
  end
end
