# Instagram Username Transfer

## What is this?

So you want to transfer your Instagram username from one account to another. You probably want to do this without risking losing your username. Unfortunately, as you probably realize, Instagram doesn't make this possible. They just don't have the money or the engineering personnel to build useful things. But don't fret! You're on Github, so you're eng, so you can do it!

## Step 1: get a box

Instagram is built in Menlo Park, California, and they have a data center in San Jose. You're going to want a machine very physically proximate to San Jose. I rented one from Linode at their Fremont, CA location. It had ~1.5ms ping to `www.instagram.com`, so that was good.

## Step 2: prepare your box

The machine you rent needs to be setup for `ruby-2.3`. I used Ubuntu 16.04 LTS. I did something like:

- $`apt-get update`
- $`apt-get install ruby ruby-build ruby-dev`
- $`gem install bundler`
- $`git clone git@github.com:zshannon/instagram-username.git`
- $`cd instagram-username`
- $`bundle`

## Step 3: prepare your script

You need to use your web browser to grab some data off a legitimate Instagram.com request. Unfortunately if you have an Apple computer, Apple doesn't have the money or engineering personnel to make Safari's Developer Console usable, so your built in web browser won't work well for this. But don't fret, I like using Google Chrome!

You should:

- Open one normal Chrome window, log into Instagram, navigate to [Edit Profile](https://www.instagram.com/accounts/edit/), then open dev tools, clear your network log, and click "Submit" on the form to log an API call.
- Open one private browsing Chrome window, log into your other Instagram account, navigate to [Edit Profile](https://www.instagram.com/accounts/edit/), then open dev tools, clear your network log, and click "Submit" on the form to log an API call.

Now, separately for each window, click on `edit/`, scroll down to "Request Headers", then copy the value of `cookie` and `x-csrftoken`.

Open `username-transfer.rb` up in a text editor you like. There are **14** locations marked `FILL_ME_IN` that you're now going to... fill... in.

Anyway hopefully you don't have any questions.

## Step 4: run your script

Once you've filled in those values on your near-to-San Jose box, it's GO TIME.

- $`ruby username-transfer.rb`

## Step 5: thank me

Extra points for creativity!
