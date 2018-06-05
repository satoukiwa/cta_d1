class IntStatLensController < ApplicationController
  def index
    @int_stat_lens = IntStatLen.page(params[:page]).per(10)

    render("int_stat_lens/index.html.erb")
  end

  def show
    @int_stat_len = IntStatLen.find(params[:id])

    render("int_stat_lens/show.html.erb")
  end

  def new
    @int_stat_len = IntStatLen.new

    render("int_stat_lens/new.html.erb")
  end

  def create
    @int_stat_len = IntStatLen.new

    @int_stat_len.dstopid = params[:dstopid]
    @int_stat_len.astopid = params[:astopid]
    @int_stat_len.distance = params[:distance]

    save_status = @int_stat_len.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/int_stat_lens/new", "/create_int_stat_len"
        redirect_to("/int_stat_lens")
      else
        redirect_back(:fallback_location => "/", :notice => "Int stat len created successfully.")
      end
    else
      render("int_stat_lens/new.html.erb")
    end
  end

  def edit
    @int_stat_len = IntStatLen.find(params[:id])

    render("int_stat_lens/edit.html.erb")
  end

  def update
    @int_stat_len = IntStatLen.find(params[:id])

    @int_stat_len.dstopid = params[:dstopid]
    @int_stat_len.astopid = params[:astopid]
    @int_stat_len.distance = params[:distance]

    save_status = @int_stat_len.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/int_stat_lens/#{@int_stat_len.id}/edit", "/update_int_stat_len"
        redirect_to("/int_stat_lens/#{@int_stat_len.id}", :notice => "Int stat len updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Int stat len updated successfully.")
      end
    else
      render("int_stat_lens/edit.html.erb")
    end
  end

  def destroy
    @int_stat_len = IntStatLen.find(params[:id])

    @int_stat_len.destroy

    if URI(request.referer).path == "/int_stat_lens/#{@int_stat_len.id}"
      redirect_to("/", :notice => "Int stat len deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Int stat len deleted.")
    end
  end
end
