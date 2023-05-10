
class EventsController < ApplicationController

  def index
      events = Event.all
      render json: events
  end



  def show
      event = Event.find(params[:id])
      render json: event, serializer: EventShowSerializer
    end

    def update_attendees
      # Your logic for updating the attendees
      # ...
      @event = Event.find(params[:id])

      if @event.update(event_params)
        # update successful
        redirect_to @event
      else
        # update failed
        render 'edit'
      end
    
      # Broadcast the updated event to the channel
      ActionCable.server.broadcast("events_#{event.id}", event: render_event(event))
    end
    
    private
    
    def render_event(event)
      ApplicationController.renderer.render(partial: 'events/event', locals: { event: event })
    end


    private

  def event_params
    params.permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :seatgeek_id, :id, :user_id, :users )
  end




end



# class EventsController < ApplicationController

#     def index
#         events = Event.all
#         render json: events
#     end

  

#     # def show
#     #     event = Event.find(params[:id])
#     #     render json: event, serializer: EventShowSerializer
#     #   end

#       def show
#         event = Event.find(params[:id])
#         formatted_time = event.datetime.strftime("%l:%M %p")
#         render json: {event: event, formatted_time: formatted_time}, serializer: EventShowSerializer
#       end

#       def update_attendees
#         # Your logic for updating the attendees
#         # ...
#         @event = Event.find(params[:id])
  
#         if @event.update(event_params)
#           # update successful
#           redirect_to @event
#         else
#           # update failed
#           render 'edit'
#         end
      
#         # Broadcast the updated event to the channel
#         ActionCable.server.broadcast("events_#{event.id}", event: render_event(event))
#       end
      
#       private
      
#       def render_event(event)
#         ApplicationController.renderer.render(partial: 'events/event', locals: { event: event })
#       end


#       private
  
#     def event_params
#       params.permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :seatgeek_id, :id, :user_id, :users )
#     end

  
  

# end


  #   def to_events
  #     event_ids = self.events.map do |e|
  #      Event.find_or_create_by(id: e["id"]) do |event|
  #          event.performer_name = e["performers"][0]["name"]
  #          event.performer_image = e["performers"][0]["image"]
  #          event.venue_name = e["venue"]["name"]
  #          event.venue_address = e["venue"]["extended_address"]
  #          event.venue_city = e["venue"]["city"]
  #          event.venue_state = e["venue"]["state"]
  #          event.venue_country = e["venue"]["country"]
  #          event.venue_zipcode= e["venue"]["postal_code"]
  #          event.datetime = e["datetime_local"]          
  #      end.id
  #    end
  #    Event.where(id: events_ids)
  #  end

   #fixed postgres bug

    # def create
    #   user = User.find_by_username(params[:username])
    #   if user && user.authenticate(params[:password])
    #     event = SeatGeek.new(event_params).to_events
    #     if event.save
    #         render json: event
    #       else
    #         render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #     end
    #   end
    # end

    # def update
    #   # event = Event.find_by_id(params[:id]))
    #   user_event =  logged_in_user.Event.find(params[:id])
    #   if user_event.update(event_params)
    #     # render json: event
    #     # user_event.user_id = session[:user_id] 
    #     # render json: event, include: ['users'], serializer: UserEventSerializer
    #     render json: { user_event: UserEventSerializer.new(user_event), jwt: token }, status: :created
        
    #   else
    #     render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #   end
    # end




    # def create
    #   user = User.find_by_username(params[:username])
    #   if user && user.authenticate(params[:password])
    #     response = HTTP.get("https://api.seatgeek.com/2/events?performers.slug=#{event_params}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
    #     events = Event.build(event_params)
    #     if events.save
    #       events.to_events
    #         render json: events
    #       else
    #         render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #     end
    #   end
    # end
