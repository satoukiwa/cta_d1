class TrainLogsController < ApplicationController
  def index
    @train_logs = TrainLog.page(params[:page]).per(10)

    render("train_logs/index.html.erb")
  end

  def show
    @train_log = TrainLog.find(params[:id])

    render("train_logs/show.html.erb")
  end

  def new
    @train_log = TrainLog.new

    render("train_logs/new.html.erb")
  end

  def create
    @train_log = TrainLog.new

    @train_log.train_number = params[:train_number]
    @train_log.station_name = params[:station_name]
    @train_log.stop_name = params[:stop_name]
    @train_log.train_locationbasestation = params[:train_locationbasestation]
    @train_log.record_time = params[:record_time]
    @train_log.train_locationmileage = params[:train_locationmileage]

    save_status = @train_log.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/train_logs/new", "/create_train_log"
        redirect_to("/train_logs")
      else
        redirect_back(:fallback_location => "/", :notice => "Train log created successfully.")
      end
    else
      render("train_logs/new.html.erb")
    end
  end

  def edit
    @train_log = TrainLog.find(params[:id])

    render("train_logs/edit.html.erb")
  end

  def update
    @train_log = TrainLog.find(params[:id])

    @train_log.train_number = params[:train_number]
    @train_log.station_name = params[:station_name]
    @train_log.stop_name = params[:stop_name]
    @train_log.train_locationbasestation = params[:train_locationbasestation]
    @train_log.record_time = params[:record_time]
    @train_log.train_locationmileage = params[:train_locationmileage]

    save_status = @train_log.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/train_logs/#{@train_log.id}/edit", "/update_train_log"
        redirect_to("/train_logs/#{@train_log.id}", :notice => "Train log updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Train log updated successfully.")
      end
    else
      render("train_logs/edit.html.erb")
    end
  end

  def destroy
    @train_log = TrainLog.find(params[:id])

    @train_log.destroy

    if URI(request.referer).path == "/train_logs/#{@train_log.id}"
      redirect_to("/", :notice => "Train log deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Train log deleted.")
    end
  end
end
