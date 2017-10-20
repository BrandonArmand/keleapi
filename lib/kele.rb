require 'httparty'
class Kele
    include HTTParty

    def initialize(email, password)
        base_url = 'https://www.bloc.io/api/v1'
        
        post = self.class.post('https://www.bloc.io/api/v1/sessions',
            body: {
                email: email, 
                password: password 
            })
            
        puts post 
    end

end