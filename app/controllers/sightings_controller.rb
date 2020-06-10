class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location] #include also works here
      end

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location } #produces a NDS we the bird and location datanested within the sighting, but really verbose
    #     if sighting
    #          #using include alternatively produces a similar JSON 
    #          #using except to exclude data
    #          #nesting only to limit data further
    #          render json: sighting, include: [:bird, :location], except: [:updated_at]
    #     else
    #     render json: { message: 'No sighting found with that id' } #error handling
    #     end
    #   end

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting.to_json(:include => {:bird => {:only => [:name, :species]}, :location => {:only => [:latitude, :longitude]}}, :except => [:updated_at])
      end


      #explicitly writng the above as option for the to_json method
    #   def index
    #     sightings = Sighting.all
    #     render json: sightings.to_json(include: [:bird, :location])
    #   end
       
    #   def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting.to_json(include: [:bird, :location])
    #   end
end
