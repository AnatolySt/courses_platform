require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:group) { create :group }
  let(:course) { create :course, groups: group }

  describe 'GET #index' do
    let!(:courses) { create_list(:course, 2, :with_groups) }
    before { get :index }

    it 'has successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      expect(response).should render_template(:index)
    end

    it 'populates an array of all courses' do
      expect(assigns(:courses)).to match_array(courses)
    end

    context 'with views rendering' do
      render_views

      it 'response body contains courses info' do
        expect(response.body).to include(courses.first.title)
        expect(response.body).to include(courses.last.title)
      end
    end
  end

  describe 'GET #show' do
    let(:course) { create :course }
    let!(:group) { create :group, :with_students, course: course }
    before { get :show, params: { id: course.id } }

    it 'has successful response' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      expect(response).should render_template(:show)
    end

    it 'populates an array of all courses' do
      expect(assigns(:course)).to match(course)
    end

    context 'with views rendering' do
      render_views

      it 'response body contains course info' do
        expect(response.body).to include(course.title)
        expect(response.body).to include(group.title)
        expect(response.body).to include(group.students.first.full_name)
      end
    end
  end
end