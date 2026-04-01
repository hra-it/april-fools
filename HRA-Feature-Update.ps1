$launchUrl = "https://hra-it.github.io/april-fools/"

[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

$xml = @"
<toast launch="$launchUrl" activationType="protocol" scenario="alarm">
  <visual>
    <binding template="ToastGeneric">
      <text>HRA Feature Update</text>
      <text>A critical update is being applied to your device. Click for details.</text>
    </binding>
    <actions>
      <action content="View Details" arguments="$launchUrl" activationType="protocol"/>
    </actions>
  </visual>
</toast>
"@

$doc = [Windows.Data.Xml.Dom.XmlDocument]::new()
$doc.LoadXml($xml)
$toast = [Windows.UI.Notifications.ToastNotification]::new($doc)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Microsoft Intune").Show($toast)
