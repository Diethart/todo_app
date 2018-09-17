require 'rails_helper'

RSpec.describe ChecklistTemplatesController, type: :controller do
  describe 'GET index' do
    let(:checklist_template) { create(:checklist_template) }

    before do
      get :index
    end

    it 'renders template' do
      expect(response).to render_template :index
    end

    it 'assigns @checklist_template' do
      expect(assigns(:checklist_templates)).to eq([checklist_template])
    end
  end

  describe 'GET new' do
    before do
      get :new
    end

    it 'renders template' do
      expect(response).to render_template :new
    end

    it 'assings @checklist_template' do
      expect(assigns(:checklist_template)).to be_a_new(ChecklistTemplate)
    end
  end

  describe 'POST create' do
    let(:item) { create(:item) }

    it 'create a checklist template with ChecklistTemplatesItem' do
      post :create, params: { checklist_template: { items: [item.id] } }

      expect(ChecklistTemplatesItem.last.item_id).to eq(item.id)
      expect(response).to redirect_to checklist_templates_path
    end

    it 'create a checklist template without ChecklistTemplatesItem' do
      count = ChecklistTemplate.count

      post :create, params: { checklist_template: { items: [""] } }

      expect(count).to eq(ChecklistTemplate.count-1)
      expect(response).to redirect_to checklist_templates_path
    end
  end

  describe 'GET edit' do
    let(:checklist_template) { create(:checklist_template) }

    before do
      get :edit, params: { id: checklist_template.id }
    end

    it 'renders template' do
      expect(response).to render_template :edit
    end

    it 'assigns @checklist_template' do
      expect(assigns(:checklist_template)).to eq(checklist_template)
    end
  end

  describe 'PUT update' do
    let(:checklist_template) { create(:checklist_template) }
    let(:item) { create(:item) }
    let(:checklist_templates_item) { create(:checklist_templates_item, checklist_template: checklist_template) }

    it 'destroy checklist templates item' do
      put :update, params: { id: checklist_template.id, checklist_template: { items: [""] } }

      expect(checklist_template.items).to be_empty
    end

    it 'create new checklist templates item' do
      count = checklist_template.items.count

      put :update, params: { id: checklist_template.id, checklist_template: { items: [item.id] } }

      expect(checklist_template.items.count).to eq(count+1)
      expect(checklist_template.items.last).to eq(item)
    end
  end

  describe 'GET show' do
    let(:checklist_template) { create(:checklist_template) }

    before do
      get :show, params: { id: checklist_template.id }
    end

    it 'renders template' do
      expect(response).to render_template :show
    end

    it 'assigns @checklist_template' do
      expect(assigns(:checklist_template)).to eq(checklist_template)
    end
  end

  describe 'DELETE destroy' do
    let(:checklist_template) { create(:checklist_template) }
    let(:second_checklist_template) { create(:checklist_template) }
    let(:checklist_templates_item) { create(:checklist_templates_item, checklist_template: checklist_template)}

    before do
      delete :destroy, params: { id: checklist_template.id }
    end

    it 'assigns @checklist_template' do
      expect(assigns(:checklist_template)).to eq(checklist_template)
    end

    it 'destroys item and checklist templates items' do
      expect(ChecklistTemplate.all).to eq([second_checklist_template])
      expect(ChecklistTemplatesItem.all).to be_empty
    end

    it 'redirects to index' do
      expect(response).to redirect_to(checklist_templates_path)
    end
  end
end
