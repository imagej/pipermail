package net.imglib2;

import net.imglib2.img.Img;
import net.imglib2.type.numeric.NumericType;
import net.imglib2.type.numeric.integer.IntType;

public class AddRealOrIntegerExample
{

	public static < T extends NumericType< T >, A extends Positionable & Sampler< T >, B extends Positionable & Sampler< T > > void add( A a, B b, Cursor< T > c )
	{
		while ( c.hasNext() )
		{
			c.fwd();
			a.setPosition( c );
			b.setPosition( c );
			c.get().set( a.get() );
			c.get().add( b.get() );
		}
	}

	public void main( String[] args )
	{
		Img< IntType > aImg = null; // this would be input image A
		RealRandomAccessible< IntType > bImg = null; // this would be the view of the input Image B
		Img< IntType > cImg = null; // this would be output image C
		RandomAccess< IntType > a = aImg.randomAccess();
		RealRandomAccess< IntType > b = bImg.realRandomAccess();
		Cursor< IntType > c = cImg.localizingCursor();
	}

}