#
# replace the phrases. AllenK (kwyshell@gmail.com)
#

# parameter, input and output files
param(
    [string] $inputfile,
    [string] $outputfile
)

# build the phrases table
$phraseList = @{
    '時鐘' = '時脈';
    '庫存' = '預設';
    '設置' = '設定';
    '互聯網絡' = '網際網路';
    '字節' = '位元組';
    '芯片' = '晶片';
    '控制面板' = '控制台';
    '客戶端 ' = '用戶端';
    '默認 ' = '預設';
    '數據' = '資料';
    '缺省' = '預設';
    '功能變數名稱' = '網域名稱';
    '框架' = '架構';
    '硬體' = '硬件';
    '主機別名' = '主機名稱';
    '主頁' = '首頁';
    '哈希' = '雜湊';
    '內核' = '核心';
    '低延時' = '低延遲';
    '內存' = '記憶體';
    '許可權' = '權限';
    '補丁' = '更新檔';
    '編程' = '程式設計';
    '視頻' = '視訊';
    '主板' = '主機板';
    '母板' = '主機板';
    '調制解調器' = '數據機';
    '鼠標' = '滑鼠';
    '簡單卷' = '簡單磁碟區';
    '跨區卷' = '跨距磁碟區';
    '帶區卷' = '等量磁碟區';
    '屏幕' = '螢幕';
    '行週期' = '行週期(tRC)';
    '行地址啟用時間' = '行地址啟用時間(tRAS)';
    '讀取行列地址延遲' = '讀取行列地址延遲(tRCD R)';
    '列地址選通脈衝延遲' = '列地址選通脈衝延遲(tCL)';
    '行地址預充電延遲' = '行地址預充電延遲(tRP)';
    '寫入行列地址延遲' = '寫入行列地址延遲(tRCD W)';
    '寫入 CAS 延遲' = '寫入 CAS 延遲(tWCL)'
}

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
    # load content
    $source = Get-Content -path $inputfile -ErrorAction Stop

    if ($null -ne $source)
    {
        # replace the string content
        foreach( $pattern in $phraseList.GetEnumerator() )
        {
            $source = ($source -replace $pattern.Key, $pattern.Value)
        }
    }

    # store content
    Set-Content -path $outputfile -Value $source -Encoding UTF8
}
catch
{
    echo "run with errors:"
    $_
    return
}


