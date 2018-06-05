class CtaLocsController < ApplicationController
  def index
    @cta_locs = CtaLoc.page(params[:page]).per(10)

    render("cta_locs/index.html.erb")
  end

  def show
    @cta_loc = CtaLoc.find(params[:id])

    render("cta_locs/show.html.erb")
  end

  def new
    @cta_loc = CtaLoc.new

    render("cta_locs/new.html.erb")
  end

  def create
    @cta_loc = CtaLoc.new

    @cta_loc.rn = params[:rn]
    @cta_loc.tmst = params[:tmst]
    @cta_loc.destst = params[:destst]
    @cta_loc.destnm = params[:destnm]
    @cta_loc.trdr = params[:trdr]
    @cta_loc.nextstaid = params[:nextstaid]
    @cta_loc.nextstpid = params[:nextstpid]
    @cta_loc.nextstanm = params[:nextstanm]
    @cta_loc.prdt = params[:prdt]
    @cta_loc.arrt = params[:arrt]
    @cta_loc.isapp = params[:isapp]
    @cta_loc.isdly = params[:isdly]
    @cta_loc.flags = params[:flags]
    @cta_loc.lat = params[:lat]
    @cta_loc.lon = params[:lon]
    @cta_loc.heading = params[:heading]

    save_status = @cta_loc.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_locs/new", "/create_cta_loc"
        redirect_to("/cta_locs")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta loc created successfully.")
      end
    else
      render("cta_locs/new.html.erb")
    end
  end

  def edit
    @cta_loc = CtaLoc.find(params[:id])

    render("cta_locs/edit.html.erb")
  end

  def update
    @cta_loc = CtaLoc.find(params[:id])

    @cta_loc.rn = params[:rn]
    @cta_loc.tmst = params[:tmst]
    @cta_loc.destst = params[:destst]
    @cta_loc.destnm = params[:destnm]
    @cta_loc.trdr = params[:trdr]
    @cta_loc.nextstaid = params[:nextstaid]
    @cta_loc.nextstpid = params[:nextstpid]
    @cta_loc.nextstanm = params[:nextstanm]
    @cta_loc.prdt = params[:prdt]
    @cta_loc.arrt = params[:arrt]
    @cta_loc.isapp = params[:isapp]
    @cta_loc.isdly = params[:isdly]
    @cta_loc.flags = params[:flags]
    @cta_loc.lat = params[:lat]
    @cta_loc.lon = params[:lon]
    @cta_loc.heading = params[:heading]

    save_status = @cta_loc.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cta_locs/#{@cta_loc.id}/edit", "/update_cta_loc"
        redirect_to("/cta_locs/#{@cta_loc.id}", :notice => "Cta loc updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cta loc updated successfully.")
      end
    else
      render("cta_locs/edit.html.erb")
    end
  end

  def destroy
    @cta_loc = CtaLoc.find(params[:id])

    @cta_loc.destroy

    if URI(request.referer).path == "/cta_locs/#{@cta_loc.id}"
      redirect_to("/", :notice => "Cta loc deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cta loc deleted.")
    end
  end
end
