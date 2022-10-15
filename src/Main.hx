import Player;

class Main extends hxd.App {

    var player: Player;
    var bot: Bot;
    var ball: Ball;
    var console: h2d.Console;

    override function init() {
        player = new Player(20, 100, 75, s2d);
        bot = new Bot(20, 100, 75, s2d);
        ball = new Ball(20, s2d, bot, player);
    }

    override function update(dt: Float) {
        player.update(s2d);
        ball.update();
    }

    static function main() {
        new Main();
    }
}