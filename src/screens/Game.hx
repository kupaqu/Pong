package screens;

import entities.*;

class Game extends Screen {

    var ball: Ball;
    var player: Player;
    var bot: Bot;
    var score: Score;

    override public function new(app: Main) {
        super(app);
        ball = new Ball(this);
        player = new Player(this);
        bot = new Bot(ball, this);
        score = new Score(this);
    }

    override public function update(dt: Float) {
        // используем свойство разности векторов
        if (ball.getBounds().intersects(player.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - player.x, ball.y - player.y).normalized();
        }
        if (ball.getBounds().intersects(bot.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - bot.x, ball.y - bot.y).normalized();
        }
        // abs для того чтобы мяч не застревал
        if (ball.y < 0) {
            ball.direction.y = Math.abs(ball.direction.y);
        }
        if (ball.y > hxd.Window.getInstance().height) {
            ball.direction.y = -Math.abs(ball.direction.y);
        }

        if (ball.x < 0) {
            score.increment(true);
            ball.setToStart();
        }
        if (ball.x > hxd.Window.getInstance().width) {
            score.increment(false);
            ball.setToStart();
        }

        ball.update(dt);
        player.update(dt);
        bot.update(dt);
    }
}