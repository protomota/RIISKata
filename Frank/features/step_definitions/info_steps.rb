def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

Given /^the app is launched$/ do
    launch_app app_path
    wait_for_frank_to_come_up
end

When /^I touch the Ground Button$/ do
    touch( "view:'UIButton' marked:'GroundBtn'" )
end

Then /^I should see an alert marked OK$/ do
    touch( "view:'UIAlertButton' marked:'OK'" )
end