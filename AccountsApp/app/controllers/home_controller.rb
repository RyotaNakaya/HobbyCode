class HomeController < ApplicationController
    require "date"
    layout "home"

    def index
        if request.post? then
        else
            @title = "家計簿ホーム"
            @newpostdata = Postdatum.new
            date = Date.today
            @ctg_array = CategoryConfigController.get_category_array
            # def_ctg_grp_id =  CategoryConfigController.get_all_category_grp[0].id
            puts @ctg_array
            def_ctg_id =  @ctg_array[0][1]
            @sub_ctg_array = CategoryConfigController.get_sub_category_array(def_ctg_id)
            @def_sub_ctg_id = @sub_ctg_array[0][1]
            show
            get_chart_by_month(date)
        end
      end

    def show
        @postdata = Postdatum.order("date DESC, created_at DESC").all.limit 5
        # @postdata.each do |data|
        #     puts "#{data.date}"
        #     puts "#{data.category_id}"
        #     puts "#{data.category.category_name}"
        # end
        # puts "#@postdata"
        # Category.joins(:postdatum).select("postdata.*, categories.*").each do |postdata|
        #     puts "#{postdata.category} : #{postdata.category_id}"
        # end
    end

    def get_chart_by_month(d)
        @chart_datas = Array.new
        ctg_mst = CategoryConfigController.get_all_category
        sub_ctg_mst = CategoryConfigController.get_all_sub_category
        all_postdata = Postdatum.where(date: d.beginning_of_month..d.end_of_month)
        all_amounts = Postdatum.where(date: d.beginning_of_month..d.end_of_month).sum("amount")
        if (all_amounts.to_f != 0)
            for ctg in ctg_mst do
                category_id = ctg.id
                puts "カテゴリIDは"
                puts category_id
                chart_data = Array.new
                amount_by_category = 0
                for obj in all_postdata do
                    puts "ポストデータのカテゴリIDは"
                    puts obj.category_id
                    parent_id = CategoryConfigController.get_parent_category_id(obj.category_id).parent_id
                    puts "取得した親はID"
                    puts parent_id
                    if (parent_id == category_id)
                        amount_by_category += obj.amount
                    end
                end

                rate = (amount_by_category / all_amounts.to_f).round(2) * 100
                @chart_datas.push(chart_data.push(ctg.ctg_name, amount_by_category, rate))
            end
            return @chart_datas
        else 
            # return false
        end
    end


    def history
        @title = "家計簿履歴"
        @allpostdata = Postdatum.order("date DESC, created_at DESC").all
    end

    def create
        if request.post? then
            puts newpostdata_params
            Postdatum.create(newpostdata_params)
        end
        goback
    end

    def edit
        @title = "家計簿修正"
        @postdata = Postdatum.find(params[:id])
    end
    
    def update
        obj = Postdatum.find(params[:id])
        obj.update(postdata_params)
        redirect_to "/home/history"
    end
    
    def delete
        obj = Postdatum.find(params[:id])
        obj.destroy
        redirect_to "/home/history"
    end

    # Ajax処理でカテゴリを取得する
    def change_ctg
        @ctg_array = CategoryConfigController.get_sub_category_array(params[:ctg_id].to_i)
        render json: { ctg_array: @ctg_array}
    end

    private
    def goback
        redirect_to("/home/index")
    end

    def newpostdata_params
        params.require(:postdatum).permit(:category_id, :amount, :date, :remark)
    end

    def postdata_params
        params.require(:postdatum).permit(:category_id, :amount, :date, :remark)
    end

end
