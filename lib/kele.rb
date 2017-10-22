require 'httparty'
require 'json'
require './lib/roadmap'
class Kele
    include HTTParty
    include Roadmap

    def initialize(email, password)
        @base_url = 'https://www.bloc.io/api/v1'
        
        post = self.class.post("#{@base_url}/sessions",
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
        response = self.class.get("#{@base_url}/users/me", 
            headers: { 
                "authorization" => @auth_token 
            })
            
        parsed_response = JSON.parse(response.body) 
    end
    
    def get_mentor_availability(id)
        response = self.class.get("#{@base_url}/mentors/#{id}/student_availability", 
            headers: { 
                "authorization" => @auth_token 
            })
            
        parsed_response = JSON.parse(response.body) 
    end
    
    def get_messages(page=nil)
        if page
            response = self.class.get("#{@base_url}/message_threads", 
                body: {
                    page: page
                },
                headers: { 
                    "authorization" => @auth_token 
                })
        else
            response = self.class.get("#{@base_url}/message_threads", 
                headers: { 
                    "authorization" => @auth_token 
                })
        end
        
        parsed_response = JSON.parse(response.body) 
    end
    
    def create_message(recipient_id, subject, message)
        sender = self.get_me['email']
        
        post = self.class.post("#{@base_url}/messages",
            body: {
                sender: sender, 
                recipient_id: recipient_id, 
                subject: subject,
                "stripped-text": message
            },
            headers: { 
                "authorization" => @auth_token 
            })
    end
end