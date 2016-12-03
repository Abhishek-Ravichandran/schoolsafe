module SchoolsHelper
    def favorite? (school)
        current_user.favorites.include? school
    end
end
