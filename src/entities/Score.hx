package entities;

import screens.*;

class Score {
    var parent: Screen;
    var app: Main;
    
    var playerScore = 0;
    var botScore = 0;
    var playerScoreText: h2d.Text;
    var botScoreText: h2d.Text;

    public function new(parent: Screen, app: Main) {
        this.parent = parent;
        this.app = app;

        playerScoreText = new h2d.Text(hxd.res.DefaultFont.get(), parent);
        playerScoreText.textAlign = Center;
        playerScoreText.setScale(5);
        playerScoreText.setPosition(hxd.Window.getInstance().width*3/4 - 100, 50);

        botScoreText = new h2d.Text(hxd.res.DefaultFont.get(), parent);
        botScoreText.textAlign = Center;
        botScoreText.setScale(5);
        botScoreText.setPosition(hxd.Window.getInstance().width/4 + 100, 50);

        applyScores();
    }
    public function increment(isPlayer: Bool) {
        if (isPlayer) {
            playerScore += 1;
            if (playerScore > 9) {
                parent.setScreen(new GameOver(app, true));
            }
        } else {
            botScore += 1;
            if (botScore > 9) {
                parent.setScreen(new GameOver(app, false));
            }
        }
        applyScores();
    }
    function applyScores() {
        playerScoreText.text = '$playerScore';
        botScoreText.text = '$botScore';
    }
}