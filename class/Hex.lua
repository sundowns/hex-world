--https://www.redblobgames.com/grids/hexagons/
Hex = Class {
    init = function(self, q, r, s)
        assert(q + r + s == 0)
        self.q = q
        self.r = r
        self.s = s
        -- self:calculateVertices()
    end;
    __tostring = function(self)
        return '('..self.q..','..self.r..','..self.s..')'
    end;
    __eq = function(self, other)
        assert_hex(delta)
        return self.q == other.q and self.r == other.r and self.s == other.s
    end;
    __add = function(self, delta)
        assert_hex(delta)
        self.q = self.q + delta.q
        self.r = self.r + delta.r
        self.s = self.s + delta.s
    end;
    __sub = function(self, delta)
        assert_hex(delta)
        self.q = self.q - delta.q
        self.r = self.r - delta.r
        self.s = self.s - delta.s
    end;
    __mul = function(self, k)
        self.q = self.q * k
        self.r = self.r * k
        self.s = self.s * k
    end;
    length = function(self)
        return math.floor((math.abs(self.q) + math.abs(self.r) + math.abs(self.s)) / 2)
    end;
    distanceTo = function(self, other)
        assert_hex(other)
        return math.abs(self:length() - other:length()) 
    end;
    -- calculateVertices = function(self)
    --     self.vertices = {}
    --     for i = 0, 5, 1 do
    --         local v_x, v_y = self:calculateCorner(i)
    --         table.insert(self.vertices, v_x)
    --         table.insert(self.vertices, v_y) 
    --     end
    -- end;
    -- calculateCorner = function(self, i)
    --     local angle_deg = 60 * i 
    --     local angle_rad = math.pi / 180 * angle_deg
    --     -- I dont understand why i have to multiply this by 1.15 for them to align. Sorry future me
    --     return self.centre.x + (constants.HEX_SIZE*1.15) * math.cos(angle_rad), self.centre.y + (constants.HEX_SIZE*1.15) * math.sin(angle_rad)
    -- end;
    -- draw = function(self)
    --     love.graphics.polygon('line', self.vertices)
        
    --     if debug then
    --         love.graphics.points(self.centre.x, self.centre.y)
    --         love.graphics.setColor(1,0,0)
    --         love.graphics.print(self.q..','..self.r ..','..self.s, self.centre.x -self.size/2, self.centre.y)
    --         Util.l.resetColour()
    --     end
    -- end;
}

function assert_hex(hex)
    assert(hex.q)
    assert(hex.r)
    assert(hex.s)
    assert(hex.q + hex.r + hex.s == 0)
end