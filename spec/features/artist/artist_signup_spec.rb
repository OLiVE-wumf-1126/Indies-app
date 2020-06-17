require 'rails_helper'

RSpec.describe "アーティスト新規登録", type: :feature do
  before do
    @artist = build(:artist)
  end
  it "新規登録" do
    visit new_artist_registration_path
    fill_in "artist[artistname]", with: @artist.artistname
    fill_in "artist[email]", with: @artist.email
    fill_in "artist[password]", with: @artist.password
    fill_in "artist[password_confirmation]", with: @artist.password
    expect { click_on "登録完了" }.to change(Artist, :count).by(1)
  end
end