# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alices_report)
    visit root_url
    fill_in 'Eメール',	with: 'alice@example.com'
    fill_in 'パスワード',	with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the reports index' do
    click_on '日報'
    assert_selector 'h1', text: '日報'
  end

  test 'showing a report' do
    visit report_url(@report)
    assert_selector 'h1', text: '日報の詳細'
    assert_text @report.title
    assert_text @report.content
    assert_text @report.created_at.strftime('%Y/%m/%d')
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: @report.title
    fill_in '内容',	with: @report.content
    click_on '登録する'
    assert_text '日報が作成されました。'
    assert_text @report.title
    assert_text @report.content
  end

  test 'updating a report' do
    visit reports_url
    click_on '編集'
    fill_in 'タイトル', with: 'タイトル変更'
    fill_in '内容',	with: '内容変更'
    click_on '更新する'
    assert_text '日報が更新されました'
    assert_text 'タイトル変更'
    assert_text '内容変更'
  end

  test 'destroying a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました'
    assert_no_text @report.title
    assert_no_text @report.content
  end
end
