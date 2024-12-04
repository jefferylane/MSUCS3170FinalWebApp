require 'rails_helper'

RSpec.describe ThreeDFilesController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test_file.stl'), 'application/sla') }

  before do
    sign_in user
  end
  
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      three_d_file = create(:three_d_file, user: user)
      get :show, params: { id: three_d_file.id }
      expect(response).to be_successful
    end
  end
end