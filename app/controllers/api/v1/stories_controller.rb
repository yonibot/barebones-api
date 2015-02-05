module API
  module V1

    class StoriesController < ApplicationController

      def index
        @stories = Story.includes(:sentences).page(params[:page])
      end

      def show
        @story = Story.where(id: params[:id]).first
      end

      def create
        @story = Story.new(title: params[:story][:title])
        if @story.save
          # pass an array of acceptable formats - [:json]
          render 'show', formats: [:json], handlers: [:jbuilder], status: 201
        else
          render json: {error: "Story could not be created."}, status: 422
        end
      end

      def update
        @story = Story.where(id: params[:id]).first
        if @story.update_attributes(title: params[:story][:title])
          render 'show', formats: [:json], handlers: [:jbuilder], status: 200
        else
          render json: {error: "Story could not be created."}, status: 422
        end
      end

      def destroy
        @story = Story.where(id: params[:id]).first
        if @story.destroy
          render json: {}, status: 200
        else
          render json: {error: "Story could not be deleted."}, status: 422
        end
      end

    end

  end
end