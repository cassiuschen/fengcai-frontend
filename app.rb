#require 'rubygems'
#require 'bundler'

#Bundler.require

require 'sinatra'
require 'sass'
require 'coffee-script'
require 'slim'

module FengCai
  class App < Sinatra::Base
    # Settings
    set :public_folder, File.dirname(__FILE__) + '/public'
    set :views, :scss => 'assets/stylesheets', :coffee => 'assets/javascripts', :default => 'views'
    helpers do
      def find_template(views, name, engine, &block)
        _, folder = views.detect { |k,v| engine == Tilt[k] }
        folder ||= views[:default]
        super(folder, name, engine, &block)
      end
    end


    # Assets
    get '/assets/application.js' do
      coffee :application
    end

    get '/assets/application.css' do
      scss :application, :style => :expanded
    end

    # Pages
    get '/' do
      slim :index
    end


    # App
    run! if app_file == $0
  end
end