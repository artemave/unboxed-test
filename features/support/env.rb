require 'aruba/cucumber'
require 'aruba'
require 'aruba/in_process'
require 'rest-assured'
require_relative '../../lib/app'

RestAssured::Server.start(database: ':memory:', port: 7899)
GitHubAPI::GITHUB_API_URL = RestAssured::Server.address

Aruba::InProcess.main_class = App
Aruba.process = Aruba::InProcess
