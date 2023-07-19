# IntelliJ IDEA

* Официальный сайт: https://www.jetbrains.com/ru-ru/idea
* Адрес загрузки: https://download.jetbrains.com/idea/ideaIC-2023.1.4.win.zip
* Имя дистрибутива: ideaIC-2023.1.4.win.zip
* Версия: 2023.1.4

## Изменения
* Каталог jbr вынесен в компонент CerediraJavaAutomationIDEAFull, так как подразумевается использовать
  для запуска IDEA OpenJDK совместимой версии из компонента CerediraJDK17. Это сделано с целью уменьшения
  размера дистрибутива. При возникновении ошибок, или необходимости - можно распаковать компонент
  CerediraJavaAutomationIDEAFull.
* Часть плагинов вынесена в компонент CerediraJavaAutomationIDEAFull, так как они почти не нужны
  для задач автоматизации тестирования. При возникновении ошибок, или необходимости - можно распаковать
  компонент CerediraJavaAutomationIDEAFull. Список плагинов:
  * android - Android Studio — интегрированная среда разработки (IDE) для работы с платформой Android.
  * android-gradle-dsl
  * android-smali - аналог ассемблера для Android-приложений.
  * cwm-plugin - Code With Me — сервис JetBrains для совместной разработки.
  * cwm-plugin-projector - Code With Me — экспорт cwm-диалогов.
  * design-tools - набор утилит для разработки графического интерфейса для Android.
  * devkit - разработка плагинов для IntelliJ IDEA
  * Kotlin - Kotlin (Ко́тлин) — статически типизированный, объектно-ориентированный язык программирования,
    работающий поверх Java Virtual Machine и разрабатываемый компанией JetBrains.
  * space - Space — это интегрированная среда для командной работы.
  * uiDesigner - Swing — библиотека для создания графического интерфейса на языке Java.
  * vcs-hg - Mercurial — кроссплатформенная распределённая система управления версиями,
    разработанная для эффективной работы с очень большими репозиториями кода.
  * vcs-perforce - Perforce — коммерческая система управления версиями.
  * vcs-svn - Subversion — свободная централизованная система управления версиями.