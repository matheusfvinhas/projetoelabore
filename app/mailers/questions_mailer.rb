# frozen_string_literal: true

class QuestionsMailer < ApplicationMailer
  def send_question(grade_title, email_teacher, email_student, name_student, question, course_title)
    @grade_title = grade_title
    @question = question
    @course_title = course_title
    @name_student = name_student
    @email_student = email_student
    mail to: email_teacher, from: email_student, subject: "Pergunta Curso Elabore: #{course_title}"
  end
end
