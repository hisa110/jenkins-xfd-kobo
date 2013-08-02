jenkins-xfd-kobo
================

This is Jenkins XFD by kobo.
You bought new kobo, you can re-use old kobo!

When jenkins is green, displayed Mr.Jenkins at Kobo.
When jenkins is failed, displayed Sad-Jenkins at Kobo.

Jenkinsの結果をKoboで表示できます。
新しいkoboを買ったら、いらなくなったkoboは再利用しましょう。
ビルド結果がsuccessのときはふつうのJenkinsが表示され、Failしたときは悲しい顔のJenkinsが表示されます。

こちらのEmotional Jenkinsの画像をつかわせていただきました。
https://wiki.jenkins-ci.org/display/JENKINS/Emotional+Jenkins+Plugin

#How to setup

##kobo (Kobo touch)

###1) jail break your kobo(enable telnet)
Please search yourself.
see http://blog.osakana.net/archives/2794

###2) copy
    cp kobo/* /mnt/onboard/


##Client

###On your machine
    bundle install
    ruby client/jenkins.rb & > /dev/null 2>&1
(Require ruby 1.9 or later)

#Settings

You can change 
- jenkins URL
- Interval
- Task name

(Please see client/jenkins.rb)
