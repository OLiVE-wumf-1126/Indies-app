require 'rails_helper'

RSpec.describe 'ログインとログアウト', type: :feature do
  before do
    @artist = create(:artist)
  end
  it "アーティストとしてログインする" do
    visit root_path
    find("a", text: "ログイン").click
    click_on "アーティスト"
    fill_in "artist[email]", with: @artist.email
    fill_in "artist[password]", with: @artist.password
    click_on "ログイン"
    expect(page).to have_content '投稿'
  end
  it "アーティストログアウトできる" do
    artistlogin(@artist)
    find("a", text: "メニュー").click
    click_on "ログアウト"
    expect(page).to have_content "ログイン"
  end
end
