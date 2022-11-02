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
        score = new Score(this, app);
    }

    override public function update(dt: Float) {
        
        // используем свойство разности векторов
        if (ball.getBounds().intersects(player.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - player.x, (ball.y - player.y)*0.5).normalized();
            hxd.Res.pong.play();
        }
        if (ball.getBounds().intersects(bot.getBounds())) {
            ball.direction = new h3d.Vector(ball.x - bot.x, (ball.y - bot.y)*0.5).normalized();
            hxd.Res.pong.play();
        }

        // abs для того чтобы мяч не застревал
        if (ball.y < 0) {
            ball.direction.y = Math.abs(ball.direction.y);
            hxd.Res.pong.play();
        }
        if (ball.y > hxd.Window.getInstance().height) {
            ball.direction.y = -Math.abs(ball.direction.y);
            hxd.Res.pong.play();
        }

        if (ball.x < 0) {
            score.increment(true);
            ball.startSpeed *= 1.1;
            ball.setToStart();
            bot.setToStart();
        }
        if (ball.x > hxd.Window.getInstance().width) {
            score.increment(false);
            ball.startSpeed *= 1.1;
            ball.setToStart();
            bot.setToStart();
        }

        ball.update(dt);
        player.update(dt);
        bot.update(dt);
    }
}