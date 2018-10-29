World = Class {
    init = function(self, grid_width, grid_height)
        self.grid = HexGrid(grid_width, grid_height, constants.HEX_WIDTH/2, constants.HEX_HEIGHT/2)
    end;
    update = function(self, dt)
        self.grid:update(dt)
    end;
    draw = function(self)
        self.grid:draw()
    end;
}