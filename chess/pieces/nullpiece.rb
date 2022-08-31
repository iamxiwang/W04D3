require "singleton"

class Nullpiece
    include Singleton

    attr_reader :color, :symbol

    def initialize 
        @color = color
    end
end