require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    foreign = Robot.new
    foreign.needs_repairs=("broken_leg")
    foreign.foreign_model=("honda")
    # act
    actual_value = foreign.station
    expected_value = 1
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    vintage = Robot.new
    vintage.needs_repairs=("broken face")
    vintage.vintage_model=("Minolta")
    # act
    actual_value = vintage.station
    expected_value = 2
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    standard = Robot.new
    standard.needs_repairs=("broken bunghole")
    # act
    actual_value = standard.station
    expected_value = 3
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    no_problem = Robot.new
    # act
    actual_value = no_problem.station
    expected_value = 4
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    taskboyz = Robot.new
    # act
    actual_value = taskboyz.prioritize_tasks
    expected_value = -1
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    dothis = Robot.new
    dothis.todos=(["this", "is", "so", "mindblowing"])
    # act
    actual_value = dothis.prioritize_tasks
    expected_value = "this"
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    slacker = Robot.new
    slacker.day_off=("Sunday")

    # act
    actual_value = slacker.workday?("Sunday")
    expected_value = false
    # assert
    assert_equal(expected_value, actual_value)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    worker = Robot.new
    worker.day_off=("Sunday")
    # act
    actual_value = worker.workday?("Monday")
    expected_value = true
    # assert
    assert_equal(expected_value, actual_value)
  end

end
