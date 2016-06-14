require 'csv'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def csv_creation
    File.delete("./saved_items.csv")
    CSV.open("./saved_items.csv", "wb") do |csv|
       csv << SavedItem.attribute_names
       current_user.saved_items.each do |item|
         csv << item.attributes.values
       end
     end
  end

  def file_download
    csv_creation
    send_file './saved_items.csv', :type => 'csv', :disposition => 'attachment'
  end

  def pagination(array, page)
    if page == 0 || page == 1
      top = 0
      bottom = 50
      current_user ? @items = array[top..bottom] : @items = []
    else
      top = ((page * 50) - 50) + 1
      bottom = (page * 50) + 1
      current_user ? @items = array[top..bottom] : @items = []
    end
  end

end
