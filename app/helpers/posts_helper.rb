module PostsHelper
    def user_name(email)
        email.split("@").first
    end
end
