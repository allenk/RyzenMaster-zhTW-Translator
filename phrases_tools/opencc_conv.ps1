#
# replace the phrases. AllenK (kwyshell@gmail.com)
#

# parameter, input and output files
param(
    [string] $inputfile,
    [string] $outputfile
)

# opencc paths
$OPEN_CC_FILEPATH         = "C:\Tools\bin\opencc\bin\opencc.exe"
$OPEN_CC_TW2SP_FILEPATH   = "C:\Tools\bin\opencc\share\opencc\s2twp.json"

# test parameters
if ($null -eq $inputfile -or $null -eq $outputfile)
{
    echo "Should provide input and output file"
    return
}

if (-Not (Test-Path -Path $inputfile -PathType leaf))
{
    echo "Cannot open the input file"
    return
}

try
{
    # convert using opencc
    # memo: convert the input sc file in tw2sp.json twice will get best result (more phrases are converted). (fun! why?)

    # simple to traditional
    $arg = "-c " + $OPEN_CC_TW2SP_FILEPATH + " -i " + $inputfile + " -o " + $outputfile
    Start-Process -FilePath $OPEN_CC_FILEPATH -NoNewWindow -Wait -ArgumentList $arg

    # phrases
    $arg = "-c " + $OPEN_CC_TW2SP_FILEPATH + " -i " + $outputfile + " -o " + $outputfile
    Start-Process -FilePath $OPEN_CC_FILEPATH -NoNewWindow -Wait -ArgumentList $arg
}
catch
{
    echo "run with errors:"
    $_
    return
}

