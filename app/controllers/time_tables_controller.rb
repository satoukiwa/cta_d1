class TimeTablesController < ApplicationController
  def index
    @q = TimeTable.ransack(params[:q])
    @time_tables = @q.result(:distinct => true).page(params[:page]).per(10)

    render("time_tables/index.html.erb")
  end

  def show
    @time_table = TimeTable.find(params[:id])

    render("time_tables/show.html.erb")
  end

  def new
    @time_table = TimeTable.new

    render("time_tables/new.html.erb")
  end

  def create
    @time_table = TimeTable.new

    @time_table.train_number = params[:train_number]
    @time_table.station_name = params[:station_name]
    @time_table.stop_name = params[:stop_name]
    @time_table.arrival_time = params[:arrival_time]
    @time_table.departure_time = params[:departure_time]
    @time_table.stop_id = params[:stop_id]
    @time_table.date = params[:date]

    save_status = @time_table.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/time_tables/new", "/create_time_table"
        redirect_to("/time_tables")
      else
        redirect_back(:fallback_location => "/", :notice => "Time table created successfully.")
      end
    else
      render("time_tables/new.html.erb")
    end
  end

  def edit
    @time_table = TimeTable.find(params[:id])

    render("time_tables/edit.html.erb")
  end

  def update
    @time_table = TimeTable.find(params[:id])

    @time_table.train_number = params[:train_number]
    @time_table.station_name = params[:station_name]
    @time_table.stop_name = params[:stop_name]
    @time_table.arrival_time = params[:arrival_time]
    @time_table.departure_time = params[:departure_time]
    @time_table.stop_id = params[:stop_id]
    @time_table.date = params[:date]

    save_status = @time_table.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/time_tables/#{@time_table.id}/edit", "/update_time_table"
        redirect_to("/time_tables/#{@time_table.id}", :notice => "Time table updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Time table updated successfully.")
      end
    else
      render("time_tables/edit.html.erb")
    end
  end

  def destroy
    @time_table = TimeTable.find(params[:id])

    @time_table.destroy

    if URI(request.referer).path == "/time_tables/#{@time_table.id}"
      redirect_to("/", :notice => "Time table deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Time table deleted.")
    end
  end
end
