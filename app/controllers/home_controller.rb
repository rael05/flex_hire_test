class HomeController < ApplicationController
  def index
    response = Request.send_request("
      {
        currentUser {
          name,
          phone,
          email,
          avatarUrl,
          profile {
            urlGithub,
            urlLinkedin,
            city,
            country {
              name
            }
          },
          userSkills{
            experience,
            skill{
              name,
            }
          },
          jobOpportunities(first: 5){
            nodes{
              title,
              status,
              requiredExperienceYears,
              description,
              jobSkills{
                name
              }
            }
          }
        }
      }
    ")
    if response[:status] == Request::SUCCESSFULLY
      @user_data = response.dig("data").dig("currentUser")
      @user_skills = response.dig("data").dig("currentUser").dig("userSkills")
      @user_opportunities = response.dig("data").dig("currentUser").dig("jobOpportunities").dig("nodes")
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
