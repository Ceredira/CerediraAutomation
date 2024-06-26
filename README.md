# CerediraAutomation

Для технической поддержки просьба обращаться в Telegram канал [CerediraAutomation](https://t.me/CerediraAutomation).

Ошибки и предложения по улучшению можно публиковать на [странице проблем](https://github.com/Ceredira/CerediraAutomation/issues).

Не нужно клонировать или скачивать репозиторий - это для разработки.

Для скачивания используйте [веб-инсталлятор](https://github.com/Ceredira/CerediraAutomation/releases/download/1.1.0.1/CerediraAutomation-1.1.0.hta)
(нажмите Сохранить ссылку как) или воспользуйтесь [страницей релизов](https://github.com/Ceredira/CerediraAutomation/releases)
для ручного скачивания всех доступных компонентов.

## Описание

CerediraAutomation - это набор инструментов (дистрибутив) для автоматизации тестирования с использованием Java и\или Python.

Данный набор будет удобен для IT-специалистов при выполнении задач по разработке (Java, Python), тестированию и
администрированию программного обеспечения на небольших проектах.

При разработке дистрибутива использовался стандарт [CerediraFHS](https://github.com/Ceredira/CerediraFHS).

В полном составе выглядит как на изображении ниже:
![CerediraAutomationWindowsFolderAll](/MDData/images/CerediraAutomationWindowsFolderAll.png)


Для большей гибкости и удобства распространения набор инструментов разделен на отдельные независимые
или малозависимые архивы - компоненты. Для упрощения скачивания, распаковки и контроля версий компонентов
разработана систему установки в виде hta-приложения Windows.
![CerediraAutomationToolboxAllInstall](/MDData/images/CerediraAutomationToolboxAllInstall.png)


| Название компонента            | Размер  | Инструменты                                                   | Описание                                                                                                                                              |
|--------------------------------|---------|---------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| CerediraFHS                    | 89.8 KB | Структура каталогов                                           | CerediraFHS - это стандарт структуры хранения каталогов и файлов внутри каталога операционной системы (ОС) Windows                                    |
| CerediraArchiver               | 2.42 MB | 7-Zip                                                         | Компонент с архиватором, для возможности распаковки других архивов                                                                                    |
| CerediraAdministration         | 9.49 MB | LdapAdmin<br/>MultiCommander<br/>Nssm<br/>PsTools<br/>Scanner | Инструменты для администрирования ОС Windows                                                                                                          |
| CerediraEditors                | 27.6 MB | Notepad++<br/>SublimeText4<br/>WinMerge                       | Инструменты для работы с текстовыми файлами                                                                                                           |
| CerediraJavaAutomation         | 303 MB  | IntelliJIDEA CE                                               | Среда разработки для автоматизации на Java<br/>**Зависимости: CerediraJDK17, CerediraVersionControlGit (опционально)**                                |
| CerediraJavaAutomationIDEAFull | 364 MB  | JBR и плагины Android и Kotlin разработки                     | Оригинальная среда запуска JBR и плагины, не очень нужные большинству проектов автоматизации тестирования<br/>**Зависимости: CerediraJavaAutomation** |
| CerediraJDK17                  | 155 MB  | Apache Maven 3<br/>OpenJDK17                                  | Инструменты для запуска Java приложений                                                                                                               |
| CerediraPythonAutomation       | * MB    | PyCharm CE                                                    | Среда разработки для автоматизации на Python<br/>**Зависимости: CerediraJDK17, CerediraVersionControlGit (опционально)**                              |
| CerediraRemoteAccess           | 35.3 MB | mRemoteNG<br/>PsTools<br/>Putty<br/>WinSCP                    | Инструменты для подключения к удаленным серверам                                                                                                      |
| CerediraTools                  | 4.16 MB | Everything<br/>FindAndReplace<br/>KeePass                     | Дополнительные инструменты, для быстрого поиска в ОС, замены в файлах и хранения паролей                                                              |
| CerediraVersionControlGit      | 51.4 MB | Git<br/>SublimeMerge                                          | Инструменты для проектов с контролем версий                                                                                                           |

Компонент CerediraArchiver, содержащий архиватор имеет формат zip, для возможности распаковки
с использованием средств ОС Windows. Остальные компоненты имеют формат 7z, так как сжимались 7-Zip
архиватором для создания архивов наименьшего размера.

В текущем репозитории хранятся только исходные файлы, разработанные в рамках этого дистрибутива.
Бинарные файлы указанных инструментов в данном репозитории не хранятся, но они доступны в архивах
на странице [релизов](https://github.com/Ceredira/CerediraAutomation/releases).

## Описание версионирования релизов

Мажорные релизы (1.0, 2.0 и т.д.) - это релизы, которые будут выходить по мере сильных изменений в версиях
или используемых технологиях внутри дистрибутива. Например, выход новой версии Java LTS или Python,
или сильное обновление IntelliJ IDEA или PyCharm. Все остальные утилиты будут обновляться под версию
основных утилит.

Минорные релизы (1.0.1, 1.0.2 и т.е.) - это инкрементальные релизы (т.е. их нужно ставить обязательно поверх
мажорных релизов), и содержат исправления и улучшения мажорного релиза.

<span style="color:red">**Скачивание и установка только минорного релиза не даст вам работоспособный полноценный дистрибутив!!!
Необходима последовательная распаковка мажорной версии и всех минорных версии к этой мажорной.**</span>

## Технические подробности
### Организация скриптов удаления

Скрипт для создания команд удаления файлов в нужном компоненте:
```batch
rem Вывести все файлы
powershell -command "$files = gci -af -recurse . | Sort-Object -Descending -Property FullName; foreach ($file in $files) { Write-Host """del """"""$($file.FullName.replace((Get-Item .).FullName, '%ceredira_path%'))"""""""""; }"
```

Скрипт для создания команд удаления каталогов в нужном компоненте:
```batch
rem Вывести все каталоги
powershell -command "$dirs = gci -ad -recurse . | Sort-Object -Descending -Property FullName; foreach ($dir in $dirs) { Write-Host """rmdir """"""$($dir.FullName.replace((Get-Item .).FullName, '%ceredira_path%'))"""""""""; }"
```
