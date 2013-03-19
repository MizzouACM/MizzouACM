require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventsController do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => 'Hackathon',
      :date => DateTime.now.next_week,
      :description => '1337 hackathon',
      :location => 'supersecretspylocation'
    }
 end


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventsController. Be sure to keep this updated too.
  def valid_admin_session
    user = FactoryGirl.create(:user, :admin => true)
    {
      :user_id => user.id
    }
  end

  def valid_session
    {}
  end



  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index, {}, valid_session
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}, valid_session
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do

    it 'redirects with error if not admin' do
      get :new, {}, valid_session
      response.should redirect_to(root_path)
    end

    it "assigns a new event as @event if admin" do
      get :new, {}, valid_admin_session
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do

    it 'redirects with error if not admin' do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}, valid_session
      response.should redirect_to(root_path)
    end

    it "assigns the requested event as @event if admin" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}, valid_admin_session
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do

    it 'should redirect with an error if not admin' do
      post :create, {:event => valid_attributes}, valid_session
      response.should redirect_to(root_path)
    end

    describe "with valid params and admin" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}, valid_admin_session
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}, valid_admin_session
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}, valid_admin_session
        response.should redirect_to(Event.last)
      end
    end

    describe "with invalid params and admin" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => { "name" => "invalid value" }}, valid_admin_session
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => { "name" => "invalid value" }}, valid_admin_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    it 'should redirect with error if not admin' do
      event = Event.create! valid_attributes
      put :update, {:id => event.to_param, :event => { "name" => "MyString" }}, valid_admin_session
      response.should redirect_to(root_path)
    end

    describe "with valid params and admin" do
      it "updates the requested event" do
        event = Event.create! valid_attributes
        # Assuming there are no other events in the database, this
        # specifies that the Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => event.to_param, :event => { "name" => "MyString" }}, valid_admin_session
      end

      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_admin_session
        assigns(:event).should eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}, valid_admin_session
        response.should redirect_to(event)
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "name" => "invalid value" }}, valid_admin_session
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "name" => "invalid value" }}, valid_admin_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    it 'redirects with error if not admin' do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_session
      response.should redirect_to(root_path)
    end

    it "destroys the requested event if admin" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}, valid_admin_session
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}, valid_admin_session
      response.should redirect_to(events_url)
    end
  end

end
