function install-android {

    param(
        [switch]$image,
        [switch]$surelock,
        [switch]$rdp,
        [switch]$changeDPI,
        [switch]$all
    )

    $device = adb devices
    $serial = ($device[1]).Substring(0,16)


    if ($image) {

        adb -s $serial restore C:\adb_images\20160713_monitorImage.ab

    }

    if ($surelock) {

        adb -s $serial install c:\adb_images\surelock.apk

    }

    if ($rdp) {

        adb -s $serial install c:\adb_images\com.microsoft.rdc.android-8.1.31.44-APK4Fun.com.apk

    }

    if ($changeDPI) {

        
        # This countdown is no longer necessary since I found the adb command to turn off the monitor screen
        <#
        write-host "Please tap the power button to turn off the monitor screen."
       
        
        for ($i = 10; $i -ge 0; $i --) {
        
            sleep -Seconds 1
            write-host "Waiting $i seconds"

        }
        #>

        write-host "Turning screen off to change the DPI setting..."

        adb shell input keyevent 26
        sleep -Seconds 1
        adb shell am display-density 240
        adb reboot

    }

    if ($all) {

        adb -s $serial restore C:\adb_images\20160713_monitorImage.ab
        adb -s $serial install c:\adb_images\surelock.apk
        adb -s $serial install c:\adb_images\com.microsoft.rdc.android-8.1.31.44-APK4Fun.com.apk

        # This countdown is no longer necessary since I found the adb command to turn off the monitor screen
        <#
        write-host "Please tap the power button to turn off the monitor screen."
        
        for ($i = 10; $i -ge 0; $i --) {
        
            sleep -Seconds 1
            write-host "Waiting $i seconds"

        }
        #>

        write-host "Turning screen off to change the DPI setting..."

        adb shell input keyevent 26
        sleep -Seconds 1
        adb shell am display-density 240
        adb reboot

    }

}
