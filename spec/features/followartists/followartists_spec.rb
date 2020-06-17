require 'rails_helper'

RSpec.describe 'アーティストフォロー機能', type: :feature do
  before do
    @artist = create(:artist)
    @post = create(:post, artist_id: @artist.id)
    @listener = create(:listener)
  end
  it "リスナーがアーティストをフォローでき、解除できる" do
    listenerlogin(@listener)
    visit root_path
    find('.linkimg').click
    expect { click_on "フォローする" }.to change(Followartist, :count).by(1)
    visit current_path
    expect { click_on "フォロー解除" }.to change(Followartist, :count).by(-1)
  end
end
