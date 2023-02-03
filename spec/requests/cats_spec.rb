require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'returns all the cats' do
      # create a db entry
      Cat.create(
        name: 'Kevin',
        age: 9,
        enjoys: 'looking out the window',
        image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
      )
      # make a request: HTTP Verb: GET
      get '/cats'

      # To See the response coming back to the request
        # p response
        
      # Two ways to test:
      cat = JSON.parse(response.body)
  
      expect(cat.length).to equal(1) # This gets the length of our array (1)
      expect(response).to have_http_status(200) # This tests the Status Code (success)
    end
  end

  describe "Post /create" do
    it 'creates a cat' do
      cat_params = {
        cat: {
          name: 'Kevin',
          age: 9,
          enjoys: 'looking out the window',
          image: 'https://media.istockphoto.com/id/1361956153/photo/black-cat-sticking-out-tongue-funny-portrait.jpg?b=1&s=170667a&w=0&k=20&c=O6mSvSQiiXT-8Vgfc71ScUQ8manUnq-dtcKTwSCq_bY='
        }
      }
      # make a request to create: HTTP Verb: POST
      post '/cats', params: cat_params

      # Test Status Code
      expect(response).to have_http_status(200)

      # Test Payload
      cat = Cat.first

      expect(cat.name).to eq('Kevin')
      expect(cat.enjoys).to eq('looking out the window')      
    end
  end
end
