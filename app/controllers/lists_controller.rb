class ListsController < ApplicationController

  layout 'application-h'
  before_action :presidente

  def index
  end

  def top_time
    #@top = Plane.joins(:flights).where('flights.time_fly > ?', 0).order('sum_id desc').limit(5).calculate(:sum, 'flights.time_fly')

    #@top = Plane.joins(:flights).select('SUM((flights.time_fly)) AS time').order('time desc').limit(5)

    @top = Plane.select('planes.*').joins(:flights).group('planes.id').having('SUM(flights.time_fly) > 0')
    @top
  end



  def debt
    @people = Person.select('people.*').joins(:ticket_members).group('people.id').where('ticket_members.status = ?', '0')
  end



  def monthly
    #@mont = Flight.select('flights.*').where('flights.time_fly = ?', '0')
    year = params[:year]
    month = params[:month]
    @monthly = Flight.select('flights.*').where("strftime('%Y', flights.date) = ? AND strftime('%m', flights.date) = ?", year, month)
  end
  
  private
  
    def presidente
      if !current_user.try(:Presidente?) 
        redirect_to root_path
      end
    end


end
