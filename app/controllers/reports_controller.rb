# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :validate_execute_permission, only: %i[edit update destroy]

  def index
    @reports = Report.order(created_at: :desc).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = current_user.reports.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy!
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def validate_execute_permission
    @report = Report.find(params[:id])
    redirect_to reports_path, notice: t('errors.messages.permission_denied') unless @report.user_id == current_user.id
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
