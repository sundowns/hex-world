HexGrid = Class {
    init = function(self, width, height, x, y)
        self.width = width
        self.height = height
        self.x = x
        self.y = y
        self.grid = {}

        for i = 0, self.width do
            self.grid[i] = {}
            for j = 0, self.height do
                local centre_x = (constants.HEX_WIDTH * i) + constants.HEX_WIDTH/2 
                local centre_y = (constants.HEX_HEIGHT * j) + constants.HEX_HEIGHT/2
                if i % 2 == 0 then
                    centre_y = centre_y + constants.HEX_HEIGHT/2 --offset our y coordinates
                end
                self.grid[i][j] = Hex(constants.HEX_SIZE, i, j, Vector(centre_x, centre_y))
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