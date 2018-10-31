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
        for i = 0, 5, 1 do
            local v_x, v_y = self:calculateCorner(i)
            table.insert(self.vertices, v_x)
            table.insert(self.vertices, v_y) 
        end
    end;
    calculateCorner = function(self, i)
        local angle_deg = 60 * i 
        local angle_rad = math.pi / 180 * angle_deg
        -- I dont understand why i have to multiply this by 1.15 for them to align. Sorry future me
        return self.centre.x + (self.size*1.15) * math.cos(angle_rad), self.centre.y + (self.size*1.15) * math.sin(angle_rad)
    end;
    draw = function(self)
        love.graphics.polygon('line', self.vertices)
        
        if debug then
            love.graphics.points(self.centre.x, self.centre.y)
            love.graphics.setColor(1,0,0)
            love.graphics.print(self.x..','..self.y, self.centre.x -self.size/3, self.centre.y)
            Util.l.resetColour()
        end
    end;
}