package ;

import demo.DemoMain;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.display.Tilesheet;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.geom.Rectangle;
import nme.Lib;
import nme.media.Sound;
import nme.text.TextField;
import se.salomonsson.ent.Core;

import com.eclecticdesignstudio.motion.Actuate;
import com.eclecticdesignstudio.motion.easing.Quad;

/**
 * ...
 * @author Tommislav
 */

class HackdayMain extends Sprite 
{
	private var bmp:Bitmap;
	private var snd:Sound;
	private var _demoMain:DemoMain;
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		// entry point
		
		_demoMain = new DemoMain(this);
		
		
	}
	
	
	private function testDumheter():Void
	{
		var tf:TextField = new TextField();
		tf.text = "hello world!!!";
		addChild(tf);
		
		var sprite:Sprite = new Sprite();
		sprite.graphics.beginFill(0xffcc00, 1);
		sprite.graphics.drawRect(0, 0, 80, 70);
		sprite.graphics.endFill();
		addChild(sprite);
		
		sprite.x = 10;
		sprite.y = 100;
		
		Actuate.tween(sprite, 4, { x:250 } );
		
		bmp = new Bitmap(Assets.getBitmapData("img/sprites.png"));
		addChild(bmp);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		snd = Assets.getSound("img/dissolve_fire.mp3");
		
		var tileSheet = new Tilesheet(Assets.getBitmapData("img/sprites.png"));
		tileSheet.addTileRect(new Rectangle(0, 0, 100, 100));
		tileSheet.addTileRect(new Rectangle(100, 0, 100, 100));
		
		
		var x:Float = 10;
		var y:Float = 200;
		var shipId:Float = 1;
		var scale:Float = 10.0;
		var rot:Float = 45.0;
		
		tileSheet.drawTiles(graphics, [x, y, shipId, 0.5], true, Tilesheet.TILE_SCALE);
	}
	
	
	private function onKeyUp(e:KeyboardEvent):Void 
	{
		bmp.x += 5;
		snd.play();
	}
	
	private function onKeyDown(e:KeyboardEvent):Void 
	{
		
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new HackdayMain());
	}
	
}
