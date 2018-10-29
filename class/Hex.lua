--https://www.redblobgames.com/grids/hexagons/
Hex = Class {
    init = function(self, size, x, y, centre)
        self.size = size
        self.x = x
        self.y = y
        self.centre = centre
        self:calculateVertices()
    end;
    __tostring = function(self)
        return self.x..','..self.y
    end;
    calculateVertices = function(self)
        self.vertices = {}
        for i = 1, 6, 1 do
            local v_x, v_y = self:calculateCorner(i)
            table.insert(self.vertices, v_x)
            table.insert(self.vertices, v_y) 
        end
    end;
    calculateCorner = function(self, i)
        local angle_deg = 60 * i 
        local angle_rad = math.pi / 180 * angle_deg
        return self.centre.x + self.size * math.cos(angle_rad), self.centre.y + self.size * math.sin(angle_rad)
    end;
    draw = function(self)
        love.graphics.polygon('line', self.vertices)
    end;
}