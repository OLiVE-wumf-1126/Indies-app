require 'rails_helper'

RSpec.describe 'リスナー情報編集', type: :feature do
  before do
    @listener = create(:listener)
  end
  it "リスナー情報編集が反映さいれている" do
    listenerlogin(@listener)
    visit root_path
    click_on "ユーザー編集"
    fill_in "listener[current_password]", with: @listener.password
    fill_in "listener[nickname]", with: "newニックネーム"
    click_on "編集完了"
    expect(page).to have_content "newニックネーム"
  end
end