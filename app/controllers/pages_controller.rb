class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  before_action :set_tags, only: [:show, :edit]


  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end


  # Static Pages
  def home
    @page = Page.find_or_create_by(title: "Home")
    @footer = Page.find_or_create_by(title: "Footer")
    if @footer.content.blank?
      @footer.content = "Fill information in the Pages Controller"
      @footer.save
    end
    if @page.content.blank?
      @page.content = "Fill information in the Pages Controller"
      @page.save
    end

  end

  def about
    @page = Page.find_or_create_by(title: "About")
    if @page.content.blank?
      @page.content = "Fill information in the Pages Controller"
      @page.save
    end
    set_tags

  end


  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :content)
  end

  # Meta Tags
  def set_tags
    @page_title = @page.title
    @page_description = ApplicationHelper.markdown(@page.content)
  end

end
