require 'rails_helper'

RSpec.describe HackersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns all hackers ordered by handle" do
      hacker_b = create(:hacker, handle: "bbb")
      hacker_a = create(:hacker, handle: "aaa")

      get :index
      expect(assigns(:hackers)).to eq([ hacker_a, hacker_b ])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns a new hacker" do
      get :new
      expect(assigns(:hacker)).to be_a_new(Hacker)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new hacker" do
        expect {
          post :create, params: { hacker: attributes_for(:hacker) }
        }.to change(Hacker, :count).by(1)
      end

      it "redirects to the hackers index" do
        post :create, params: { hacker: attributes_for(:hacker) }
        expect(response).to redirect_to(hackers_path)
      end

      it "sets a success notice" do
        post :create, params: { hacker: attributes_for(:hacker) }
        expect(flash[:notice]).to eq("Hacker created successfully.")
      end
    end

    context "with invalid params" do
      it "does not create a hacker" do
        expect {
          post :create, params: { hacker: { handle: "" } }
        }.not_to change(Hacker, :count)
      end

      it "renders new template" do
        post :create, params: { hacker: { handle: "" } }
        expect(response).to render_template(:new)
      end

      it "returns unprocessable_entity status" do
        post :create, params: { hacker: { handle: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with duplicate handle" do
      it "does not create a duplicate hacker" do
        existing_hacker = create(:hacker, handle: "geohot")

        expect {
          post :create, params: { hacker: { handle: "geohot", team: false } }
        }.not_to change(Hacker, :count)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      hacker = create(:hacker)
      get :edit, params: { id: hacker.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns the requested hacker" do
      hacker = create(:hacker)
      get :edit, params: { id: hacker.id }
      expect(assigns(:hacker)).to eq(hacker)
    end
  end

  describe "PATCH #update" do
    let(:hacker) { create(:hacker, handle: "original_handle") }

    context "with valid params" do
      it "updates the hacker" do
        patch :update, params: { id: hacker.id, hacker: { handle: "new_handle" } }
        hacker.reload
        expect(hacker.handle).to eq("new_handle")
      end

      it "redirects to hackers index" do
        patch :update, params: { id: hacker.id, hacker: attributes_for(:hacker) }
        expect(response).to redirect_to(hackers_path)
      end

      it "sets a success notice" do
        patch :update, params: { id: hacker.id, hacker: { handle: "updated" } }
        expect(flash[:notice]).to eq("Hacker updated successfully.")
      end
    end

    context "with invalid params" do
      it "does not update the hacker" do
        patch :update, params: { id: hacker.id, hacker: { handle: "" } }
        hacker.reload
        expect(hacker.handle).to eq("original_handle")
      end

      it "renders edit template" do
        patch :update, params: { id: hacker.id, hacker: { handle: "" } }
        expect(response).to render_template(:edit)
      end

      it "returns unprocessable_entity status" do
        patch :update, params: { id: hacker.id, hacker: { handle: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:hacker) { create(:hacker) }

    context "when hacker has no credits" do
      it "destroys the hacker" do
        expect {
          delete :destroy, params: { id: hacker.id }
        }.to change(Hacker, :count).by(-1)
      end

      it "redirects to hackers index" do
        delete :destroy, params: { id: hacker.id }
        expect(response).to redirect_to(hackers_path)
      end

      it "sets a success notice" do
        delete :destroy, params: { id: hacker.id }
        expect(flash[:notice]).to eq("Hacker deleted successfully.")
      end
    end

    context "when hacker has credits" do
      it "destroys the hacker and associated credits" do
        exploit = create(:exploit)
        credit = Credit.create!(exploit: exploit, hacker: hacker)

        expect {
          delete :destroy, params: { id: hacker.id }
        }.to change(Hacker, :count).by(-1).and change(Credit, :count).by(-1)
      end
    end
  end
end
