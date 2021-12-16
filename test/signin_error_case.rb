require 'minitest/autorun'
require 'watir'

p "Testing the webpage"
browser=Watir::Browser.new:firefox
browser.goto "https://patient-login-main.herokuapp.com/sign_in"
t1=browser.text_field id: 'email'
t1.set "lkjh@gmail.com"
t2=browser.text_field id: 'password'
t2.set "s3TG2m3TbVF5k95"
browser.screenshot.save 'page3.png'
button = browser.button(value: 'Sign In') 
button.click

if browser.title.include? "Kiosk"
puts "Error" 
else 
browser.screenshot.save 'page4.png'
p "Test Executed Successfully"
end
browser.close


