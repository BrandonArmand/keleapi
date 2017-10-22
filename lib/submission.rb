module Submission
   def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
        sender = self.get_me['current_enrollment']['id']
        
        post = self.class.post("#{@base_url}/checkpoint_submissions",
            body: {
                assignment_branch: assignment_branch,
                assignment_commit_link: assignment_commit_link,
                checkpoint_id: checkpoint_id,
                comment: comment,
                enrollment_id: sender
            },
            headers: { 
                "authorization" => @auth_token 
            }) 
   end
   
   def update_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, id)
        sender = self.get_me['current_enrollment']['id']
        
        post = self.class.post("#{@base_url}/checkpoint_submissions/:#{id}",
            body: {
                assignment_branch: assignment_branch,
                assignment_commit_link: assignment_commit_link,
                checkpoint_id: checkpoint_id,
                comment: comment,
                enrollment_id: sender
            },
            headers: { 
                "authorization" => @auth_token 
            }) 
   end
end