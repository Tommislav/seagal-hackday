package demo.components;
import se.salomonsson.ent.IComponent;

/**
 * ...
 * @author Tommislav
 */

class CatComponent implements IComponent
{
	public var fallSpeed:Float;
	public var alive:Bool;
	
	public function new(fallSpeed:Float) 
	{
		this.fallSpeed = fallSpeed;
		alive = true;
	}
	
}