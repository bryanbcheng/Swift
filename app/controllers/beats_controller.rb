class BeatsController < ApplicationController
  # GET /beats
  # GET /beats.xml
  def index
    @beats = Beat.all
    @beats.sort! { |a,b| b.created_at <=> a.created_at }
    @beat = Beat.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beats }
    end

  end

  # GET /beats/1
  # GET /beats/1.xml
  def show
    @beat = Beat.find(params[:id])    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @beat }
    end
  end

  # POST /beats
  # POST /beats.xml
  def create
    @user = User.find_by_id(current_user)
    
    if @user.nil?
      flash[:error] = "Please sign in to share your music"
      redirect_to signin_path
    else
      #@beat = @user.beats.create(params[:beat])
            
      
      respond_to do |format|
        if @user.beats.create!(params[:beat])
          format.html { redirect_to(beats_path, :notice => 'Beat was successfully created.') }
          format.xml  { render :xml => @beat, :status => :created, :location => @beat }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @beat.errors, :status => :unprocessable_entity }
	end     
      end
    end
  end

  # DELETE /beats/1
  # DELETE /beats/1.xml
  def destroy
    @beat = Beat.find(params[:id])
    @beat.destroy

    respond_to do |format|
      format.html { redirect_to(beats_url) }
      format.xml  { head :ok }
    end
  end
end
