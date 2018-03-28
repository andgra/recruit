class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # для выполнения routes с ассоциацией
  def index
    if params[:company_id]
      @jobs = Company.find(params[:company_id]).jobs.where(where_params.merge({is_deleted: false}))
    else
      @jobs = Job.where(where_params.merge({is_deleted: false}))
    end
    render json: { jobs: @jobs }, except: [:id, :created_at, :updated_at, :is_deleted]
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job.as_json, status: :created
    else
      render json: {user: @job.errors, status: :no_content}
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.update({is_deleted: true})
      render json: {deleted_job: @job, code: 200, status: 'success'}
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end


  private
  def set_job
    @job = Job.where({id: params[:id], is_deleted: false})
  end

  def where_params
    params.permit(:place, :name)
  end

  def job_params
    params.permit(:place, :company_id, :name)
  end
end
