require 'minitest/autorun'
require 'watir'

  
browser=Watir::Browser.new :firefox

p "Testing the webpage"
browser.goto "https://patient-login-main.herokuapp.com/sign_in"
t1=browser.text_field id: 'email'
t1.set "kappa@gmail.com"
t2=browser.text_field id: 'password'
t2.set "s3TG2m3TbVF5k95"
browser.screenshot.save 'page1.png'
button = browser.button(value: 'Sign In') 
button.click

if browser.title.include? "Kiosk"
browser.screenshot.save 'page2.png'
puts "Test Executed Successfully"
else 
p "Error"
end
browser.close
