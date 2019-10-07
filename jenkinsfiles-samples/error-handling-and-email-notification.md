node {

  try {
  
    stage ('echo'){
    
      sh 'echo "hello world"'
      def object = null
      sh "${object.class}"
    }
    
  }
  
  catch (NullPointerException e) {
  
    error 'broken pipeline message'
    currentBuild.result = 'FAILURE'
    currentBuild.result = 'UNSTABLE'
    
  } finally {
  
      stage ('Send email notification') {
        echo 'This will run no matter the build result'
        mail to: 'larissaporto@dev.com'
             subject: " Failed Pipeline: ${currentBuild.fullDisplayName}"
             body: "Something is wrong with ${end.BUILD_URL}"
      }
    
  }

}
