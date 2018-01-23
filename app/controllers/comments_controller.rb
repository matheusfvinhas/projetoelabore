# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_grade, only: %i[update destroy]
  before_action :find_grade, only: %i[new create]

  def new
    @comment = @grade.comments.build
  end

  def show; end

  def create
    @comment = @grade.comments.create(comments_params)

    if @comment.save
      flash[:notice] = 'Comentário salvo com sucesso.'
      redirect_to grade_comments_path(@grade)
    else
      flash[:alert] = 'Erro ao salvar comentário.'
      render :new
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comentário atualizado com sucesso.'
        redirect_to grade_comments_path(@grade)
    else
      flash[:alert] = 'Erro ao atualizar curso.'
        render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = 'Curso deletado com sucesso.'
    else
      flash[:alert] = 'Erro ao deletar curso.'
    end
    redirect_to grade_comments_path(@grade)
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end

    def set_comment
      @comment = comment.find(params[:id])
    end
    def set_grade
      @grade = @comment.grade
    end

    def find_grade
      @grade = Grade.find(params[:grade_id])
    end


end
