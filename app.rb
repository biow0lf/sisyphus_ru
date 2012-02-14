require 'rubygems'
require 'bundler/setup'
require 'sinatra'

# before '/*' do
#   unless request.path_info == '/'
#     while request.path_info[-1] == '/'
#       request.path_info = request.path_info[0..-2]
#     end
#   end
# end

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
