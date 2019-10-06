node("normandy") {
    stage('checkout') {
        checkout scm
    }
    stage('build') {
        sh 'packer build ubuntu-zfs-efi-vagrant.json'
    }
}
