class StopDataController < ApplicationController
  def index
    @stop_data = StopDatum.all

    render("stop_data/index.html.erb")
  end

  def show
    @stop_datum = StopDatum.find(params[:id])

    render("stop_data/show.html.erb")
  end

  def new
    @stop_datum = StopDatum.new

    render("stop_data/new.html.erb")
  end

  def create
    @stop_datum = StopDatum.new

    @stop_datum.station_name = params[:station_name]
    @stop_datum.stop_name = params[:stop_name]
    @stop_datum.long = params[:long]
    @stop_datum.lat = params[:lat]
    @stop_datum.stop_id = params[:stop_id]
    @stop_datum.map_id = params[:map_id]
    @stop_datum.direction_id = params[:direction_id]
    @stop_datum.mileage = params[:mileage]

    save_status = @stop_datum.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/stop_data/new", "/create_stop_datum"
        redirect_to("/stop_data")
      else
        redirect_back(:fallback_location => "/", :notice => "Stop datum created successfully.")
      end
    else
      render("stop_data/new.html.erb")
    end
  end

  def edit
    @stop_datum = StopDatum.find(params[:id])

    render("stop_data/edit.html.erb")
  end

  def update
    @stop_datum = StopDatum.find(params[:id])

    @stop_datum.station_name = params[:station_name]
    @stop_datum.stop_name = params[:stop_name]
    @stop_datum.long = params[:long]
    @stop_datum.lat = params[:lat]
    @stop_datum.stop_id = params[:stop_id]
    @stop_datum.map_id = params[:map_id]
    @stop_datum.direction_id = params[:direction_id]
    @stop_datum.mileage = params[:mileage]

    save_status = @stop_datum.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/stop_data/#{@stop_datum.id}/edit", "/update_stop_datum"
        redirect_to("/stop_data/#{@stop_datum.id}", :notice => "Stop datum updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Stop datum updated successfully.")
      end
    else
      render("stop_data/edit.html.erb")
    end
  end

  def destroy
    @stop_datum = StopDatum.find(params[:id])

    @stop_datum.destroy

    if URI(request.referer).path == "/stop_data/#{@stop_datum.id}"
      redirect_to("/", :notice => "Stop datum deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Stop datum deleted.")
    end
  end
end
