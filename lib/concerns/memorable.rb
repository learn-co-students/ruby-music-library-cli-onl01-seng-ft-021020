module Concerns::Memorable
    def destroy_all
        self.all.clear
    end

    def create(name)
        self.new(name)
    end
end
