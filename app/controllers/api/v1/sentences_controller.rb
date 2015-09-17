module API
  module V1

    class SentencesController < ApplicationController
      before_action :find_sentence, only: [:show, :update, :destroy]

      def index
        @story = Story.find(params[:story_id])
        @sentences = @story.sentences
      end

      def create
        @story = Story.find(params[:story_id])
        position = @story.sentences.size > 0 ? @story.sentences.last + 1 : 1
        @sentence = Sentence.new(story_id: params[:story_id], content: params[:sentence][:content], position: position)
        if @sentence.save
          render 'show', formats: [:json], handlers: [:jbuilder], status: 201
        else
          render json: { error: "Sentence could not be created." }, status: 422
        end
      end

      def update
        if @sentence.update_attributes(content: params[:sentence][:content])
          render 'show', formats: [:json], handlers: [:jbuilder], status: 200
        else
          render json: { error: "Sentence could not be updated." }, status: 422
        end
      end

      def destroy
        if @sentence.destroy
          render json: {}, status: 200
        else
          render json: { error: "Sentence could not be deleted." }, status: 422
        end
      end

      private

      def find_sentence
        @sentence = Sentence.find(params[:id])
      end
    end

  end
end
