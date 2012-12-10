package demo.systems;
import demo.components.PositionComponent;
import demo.components.TilesheetRenderableComponent;
import nme.Assets;
import nme.display.Sprite;
import nme.display.Tilesheet;
import nme.geom.Rectangle;
import se.salomonsson.ent.EntManager;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;

/**
 * ...
 * @author Tommislav
 */

class TilesheetRendererSystem extends Sys
{
	private var _holder:Sprite;
	private var _tileSheet:Tilesheet;
	
	public function new(holder:Sprite) {
		super();
		
		_holder = holder;
		
		_tileSheet = new Tilesheet(Assets.getBitmapData("img/sprites.png"));
		_tileSheet.addTileRect(new Rectangle(0.0, 0.0, 141.0, 85.0)); // ship
		_tileSheet.addTileRect(new Rectangle(143.0, 0.0, 30.0, 210)); // bullet
		_tileSheet.addTileRect(new Rectangle(175.0, 0.0, 44.0, 69.0)); // cat
		_tileSheet.addTileRect(new Rectangle(221.0, 0.0, 42.0, 43.0)); // cat falling
		_tileSheet.addTileRect(new Rectangle(264.0, 0.0, 59.0, 69.0)); // splash
		
	}

	override public function tick(gt:GameTime):Void 
	{
		var entities = em().getEWC([PositionComponent, TilesheetRenderableComponent]);
		var drawArray:Array<Float> = new Array<Float>();
		for (i in 0...entities.length) {
			var ew:EW = entities[i];
			drawArray.push(ew.comp(PositionComponent).x);
			drawArray.push(ew.comp(PositionComponent).y);
			drawArray.push(ew.comp(TilesheetRenderableComponent).tileId);
		}
		
		_holder.graphics.clear();
		_tileSheet.drawTiles(_holder.graphics, drawArray);
	}
	
}