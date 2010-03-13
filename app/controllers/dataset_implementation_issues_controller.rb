class DatasetImplementationIssuesController < ApplicationController
  # GET /dataset_implementation_issues
  # GET /dataset_implementation_issues.xml
  def index
     @page_title = "Issues with VDW Dataset Implementations"
    @dataset_implementation_issues = DatasetImplementationIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dataset_implementation_issues }
    end
  end

  # GET /dataset_implementation_issues/1
  # GET /dataset_implementation_issues/1.xml
  def show
    @dataset_implementation_issue = DatasetImplementationIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dataset_implementation_issue }
    end
  end

  # GET /dataset_implementation_issues/new
  # GET /dataset_implementation_issues/new.xml
  def new
    @dataset_implementation_issue = DatasetImplementationIssue.new
    @dataset_implementation_issue.submitting_user_id = current_user.id
    @dataset_implementation_issue.dataset_implementation_id = params[:diid]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dataset_implementation_issue }
    end
  end

  # GET /dataset_implementation_issues/1/edit
  def edit
    @dataset_implementation_issue = DatasetImplementationIssue.find(params[:id])
  end

  # POST /dataset_implementation_issues
  # POST /dataset_implementation_issues.xml
  def create
    @dataset_implementation_issue = DatasetImplementationIssue.new(params[:dataset_implementation_issue])

    respond_to do |format|
      if @dataset_implementation_issue.save
        flash[:notice] = 'DatasetImplementationIssue was successfully created.'
        format.html { redirect_to(@dataset_implementation_issue) }
        format.xml  { render :xml => @dataset_implementation_issue, :status => :created, :location => @dataset_implementation_issue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dataset_implementation_issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dataset_implementation_issues/1
  # PUT /dataset_implementation_issues/1.xml
  def update
    @dataset_implementation_issue = DatasetImplementationIssue.find(params[:id])

    respond_to do |format|
      if @dataset_implementation_issue.update_attributes(params[:dataset_implementation_issue])
        flash[:notice] = 'DatasetImplementationIssue was successfully updated.'
        format.html { redirect_to(@dataset_implementation_issue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dataset_implementation_issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_implementation_issues/1
  # DELETE /dataset_implementation_issues/1.xml
  def destroy
    @dataset_implementation_issue = DatasetImplementationIssue.find(params[:id])
    @dataset_implementation_issue.destroy

    respond_to do |format|
      format.html { redirect_to(dataset_implementation_issues_url) }
      format.xml  { head :ok }
    end
  end
end
