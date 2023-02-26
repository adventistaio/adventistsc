require 'rails_helper'

RSpec.describe 'route for Root path', type: :routing do
  it 'routes /home to the Home controller' do
    expect(get('/')).to route_to('home#index')
  end
end
