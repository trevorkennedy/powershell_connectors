using namespace Microsoft.Office.Interop.Outlook
Add-Type -assembly "Microsoft.Office.Interop.Outlook"

$file = "C:\Users\Trevor\Downloads\UwAmp\www\transactional-email-templates\templates\inlined\alert.html"
$to = “tampatrev@gmail.com“
$text = "Message body here"
$subject = "PowerShell text"
$importance = 2 # high importance email header

$html = [Io.File]::ReadAllText($file)
$outlook = New-Object -com Outlook.Application 
$itemType = [OlItemType]::olMailItem
$mail = $outlook.CreateItem($itemType)
$mail.importance = $importance
$mail.subject = $subject
$mail.body = $text
$Mail.HTMLBody = $html
$mail.To = $to
$mail.Send()
#$outlook.Quit()