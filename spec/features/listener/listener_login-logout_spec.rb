require 'rails_helper'

RSpec.describe 'ログインとログアウト', type: :feature do
  before do
    @listener = create(:listener)
  end
  it "リスナーとしてログインする" do
    visit root_path
    find("a", text: "ログイン").click
    click_on "リスナー"
    fill_in "listener[email]", with: @listener.email
    fill_in "listener[password]", with: @listener.password
    click_on "ログイン"
    expect(page).to have_content 'フォローアーティスト一覧'
  end
  it "リスナーログアウトできる" do
    listenerlogin(@listener)
    find("a", text: "メニュー").click
    click_on "ログアウト"
    expect(page).to have_content "ログイン"
  end
end
