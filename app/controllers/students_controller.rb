class StudentsController < ApplicationController
   def index
    @dojo = Dojo.find(params[:id])
    render "dojos/show_dojo.html.erb"
   end

  def create
    s = Student.new(student_params)
    s.save
    redirect_to "/dojos/#{params[:student][:dojo_id]}"
  end

  def new
    @dojos = Dojo.all
    render "dojos/newstudent_page.html.erb"
  end 

  def show
    @student = Student.find(params[:id])
    cohort_date = @student.created_at

    @classmates = Student.where(dojo_id: params[:dojo_id]).where("created_at >? ",cohort_date.beginning_of_day).where.not(id: params[:id])
    
    render "dojos/show_student.html.erb"
  end

  def edit
    @student = Student.find(params[:id])
    @dojos = Dojo.all
    render "dojos/edit_student.html"
  end

  def update
      @student = Student.find(params[:id])
      @student.update(student_params)
      redirect_to "/dojos/#{params[:student][:dojo_id]}/students/#{@student.id}"
  end

  def destroy
    @student = Student.find(params[:id])
    dojo_id = @student.dojo_id
    @student.destroy
    redirect_to "/dojos/#{dojo_id}"
  end

  private 
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end

end
