class RecallEventsController < ApplicationController
  before_action :set_recall_event, only: [:show, :edit, :update, :destroy]

  # GET /recall_events
  # GET /recall_events.json
  def index
    @total_count = RecallEvent.count
    @class_one_count = RecallEvent.class_one.count
    @class_two_count = RecallEvent.class_two.count
    @class_three_count = RecallEvent.class_three.count

    @recall_events = RecallEvent.all.order(report_date: :desc).page(params[:page])

    if params[:classification].present?
      @recall_events = case params[:classification].to_sym
                       when :class_one
                         @recall_events.class_one
                       when :class_two
                         @recall_events.class_two
                       when :class_three
                         @recall_events.class_three
                       end
    end
  end

  # GET /recall_events/1
  # GET /recall_events/1.json
  def show
  end

  # GET /recall_events/new
  # def new
  #   @recall_event = RecallEvent.new
  # end

  # GET /recall_events/1/edit
  def edit
  end

  # POST /recall_events
  # POST /recall_events.json
  # def create
  #   @recall_event = RecallEvent.new(recall_event_params)

  #   respond_to do |format|
  #     if @recall_event.save
  #       format.html { redirect_to @recall_event, notice: 'Recall event was successfully created.' }
  #       format.json { render :show, status: :created, location: @recall_event }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @recall_event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /recall_events/1
  # PATCH/PUT /recall_events/1.json
  # def update
  #   respond_to do |format|
  #     if @recall_event.update(recall_event_params)
  #       format.html { redirect_to @recall_event, notice: 'Recall event was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @recall_event }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @recall_event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /recall_events/1
  # DELETE /recall_events/1.json
  # def destroy
  #   @recall_event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to recall_events_url, notice: 'Recall event was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recall_event
    @recall_event = RecallEvent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recall_event_params
    params[:recall_event]
  end
end
