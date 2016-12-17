class UserService

    def get_medications
      OpenStruct.new(
        name: "Advil",
        time: "1:30 am",
        next_reminder: "1:41 am",
        last_reminder: "1:19 am"
      )
    end
end
