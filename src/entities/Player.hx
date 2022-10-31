package entities;

import screens.*;

class Player extends h2d.Bitmap {
    public function new(parent: Screen) {
        super(h2d.Tile.fromColor(0xFFFFFF, 20, 100), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        setPosition(hxd.Window.getInstance().width - 100, hxd.Window.getInstance().height / 2);
    }

    public function update(dt: Float) {
        y = hxd.Window.getInstance().mouseY;
    }
}