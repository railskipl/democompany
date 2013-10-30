class ContactMailer < ActionMailer::Base
  
default :from => "jyoti.vskp@gmail.com"

  def registration_confirmation(contact)
      @contact = contact
      mail(:to => contact.email, :subject => "Registered")
  end

end

