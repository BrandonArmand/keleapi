require 'httparty'
require 'json'
class Kele
    include HTTParty

    def initialize(email, password)
        base_url = 'https://www.bloc.io/api/v1'
        
        post = self.class.post('https://www.bloc.io/api/v1/sessions',
            body: {
                email: email, 
                password: password 
            })
        
        @auth_token = post['auth_token']
        if !@auth_token
           p "Error retrieving token, try again"
        else
           p "Token recieved"
        end
    end
    
    def get_me
        response = self.class.get('https://www.bloc.io/api/v1/users/me', 
            headers: { 
                "authorization" => @auth_token 
            })
            
        parsed_response = JSON.parse(response.body) 
    end

end