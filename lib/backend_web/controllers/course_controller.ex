defmodule BackendWeb.CourseController do
  use BackendWeb, :controller

  alias Backend.CourseModel
  alias Backend.CourseSchema

  def index(conn, _param) do
    courses = CourseModel.index(CourseSchema)
    render(conn, "index.json", courses: courses)
  end

  def show(conn, %{"id" => id}) do
    course = CourseModel.show(id)
    render(conn, "show.json", course: course)
  end

  def update(conn, %{"id" => id, "course" => attrs}) do
    course = CourseModel.show(id)

    with {
           :ok,
           %CourseSchema{} = course
         } <- CourseModel.update(course, attrs) do
      render(conn, "show.json", course: course)
    end
  end

  def delete(conn, %{"id" => id}) do
    course = CourseModel.show(id)

    with {
           :ok,
           %CourseSchema{}
         } <- CourseModel.delete(course) do
      render(conn, :no_content, "")
    end
  end

  def create(conn, %{"course" => attrs}) do
    with {
           :ok,
           %CourseSchema{} = attrs
         } <- CourseModel.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", course: attrs)
    end
  end
end
