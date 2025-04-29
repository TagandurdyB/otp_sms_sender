package com.example.otp_sms_sender

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.telephony.SmsManager
import android.telephony.SubscriptionManager
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import android.widget.Toast


class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.chat/chat"
    private val PERMISSIONS_REQUEST_CODE = 1

    // Global variable to hold SMS data until permissions are granted
    private var pendingSmsData: Triple<String, String, Int>? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "sendSmsWithSlot") {
                val phoneNumber = call.argument<String>("phoneNumber") ?: ""
                val message = call.argument<String>("message") ?: ""
                val simSlot = call.argument<Int>("simSlot") ?: 0 // Default to SIM slot 0

                // Check permissions first
                if (ContextCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED ||
                    ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
                    
                    // If permissions are not granted, request them
                    ActivityCompat.requestPermissions(
                        this, 
                        arrayOf(Manifest.permission.READ_PHONE_STATE, Manifest.permission.SEND_SMS), 
                        PERMISSIONS_REQUEST_CODE
                    )
                    
                    // Store SMS data for later
                    pendingSmsData = Triple(phoneNumber, message, simSlot)
                    
                    // Return error until permissions are granted
                    result.error("PERMISSION_DENIED", "Permissions not granted", null)
                    return@setMethodCallHandler
                }

                // If permissions are granted, proceed with sending SMS
                sendSmsWithSlot(phoneNumber, message, simSlot, result)
            } else {
                result.notImplemented()
            }
        }
    }

    // Function to send SMS after permissions are granted
    private fun sendSmsWithSlot(phoneNumber: String, message: String, simSlot: Int, result: MethodChannel.Result) {
        try {
            val subscriptionManager = getSystemService(TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager
            val subscriptionInfoList = subscriptionManager.activeSubscriptionInfoList

            // Log the number of active subscriptions
            Log.d("MainActivity", "Active subscriptions: ${subscriptionInfoList?.size}")
            Log.d("MainActivity", "Using simSlot: $simSlot")

            // Ensure the simSlot index is valid
            if (subscriptionInfoList != null && subscriptionInfoList.isNotEmpty() && simSlot < subscriptionInfoList.size) {
                val subscriptionInfo = subscriptionInfoList[simSlot] // Get the SIM info for the specified slot
                val simSlotId = subscriptionInfo.subscriptionId

                val smsManager = SmsManager.getSmsManagerForSubscriptionId(simSlotId)
                smsManager.sendTextMessage(phoneNumber, null, message, null, null)
                result.success("SMS Sent Successfully")
            } else {
                result.error("INVALID_SIM_SLOT", "The specified SIM slot is invalid or no active subscriptions found.", null)
            }
        } catch (e: Exception) {
            result.error("SEND_SMS_FAILED", "Failed to send SMS", e.message)
        }
    }

    // Handle permission result
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (requestCode == PERMISSIONS_REQUEST_CODE) {
            // Check if both permissions are granted
            val sendSmsGranted = grantResults.getOrNull(0) == PackageManager.PERMISSION_GRANTED
            val readPhoneStateGranted = grantResults.getOrNull(1) == PackageManager.PERMISSION_GRANTED

            // Log the permission status for debugging
            Log.d("MainActivity", "SEND_SMS permission granted: $sendSmsGranted")
            Log.d("MainActivity", "READ_PHONE_STATE permission granted: $readPhoneStateGranted")

            if (sendSmsGranted && readPhoneStateGranted) {
                // Permissions granted, retry sending the SMS if there was pending SMS data
                pendingSmsData?.let {
                    sendSmsWithSlot(it.first, it.second, it.third, object : MethodChannel.Result {
                        override fun success(result: Any?) {
                            // Handle success
                            Log.d("MainActivity", "SMS sent successfully after permissions granted")
                        }

                        override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                            // Handle error
                            Log.e("MainActivity", "Error sending SMS: $errorMessage")
                        }

                        override fun notImplemented() {
                            // Handle not implemented
                        }
                    })
                    pendingSmsData = null // Clear the pending data after sending the SMS
                }
            } else {
                // Permissions were not granted, handle accordingly
                Log.e("MainActivity", "Permissions not granted")
                Toast.makeText(this, "Permissions not granted, SMS cannot be sent", Toast.LENGTH_SHORT).show()
            }
        }
    }


}