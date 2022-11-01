package entities;

import screens.*;

class Bot extends h2d.Bitmap {
    var ball: Ball;

    public function new(ball: Ball, parent: Screen) {
        super(h2d.Tile.fromColor(0xFFFFFF, 20, 100), parent);
        this.ball = ball;
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;
        setPosition(100, hxd.Window.getInstance().height / 2);
    }

    public function update(dt: Float) {
        y += (ball.y - y) * 0.1;
    }

    public function setToStart() {
        y = hxd.Window.getInstance().height / 2;
    }
}