get '/' do
  erb :'index'
end


get '/events' do
  puts params.inspect
  erb
end
