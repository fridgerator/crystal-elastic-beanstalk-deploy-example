module EBTest
  module Routes
    alias Env = HTTP::Server::Context
    
    get "/", &->HomeController.hello(Env)
  end
end