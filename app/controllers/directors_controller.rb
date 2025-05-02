class DirectorsController < ApplicationController
  def index
      render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)
    render({ :template => "director_templates/details"})
  end

  def youngest

 ordered = Director.where.not({ :dob => nil }).order({ :dob =>:desc })

 the_youngest = ordered.at(0)

    @youngest_id = the_youngest.id
    @youngest_name = the_youngest.name
    @youngest_dob = the_youngest.dob.strftime("%B %-d, %Y")

    
      render({ :template => "director_templates/youngest" })
  end

  def eldest

    ordered = Director.where.not({ :dob => nil }).order({ :dob =>:asc })

    the_eldest = ordered.at(0)
   
       @eldest_id = the_eldest.id
       @eldest_name = the_eldest.name
       @eldest_dob = the_eldest.dob.strftime("%B %-d, %Y")
    render({ :template => "director_templates/eldest" })
  end

end
