class StudysController < ApplicationController

def index
    @studys = Study.all
end

  def new
    @study = Study.new
  end

  def create
    study = Study.new(study_params)
    study.user_id = current_user.id
    if study.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

 

  def edit
    @study = Study.find(params[:id])
  end

  def update
    study = Study.find(params[:id])
    if study.update(study_params)
      redirect_to :action => "show", :id => study.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    study = Study.find(params[:id])
    study.destroy
    redirect_to action: :index
  end

  private
  def study_params
    params.require(:study).permit(:body, :learn, :tipe)
  end
end
