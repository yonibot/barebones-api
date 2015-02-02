module API
  module V1

    class SentencesController < ApplicationController

      def index
        @story = Story.where(id: params[:story_id]).first
        @sentences = @story.sentences
      end

      def show
        @sentence = Sentence.where(id: params[:id]).first
      end

      def create
        @story = Story.where(id: params[:story_id]).first
        @sentence = Sentence.new(story_id: params[:story_id], content: params[:id], position: @story.sentences.last.position+1)
        if @sentence.save
          render 'show', formats: [:json], handlers: [:jbuilder], status: 200
        else
          render json: {error: "Sentence could not be created."}, status: 422
        end
      end

      def update
        @story = Sentence.where(id: params[:id]).first
        if @sentence.update_attributes(content: params[:sentence][:content])
          render 'show', formats: [:json], handlers: [:jbuilder], status: 200
        else
          render json: {error: "Sentence could not be created."}, status: 422
        end
      end

      def destroy
        @sentence = Sentence.where(id: params[:id]).first
        if @sentence.destroy
          render json: {}, status: 200
        else
          render json: {error: "Sentence could not be deleted."}, status: 422
        end
      end

    end

  end
end