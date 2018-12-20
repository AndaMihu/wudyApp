json.extract! @chat, :id, :message, :teacher_id, :student_id
json.url chat_url(@chat, format: :json)