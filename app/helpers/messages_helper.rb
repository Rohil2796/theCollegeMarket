module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' data-img-src='<%= image_tag @user.avatar.url(:medium) %>' #{'selected' if user == chosen_recipient}>#{user.firstName + ' ' + user.lastName}</option>"
    end
    s.html_safe
  end
end