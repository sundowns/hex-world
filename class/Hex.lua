--https://www.redblobgames.com/grids/hexagons/
Hex = Class {
    init = function(self, q, r, s)
        assert(q + r + s == 0)
        self.q = q
        self.r = r
        self.s = s
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
}

function assert_hex(hex)
    assert(hex.q)
    assert(hex.r)
    assert(hex.s)
    assert(hex.q + hex.r + hex.s == 0)
end