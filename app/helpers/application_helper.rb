module ApplicationHelper
  
  def render_alert(object)
    render partial: '../shared/alert', locals: {object: object} 
  end
  
  def truncate_html(text, options={})
    return unless text
    
    text = truncate text, length: options[:length]-3, omission: ''
    text << options[:omission].html_safe
  end
  
end