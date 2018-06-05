class TrainStatusesController < ApplicationController
  def index
    @q = TrainStatus.ransack(params[:q])
    @train_statuses = @q.result(:distinct => true).page(params[:page]).per(10)

    render("train_statuses/index.html.erb")
  end

  def show
    @train_status = TrainStatus.find(params[:id])

    render("train_statuses/show.html.erb")
  end

  def new
    @train_status = TrainStatus.new

    render("train_statuses/new.html.erb")
  end

  def create
    @train_status = TrainStatus.new

    @train_status.train_number = params[:train_number]
    @train_status.status = params[:status]

    save_status = @train_status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/train_statuses/new", "/create_train_status"
        redirect_to("/train_statuses")
      else
        redirect_back(:fallback_location => "/", :notice => "Train status created successfully.")
      end
    else
      render("train_statuses/new.html.erb")
    end
  end

  def edit
    @train_status = TrainStatus.find(params[:id])

    render("train_statuses/edit.html.erb")
  end

  def update
    @train_status = TrainStatus.find(params[:id])

    @train_status.train_number = params[:train_number]
    @train_status.status = params[:status]

    save_status = @train_status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/train_statuses/#{@train_status.id}/edit", "/update_train_status"
        redirect_to("/train_statuses/#{@train_status.id}", :notice => "Train status updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Train status updated successfully.")
      end
    else
      render("train_statuses/edit.html.erb")
    end
  end

  def destroy
    @train_status = TrainStatus.find(params[:id])

    @train_status.destroy

    if URI(request.referer).path == "/train_statuses/#{@train_status.id}"
      redirect_to("/", :notice => "Train status deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Train status deleted.")
    end
  end
end
