# frozen_string_literal: true

module Admin
  class BadgesController < Admin::BaseController
    before_action :set_badge, only: %i[edit update destroy]

    def new
      @badge = Badge.new
    end

    def index
      @badges = Badge.all
    end

    def create
      @badge = Badge.new(badge_params)

      if @badge.save
        redirect_to admin_tests_path
      else
        render :new
      end
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_tests_path
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_path
    end

    private

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :rule, :url_picture, :rule_criterion, :description)
    end
  end
end
