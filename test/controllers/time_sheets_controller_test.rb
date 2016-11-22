require 'test_helper'

class TimeSheetsControllerTest < ActionController::TestCase
  test "get new time-sheet form and create time-sheet" do
    get new_time_sheet_path 
    assert_template 'time_sheets/new'
    assert_difference 'TimeSheet.count', 1 do
      post_via_redirect time_sheets_path, time_sheet: {}
    end
    assert_template root_path
    
  end
end
