package screens;

import entities.*;

class Game extends Screen {

    var ball: Ball;
    var player: Player;
    var bot: Bot;
    // var score: Score;

    override public function new(app: Main) {
        super(app);
        ball = new Ball(this);
        player = new Player(this);
        bot = new Bot(ball, this);
    }

    override public function update(dt: Float) {
        if (ball.getBounds().intersects(player.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - player.x, ball.y - player.y).normalized();
        }
        if (ball.getBounds().intersects(bot.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - bot.x, ball.y - bot.y).normalized();
        }
        if (ball.y < 0 || ball.y > hxd.Window.getInstance().height) {
            ball.direction.y *= -1;
        }
        ball.update(dt);
        player.update(dt);
        bot.update(dt);
    }
}