class ProjectsController < ApplicationController
  load_and_authorize_resource

  # index, new and edit actions are handled by load_and_authorize_resource

  def create
    # load_and_authorize_resource does this behind the scenes:
    #     @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Project was saved!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    # load_and_authorize_resource does this behind the scenes:
    #     @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Project was updated!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    # load_and_authorize_resource does this behind the scenes:
    #     @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'Project was destroyed!'
    else
      flash[:warning] = 'Cannot destroy this project...'
    end
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end


end