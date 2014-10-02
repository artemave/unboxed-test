Given(/^Walter published some Ruby code under his github account$/) do
  RestAssured::Double.create fullpath: '/users/walter/repos',
    content: fixture('ruby.json')
end

When(/^Jesse wants to find out what is Walter's programming language of choice$/) do
  run_simple "fav_lang walter"
end

Then(/^he can see that it is a Ruby$/) do
  assert_exact_output "Ruby\n", all_output
end
