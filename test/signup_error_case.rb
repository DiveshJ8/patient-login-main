require 'minitest/autorun'
require 'watir'

p "Testing the webpage"

browser=Watir::Browser.new:firefox
browser.goto "https://patient-login-main.herokuapp.com/sign_up"
t1=browser.text_field id: 'user_email'
t1.set "abc"
t2=browser.text_field id: 'user_password'
t2.set "s3TG2m3TbVF5k95"
t3=browser.text_field id: 'user_password_confirmation'
t3.set "s3TG2m3TbVF5k95"
t4=browser.text_field id: 'user_user_type'
t4.set "patient"
browser.screenshot.save 'page7.png'

button = browser.button(value: 'Sign Up') 
button.click

if browser.title.include? "Kiosk"
puts "Error" 
else 
browser.screenshot.save 'page8.png'
p "Test Executed Successfully"
end
browser.close


