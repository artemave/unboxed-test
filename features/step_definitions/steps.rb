Given(/^Walter published some Ruby code under his github account$/) do
  RestAssured::Double.create fullpath: '/users/walter/repos',
    content: fixture('ruby.json')
end

When(/^.* wants to find out what is (Walter|Jon|Earl)'s programming language of choice$/) do |user|
  run_simple "fav_lang #{user.downcase}", fail_on_error=false
end

Then(/^he can see that it is a Ruby$/) do
  assert_exact_output "Ruby\n", all_output
  assert_exit_status 0
end

Given(/^Jon Snow does not have a github account$/) do
  RestAssured::Double.create fullpath: '/users/jon/repos', status: 404
end

Then(/^he sees an error explaining that Jon Snow is not a github user$/) do
  assert_exact_output("User not found\n", all_output)
  assert_exit_status 1
end

Given(/^Earl has no repos on github$/) do
  RestAssured::Double.create fullpath: '/users/earl/repos', content: "[]"
end

Then(/^he sees we can't really tell$/) do
  assert_exact_output("It is hard to say...\n", all_output)
  assert_exit_status 0
end
