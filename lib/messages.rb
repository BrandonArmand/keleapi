module Messages
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