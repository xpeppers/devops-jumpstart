require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe 'Blog' do
  describe 'GET on /posts' do
    it 'returns ok' do
      get '/posts'

      expect(last_response).to be_ok
    end
  end

  describe 'POST in /posts' do
    it 'returns ok post' do
      post '/posts', post: { title: 'Test title', body: 'Test text' }

      expect(last_response).to be_redirect
      expect(last_response.location).to include('posts/')
    end
  end
end
