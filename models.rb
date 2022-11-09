require 'sequel'
Sequel.sqlite('./db/test.db')

class Task < Sequel::Model
    def self.todo
        where(:done).all
    end

    def done?
        self.done
    end
end

# class Task < Struct.new(:id, :title, :done, :due)
#     TASKS = [
#         "Play Battletoads",
#         "Learn how to force-push",
#         "Find radioactive spider",
#         "Rescue April",
#         "Add red setting to sonic screwdriver",
#         "Fix lightsaber",
#         "Shine claws",
#         "Saw cape",
#         "Buy Blue paint",
#         "Repaint TARDIS",
#     ].map.with_index{|t, i| Task.new((i+1), t, (i%2 == 0), Time.at(rand * Time.now.to_i))}
#     def self.all
#         TASKS
#     end
#     def self.find(id)
#         TASKS.find{|t| t.id == id}
#     end
#     def self.todo
#         TASKS.sort_by{|t| t.done ? 0 : 1}
#     end
#     def done?
#         self.done
#     end
# end


# class Post < Struct.new(:id, :title, :done, :due)
#     POSTS = [
#         "Play Battletoads",
#         "Learn how to force-push",
#         "Find radioactive spider",
#         "Rescue April",
#         "Add red setting to sonic screwdriver",
#         "Fix lightsaber",
#         "Shine claws",
#         "Saw cape",
#         "Buy Blue paint",
#         "Repaint TARDIS",
#     ].map.with_index{|t, i| Task.new((i+1), t, (i%2 == 0), Time.at(rand * Time.now.to_i))}
#     def self.all
#         POSTS
#     end
#     def self.find(id)
#         POSTS.find{|t| t.id == id}
#     end
#     def done?
#         self.done
#     end
# end
