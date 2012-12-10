package demo.systems;
import demo.components.BulletComponent;
import demo.components.PositionComponent;
import demo.components.TilesheetRenderableComponent;
import demo.SpriteId;
import nme.ui.Keyboard;
import se.salomonsson.ent.EW;
import se.salomonsson.ent.GameTime;
import se.salomonsson.ent.Sys;
import se.salomonsson.game.components.KeyboardInputComponent;
import se.salomonsson.game.components.SoundComponent;

/**
 * ...
 * @author Tommislav
 */

class ShipSystem extends Sys
{
	private var _ship:EW;
	private var _bulletTimer:Int;
	
	
	override public function onAdded(sm, em):Void 
	{
		super.onAdded(sm, em);
		
		_ship = em.allocateEntity()
			.addComponent(new PositionComponent(0.0, 0.0))
			.addComponent(new TilesheetRenderableComponent(SpriteId.SHIP));
	}
	
	override public function tick(gt:GameTime):Void 
	{
		_bulletTimer++;
		
		var keys = em().getComp(KeyboardInputComponent);
		var pos:PositionComponent = _ship.comp(PositionComponent);
		
		if (keys.getKeyIsDown(Keyboard.RIGHT))
			pos.x += 2;
		
		if (keys.getKeyIsDown(Keyboard.LEFT))
			pos.x -= 2;
		
		if (keys.getKeyIsDown(Keyboard.UP))
			pos.y -= 2;
		
		if (keys.getKeyIsDown(Keyboard.DOWN))
			pos.y += 2;
			
		if (keys.getKeyIsDown(Keyboard.SPACE))
			fireBullet();
	}
	
	private function fireBullet() 
	{
		if (_bulletTimer < 20)
			return;
		_bulletTimer = 0;
		
		var pos:PositionComponent = _ship.comp(PositionComponent);
		var fromX:Float = pos.x + 134 - 10;
		var fromY:Float = pos.y + 67 - 11;
		
		em().allocateEntity()
			.addComponent(new PositionComponent(fromX, fromY))
			.addComponent(new TilesheetRenderableComponent(SpriteId.BULLET))
			.addComponent(new BulletComponent());
			
		em().getComp(SoundComponent).queueSfx.push("img/shoot.mp3");
	}
	
}