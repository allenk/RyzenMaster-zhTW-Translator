#
# replace the phrases. AllenK (kwyshell@gmail.com)
#

# parameter, input and output files
param(
    [string] $inputfile,
    [string] $outputfile
)

# build the phrases table
$phraseList = @(
    ('時鐘', '時脈'),
    ('庫存', '預設'),
    ('設置', '設定'),
    ('時鐘', '時脈'),
    ('互聯網絡', '網際網路'),
    ('字節', '位元組'),
    ('芯片', '晶片'),
    ('控制面板', '控制台'),
    ('客戶端 ', '用戶端'),
    ('默認 ', '預設'),
    ('數據', '資料'),
    ('缺省', '預設'),
    ('功能變數名稱', '網域名稱'),
    ('框架', '架構'),
    ('硬體', '硬件'),
    ('主機別名', '主機名稱'),
    ('主頁', '首頁'),
    ('哈希', '雜湊'),
    ('內核', '核心'),
    ('低延時', '低延遲'),
    ('內存', '記憶體'),
    ('許可權', '權限'),
    ('補丁', '更新檔'),
    ('編程', '程式設計'),
    ('視頻', '視訊'),
    ('主板', '主機板'),
    ('母板', '主機板'),
    ('調制解調器', '數據機'),
    ('鼠標', '滑鼠'),
    ('調制解調器', '數據機'),
    ('簡單卷', '簡單磁碟區'),
    ('跨區卷', '跨距磁碟區'),
    ('帶區卷', '等量磁碟區'),
    ('調制解調器', '數據機'),
    ('屏幕', '螢幕')
)

# test parameters
if ($null -eq $inputfile -or $null -eq $outputfile)
{
    echo "Should provide input and output file"
    return
}

if (-Not (Test-Path -Path $inputfile -PathType leaf))
{
    echo "Cannot open the input file"
    ##return
}

try
{
    # load content
    $source = Get-Content -path $inputfile -ErrorAction Stop

    if ($null -ne $source)
    {
        # replace the string content
        foreach( $pattern in $phraseList.GetEnumerator() )
        {
            $source = ($source -replace $pattern[0], $pattern[1])
        }
    }

    # store content
    Set-Content -path $outputfile -Value $source
}
catch
{
    echo "run with errors:"
    $_
    return
}


