module ApplicationHelper
  
  def render_alert(object, options={})
    render partial: '../shared/alert', locals: {object: object, alert_container_class: options[:alert_container_class]} 
  end
  
  def truncate_html(text, options={})
    return unless text
    
    text = truncate text, length: options[:length]-3, omission: ''
    text << options[:omission].html_safe
  end
  
end