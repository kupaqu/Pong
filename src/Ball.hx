class Ball {
    var bitmap: h2d.Bitmap;
    public var hitbox: Array<Float>;
    var angle: Float;
    var speed: Float;

    public function new(size: Int, scene: h2d.Scene) {
        bitmap = new h2d.Bitmap(h2d.Tile.fromColor(0xFFFFFF, size, size), scene);
        bitmap.x = scene.width * 0.5 - bitmap.tile.width * 0.5;
        bitmap.y = scene.height * 0.5 - bitmap.tile.height * 0.5;

        angle = 0;
        speed = 1;
    }

    private function updateHitbox() {
        hitbox = [bitmap.x, bitmap.x+bitmap.tile.width, bitmap.y, bitmap.y+bitmap.tile.height];
    }

    public function update(scene: h2d.Scene) {
        bitmap.x += speed;
        bitmap.y += speed;
    }
}