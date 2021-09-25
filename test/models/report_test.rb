# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @alices_report = reports(:alices_report)
    @others_report = reports(:others_report)
  end

  test '#editable?' do
    assert @alices_report.editable?(@alice)
    assert_not @others_report.editable?(@alice)
  end

  test '#created_on' do
    assert_equal @alices_report.created_at.to_date, @alices_report.created_on
  end
end
