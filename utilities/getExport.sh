docker cp configIncludes.txt dockerjenkins_master_1:/tmp/configIncludes.txt
docker exec dockerjenkins_master_1 bash -c "tar -czvf /tmp/jenkinsexport.tar.gz -T /tmp/configIncludes.txt /var/jenkins_home/jobs/*/config.xml"
docker cp dockerjenkins_master_1:/tmp/jenkinsexport.tar.gz ../docker-jenkins/jenkins-data/jenkinsexport.tar.gz
