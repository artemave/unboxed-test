require 'aruba/cucumber'
require 'aruba'
require 'aruba/in_process'
require_relative '../../lib/fav_lang'

Aruba::InProcess.main_class = FavLang
Aruba.process = Aruba::InProcess
