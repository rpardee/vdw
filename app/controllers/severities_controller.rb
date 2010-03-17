class SeveritiesController < ApplicationController
  # GET /severities
  # GET /severities.xml
  def index
    @severities = Severity.all(:order => "sort_order")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @severities }
    end
  end

  # GET /severities/1
  # GET /severities/1.xml
  def show
    @severity = Severity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @severity }
    end
  end

  # GET /severities/new
  # GET /severities/new.xml
  def new
    @severity = Severity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @severity }
    end
  end

  # GET /severities/1/edit
  def edit
    @severity = Severity.find(params[:id])
  end

  # POST /severities
  # POST /severities.xml
  def create
    @severity = Severity.new(params[:severity])

    respond_to do |format|
      if @severity.save
        flash[:notice] = 'Severity was successfully created.'
        format.html { redirect_to(@severity) }
        format.xml  { render :xml => @severity, :status => :created, :location => @severity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @severity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /severities/1
  # PUT /severities/1.xml
  def update
    @severity = Severity.find(params[:id])

    respond_to do |format|
      if @severity.update_attributes(params[:severity])
        flash[:notice] = 'Severity was successfully updated.'
        format.html { redirect_to(@severity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @severity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /severities/1
  # DELETE /severities/1.xml
  def destroy
    @severity = Severity.find(params[:id])
    @severity.destroy

    respond_to do |format|
      format.html { redirect_to(severities_url) }
      format.xml  { head :ok }
    end
  end
end
