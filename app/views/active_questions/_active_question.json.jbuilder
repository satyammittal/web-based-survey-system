json.extract! active_question, :id, :question_id, :user_id, :created_at, :updated_at
json.url active_question_url(active_question, format: :json)