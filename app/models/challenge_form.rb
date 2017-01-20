class ChallengeForm < MailForm::Base
  attribute :name,  :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,   :captcha => true
  attribute :challengee_email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  def headers
    {
      :subject => "You've Been Challenged! - It's All Good",
      :to => "#{challengee_email}",
      :from => %("#{name}" <#{email}>)
    }
  end
end