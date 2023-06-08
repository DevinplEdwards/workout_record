require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
    @exercise = exercises(:one)
    sign_in users(:one)
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post exercise_entries_url(@exercise), params: { entry: { weight: @entry.weight } }
    end

    assert_redirected_to exercise_url(@exercise)
    assert_equal "Entry was successfully saved.", flash[:notice]
  end

  test "should update entry" do
    patch exercise_entry_url(@exercise, @entry), params: { entry: { weight: @entry.weight } }

    assert_redirected_to exercise_url(@exercise)
    assert_equal "Entry was successfully updated.", flash[:notice]
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete exercise_entry_url(@exercise, @entry)
    end

    assert_redirected_to exercise_url(@exercise)
    assert_equal "Entry was successfully destroyed.", flash[:notice]
  end
end
