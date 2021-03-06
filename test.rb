require './app'
require 'test/unit'
require 'rack/test'

class SisyphusAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
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

  # GET '/team/:name'
  def test_team_url
    get '/team/security'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/teams/security', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/team/:name'
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

  # GET '/packager/:maintainer/bugs'
  def test_maintainer_bugs_url
    get '/packager/ldv/bugs'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/maintainers/ldv/bugs', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/packager/:maintainer/bugs'
  def test_maintainer_bugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/packager/ldv/bugs"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/maintainers/ldv/bugs", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/packager/:maintainer/allbugs'
  def test_maintainer_allbugs_url
    get '/packager/ldv/allbugs'
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
  def test_maintainer_repocop_url_with_locale
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
  def test_packages_url_with_locale
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
      get "/#{locale}/packages/System/Configuration/Packaging"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/packages/System/Configuration/Packaging", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/srpm/:branch/:name'
  # TODO: /srpm/Branch3/glibc/
  def test_srpm_url
    get '/srpm/Sisyphus/glibc'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch51/glibc'
    assert_equal 'http://packages.altlinux.org/ru/5.1/srpms/glibc', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/p5/glibc'
    assert_equal 'http://packages.altlinux.org/ru/Platform5/srpms/glibc', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch41/glibc'
    assert_equal 'http://packages.altlinux.org/ru/4.1/srpms/glibc', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch4/glibc'
    assert_equal 'http://packages.altlinux.org/ru/4.0/srpms/glibc', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/srpm/:branch/:name'
  # TODO: /ru/srpm/Branch3/glibc/
  def test_srpm_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch51/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/5.1/srpms/glibc", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/p5/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/Platform5/srpms/glibc", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch41/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/4.1/srpms/glibc", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch4/glibc"
      assert_equal "http://packages.altlinux.org/#{locale}/4.0/srpms/glibc", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET '/srpm/:branch/:name/changelog'
  # TODO: /srpm/Branch3/glibc/changelog
  def test_srpm_changelog_url
    get '/srpm/Sisyphus/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/changelog', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch51/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/5.1/srpms/glibc/changelog', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/p5/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/Platform5/srpms/glibc/changelog', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch41/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/4.1/srpms/glibc/changelog', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch4/glibc/changelog'
    assert_equal 'http://packages.altlinux.org/ru/4.0/srpms/glibc/changelog', last_response.location
    assert_equal 301, last_response.status
  end

  # GET '/:locale/srpm/:branch/:name/changelog'
  # TODO: /srpm/Branch3/glibc/changelog
  def test_srpm_changelog_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/changelog"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/changelog", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch51/glibc/changelog"
      assert_equal "http://packages.altlinux.org/#{locale}/5.1/srpms/glibc/changelog", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/p5/glibc/changelog"
      assert_equal "http://packages.altlinux.org/#{locale}/Platform5/srpms/glibc/changelog", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch41/glibc/changelog"
      assert_equal "http://packages.altlinux.org/#{locale}/4.1/srpms/glibc/changelog", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch4/glibc/changelog"
      assert_equal "http://packages.altlinux.org/#{locale}/4.0/srpms/glibc/changelog", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET /srpm/:branch/:name/spec
  # TODO: /srpm/Branch3/glibc/spec
  def test_srpm_spec_url
    get '/srpm/Sisyphus/glibc/spec'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/spec', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch51/glibc/spec'
    assert_equal 'http://packages.altlinux.org/ru/5.1/srpms/glibc/spec', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/p5/glibc/spec'
    assert_equal 'http://packages.altlinux.org/ru/Platform5/srpms/glibc/spec', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch41/glibc/spec'
    assert_equal 'http://packages.altlinux.org/ru/4.1/srpms/glibc/spec', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch4/glibc/spec'
    assert_equal 'http://packages.altlinux.org/ru/4.0/srpms/glibc/spec', last_response.location
    assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/spec
  # TODO: /ru/srpm/Branch3/glibc/spec
  def test_srpm_spec_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/spec"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/spec", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch51/glibc/spec"
      assert_equal "http://packages.altlinux.org/#{locale}/5.1/srpms/glibc/spec", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/p5/glibc/spec"
      assert_equal "http://packages.altlinux.org/#{locale}/Platform5/srpms/glibc/spec", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch41/glibc/spec"
      assert_equal "http://packages.altlinux.org/#{locale}/4.1/srpms/glibc/spec", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch4/glibc/spec"
      assert_equal "http://packages.altlinux.org/#{locale}/4.0/srpms/glibc/spec", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # TODO:
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/patches
  # http://sisyphus.ru/ru/srpm/Sisyphus/Ri-li/sources
  # TODO: /ru/srpm/Branch3/glibc/patches
  # TODO: /ru/srpm/Branch3/glibc/sources

  # GET /srpm/:branch/:name/get
  # TODO: /srpm/Branch3/glibc/get
  def test_srpm_get_url
    get '/srpm/Sisyphus/glibc/get'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/get', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch51/glibc/get'
    assert_equal 'http://packages.altlinux.org/ru/5.1/srpms/glibc/get', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/p5/glibc/get'
    assert_equal 'http://packages.altlinux.org/ru/Platform5/srpms/glibc/get', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch41/glibc/get'
    assert_equal 'http://packages.altlinux.org/ru/4.1/srpms/glibc/get', last_response.location
    assert_equal 301, last_response.status

    get '/srpm/Branch4/glibc/get'
    assert_equal 'http://packages.altlinux.org/ru/4.0/srpms/glibc/get', last_response.location
    assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/get
  # TODO: /ru/srpm/Branch3/glibc/get
  def test_srpm_get_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/get"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/get", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch51/glibc/get"
      assert_equal "http://packages.altlinux.org/#{locale}/5.1/srpms/glibc/get", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/p5/glibc/get"
      assert_equal "http://packages.altlinux.org/#{locale}/Platform5/srpms/glibc/get", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch41/glibc/get"
      assert_equal "http://packages.altlinux.org/#{locale}/4.1/srpms/glibc/get", last_response.location
      assert_equal 301, last_response.status

      get "/#{locale}/srpm/Branch4/glibc/get"
      assert_equal "http://packages.altlinux.org/#{locale}/4.0/srpms/glibc/get", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET /srpm/:branch/:name/gear
  def test_srpm_gear_url
    get '/srpm/Sisyphus/glibc/gear'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/gear', last_response.location
    assert_equal 301, last_response.status

    # TODO:
    # get '/srpm/Branch51/glibc/gear'
    # assert_equal 'http://packages.altlinux.org/ru/5.1/srpms/glibc/gear', last_response.location
    # assert_equal 301, last_response.status
    #
    # get '/srpm/p5/glibc/gear'
    # assert_equal 'http://packages.altlinux.org/ru/Platform5/srpms/glibc/gear', last_response.location
    # assert_equal 301, last_response.status
    #
    # get '/srpm/Branch41/glibc/gear'
    # assert_equal 'http://packages.altlinux.org/ru/4.1/srpms/glibc/gear', last_response.location
    # assert_equal 301, last_response.status
    #
    # get '/srpm/Branch4/glibc/gear'
    # assert_equal 'http://packages.altlinux.org/ru/4.0/srpms/glibc/gear', last_response.location
    # assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/gear
  def test_srpm_gear_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/gear"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/gear", last_response.location
      assert_equal 301, last_response.status

      # TODO:
      # get "/#{locale}/srpm/Branch51/glibc/gear"
      # assert_equal "http://packages.altlinux.org/#{locale}/5.1/srpms/glibc/gear", last_response.location
      # assert_equal 301, last_response.status
      #
      # get "/#{locale}/srpm/p5/glibc/gear"
      # assert_equal "http://packages.altlinux.org/#{locale}/Platform5/srpms/glibc/gear", last_response.location
      # assert_equal 301, last_response.status
      #
      # get "/#{locale}/srpm/Branch41/glibc/gear"
      # assert_equal "http://packages.altlinux.org/#{locale}/4.1/srpms/glibc/gear", last_response.location
      # assert_equal 301, last_response.status
      #
      # get "/#{locale}/srpm/Branch4/glibc/gear"
      # assert_equal "http://packages.altlinux.org/#{locale}/4.0/srpms/glibc/gear", last_response.location
      # assert_equal 301, last_response.status
    end
  end

  # GET /srpm/:branch/:name/bugs
  def test_srpm_bugs_url
    get '/srpm/Sisyphus/glibc/bugs'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/bugs', last_response.location
    assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/bugs
  def test_srpm_bugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/bugs"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/bugs", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET /srpm/:branch/:name/allbugs
  def test_srpm_allbugs_url
    get '/srpm/Sisyphus/glibc/allbugs'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/allbugs', last_response.location
    assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/allbugs
  def test_srpm_allbugs_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/allbugs"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/allbugs", last_response.location
      assert_equal 301, last_response.status
    end
  end

  # GET /srpm/:branch/:name/repocop
  def test_srpm_repocop_url
    get '/srpm/Sisyphus/glibc/repocop'
    assert_equal 'http://packages.altlinux.org/ru/Sisyphus/srpms/glibc/repocop', last_response.location
    assert_equal 301, last_response.status
  end

  # GET /:locale/srpm/:branch/:name/repocop
  def test_srpm_repocop_url_with_locale
    ['en', 'ru', 'br'].each do |locale|
      get "/#{locale}/srpm/Sisyphus/glibc/repocop"
      assert_equal "http://packages.altlinux.org/#{locale}/Sisyphus/srpms/glibc/repocop", last_response.location
      assert_equal 301, last_response.status
    end
  end
end
