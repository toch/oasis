# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
put '/data/:id', to: 'data#store'
post '/data', to: 'data#index'
get '/data/:id', to: 'data#fetch'
get '/data', to: 'data#search'
