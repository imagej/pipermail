/* -*- mode: java; c-basic-offset: 8; indent-tabs-mode: t; tab-width: 8 -*- */

package features;

import ij.*;
import imagej.plugin.Parameter;
import imagej.plugin.AbstractPlugIn;
import ij.measure.Calibration;
import ij.plugin.*;
import ij.process.*;
import ij.gui.GenericDialog;

public class Tubeness_ extends AbstractPlugIn implements PlugIn {

	static final String PLUGIN_VERSION = "1.2";

	@parameter(label="Input image")
	public ImagePlus original = null;
	
	@Parameter(label="Sigma")
	public double sigma = 1.0;
	
	@Parameter(label="Use calibration")
	public boolean useCalibration = false;
	
	@Parameter(label="Output image", output=true)
	public ImagePlus result = null;
	
	public void run(String ignored) {

		if (original == null)
			original = WindowManager.getCurrentImage();
		if (original == null) {
			IJ.error("No current image to calculate tubeness of.");
			return;
		}

		Calibration calibration = original.getCalibration();

		double minimumSeparation = 1;
		if( calibration != null )
			minimumSeparation = Math.min(calibration.pixelWidth,
						     Math.min(calibration.pixelHeight,
							      calibration.pixelDepth));

		TubenessProcessor tp = new TubenessProcessor(sigma,useCalibration);

		result = tp.generateImage(original);
		result.setTitle("tubeness of " + original.getTitle());

		result.show();
	}
}
