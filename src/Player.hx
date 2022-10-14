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
        hitbox = [bitmap.x, bitmap.x+bitmap.tile.width, bitmap.y, bitmap.y+bitmap.tile.height];
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
}

class Bot extends Player {
    public override function new(width: Int, height: Int, pad: Int, scene: h2d.Scene) {
        super(width, height, pad, scene);
        bitmap.x = pad;
        this.updateHitbox();
    }

    public override function update(scene: h2d.Scene) {
        // бот следит за y-осью мяча
    }
}