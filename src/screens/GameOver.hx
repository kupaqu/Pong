package screens;

class GameOver extends Screen {
    override public function new(app: Main, win: Bool) {
        super(app);

        var title = new h2d.Text(hxd.res.DefaultFont.get(), this);
        if (win) {
            title.text = "You won!";
            hxd.Res.victory.play();
        } else {
            title.text = "You lost!";
            hxd.Res.gameover.play();
        }
        title.textAlign = Center;
        title.setScale(4);
        title.setPosition(hxd.Window.getInstance().width/2, hxd.Window.getInstance().height/2 - 50);

        var hint = new h2d.Text(hxd.res.DefaultFont.get(), this);
        hint.text = "Press SPACE to play again.";
        hint.textAlign = Center;
        hint.setScale(2);
        hint.setPosition(hxd.Window.getInstance().width/2, hxd.Window.getInstance().height/2 + 50);
    }

    override public function update(dt: Float) {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            setScreen(new Game(app));
        }
    }
}