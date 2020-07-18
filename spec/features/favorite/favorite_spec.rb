require 'rails_helper'

RSpec.describe '投稿いいね機能', type: :feature do
  before do
    @artist = create(:artist)
    @post = create(:post, artist_id: @artist.id)
    @listener = create(:listener)
  end
  it 'リスナー投稿をいいねでき、解除できる' do
    listenerlogin(@listener)
    visit root_path
    expect { click_on '☆0' }.to change(Favorite, :count).by(1)
    visit current_path
    expect { click_on '★1' }.to change(Favorite, :count).by(-1)
  end
end
