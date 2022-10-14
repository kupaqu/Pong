import Player;

class Main extends hxd.App {

    var player: Player;
    var bot: Bot;
    var ball: Ball;
    var console: h2d.Console;

    override function init() {
        ball = new Ball(10, s2d);
        
        player = new Player(10, 75, 50, s2d);
        bot = new Bot(10, 75, 50, s2d);
        // console = new h2d.Console(hxd.res.DefaultFont.get(), s2d);
        // console.show();
    }

    override function update(dt: Float) {
        player.update(s2d);
        ball.update(s2d);
        // console.log(player.hitbox.toString());
    }

    static function main() {
        new Main();
    }
}