# Powershell actions.ps1 functions for vagrant,firewall and updateansibleroles:
| function             | flag         | type         |action                                                           |
|----------------------|-----------------------------|-----------------------------------------------------------------|
| vagrant              | -action      |  string      | vagrant second statement to do staff. [up,destroy,ssh]          |
| vagrant              | -provision   |  switch      | only works with up action - proceeding  provisioning.           |
| vagrant              | -force       |  switch      | Only works with destroy action - forcly destroy vm              |
| vagrant              | -user        |  string      | your wsl user to connect vm                                     |
| vagrant              | -distr       |  string      | your wsl distr name                                             |
| firewall             | -up          |  switch      | delete exclution for virtual WSL adapter from Sec profiles      |
| firewall             | -down        |  switch      | add exclustion for   virtual WSL adapter from Sec profiles      |
| UpdateAnsibleRoles   | ....         |  ......      | updating roles folder with roles in requirements.yml            |