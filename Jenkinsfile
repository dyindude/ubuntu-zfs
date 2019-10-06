node("normandy") {
    stage('checkout') {
        checkout scm
    }
    stage('build') {
        sh 'packer build ubuntu-zfs-efi-vagrant.json'
    }
    stage('import into vagrant') {
        sh "vagrant box add ubuntu-zfs packer_virtualbox-iso_virtualbox.box --box-version ${BUILD_NUMBER}"
    }
}
