require 'test_helper'

class SolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solution = solutions(:one)
  end

  test "should get index" do
    get solutions_url
    assert_response :success
  end

  test "should get new" do
    get new_solution_url
    assert_response :success
  end

  test "should create solution" do
    assert_difference('Solution.count') do
      post solutions_url, params: { solution: { description: @solution.description } }
    end

    assert_redirected_to solution_path(Solution.last)
  end

  test "should show solution" do
    get solution_url(@solution)
    assert_response :success
  end

  test "should get edit" do
    get edit_solution_url(@solution)
    assert_response :success
  end

  test "should update solution" do
    patch solution_url(@solution), params: { solution: { description: @solution.description } }
    assert_redirected_to solution_path(@solution)
  end

  test "should destroy solution" do
    assert_difference('Solution.count', -1) do
      delete solution_url(@solution)
    end

    assert_redirected_to solutions_path
  end
end
