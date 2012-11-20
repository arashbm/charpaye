class ActivityObserver < ActiveRecord::Observer
 observe :post, :review 

 def after_create(record)
   record_class = record.class.to_s
   activity = {
     object: record.user,
     subject: record.id,
     subject_type: record_class,
     action: "#{record_class}:create"
   }
   timestamp = Time.now.to_i

   User.each do |user|
     activity[:importance] = record.importance_to(user)
     $redis.zadd user.id, timestamp, activity.to_json if user.can_see?(record)
   end
 end

 def after_update(record)
   record_class = record.class.to_s
   activity = {
     object: record.user,
     subject: record.id,
     subject_type: record_class,
     action: "#{record_class}:update"
   }
   timestamp = Time.now.to_i

   User.each do |user|
     activity[:importance] = record.importance_to(user)
     $redis.zadd user.id, timestamp, activity.to_json if user.can_see?(record)
   end
 end
end
