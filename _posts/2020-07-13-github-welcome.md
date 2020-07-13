---
title: GitHub Welcome Feature
categories:
  - programming
tags:
  - github
  - features
  - secret
classes: wide
gallery:
  - image_path: assets/images/posts_images/2020-07-13-github-welcome/enzo_github_welcome.png
    alt: "Enzo GitHub Welcome"
    title: "Example 1"
  - image_path: assets/images/posts_images/2020-07-13-github-welcome/vansh_github_welcome.png
    alt: "Vansh GitHub Welcome"
    title: "Example 2"
---

Today, I wanted to write a brief blog about a new release from GitHub that allows users to create personal welcome messages automatically. This new feature was released as a "secret" feature in a recent GitHub update.

## Unlocking the Secret

To create the welcome message you must create a repository with the same name as your GitHub username. For instance my username is williazo, so to unlock this feature I would simply create a new repository with the name williazo. Note that as soon as you give the repository the appropriate name, a note will appear identifying that you have uncovered the secret. Ensure that your repository is set to public and initialize it with a README.md. The README.md serves as the template for creating the welcome message and comes with some initial suggestions for things to includes such as projects you are currently working on, contact info, etc. From there though the choice is yours about what and how you want to include relavent information. Below is a screenshot of the landing page for my GitHub account with the new welcome message.

{% capture fig_img %}
![justin_welcome]({{ "assets/images/posts_images/2020-07-13-github-welcome/jrw_github_welcome.jpg" | relative_url }})
{% endcapture %}
<figure>
  {{ fig_img | markdownify | remove: "<p>" | remove: "</p>" }}
  <figcaption>My personal GitHub landing page.</figcaption>
</figure>

You can see that this provides you an opportunity to explain a little bit more about yourself and your goals rather than strictly listing your repositories. You will also notice that the welcome README.md supports GitHub emojis[^1].

## Inspiration

To get the creative juices flowing I have also included several examples below of welcome pages to serve as inspiration. Links to each of the respective GitHub pages is included in the captions. There is also a great directory at <https://github.com/abhisheknaiidu/awesome-github-profile-readme> dedicated to showcasing these welcome pages.

{% include gallery layout="half" class="full"
caption="Examples of interesting GitHub welcome pages. <br>
Example 1: Available at <https://github.com/BLKKKBVSIK> with animation. <br>
Available at <https://github.com/vanshkapoor>." %}

[^1]: For a complete list of the supported emojis see <https://gist.github.com/rxaviers/7360908>. 