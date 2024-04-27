package com.example.ultimate_alarm_clock

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel
import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.SystemClock
import android.app.ActivityManager
import android.widget.Toast
import android.os.PowerManager
import android.util.Log
import android.view.WindowManager
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri
import android.app.AlertDialog
import android.widget.Button
import android.os.Build
import java.util.Locale
import android.provider.Settings

class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "ulticlock"
        const val ACTION_START_FLUTTER_APP = "com.example.ultimate_alarm_clock"
        const val EXTRA_KEY = "alarmRing"
        val alarmConfig = hashMapOf("shouldAlarmRing" to false, "alarmIgnore" to false)
        private var ringtone: Ringtone? = null
        const val OVERLAY_REQUEST_CODE = 123
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Your existing onCreate code goes here...

        val dialogBuilder = AlertDialog.Builder(this)
        val inflater = this.layoutInflater
        val dialogView = inflater.inflate(R.layout.custom_dialog, null)
        dialogBuilder.setView(dialogView)

        val yesButton = dialogView.findViewById<Button>(R.id.yesButton)
        val noButton = dialogView.findViewById<Button>(R.id.noButton)

        val alertDialog = dialogBuilder.create()

        yesButton.setOnClickListener {
            alertDialog.dismiss()
            if ("xiaomi".equals(Build.MANUFACTURER.toLowerCase(Locale.ROOT))) {
                val intent = Intent("miui.intent.action.APP_PERM_EDITOR")
                intent.setClassName(
                    "com.miui.securitycenter",
                    "com.miui.permcenter.permissions.PermissionsEditorActivity"
                )
                intent.putExtra("extra_pkgname", packageName)
                AlertDialog.Builder(this)
                    .setTitle("Please Enable the additional permissions")
                    .setMessage("You will not receive notifications while the app is in the background if you disable these permissions")
                    .setPositiveButton("Go to Settings") { dialog, which ->
                        startActivity(intent)
                    }
                    .setIcon(android.R.drawable.ic_dialog_info)
                    .setCancelable(false)
                    .show()
            } else {
                val overlaySettings = Intent(
                    Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                    Uri.parse("package:$packageName")
                )
                startActivityForResult(overlaySettings, OVERLAY_REQUEST_CODE)
            }
        }

        noButton.setOnClickListener {
            alertDialog.dismiss()
        }

        alertDialog.show()
    }




    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON or WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED or WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON)
        var methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        val intent = intent
        if (intent != null && intent.hasExtra(EXTRA_KEY)) {
            val receivedData = intent.getStringExtra(EXTRA_KEY)
            alarmConfig["shouldAlarmRing"] = true
            val cleanIntent = Intent(intent)
            cleanIntent.removeExtra(EXTRA_KEY)
            setIntent(cleanIntent)
            println("NATIVE SAID OK")
        } else {
            println("NATIVE SAID NO")
        }
        methodChannel.invokeMethod("appStartup", alarmConfig)
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "scheduleAlarm") {
                val seconds = call.argument<Int>("milliSeconds")
                println("FLUTTER CALLED SCHEDULE")
                scheduleAlarm(seconds ?: 0)
                result.success(null)
            } else if (call.method == "cancelAllScheduledAlarms") {
                println("FLUTTER CALLED CANCEL ALARMS")
                cancelAllScheduledAlarms()
                result.success(null)
            } else if (call.method == "bringAppToForeground") {
                bringAppToForeground(this)
                result.success(null)
            } else if (call.method == "minimizeApp" ) {
                minimizeApp()
                result.success(null)   
            } else if (call.method == "playDefaultAlarm") {
                playDefaultAlarm(this)
                result.success(null)
            } else if (call.method == "stopDefaultAlarm") {
                stopDefaultAlarm()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    fun bringAppToForeground(context: Context) {
        val activityManager = context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager?
        val appTasks = activityManager?.appTasks
        appTasks?.forEach { task ->
            if (task.taskInfo.baseIntent.component?.packageName == context.packageName) {
                task.moveToFront()
                return@forEach
            }
        }
    }


    private fun minimizeApp() {
        moveTaskToBack(true)
    }


    private fun scheduleAlarm(milliSeconds: Int) {
        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(this, AlarmReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            this,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
        )

        // Schedule the alarm
        val triggerTime = SystemClock.elapsedRealtime() + milliSeconds
        alarmManager.setExact(AlarmManager.ELAPSED_REALTIME_WAKEUP, triggerTime, pendingIntent)
    }

    private fun cancelAllScheduledAlarms() {
        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(this, AlarmReceiver::class.java)
        val pendingIntent = PendingIntent.getBroadcast(
            this,
            0,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
        )

        // Cancel any existing alarms by providing the same pending intent
        alarmManager.cancel(pendingIntent)
        pendingIntent.cancel()
    }

    private fun playDefaultAlarm(context: Context) {
        val alarmUri: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM)
        ringtone = RingtoneManager.getRingtone(context, alarmUri)
        ringtone?.play()
    }

    private fun stopDefaultAlarm() {
        ringtone?.stop()
    }
}
