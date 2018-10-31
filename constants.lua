local size_x = 40
local size_y = 40 --keep these equal for now

return {
    HEX_SIZE = Vector(size_x, size_y),
    HEX_ORIGIN = Vector(0,0), -- origin of a hex's coordinates (top left)
    HEX_WIDTH = math.sqrt(3) * size_x,
    HEX_HEIGHT = 2 * size_y,
    CAMERA_SPEED = 100,
    CAMERA_ZOOM_SPEED = 0.2
}