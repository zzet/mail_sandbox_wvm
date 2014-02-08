echo "get roles"
ansible-galaxy install bennojoy.nginx --roles-path='./provisioning/roles'
ansible-galaxy install bennojoy.redis --roles-path='./provisioning/roles'
ansible-galaxy install zzet.common --roles-path='./provisioning/roles'
ansible-galaxy install zzet.rbenv --roles-path='./provisioning/roles'
ansible-galaxy install zzet.postgresql --roles-path='./provisioning/roles'
ansible-galaxy install zzet.runit --roles-path='./provisioning/roles'
ansible-galaxy install zzet.mail_sandbox --roles-path='./provisioning/roles'
echo "mkdir for projects"
mkdir -p ./projects/mail_sandbox
echo "clone last repos"
git clone git@github.com:zzet/mail_sandbox.git ./projects/mail_sandbox
echo ""
echo "please, run 'vagrant up'"
