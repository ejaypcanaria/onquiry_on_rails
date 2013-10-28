module ApplicationHelper
  
  def render_alert(object)
    render partial: '../shared/alert', locals: {object: object} 
  end
  
end
