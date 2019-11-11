
offset = 3

function _init()
    x = offset
    y = 6
end

function _update60()
    x += 1/8
    -- compute current map chunks
    id = flr((x-offset) / 16)
    chunk = 0 -- id
    nextchunk = 0 -- id+1
    -- falling?
    local tile = mget(chunk + x % 16, y + 0.75)
    if tile == 0 or y%1 != 0.25 then
        y += 1/8
    end
end

function _draw()
    cls()
    camera((x-offset)*8,0)
    -- decor
    draw_chunk(chunk, id*16)
    draw_chunk(nextchunk, id*16+16)
    -- sprite
    spr(16,x*8,y*8)
end

function draw_chunk(chunk, x)
    map(chunk, 0, x*8, 0, 16, 16)
end

