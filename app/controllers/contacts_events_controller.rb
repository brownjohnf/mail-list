class ContactsEventsController < ApplicationController
  before_action :set_contacts_event, only: [:show, :edit, :update, :destroy]

  # GET /contacts_events
  # GET /contacts_events.json
  def index
    @contacts_events = ContactsEvent.all
  end

  # GET /contacts_events/1
  # GET /contacts_events/1.json
  def show
  end

  # GET /contacts_events/new
  def new
    @contacts_event = ContactsEvent.new
  end

  # GET /contacts_events/1/edit
  def edit
  end

  # POST /contacts_events
  # POST /contacts_events.json
  def create
    @contacts_event = ContactsEvent.new(contacts_event_params)
    puts contacts_event_params
    puts @contacts_event.inspect

    respond_to do |format|
      if @contacts_event.save
        format.html { redirect_to @contacts_event, notice: 'Contacts event was successfully created.' }
        format.json { render :show, status: :created, location: @contacts_event }
      else
        format.html { render :new }
        format.json { render json: @contacts_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts_events/1
  # PATCH/PUT /contacts_events/1.json
  def update
    respond_to do |format|
      if @contacts_event.update(contacts_event_params)
        format.html { redirect_to @contacts_event, notice: 'Contacts event was successfully updated.' }
        format.json { render :show, status: :ok, location: @contacts_event }
      else
        format.html { render :edit }
        format.json { render json: @contacts_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts_events/1
  # DELETE /contacts_events/1.json
  def destroy
    @contacts_event.destroy
    respond_to do |format|
      format.html { redirect_to contacts_events_url, notice: 'Contacts event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacts_event
      @contacts_event = ContactsEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacts_event_params
      params.require(:contacts_event).permit(:contact_id, :event_id)
    end
end
