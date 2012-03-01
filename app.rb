require 'rubygems'
require 'bundler/setup'
require 'sinatra'

get '/' do
  redirect 'http://packages.altlinux.org/ru', 301
end

get '/:first' do
  first = params[:first]
  case first
  when 'project'
    redirect 'http://packages.altlinux.org/ru/project', 301
  when 'security'
    redirect 'http://packages.altlinux.org/ru/security', 301
  when 'people'
    redirect 'http://packages.altlinux.org/ru/Sisyphus/people', 301
  when 'packages'
    redirect 'http://packages.altlinux.org/ru/Sisyphus/packages', 301
  when 'en', 'ru', 'br'
    redirect "http://packages.altlinux.org/#{first}", 301
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second' do
  first = params[:first]
  second = params[:second]
  case first
  when 'team'
    redirect "http://packages.altlinux.org/ru/Sisyphus/teams/#{second}", 301
  when 'packager'
    redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{second}", 301
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{second}", 301
  when 'en', 'ru', 'br'
    case second
    when 'project'
      redirect "http://packages.altlinux.org/#{first}/project", 301
    when 'security'
      redirect "http://packages.altlinux.org/#{first}/security", 301
    when 'people'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/people", 301
    when 'packages'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/packages", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third' do
  first = params[:first]
  second = params[:second]
  third = params[:third]
  case first
  when 'packager'
    case third
    when 'srpms'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{second}/srpms", 301
    when 'bugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{second}/bugs", 301
    when 'allbugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{second}/allbugs", 301
    when 'repocop'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{second}/repocop", 301
    else
      raise Sinatra::NotFound
    end
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{second}/#{third}", 301
  when 'srpm'
    branch = second
    branch = '5.1' if branch == 'Branch51'
    branch = 'Platform5' if branch == 'p5'
    branch = '4.1' if branch == 'Branch41'
    branch = '4.0' if branch == 'Branch4'
    redirect "http://packages.altlinux.org/ru/#{branch}/srpms/#{third}", 301
  when 'en', 'ru', 'br'
    case second
    when 'team'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/teams/#{third}", 301
    when 'packager'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/maintainers/#{third}", 301
    when 'packages'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/packages/#{third}", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third/:fourth' do
  first = params[:first]
  second = params[:second]
  third = params[:third]
  fourth = params[:fourth]
  case first
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{second}/#{third}/#{fourth}", 301
  when 'srpm'
    case params[:fourth]
    when 'changelog'
      branch = second
      branch = '5.1' if branch == 'Branch51'
      branch = 'Platform5' if branch == 'p5'
      branch = '4.1' if branch == 'Branch41'
      branch = '4.0' if branch == 'Branch4'
      redirect "http://packages.altlinux.org/ru/#{branch}/srpms/#{third}/changelog", 301
    when 'spec'
      branch = second
      branch = '5.1' if branch == 'Branch51'
      branch = 'Platform5' if branch == 'p5'
      branch = '4.1' if branch == 'Branch41'
      branch = '4.0' if branch == 'Branch4'
      redirect "http://packages.altlinux.org/ru/#{branch}/srpms/#{third}/spec", 301
    when 'get'
      branch = second
      branch = '5.1' if branch == 'Branch51'
      branch = 'Platform5' if branch == 'p5'
      branch = '4.1' if branch == 'Branch41'
      branch = '4.0' if branch == 'Branch4'
      redirect "http://packages.altlinux.org/ru/#{branch}/srpms/#{third}/get", 301
    when 'gear'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{third}/gear", 301
    when 'bugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{third}/bugs", 301
    when 'allbugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{third}/allbugs", 301
    when 'repocop'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{third}/repocop", 301
    else
      raise Sinatra::NotFound
    end
  when 'en', 'ru', 'br'
    case second
    when 'packager'
      case fourth
      when 'srpms'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/maintainers/#{third}/srpms", 301
      when 'bugs'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/maintainers/#{third}/bugs", 301
      when 'allbugs'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/maintainers/#{third}/allbugs", 301
      when 'repocop'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/maintainers/#{third}/repocop", 301
      else
        raise Sinatra::NotFound
      end
    when 'packages'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/packages/#{third}/#{fourth}", 301
    when 'srpm'
      branch = third
      branch = '5.1' if branch == 'Branch51'
      branch = 'Platform5' if branch == 'p5'
      branch = '4.1' if branch == 'Branch41'
      branch = '4.0' if branch == 'Branch4'
      redirect "http://packages.altlinux.org/#{first}/#{branch}/srpms/#{fourth}", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third/:fourth/:fifth' do
  first = params[:first]
  second = params[:second]
  third = params[:third]
  fourth = params[:fourth]
  fifth = params[:fifth]
  case first
  when 'en', 'ru', 'br'
    case second
    when 'packages'
      redirect "http://packages.altlinux.org/#{first}/Sisyphus/packages/#{third}/#{fourth}/#{fifth}", 301
    when 'srpm'
      case params[:fifth]
      when 'changelog'
        branch = third
        branch = '5.1' if branch == 'Branch51'
        branch = 'Platform5' if branch == 'p5'
        branch = '4.1' if branch == 'Branch41'
        branch = '4.0' if branch == 'Branch4'
        redirect "http://packages.altlinux.org/#{first}/#{branch}/srpms/#{fourth}/changelog", 301
      when 'spec'
        branch = third
        branch = '5.1' if branch == 'Branch51'
        branch = 'Platform5' if branch == 'p5'
        branch = '4.1' if branch == 'Branch41'
        branch = '4.0' if branch == 'Branch4'
        redirect "http://packages.altlinux.org/#{first}/#{branch}/srpms/#{fourth}/spec", 301
      when 'get'
        branch = third
        branch = '5.1' if branch == 'Branch51'
        branch = 'Platform5' if branch == 'p5'
        branch = '4.1' if branch == 'Branch41'
        branch = '4.0' if branch == 'Branch4'
        redirect "http://packages.altlinux.org/#{first}/#{branch}/srpms/#{fourth}/get", 301
      when 'gear'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/srpms/#{fourth}/gear", 301
      when 'bugs'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/srpms/#{fourth}/bugs", 301
      when 'allbugs'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/srpms/#{fourth}/allbugs", 301
      when 'repocop'
        redirect "http://packages.altlinux.org/#{first}/Sisyphus/srpms/#{fourth}/repocop", 301
      else
        raise Sinatra::NotFound
      end
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end
