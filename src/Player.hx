class Player {
    var bitmap: h2d.Bitmap;
    public var hitbox: Array<Float>;

    public function new(width: Int, height: Int, pad: Int, scene: h2d.Scene) {
        bitmap = new h2d.Bitmap(h2d.Tile.fromColor(0xFFFFFF, width, height), scene);
        bitmap.x = scene.width - pad - bitmap.tile.width;
        bitmap.y = scene.height * 0.5 - bitmap.tile.height * 0.5;
        this.updateHitbox();
    }
    
    private function updateHitbox() {
        hitbox = [bitmap.x, bitmap.tile.width, bitmap.y, bitmap.tile.height];
    }

    public function update(scene: h2d.Scene) {
        if (scene.mouseY < bitmap.tile.height * 0.5)
            bitmap.y = 0;
        else if (scene.mouseY > scene.height - bitmap.tile.height * 0.5)
            bitmap.y = scene.height - bitmap.tile.height;
        else
            bitmap.y = scene.mouseY - bitmap.tile.height * 0.5;
        this.updateHitbox();
    }

    public function hit(ballHitbox: Array<Float>) {
        if ((Math.abs((hitbox[0] + hitbox[1]/2) - (ballHitbox[0] + ballHitbox[1]/2)) * 2 < (hitbox[1] + ballHitbox[1]))
            && (Math.abs((hitbox[2] + hitbox[3]/2) - (ballHitbox[2] + ballHitbox[3]/2)) * 2 < (hitbox[3] + ballHitbox[3]))) {
            return true;
        }
        return false;
    }
}

class Bot extends Player {

    var speed: Float;

    public override function new(width: Int, height: Int, pad: Int, scene: h2d.Scene) {
        super(width, height, pad, scene);
        speed = 0.8;
        bitmap.x = pad;
        this.updateHitbox();
    }

    public override function update(scene: h2d.Scene) {
        // бот следит за y-осью мяча
    }
}