-- Hexagonal map, using https://www.redblobgames.com/grids/hexagons/implementation.html#map-shapes

-- Some constant helper functions (look at above link)
function Orientation(f0, f1, f2, f3, b0, b1, b2, b3, start_angle)
    return {f0 = f0, f1 = f1, f2 = f2, f3 = f3, b0 = b0, b1 = b1, b2 = b2, b3 = b3, start_angle = start_angle}
end

function Layout(orientation, size, origin)
    return {orientation = orientation, size = size, origin = origin}
end

local layout_pointy = Orientation(math.sqrt(3.0), math.sqrt(3.0) / 2.0, 0.0, 3.0 / 2.0, math.sqrt(3.0) / 3.0, -1.0 / 3.0, 0.0, 2.0 / 3.0, 0.5)
local layout_flat = Orientation(3.0 / 2.0, 0.0, math.sqrt(3.0) / 2.0, math.sqrt(3.0), 2.0 / 3.0, 0.0, -1.0 / 3.0, math.sqrt(3.0) / 3.0, 0.0)

HexMap = Class {
    init = function(self, origin, radius, size, hex_origin)
        self.origin = origin
        print(hex_origin)
        self.layout = Layout(layout_flat, size, hex_origin)
        self.radius = radius
        self.map = {}

        for q = -1*self.radius, self.radius do
            local r1 = math.max(-self.radius, -q - self.radius);
            local r2 = math.min(self.radius, -q + self.radius);
            for r = r1, r2 do
                table.insert(self.map, Hex(q, r, -q-r))
            end
        end
    end;
    hex_to_pixel = function(self, hex)
        local M = self.layout.orientation
        local x = (M.f0 * hex.q + M.f1 * hex.r) * self.layout.size.x
        local y = (M.f2 * hex.q + M.f3 * hex.r) * self.layout.size.y
        return Vector(x + self.layout.origin.x, y + self.layout.origin.y)
    end;
    pixel_to_hex = function(self, pixel)
        local M = self.layout.orientation
        local size = self.layout.size
        local origin = self.layout.origin
        local pt = Vector((pixel.x - origin.x) / size.x, (pixel.y - origin.y) / size.y)
        local q = M.b0 * pt.x + M.b1 * pt.y
        local r = M.b2 * pt.x + M.b3 * pt.y
        return Hex(q, r, -q - r)
    end;
    hex_corner_offset = function(self, corner)
        local M = self.layout.orientation
        local size = self.layout.size
        local angle = 2.0 * math.pi * (M.start_angle - corner) / 6.0
        return Vector(size.x * math.cos(angle), size.y * math.sin(angle))
    end;
    polygon_corners = function(self, hex)
        local verts = {}
        local centre = self:hex_to_pixel(hex)
        for i = 0, 5 do
            local offset = self:hex_corner_offset(i)
            table.insert(verts, centre.x + offset.x)
            table.insert(verts, centre.y + offset.y)
        end
        return verts
    end;
    update = function(self, dt)
    end;
    draw = function(self)
        for i, hex in pairs(self.map) do
            love.graphics.polygon('line', self:polygon_corners(hex))

            if debug then
                local centre = self:hex_to_pixel(hex)
                love.graphics.print(hex:__tostring(), centre.x - constants.HEX_WIDTH/3, centre.y)
            end
        end
    end;
}