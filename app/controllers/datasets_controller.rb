class DatasetsController < ApplicationController
before_filter :require_user
  # GET /datasets
  # GET /datasets.xml
  def index
     @page_title = "VDW Datasets"
    @datasets = Dataset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datasets }
      format.pdf
    end
  end

  # GET /datasets/1
  # GET /datasets/1.xml
  def show
    @dataset = Dataset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/new
  # GET /datasets/new.xml
  def new
    @dataset = Dataset.new
    3.times do
      @dataset.dataset_variables << DatasetVariable.new
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset }
    end
  end

  # GET /datasets/1/edit
  def edit
    @dataset = Dataset.find(params[:id])
    @dataset.dataset_variables.build
    # raise(@dataset.dataset_variables[0].variable_attributes.inspect)
  end

  # POST /datasets
  # POST /datasets.xml
  def create
    @dataset = Dataset.new(params[:dataset])

    respond_to do |format|
      if @dataset.save
        flash[:notice] = 'Dataset was successfully created.'
        format.html { redirect_to(@dataset) }
        format.xml  { render :xml => @dataset, :status => :created, :location => @dataset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datasets/1
  # PUT /datasets/1.xml
  def update
    # raise("boobies!")
    @dataset = Dataset.find(params[:id])
    # raise(params[:dataset][:dataset_variables_attributes]["0"].class.to_s)
    respond_to do |format|
      if @dataset.update_attributes(params[:dataset])
        flash[:notice] = 'Dataset was successfully updated.'
        format.html { redirect_to(@dataset) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1
  # DELETE /datasets/1.xml
  def destroy
    @dataset = Dataset.find(params[:id])
    @dataset.destroy

    respond_to do |format|
      format.html { redirect_to(datasets_url) }
      format.xml  { head :ok }
    end
  end
end
