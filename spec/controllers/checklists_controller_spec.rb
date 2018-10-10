require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
  describe 'GET index' do
    let(:checklist) { create(:checklist) }

    before do
      get :index
    end

    it 'renders template' do
      expect(response).to render_template :index
    end

    it 'assigns @checklists' do
      expect(assigns(:checklists)).to eq([checklist])
    end
  end

  describe 'GET new' do
    before do
      get :new
    end

    it 'renders template' do
      expect(response).to render_template :new
    end

    it 'assings @checklist' do
      expect(assigns(:checklist)).to be_a_new(Checklist)
    end
  end

  describe 'POST create' do
    let(:checklist_template) { create(:checklist_template) }

    it 'create a checklist' do
      expect{ post :create, params: { checklist: { checklist_template_id: checklist_template.id, title: 'test' } } }.to change{ Checklist.count }.by(1)
    end

    it 'redirects_to checklist index' do
      post :create, params: { checklist: { checklist_template_id: checklist_template.id, title: 'test' } }

      expect(response).to redirect_to checklists_path
    end
  end

  describe 'GET edit' do
    let(:checklist) { create(:checklist) }

    before do
      get :edit, params: { id: checklist.id }
    end

    it 'renders template' do
      expect(response).to render_template :edit
    end

    it 'assigns @checklist' do
      expect(assigns(:checklist)).to eq(checklist)
    end
  end

  describe 'GET update' do
    let(:checklist) { create(:checklist) }

    before do
      get :update, params: { id: checklist.id, checklist: { title: 'test', checklist_template_id: checklist.checklist_template_id } }
    end

    it 'redirects to show' do
      expect(response).to redirect_to(checklist_path(checklist.id))
    end

    it 'assigns @checklist' do
      expect(assigns(:checklist)).to eq(checklist)
    end

    it 'change checklist title' do
      expect(checklist.reload.title).to eq('test')
    end
  end

  describe 'GET show' do
    let(:checklist) { create(:checklist) }

    before do
      get :show, params: { id: checklist.id }
    end

    it 'renders template' do
      expect(response).to render_template :show
    end

    it 'assigns @checklist' do
      expect(assigns(:checklist)).to eq(checklist)
    end
  end

  describe 'DELETE destroy' do
    let(:checklist) { create(:checklist) }

    before do
      delete :destroy, params: { id: checklist.id }
    end

    it 'assigns @checklist' do
      expect(assigns(:checklist)).to eq(checklist)
    end

    it 'destroys checklist' do
      expect(Checklist.all).to be_empty
    end

    it 'redirects to index' do
      expect(response).to redirect_to(checklists_path)
    end
  end
end
