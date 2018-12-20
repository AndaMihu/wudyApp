class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    if teacher_signed_in?

    @chats_teacher = Chat.where(student_id: params[:student_id]).sort_by(&:created_at)
    @students = Student.where(teacher_id: current_teacher.id)
    @message = Chat.where(teacher_id: current_teacher.id)
    @st_name = Student.where(id: params[:student_id]).first
    @st_response = Chat.where(student_id: params[:student_id]).sort_by(&:created_at)

    elsif student_signed_in?

    @test = Chat.where(student_id: current_student.id).group_by(&:created_at)
    @chats_student = Chat.where(student_id: current_student.id).sort_by(&:created_at)
    @response = Chat.where(teacher_id: current_student.teacher_id).sort_by(&:created_at)
    @chats = Chat.all.sort_by(&:created_at)
    end

    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end
def show
end
  def create
    @chat = Chat.new(chat_params)
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :teacher_id, :student_id)
    end
end

