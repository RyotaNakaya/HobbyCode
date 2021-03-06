class HomeController < ApplicationController
    require "date"
    layout "home"

    def index
            @title = "家計簿ホーム"
            @newpostdata = Postdatum.new
            date = Date.today
            @year = Date.today.strftime("%Y")
            @month = Date.today.strftime("%m")
            @ctg_array = CategoryConfigController.get_category_array
            def_ctg_id =  @ctg_array[0][1]
            @sub_ctg_array = CategoryConfigController.get_sub_category_array(def_ctg_id)
            # @def_sub_ctg_id = @sub_ctg_array[0][1]
            get_chart_by_month(@year, @month)
            @postdata = show
    end

    def show
        postdata = Postdatum.order("created_at DESC").all.limit 5
        # CategoryConfigController.get_category_with_parent(@postdata)
        return postdata
    end

    def show_by_month(y, m)
        postdata = Postdatum.where("strftime('%Y', date) = ? AND strftime('%m', date) = ?", y.to_s, m.to_s).order("date DESC, created_at DESC")
        return postdata
    end

    def history
        @title = "家計簿履歴"
        # @year_month = Date.today.strftime("%Y-%m")
        @year = Date.today.strftime("%Y")
        @month = Date.today.strftime("%m")
        @allpostdata = show_by_month(@year, @month)
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
        @selected_sub_ctg_id = @postdata.category_id
        @selected_ctg_id = CategoryConfigController.get_parent_category_id(@selected_sub_ctg_id).parent_id
        @ctg_array = CategoryConfigController.get_category_array
        @sub_ctg_array = CategoryConfigController.get_sub_category_array(@selected_ctg_id)
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

    def grid_input
        # 
    end

    def get_chart_by_month(y, m)
        @chart_datas = Array.new
        ctg_mst = CategoryConfigController.get_all_category
        sub_ctg_mst = CategoryConfigController.get_all_sub_category
        # all_postdata = Postdatum.where(date: d.beginning_of_month..d.end_of_month)
        all_postdata = Postdatum.where("strftime('%Y', date) = ? AND strftime('%m', date) = ?", y.to_s, m.to_s)
        all_amounts = Postdatum.where("strftime('%Y', date) = ? AND strftime('%m', date) = ?", y.to_s, m.to_s).sum("amount")

        if (all_amounts.to_f != 0)
            for ctg in ctg_mst do
                category_id = ctg.id
                # puts "カテゴリIDは"
                # puts category_id
                chart_data = Array.new
                amount_by_category = 0
                for obj in all_postdata do
                    # puts "ポストデータのカテゴリIDは"
                    # puts obj.category_id
                    parent_id = CategoryConfigController.get_parent_category_id(obj.category_id).parent_id
                    # puts "取得した親はID"
                    # puts parent_id
                    if (parent_id == category_id)
                        amount_by_category += obj.amount
                    end
                end

                rate = ((amount_by_category / all_amounts.to_f) * 100).round(2)
                @chart_datas.push(chart_data.push(ctg.ctg_name, amount_by_category, rate))
            end
            return @chart_datas
        else 
            # return false#データが0件だった時の処理
        end

        render
    end


    # Ajax処理でカテゴリを取得する
    def change_ctg
        @ctg_array = CategoryConfigController.get_sub_category_array(params[:ctg_id].to_i)
        render json: { ctg_array: @ctg_array}
    end

    # Ajax処理で月の変更後の結果を取得する
    def change_month
        v = params[:button]
        y = params[:this_year].to_i
        m = params[:this_month].to_i
        # ここで変更後の月と年を取得
        after_data = get_after_month(v, y, m)

        @year = after_data[:year]
        @month = after_data[:month]
        @allpostdata = show_by_month(@year, @month)
        render
    end
    
    # Ajax処理で月の変更後のグラフ結果を取得する
    def change_month_chart
        v = params[:button]
        y = params[:this_year].to_i
        m = params[:this_month].to_i
        # ここで変更後の月と年を取得
        after_data = get_after_month(v, y, m)

        @year = after_data[:year]
        @month = after_data[:month]
        @chart_datas = get_chart_by_month(@year, @month)
        render
    end

    private
    def goback
        redirect_to("/home/index")
    end

    def get_after_month(v, y, m)
        if (v == "prev_month")
            new_y = y
            new_m = m-1
            if (new_m == 0)
                new_y = y-1
                new_m = 12
            end
        else (v == "next_month")
            new_y = y
            new_m = m+1
            if (new_m == 13)
                new_y = y+1
                new_m = 1
            end
        end
        return {year: new_y, month: new_m}
    end
    
    def newpostdata_params
        params.require(:postdatum).permit(:category_id, :amount, :date, :remark)
    end
    
    def postdata_params
        params.require(:postdatum).permit(:category_id, :amount, :date, :remark)
    end
    
end
