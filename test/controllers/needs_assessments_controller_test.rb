require 'test_helper'

class NeedsAssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @needs_assessment = needs_assessments(:one)
  end

  test "should get index" do
    get needs_assessments_url
    assert_response :success
  end

  test "should get new" do
    get new_needs_assessment_url
    assert_response :success
  end

  test "should create needs_assessment" do
    assert_difference('NeedsAssessment.count') do
      post needs_assessments_url, params: { needs_assessment: { is_known: @needs_assessment.is_known, needs: @needs_assessment.needs, relationship: @needs_assessment.relationship, time_frame: @needs_assessment.time_frame, user_id: @needs_assessment.user_id } }
    end

    assert_redirected_to needs_assessment_url(NeedsAssessment.last)
  end

  test "should show needs_assessment" do
    get needs_assessment_url(@needs_assessment)
    assert_response :success
  end

  test "should get edit" do
    get edit_needs_assessment_url(@needs_assessment)
    assert_response :success
  end

  test "should update needs_assessment" do
    patch needs_assessment_url(@needs_assessment), params: { needs_assessment: { is_known: @needs_assessment.is_known, needs: @needs_assessment.needs, relationship: @needs_assessment.relationship, time_frame: @needs_assessment.time_frame, user_id: @needs_assessment.user_id } }
    assert_redirected_to needs_assessment_url(@needs_assessment)
  end

  test "should destroy needs_assessment" do
    assert_difference('NeedsAssessment.count', -1) do
      delete needs_assessment_url(@needs_assessment)
    end

    assert_redirected_to needs_assessments_url
  end
end
