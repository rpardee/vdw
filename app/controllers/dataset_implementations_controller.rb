class DatasetImplementationsController < ApplicationController
  # GET /dataset_implementations
  # GET /dataset_implementations.xml
  def index
    @dataset_implementations = DatasetImplementation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dataset_implementations }
    end
  end

  # GET /dataset_implementations/1
  # GET /dataset_implementations/1.xml
  def show
    @dataset_implementation = DatasetImplementation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset_implementation }
    end
  end

  # GET /dataset_implementations/new
  # GET /dataset_implementations/new.xml
  def new
    @dataset_implementation = DatasetImplementation.new
    @dataset_implementation.site_id = params[:site_id] unless params[:site_id].blank?
    @dataset_implementation.dataset_id = params[:dataset_id] unless params[:dataset_id].blank?
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset_implementation }
    end
  end

  # GET /dataset_implementations/1/edit
  def edit
    @dataset_implementation = DatasetImplementation.find(params[:id])
  end

  # POST /dataset_implementations
  # POST /dataset_implementations.xml
  def create
    @dataset_implementation = DatasetImplementation.new(params[:dataset_implementation])

    respond_to do |format|
      if @dataset_implementation.save
        flash[:notice] = 'DatasetImplementation was successfully created.'
        format.html { redirect_to(@dataset_implementation) }
        format.xml  { render :xml => @dataset_implementation, :status => :created, :location => @dataset_implementation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataset_implementation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dataset_implementations/1
  # PUT /dataset_implementations/1.xml
  def update
    @dataset_implementation = DatasetImplementation.find(params[:id])

    respond_to do |format|
      if @dataset_implementation.update_attributes(params[:dataset_implementation])
        flash[:notice] = 'DatasetImplementation was successfully updated.'
        format.html { redirect_to(@dataset_implementation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataset_implementation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_implementations/1
  # DELETE /dataset_implementations/1.xml
  def destroy
    @dataset_implementation = DatasetImplementation.find(params[:id])
    @dataset_implementation.destroy

    respond_to do |format|
      format.html { redirect_to(dataset_implementations_url) }
      format.xml  { head :ok }
    end
  end
end
