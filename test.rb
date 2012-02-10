require './app'
require 'test/unit'
require 'rack/test'

class SisyphusAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # GET '//////' :)
  def test_strip_slashes
    get '//////'
    assert_equal 'http://packages.altlinux.org/ru', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/'
  def test_root_url
    get '/'
    assert_equal 'http://packages.altlinux.org/ru', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale'
  def test_root_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}"
      assert_equal "http://packages.altlinux.org/#{locale}", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/oy'
  def test_root_url_with_wrong_locale
    get '/oy'
    assert_equal 404, last_response.status
  end

  # GET '/project'
  def test_project_url
    get '/project'
    assert_equal 'http://packages.altlinux.org/ru/project', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/project'
  def test_project_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/project"
      assert_equal "http://packages.altlinux.org/#{locale}/project", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/security'
  def test_security_url
    get '/security'
    assert_equal 'http://packages.altlinux.org/ru/security', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/security'
  def test_security_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/security"
      assert_equal "http://packages.altlinux.org/#{locale}/security", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/people'
  def test_people_url
    get '/people'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/people', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/people'
  def test_people_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/people"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/people", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/team/security'
  def test_team_url
    get '/team/security'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/teams/security', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/team/security'
  def test_team_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/team/security"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/teams/security", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/:maintainer'
  def test_maintainer_url
    get '/packager/ldv'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/:maintainer'
  def test_maintainer_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/:maintainer/srpms'
  def test_maintainer_srpms_url
    get '/packager/ldv/srpms'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv/srpms', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/:maintainer/srpms'
  def test_maintainer_srpms_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv/srpms"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv/srpms", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/ldv/bugs'
  def test_maintainer_bugs_url
    get '/packager/ldv/bugs'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv/bugs', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/ldv/bugs'
  def test_maintainer_bugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv/bugs"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv/bugs", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/:maintainer/allbugs'
  def test_maintainer_allbugs_url
    get '/packager/ldv/bugs'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv/allbugs', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/:maintainer/allbugs'
  def test_maintainer_allbugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv/allbugs"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv/allbugs", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/:maintainer/repocop'
  def test_maintainer_repocop_url
    get '/packager/ldv/repocop'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv/repocop', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/:maintainer/repocop'
  def test_maintainer_allbugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv/repocop"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv/repocop", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packages'
  def test_packages_url
    get '/packages'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/packages', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packages'
  def test_maintainer_allbugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packages"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/packages", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packages/:group1'
  def test_packages_level1_url
    get '/packages/Shells'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/packages/Shells', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packages/:group1'
  def test_packages_level1_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packages/Shells"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/packages/Shells", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packages/:group1/:group2'
  def test_packages_level2_url
    get '/packages/Archiving/Compression'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/packages/Archiving/Compression', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packages/:group1/:group2'
  def test_packages_level2_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packages/Archiving/Compression"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/packages/Archiving/Compression", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packages/:group1/:group2/:group3'
  def test_packages_level3_url
    get '/packages/System/Configuration/Packaging'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/packages/System/Configuration/Packaging', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packages/:group1/:group2/:group3'
  def test_packages_level3_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/Sisyphus/packages/System/Configuration/Packaging"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/packages/System/Configuration/Packaging", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/srpm/Sisyphus/:name'
  def test_srpm_url
    get '/srpm/Sisyphus/glibc'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/srpm/Sisyphus/:name'
  def test_srpm_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/srpm/Sisyphus/:name/changelog'
  def test_srpm_changelog_url
    get '/srpm/Sisyphus/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc', last_response.location
    assert_equal 301, last_response.status
  end


  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/spec
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/patches
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/sources
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/get
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/gear
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/bugs
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/allbugs
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/repocop
end
