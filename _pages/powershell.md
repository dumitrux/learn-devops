---
title: PowerShell
author: dumitrux
date: 2023-09-11
category: Jekyll
layout: post
---

PowerShell Basic commands

- [Iterate through files in a directory](#iterate-through-files-in-a-directory)


# Scripts
Iterate through files in a directory
```powershell
Get-ChildItem "." -Filter *.log | 
Foreach-Object {
    $content = Get-Content $_.FullName

    #filter and save content to the original file
    $content | Where-Object {$_ -match 'step[49]'} | Set-Content $_.FullName

    #filter and save content to a new file 
    $content | Where-Object {$_ -match 'step[49]'} | Set-Content ($_.BaseName + '_out.log')
}
```
