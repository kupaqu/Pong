package screens;

class Menu extends Screen {
    override public function new(app: Main) {
        super(app);

        var title = new h2d.Text(hxd.res.DefaultFont.get(), this);
        title.text = "Pong";
        title.textAlign = Center;
        title.setScale(4);
        title.setPosition(hxd.Window.getInstance().width/2, hxd.Window.getInstance().height/2 - 50);

        var hint = new h2d.Text(hxd.res.DefaultFont.get(), this);
        hint.text = "Press SPACE to start.";
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