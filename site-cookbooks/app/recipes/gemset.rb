rvm_gemset "#{node['rvm']['app_gemset']}" do
  ruby_string "#{node['rvm']['default_ruby']}"
  action      :create
end

rvm_gemset "#{node['rvm']['default_ruby']}@#{node['rvm']['app_gemset']}"