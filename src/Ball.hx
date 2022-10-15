class Ball {
    public var hitbox: Array<Float>;
    var bitmap: h2d.Bitmap;
    var angle: Float;
    var speed: Float;
    var scene: h2d.Scene;
    var left: Player;
    var right: Player;

    public function new(size: Int, scene: h2d.Scene, left, right) {
        this.scene = scene;
        this.left = left;
        this.right = right;
        bitmap = new h2d.Bitmap(h2d.Tile.fromColor(0xFFFFFF, size, size), this.scene);
        speed = 10;
        this.reset();
        updateHitbox();
    }

    public function reset() {
        bitmap.x = scene.width * 0.5 - bitmap.tile.width * 0.5;
        bitmap.y = scene.height * 0.5 - bitmap.tile.height * 0.5;
        angle = Random.float(0, 2*Math.PI);
    }

    private function updateHitbox() {
        hitbox = [bitmap.x, bitmap.tile.width, bitmap.y, bitmap.tile.height];
    }

    public function update() {
        switch this.collision() {
            case Collision.Wall:
                angle = 2*Math.PI - angle;
            case Collision.Racket:
                angle = Math.PI - angle;
            case Collision.Out:
                this.reset();
            case _:
                
        }
        bitmap.x += speed * Math.cos(angle);
        bitmap.y += speed * Math.sin(angle);
        updateHitbox();
    }

    private function collision() {
        if (bitmap.y <= 0 || bitmap.y >= scene.height-bitmap.tile.height) 
            return Collision.Wall;

        if (left.hit(hitbox) || right.hit(hitbox))
            return Collision.Racket;

        if (bitmap.x <= 0 || bitmap.x >= scene.width-bitmap.tile.width)
            return Collision.Out;

        return Collision.None;
    }
}