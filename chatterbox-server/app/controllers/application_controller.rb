class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/messages' do
    messages = Message.all 
    messages.to_json
  end

  post '/messages' do
    added_post = Message.create(
      body: params[:body],
      username: params[:username],
      created_at: params[:created_at],
      updated_at: params[:updated_at],
    )
    added_post.to_json
  end

  patch '/messages/:id' do 
    target_post = Message.find(params[:id])
    target_post.update(
      body: params[:body]
    )
    target_post.to_json
  end

  delete '/messages/:id' do
    target_post = Message.find(params[:id])
    target_post.destroy
    target_post.to_json
  end
  
end
