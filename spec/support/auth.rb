def teacher_auth
  auth_for create(:teacher)
end

def student_auth
  auth_for create(:student)
end

def auth_for(user)
  { :authorization => "Bearer #{user.access_token}" }
end
