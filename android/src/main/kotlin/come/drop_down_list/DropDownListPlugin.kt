//package come.drop_down_list
//
//
//
//class DropDownListPlugin: MethodCallHandler {
//  companion object {
//    @JvmStatic
//    fun registerWith(registrar: Registrar) {
//      val channel = MethodChannel(registrar.messenger(), "drop_down_list")
//      channel.setMethodCallHandler(DropDownListPlugin())
//    }
//  }
//
//  override fun onMethodCall(call: MethodCall, result: Result) {
//    if (call.method == "getPlatformVersion") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
//    } else {
//      result.notImplemented()
//    }
//  }
//}
