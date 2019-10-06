node("normandy") {
    stage('checkout') {
        checkout scm
    }
    stage('build') {
        sh 'packer build -on-error=ask ubuntu-zfs-efi-vagrant.json'
    }
}
