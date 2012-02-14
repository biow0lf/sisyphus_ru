require 'rubygems'
require 'bundler/setup'
require 'sinatra'

get '/' do
  redirect 'http://packages.altlinux.org/ru', 301
end

get '/:first' do
  case params[:first]
  when 'project'
    redirect 'http://packages.altlinux.org/ru/project', 301
  when 'security'
    redirect 'http://packages.altlinux.org/ru/security', 301
  when 'people'
    redirect 'http://packages.altlinux.org/ru/Sisyphus/people', 301
  when 'packages'
    redirect 'http://packages.altlinux.org/ru/Sisyphus/packages', 301
  when 'en', 'ru', 'br'
    redirect "http://packages.altlinux.org/#{params[:first]}", 301
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second' do
  case params[:first]
  when 'team'
    redirect "http://packages.altlinux.org/ru/Sisyphus/teams/#{params[:second]}", 301
  when 'packager'
    redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{params[:second]}", 301
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{params[:second]}", 301
  when 'en', 'ru', 'br'
    case params[:second]
    when 'project'
      redirect "http://packages.altlinux.org/#{params[:first]}/project", 301
    when 'security'
      redirect "http://packages.altlinux.org/#{params[:first]}/security", 301
    when 'people'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/people", 301
    when 'packages'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/packages", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third' do
  case params[:first]
  when 'packager'
    case params[:third]
    when 'srpms'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{params[:second]}/srpms", 301
    when 'bugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{params[:second]}/bugs", 301
    when 'allbugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{params[:second]}/allbugs", 301
    when 'repocop'
      redirect "http://packages.altlinux.org/ru/Sisyphus/maintainers/#{params[:second]}/repocop", 301
    else
      raise Sinatra::NotFound
    end
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{params[:second]}/#{params[:third]}", 301
  when 'srpm'
    redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}", 301
  when 'en', 'ru', 'br'
    case params[:second]
    when 'team'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/teams/#{params[:third]}", 301
    when 'packager'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/maintainers/#{params[:third]}", 301
    when 'packages'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/packages/#{params[:third]}", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third/:fourth' do
  case params[:first]
  when 'packages'
    redirect "http://packages.altlinux.org/ru/Sisyphus/packages/#{params[:second]}/#{params[:third]}/#{params[:fourth]}", 301
  when 'srpm'
    case params[:fourth]
    when 'changelog'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/changelog", 301
    when 'spec'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/spec", 301
    when 'get'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/get", 301
    when 'gear'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/gear", 301
    when 'bugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/bugs", 301
    when 'allbugs'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/allbugs", 301
    when 'repocop'
      redirect "http://packages.altlinux.org/ru/Sisyphus/srpms/#{params[:third]}/repocop", 301
    else
      raise Sinatra::NotFound
    end
  when 'en', 'ru', 'br'
    case params[:second]
    when 'packager'
      case params[:fourth]
      when 'srpms'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/maintainers/#{params[:third]}/srpms", 301
      when 'bugs'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/maintainers/#{params[:third]}/bugs", 301
      when 'allbugs'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/maintainers/#{params[:third]}/allbugs", 301
      when 'repocop'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/maintainers/#{params[:third]}/repocop", 301
      else
        raise Sinatra::NotFound
      end
    when 'packages'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/packages/#{params[:third]}/#{params[:fourth]}", 301
    when 'srpm'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}", 301
    else
      raise Sinatra::NotFound
    end
  else
    raise Sinatra::NotFound
  end
end

get '/:first/:second/:third/:fourth/:fifth' do
  case params[:first]
  when 'en', 'ru', 'br'
    case params[:second]
    when 'packages'
      redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/packages/#{params[:third]}/#{params[:fourth]}/#{params[:fifth]}", 301
    when 'srpm'
      case params[:fifth]
      when 'changelog'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/changelog", 301
      when 'spec'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/spec", 301
      when 'get'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/get", 301
      when 'gear'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/gear", 301
      when 'bugs'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/bugs", 301
      when 'allbugs'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/allbugs", 301
      when 'repocop'
        redirect "http://packages.altlinux.org/#{params[:first]}/Sisyphus/srpms/#{params[:fourth]}/repocop", 301
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
