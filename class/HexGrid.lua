HexGrid = Class {
    init = function(self, width, height, x, y)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.grid = {}
        for x = 0, self.width do
            self.grid[x] = {}
            for y = 0, self.height do
                local centre_x = (constants.HEX_WIDTH * x) + constants.HEX_WIDTH/2
                local centre_y = (constants.HEX_HEIGHT * y) + constants.HEX_HEIGHT/2
                if x % 2 == 0 then
                    centre_y = centre_y + constants.HEX_HEIGHT/2 --offset our y coordinates
                end
                self.grid[x][y] = Hex(constants.HEX_SIZE, x, y, Vector(centre_x, centre_y)) --TODO: calc centre
            end
        end
    end;
    get = function(self, x, y)
        return self.grid[x][y]
    end;
    update = function(self, dt)
    end;
    draw = function(self)
        for x = 0, self.width do
            for y = 0, self.height do
                self.grid[x][y]:draw()
            end
        end
    end;
}