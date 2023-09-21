# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  prereq_id     :bigint
#  instructor_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :name, :instructor_id, presence: true

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        through: :enrollments,
        source: :student

     has_one :course,
        class_name: 'Course',
        foreign_key: :prereq_id,
        primary_key: :id

        belongs_to :prerequisite,
        class_name: 'Course',
        foreign_key: :prereq_id,
        primary_key: :id


end
