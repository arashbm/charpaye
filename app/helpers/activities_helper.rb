# encoding: UTF-8
module ActivitiesHelper
  def subject_name(subject)
    if current_user && subject && current_user.id == subject.id
      'شما'
    elsif subject
      link_to subject.name, subject
    else 
      'یک نفر'
    end
  end

  def verb(subject, root='کرد')
    if current_user && current_user.id == subject.id
      root+'ید'
    else
      root
    end
  end
end
