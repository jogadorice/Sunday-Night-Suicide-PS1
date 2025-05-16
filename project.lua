return {
	DEBUG_MODE = true,

	title = "Sunday Night Suicide PS1",
	file = "SNS-PS1",
	icon = "art/icon.png",
	version = "1.0.0-dev",
	package = "com.jogadorice.snsps1",
	width = 720,
	height = 720,
	FPS = 60,
	company = "Jogadorice",

	flags = {
		checkForUpdates = false,

		loxelInitialAutoPause = true,
		loxelInitialParallelUpdate = true,
		loxelInitialAsyncInput = false,

		loxelForceRenderCameraComplex = false,
		loxelDisableRenderCameraComplex = false,
		loxelDisableScissorOnRenderCameraSimple = false,
		loxelDefaultClipCamera = true
	}
}
