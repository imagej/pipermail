Index: ui/awt-swing/swing/ui-base/src/main/java/imagej/ui/swing/display/SwingDisplayPanel.java
===================================================================
--- ui/awt-swing/swing/ui-base/src/main/java/imagej/ui/swing/display/SwingDisplayPanel.java	(revision 3806)
+++ ui/awt-swing/swing/ui-base/src/main/java/imagej/ui/swing/display/SwingDisplayPanel.java	(working copy)
@@ -85,7 +85,7 @@
 	private final ImageDisplay display;
 	private final JLabel imageLabel;
 	private final JPanel sliders;
-	private final DisplayWindow window;
+	private final SwingDisplayWindow window;
 
 	protected final Map<Axis, Integer> axisPositions =
 		new HashMap<Axis, Integer>();
@@ -104,7 +104,7 @@
 		final DisplayWindow window)
 	{
 		this.display = display;
-		this.window = window;
+		this.window = (SwingDisplayWindow) window;
 
 		imageLabel = new JLabel(" ");
 		final int prefHeight = imageLabel.getPreferredSize().height;
@@ -453,7 +453,7 @@
 	@Override
 	public void close() {
 		closeHelper();
-		((SwingDisplayWindow) this.getParent()).dispose();
+		this.window.dispose();
 	}
 
 }
