module Roadmap    
    def get_roadmap(id)
        response = self.class.get("#{@base_url}/roadmaps/#{id}", 
            headers: { 
                "authorization" => @auth_token 
            })
            
        parsed_response = JSON.parse(response.body) 
    end
    
    def get_checkpoint(id)
        response = self.class.get("#{@base_url}/checkpoints/#{id}", 
            headers: { 
                "authorization" => @auth_token 
            })
            
        parsed_response = JSON.parse(response.body) 
    end
end