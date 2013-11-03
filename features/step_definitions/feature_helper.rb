module FeatureHelper
  
  def sign_in(user)
    visit '/'
    fill_in "login_email", with: user.email
    fill_in "login_password", with: user.password
    click_on "Login"
    current_path.should == "/home"
  end
 
  def ask(question)
    fill_in "question_question", with: question
    click_on "Ask"
    current_path.should == show_question_path(question.parameterize)
  end
 
end


World(FeatureHelper)