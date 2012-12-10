package demo.components;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.geom.Point;
import nme.geom.Rectangle;
import nme.Lib;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;

/**
 * Renders with copy pixels instead of tileSheet
 * @author Tommislav
 */

class CPRenderSystem extends Sys
{
	private var _canvas:BitmapData;
	
	private var _spriteSheet:BitmapData;
	private var _spriteLoc:Array<Rectangle>;
	private var _p:Point;
	
	public function new() 
	{
		super();
		
		_canvas = new BitmapData(800, 480, false, 0xffffffff);
		Lib.current.stage.addChild(new Bitmap(_canvas));
		
		_p = new Point();
		
		_spriteSheet = Assets.getBitmapData("img/sprites.png");
		_spriteLoc = new Array<Rectangle>();
		
		_spriteLoc.push(new Rectangle(0.0, 0.0, 141.0, 85.0)); // ship
		_spriteLoc.push(new Rectangle(143.0, 0.0, 30.0, 210)); // bullet
		_spriteLoc.push(new Rectangle(175.0, 0.0, 44.0, 69.0)); // cat
		_spriteLoc.push(new Rectangle(221.0, 0.0, 42.0, 43.0)); // cat falling
		_spriteLoc.push(new Rectangle(264.0, 0.0, 59.0, 69.0)); // splash
	}
	
	override public function tick(gt:GameTime):Void 
	{
		_canvas.fillRect(new Rectangle(0, 0, 800, 480), 0xffffffff);
		
		var entities = em().getEWC([PositionComponent, TilesheetRenderableComponent]);
		var drawArray:Array<Float> = new Array<Float>();
		for (i in 0...entities.length) {
			var ew:EW = entities[i];
			var pos:PositionComponent = ew.comp(PositionComponent);
			var tileId:Int = Std.int(ew.comp(TilesheetRenderableComponent).tileId);
			
			_p.x = pos.x;
			_p.y = pos.y;
			
			_canvas.copyPixels(_spriteSheet, _spriteLoc[tileId], _p);
		}
	}
}