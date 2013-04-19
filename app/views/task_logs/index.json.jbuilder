json.array!(@task_logs) do |task_log|
  json.extract! task_log, :user_id, :name, :notes, :context
  json.url task_log_url(task_log, format: :json)
end