onepennymedia
=============

A web media reporting about web/app startups in Hangzhou

## development

One Penny Media is based on the blogging engine called: [Typo](https://github.com/fdv/typo). Quoting its description:

    Typo is the oldest and most powerful Ruby on Rails blogware, providing custom templates, powerful drag and drop plugins API, advanced SEO capabilities, XMLRPC API and many more.

### requirement

* ruby 1.9.3p286 # install via rbenv or rvm.

### setup

> bundle

> rake db:migrate

> open http://localhost:3000

## deployment

### Setup

The deploy script will checkedout the codes from Github using your local ssh key via ssh agent forwarding, please follow these steps to setup the forwarding:

1 Add the following to ~/.ssh/config:

> Host media.onepennyentrepreneur.com

> ForwardAgent yes

2 Enable forwarding in /etc/sshd_config (disabled in OSX by default):

> AllowAgentForwarding yes

3 Add your local key to ssh agent:

> ssh-add ~/.ssh/id_rsa (or ssh-add ~/.ssh/id_dsa, depending on the key you are using)

4 Login to production server and test the with Github:

> ssh media.onepennyentrepreneur.com

> ssh -T git@github.com

> should return "Hi XXXXX! You've successfully authenticated", otherwise indicated something wrong.

5 Done, you are ready to deploy your code.

### Deploy

> cap deploy

> open http://media.onepennyentrepreneur.com
