require './app'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_strip_slashes
    get '//////'
    assert_equal 'http://packages.altlinux.org/ru', last_response.location
    assert_equal 301, last_response.status
  end

  def test_root_url
    get '/'
    assert_equal 'http://packages.altlinux.org/ru', last_response.location
    assert_equal 301, last_response.status
  end

  def test_root_url_with_locale
    ['en', 'ru', 'uk', 'br'].each do |locale|
      get "/#{locale}"
      assert_equal "http://packages.altlinux.org/#{locale}", last_response.location
      assert_equal 301, last_response.status
    end
  end

  def test_root_url_with_wrong_locale
    get '/oy'
    assert_equal 404, last_response.status
  end

  def test_project_url
    get '/project'
    assert_equal 'http://packages.altlinux.org/ru/project', last_response.location
    assert_equal 301, last_response.status
  end

  def test_project_url_with_locale
    ['en', 'ru', 'uk', 'br'].each do |locale|
      get "/#{locale}/project"
      assert_equal "http://packages.altlinux.org/#{locale}/project", last_response.location
      assert_equal 301, last_response.status
    end
  end

  def test_security_url
    get '/security'
    assert_equal 'http://packages.altlinux.org/ru/security', last_response.location
    assert_equal 301, last_response.status
  end

  def test_security_url_with_locale
    ['en', 'ru', 'uk', 'br'].each do |locale|
      get "/#{locale}/security"
      assert_equal "http://packages.altlinux.org/#{locale}/security", last_response.location
      assert_equal 301, last_response.status
    end
  end

  def test_people_url
    get '/people/'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/people', last_response.location
    assert_equal 301, last_response.status
  end

  def test_people_url_with_locale
    ['en', 'ru', 'uk', 'br'].each do |locale|
      get "/#{locale}/people"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/people", last_response.location
      assert_equal 301, last_response.status
    end
  end
end
