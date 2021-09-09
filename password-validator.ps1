
$PASS = $args[0]
$ISGOOD=0
$FILE = $args[1]


#If the option “-f” is added the password should be retrieved from a file.
if($PASS -eq '-f'){
    $NewPass = Get-Content -Path $FILE
}

else {
    $NewPass = $PASS
}    

# Check if string is less than 10 characters
if($NewPass.Length -le 9){
    write-host -ForegroundColor red "password does not include 10 or more characters"
}
else{
    $ISGOOD++
}
# Check if string include digits
if ( $NewPass -notmatch '\d+' -or $NewPass -notmatch '[a-zA-Z]+' ) {
    Write-Host -ForegroundColor Red "password does not include digits"   
}
else{
    $ISGOOD++
}
# Check if string include lowercase letters
if ( $NewPass -notmatch '(?-i)[a-z]+' ) {
    Write-Host -ForegroundColor Red "password does not include lowercase letters"
}
else{
    $ISGOOD++
}
# Check if string include uppercase letters
if ( $NewPass -notmatch '(?-i)[A-Z]+' ) {
    Write-Host -ForegroundColor Red "password does not include uppercase letters" 
    
}
else{
    $ISGOOD++
}
# Check ISGOOD status, if ISGOOD doesn't equal to 4, it means that password isn't good enough 
# since it doesn't meet the conditions above
if( $ISGOOD -eq 4){
    Write-Host -ForegroundColor Green "Your password is valid!!"
    exit 0 
}

else{
    exit 1
}




