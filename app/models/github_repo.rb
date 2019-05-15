class GithubRepo

  attr_reader :name, :url

  def initialize(hash)
    @name = hash["name"]
    @url = hash["html_url"]
  end

  def authenticate_user
    client_id = ENV['d39518d29d8d39a37017']
    redirect_uri = CGI.escape("http://localhost:3000/auth")
    github_url = "https://github.com/login/oauth/authorize?client_id=#{d39518d29d8d39a37017}"
    redirect_to github_url unless logged_in?  end

  def authenticate!(client_id, client_secret, code)
   response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV["d39518d29d8d39a37017"], client_secret: ENV["02dbaf073d5a7a127693bdc3c833ca58833ff390"],code: code}, {'Accept' => 'application/json'}
   access_hash = JSON.parse(response.body)

   user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
   user_json = JSON.parse(user_response.body)
   session[:username] = user_json["login"]

   redirect_to '/'
 end

end
