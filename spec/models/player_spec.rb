require 'rails_helper'

RSpec.describe Player, type: :model do
  it "gets challenger players data" do
    response = RestClient.get 'https://www.google.co.uk'
    expect(response.code).to eq(200)
  end
end
