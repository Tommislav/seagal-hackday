package demo.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class PositionComponent implements IComponent
{
	public var x:Float;
	public var y:Float;
	
	public function new(x:Float, y:Float) {
		this.x = x;
		this.y = y;
	}
}