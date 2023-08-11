class PagesController < ApplicationController
def index
end

def new
    @page = Page.new
  end

  def show
    @page = Page.find_by(id: params[:id])
  end

  def create
    @page = Page.new(page_params)
    params[:page][:question] ? @page.question = params[:page][:question].join("") : false
    if @page.save
        flash[:notice] = "診断が完了しました"
        redirect_to page_path(@page.id)
    else
        redirect_to :action => "new"
    end
  end

private
  def page_params
      params.require(:page).permit(:id, question: [])
  end

end
