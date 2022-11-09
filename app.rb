require 'roda'
require './models'

class App < Roda
    plugin :render, layout: './layout'
    plugin :content_for
    plugin :view_options


    route do |r|
        set_view_options engine: 'erb'

        r.on 'db' do
            puts 'db'
            r.on Integer do |id|
                puts 'id'
                db = Sequel.sqlite("./db/user_#{id}.db")
                r.on 'users', Integer do |id|
                    set_view_subdir 'users'
                        users = db[:user]
                        next unless @user = users.first(id: id)
                        view 'user'
                end
            end
        end

        r.on 'tasks' do
            set_view_subdir 'tasks'

            r.get true do
                @tasks = Task.all
                view 'index'
            end

            r.get Integer do |id|
                next unless @task = Task.first(id: 3)
                view 'task'
            end

            r.get 'undone' do
                @tasks = Task.todo
                view 'undone'
            end
        end

        r.on 'posts' do |r|
            set_view_subdir 'posts'

            r.get true do |r|
                @posts = Post.all
                view 'index'
            end

            r.get Integer do |r|
                @posts = Post.all
                view 'post'
            end
        end

        r.post 'clicked' do
            render 'clicked'
        end

        r.post 'swap_button' do
            render 'swap_button'
        end

    end
end
