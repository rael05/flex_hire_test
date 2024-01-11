class Request < ApplicationRecord
  ERROR = "error"
  SUCCESSFULLY = "ok"

  def self.send_request(query, variables: nil)
    request = HTTParty.post(
      ENV["flexhire_url"],
      headers: {
        "Content-Type": "application/json",
        "FLEXHIRE-API-KEY": ENV["flexhire_api_key"],
      },
      body: {
        query: query,
        variables: variables
      }.to_json
    )
    if request["data"].present?
      {status: SUCCESSFULLY, **request}
    else
      {status: ERROR, **request}
    end
  end
end