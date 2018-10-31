World = Class {
    init = function(self, origin, map_radius, hex_size, hex_origin)
        self.map = HexMap(origin, map_radius, hex_size, hex_origin)
    end;
    update = function(self, dt)
        self.map:update(dt)
    end;
    draw = function(self)
        self.map:draw()
    end;
}