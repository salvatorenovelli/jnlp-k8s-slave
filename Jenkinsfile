
node {
   def project = 'redirect-check-180020'
   def appName = 'jnlp-k8s-slave'

   def imageTag = "gcr.io/${project}/${appName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"

   checkout scm

   stage 'Build image'
   sh("docker build . -t ${imageTag}")

   stage 'Push image to registry'
   sh("gcloud docker -- push ${imageTag}")

}
