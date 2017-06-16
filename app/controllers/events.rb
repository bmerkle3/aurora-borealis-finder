get '/' do
  erb :'index'
end


post '/events' do
  # uri = URI('https://api.auroras.live/v1/?type=all&lat=40.7813913&long=-73.976902&forecast=false&threeday=false')
  # http_string = Net::HTTP.get(uri)
  # parsed_response = JSON.parse(http_string)
  # event = parsed_response["probability"]["highest"]
  # puts "reg event: #{event}"
  # @event = Event.create(color: event["colour"], long: event["long"], lat: event["lat"], value: event["value"])
  redirect "/events/2"
  # redirect "/events/#{@event.id}"
end


get '/events/:id' do
  @event = Event.find_by(id: params[:id])
  erb :'events/show'
end
