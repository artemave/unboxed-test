require 'aruba/cucumber'
require 'aruba'
require 'aruba/in_process'
require 'rest-assured'
require_relative '../../lib/app'

RestAssured::Server.start(database: ':memory:', port: 7899)
GitHubAPI.github_api_url = RestAssured::Server.address

Aruba::InProcess.main_class = App
Aruba.process = Aruba::InProcess
