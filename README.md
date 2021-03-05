# RyzenMaster-zhTW-Translator
Ryzen Maser Traditional Chinese Translator

## Motivation ##
RM (Ryzen Maser)'s Chinese display is not very friendly and perfectly. His default font uses **mingliu.ttc**, but it does not support the Chinese translation version. Therefore, we intend to provide a translation ourselves.

## Preview ##
Translating with the New Phrase Tool.  
![RyzenMaster-zhTW-screenshot](/Artwork/RyzerMaster-zhTW.png?raw=true "Ryzen Master Tradition Chinese")

Translating only SC to TC.  
![RyzenMaster-zhTW-screenshot](/Artwork/RyzerMaster-zhTW_0.png?raw=true "Ryzen Master Tradition Chinese")


## How it works ##
Because RM uses QT to design the software. Therefore, we can use QT's resource editor to create and change the translated QM files for i18n.

## Steps ##
The default installation location for RM is **%ProgramFiles%\AMD\RyzenMaster**. We need to get **chinese_simplified.qm** from **RyzenMaster\bin\Languages**. This is a simplified Chinese version. We will use this version as a template and translate it to our target version.

## Tools ##
To modify QM files, we need to install **qt5-tools\linguist.exe**. You need to go to the [QT linguist web page](https://doc.qt.io/qt-5/qtlinguist-index.html) to download and install it. Then we can use linguist to open the compiled .qm file. And re-export the translated .qm file. For convenience, I saved the .qm file as a **chinese_traditional.ts** file so that we can edit it with a text editor.

## Installation ##
To use traditional Chinese, we need to provide a translation file called: chinese_traditional.qm. and place it in **RyzenMaster\bin\Languages** and **RyzenMaster\bin\translations**.

## Use my pre-translated file ##
Please use the translation file in **prebuilt** and copy to your Ryzen Master folder (%ProgramFiles%\AMD\RyzenMaster).

## String Conversion Tool ##
Because our translation is based on the Simplified Chinese version, some common words may not be suitable for Traditional Chinese users, so we have added a common word conversion tool. Please use powershell to run **replace_zhtw_idiomatic.ps1**.

```powershell
.\replace_zhtw_idiomatic.ps1 .\chinese_traditional.ts .\chinese_traditional1.ts
```

### Phrases_Tools ###
Provide new phrase tool uses opencc and Microsoft word to convert Simplified Chinese to Traditional.

* opencc setup:  
  * Download [opencc](https://github.com/BYVoid/OpenCC)
  * Configure the opencc_conv.ps1 in folder: **phrases_tools**
    ```powershell    
    # opencc paths
    $OPEN_CC_FILEPATH         = "C:\opencc\bin\opencc.exe"
    $OPEN_CC_TW2SP_FILEPATH   = "C:\opencc\data\config\s2twp.json"
    ```
* Office Word setup:  
  * Install office word.
  * We use VBScript to use Automation Word objects to call office convert API to convert chinese_traditional.ts

* Convert Rules:
  1. Convert in opencc.
  2. Convert opencc result in Word convert. 
  3. Apply **replace_zhtw_idiomatic.ps1** convert. (final phrases fix)

* Test It:  
    ```bat
    cd phrases_tools
    convert.cmd
    ```
* Preview:  
![RyzenMaster-zhTW-Phrases](/Artwork/tc_phrases_convert.png?raw=true "Translating with the New Phrase Tool")

## Tested Ryzen Master Version ##
Ver: 2.6.1.1797
