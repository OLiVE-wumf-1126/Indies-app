require 'rails_helper'

RSpec.describe 'アーティスト情報編集', type: :feature do
  before do
    @artist = create(:artist)
  end
  it "アーティスト情報編集が反映さいれている" do
    artistlogin(@artist)
    find("a", text: "メニュー").click
    click_on "マイページ"
    click_on "アーティスト情報編集"
    fill_in "artist[current_password]", with: @artist.password
    fill_in "artist[profile]", with: "テストプロフィール"
    click_on "編集完了"
    find("a", text: "メニュー").click
    click_on "マイページ"
    expect(page).to have_content 'テストプロフィール'
  end
end
