class HomeController < ApplicationController
    require "date"
    layout "home"

    def index
        if request.post? then
        else
            @title = "家計簿ホーム"
            @newpostdata = Postdatum.new
            date = Date.today
            @ctg_grp_array = CategoryConfigController.get_category_grp_array
            all_ctg = CategoryConfigController.get_all_category
            def_ctg_grp_id =  CategoryConfigController.get_all_category_grp[0].id
            @ctg_array = CategoryConfigController.get_category_array(def_ctg_grp_id)
            # @ctg_array = Array.new
            # for obj in all_ctg do
            #     if (obj.category_grp_id == def_ctg_grp_id)
            #         @ctg_array.push(Array.new([obj.category_name, obj.id]))
            #     end
            # end
            show
            get_chart_by_month(date)
        end
      end

    def show
        @postdata = Postdatum.order("date DESC, created_at DESC").all.limit 5
    end

    def get_chart_by_month(d)
        # ToDo カテゴリマスタから取得する
        category_mst = ["食費", "日用雑貨", "交通費", "交際費", "エンタメ", "その他"]
        @chart_datas = Array.new
        all_postdata = Postdatum.where(date: d.beginning_of_month..d.end_of_month)
        all_amounts = Postdatum.where(date: d.beginning_of_month..d.end_of_month).sum("amount")
        for category in category_mst do
            category = category
            chart_data = Array.new
            amount_by_category = 0
            # amount_by_category = Postdatum.where(date: d.beginning_of_month..d.end_of_month).where(category: "" + category + "").sum("amount")
            for obj in all_postdata do
                if (obj.category == category)
                    amount_by_category += obj.amount
                end
            end

            rate = (amount_by_category / all_amounts.to_f).round(2) * 100
            @chart_datas.push(chart_data.push(category, amount_by_category, rate))
        end
        return @chart_datas
    end


    def history
        @title = "家計簿履歴"
        @allpostdata = Postdatum.order("date DESC, created_at DESC").all
    end

    def create
        if request.post? then
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

    # Ajax処理を行う処理
    def change_ctg
        # render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
        # render json: self.get_category_array(data)
        @ctg_array = get_category_array(params[:ctg_grp_id])
    end

    private
    def goback
        redirect_to("/home/index")
    end

    def newpostdata_params
        params.require(:postdatum).permit(:category, :amount, :date, :remark)
    end

    def postdata_params
        params.require(:postdatum).permit(:category, :amount, :date, :remark)
    end

end
