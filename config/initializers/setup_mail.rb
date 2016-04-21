ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.sendgrid.net",
    :port => 25,
    :domain => "awts.io",
    :authentication => "plain",
    :username => ENV["SENDGRID_USERNAME"],
    :password => ENV["ZOHO_PASSWORD"],
    :ssl => true,
    :tls => true,
    :enable_starttls_auto => true
}