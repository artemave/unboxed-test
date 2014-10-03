Given(/^Ted has no idea how to use the app$/) do
end

When(/^he tries to just run it with no parameters$/) do
  run_simple "fav_lang", fail_on_error=false
end

Then(/^he sees usage instructions$/) do
  assert_exact_output "Usage: #{$0} USERNAME\n", all_output
end
