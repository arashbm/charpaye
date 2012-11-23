class Activity < ActiveRecord::Base
  attr_accessible :action, :data, :thing, :thing_id, :thing_type, :subject_id, :subject 

  # subject is the guy who has done the action
  belongs_to :subject, class_name: 'User'

  # subject is the thing/user who has been the target of action
  belongs_to :thing, polymorphic: true

  # data is extra data hash needed for notification
  # NEVER EVER SAVE FULL MODEL INSTANCES IN IT. ONLY IDS!
  # YOU'VE BEEN WARNNED
  store :data
end
