package hx.prim;

abstract XInt(Int)
{
	public static var MAX_VALUE:Int = 2147483647;
	
	public inline function new(i:Int) this = i;
	
	public inline function toString(?radix:Int):String { return this + ""; }
	
	@:from
	public inline static function fromStr(s:String):XInt return new XInt(Std.parseInt(s));
	
	@:from
	inline static function fromFloat(s:Float):XInt return new XInt(Math.floor(s));
	
	@:from
	public inline static function fromInt(s:Int):XInt return new XInt(s);
	
	@:from
	public inline static function fromUInt(s:UInt):XInt return new XInt(s);
	
	@:from
	public inline static function fromXFloat(s:XFloat):XInt return new XInt(s.toInt());
	
	@:from
	public inline static function fromXInt(s:XInt):XInt return s;
	
	//***********************************************************************
	
	@:to
	public inline function toInt():Int return Math.floor(this);
	
	@:to
	public inline function toFloat():Float return this+0.0;	
	
	@:to
	public inline function toXUInt():XUInt return new XUInt(this);
	
	@:to
	public inline function toXFloat():XFloat return new XFloat(this);
	
	@:to
	public inline function toStr():String return this + "";
	
	@:to
	public inline function toBool():Bool return this != 0;
	
	//******************************************************************
	
	@:op(A >> B) public static inline function rShift(a:XInt, b:XInt):Int {
		return a.toInt() >> b.toInt();
	}
	
	@:op(A << B) public static inline function lShift(a:XInt, b:XInt):Int {
		return a.toInt() << b.toInt();
	}
	
	@:op(A >>> B) public static inline function llShift(a:XInt, b:XInt):Int {
		return a.toInt() >>> b.toInt();
	}
	
	//******************************************************************
	
	@:op(A > B) public static inline function gt(a:XInt, b:XInt):Bool {
		return a.toInt() > b.toInt();
	}
	
	@:commutative @:op(A + B) static inline function addInt(a:XInt, b:Int):XInt {
		return new XInt(a.toInt() + b);
	}
	
	@:commutative @:op(A + B) static inline function addFloat(a:XInt, b:Float):Float {
		return a.toInt() + b;
	}
	
	@:commutative @:op(A + B) static inline function addStr(a:XInt, b:String):String {
		return a.toString() + (b);
	}
	
	@:commutative @:op(A + B) static inline function addBool(a:XInt, b:Bool):String {
		return a.toString() + (b + "");
	}
	
	@:commutative @:op(A + B) static inline function addDynamic(a:XInt, b:Dynamic):String {
		return a.toString() + (b + "");
	}
	
	//*****************************************************************
	@:op(A < B) public static inline function lt(a:XInt, b:XInt):Bool {
		return a.toInt() < b.toInt();
	}
	
	@:op(A == B) public static inline function eq(a:XInt, b:XInt):Bool {
		return a.toInt() == b.toInt();
	}
	
	@:op(A != B) public static inline function ne(a:XInt, b:XInt):Bool {
		return a.toInt() != b.toInt();
	}
	
	@:op(A <= B) public static inline function ge(a:XInt, b:XInt):Bool {
		return a.toInt() <= b.toInt();
	}
	
	@:op(A >= B) public static inline function le(a:XInt, b:XInt):Bool {
		return a.toInt() >=b.toInt();
	}
	
	//******************************************************************
		
	@:op(A * B) public static inline function mul(a:XInt, b:XInt):XInt {
		return a.toInt() * b.toInt();
	}
	
	@:op(A / B) public static inline function dev(a:XInt, b:XInt):Float {
		return a.toInt() / b.toInt();
	}
	
	@:op(A - B) public static inline function min(a:XInt, b:XInt):XInt {
		return a.toInt() - b.toInt();
	}
	
	@:op(A % B) public static inline function mod(a:XInt, b:XInt):XInt {
		return a.toInt() % b.toInt();
	}
	
	
	//*********************************************
	
	@:op(A += B) private inline function addEq(b:XInt):XInt {
		return this += b.toInt();
	}
	
	@:op(A *= B) private inline function mulEq(b:XInt):XInt {
		return this *= b.toInt();
	}
	
	//@:op(A /= B) private inline function devEq(b:XInt):Float {
		//return this /= b.toInt();
	//}
	
	@:op(A -= B) private inline function minEq(b:XInt):XInt {
		return this -= b.toInt();
	}
	
	@:op(A %= B) private inline function modEq(b:XInt):XInt {
		return this %= b.toInt();
	}
	
	//*********************************************
	
	@:op(A++) 
	public inline function oneup():Int 
	{
        return this++;
    }
	
	@:op(++A) 
	public inline function oneuppost():Int 
	{
        return ++this;
    }
	
	@:op(A--) 
	public inline function onedown():Int 
	{
        return this--;
    }
	
	@:op(--A) 
	public inline function onedownpost():Int 
	{
        return --this;
    }
	
	@:op(~A) 
	public inline function bitwisenot():Int 
	{
        return ~this;
    }
	
	@:op(-A) 
	public inline function minusThis():Int 
	{
        return -1*this;
    }
}
