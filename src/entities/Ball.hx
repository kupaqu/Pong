package entities;

import screens.*;

class Ball extends h2d.Bitmap {
    public var direction: h3d.Vector;
    var currentSpeed: Float;
    public var startSpeed: Float = 10;
    
    public function new(parent: Screen) {
        super(h2d.Tile.fromColor(0xFFFFFF, 20, 20), parent);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        setToStart();
    }

    public function setToStart() {
        setPosition(hxd.Window.getInstance().width / 2, hxd.Window.getInstance().height / 2);
        direction = new h3d.Vector();
        currentSpeed = startSpeed;
        Random.float(-1, 1) > 0 ? direction.x = 1 : direction.x = -1;
    }

    public function update(dt: Float) {
        setPosition(x+direction.x*currentSpeed, y+direction.y*currentSpeed);
    }

}