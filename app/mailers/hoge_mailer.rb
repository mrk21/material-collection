class HogeMailer < ApplicationMailer
  def test
    mail to: 'hoge@example.com', subject: 'test'
  end
end
