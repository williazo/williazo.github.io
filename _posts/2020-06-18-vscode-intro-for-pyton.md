---
title: vscode-Intro for Python
categories:
  - statistics
tags:
  - vscode
  - python
  - notebook
  - Jupyter
classes: wide
---

I am back on a roll now with blogging and I can feel the momentum. This week I wanted to spend some time going over an introduction to one of my favorite new discoveres, [Visual Studio Code](https://code.visualstudio.com).

Visual Studio Code, referred to as vscode throughout the remaining post, in its most simple sense is a text editor, but it is a text editor on steroids. This software was developed by the Microsoft Team and has become extremely popular within the software develoment community. The basic install version of vscode comes pre-installed with several usefull features such as IntelliSense that provides users with comfortable highlighting and autocomplete, built in Git compatibility for distributed version control, and an expansive catalogue of extensions. These extensions range from highly functional to purely aesthetic.

My personal favorite aesthetic extension is [Color Highligher](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight) that allows you to preview colors entered as Hex, e.g., "#F00123",  values or rgb, e.g., "rgb(80, 20, 80)", functions within the editor rather than after running the code. See the screen below from vscode that shows the preview color for each of these cases, red and purple, in the text editor as boxes before the text.

![alt text]({{"assets/images/posts_images/2020-06-18-vscode/vscode-color-highlighter.png" | relative_url}})

While it has many of these abilities to help make code more readable and programmer friendly, it become widely accepted among developers due to its performance with languages such as JavaScript, CSS, and other web development essentials. Today, in addition to web development vscode is also gaining increasing popularity among data scientists due to its Pyton compatibility.

## vscode-Python

We can add the Python extension from the vscode marketplace using their extension [here](https://marketplace.visualstudio.com/items?itemName=ms-python.python). This extension allows you to select which Python interpretor, Python 2 or Python 3, you want to run based on what you have installed locally on your system. One of my favorite things though about working with Python in vscode has been the integration it provides for working with Jupyter notebooks.

### Integration with Jupyter Notebooks

As someone who was introduced into statistical programming primarily using R, I have struggled everytime I have tried to switch to working in Python because I had become so dependent on the RStudio IDE with windows to display the local environment, generate plots, etc. However, on the occasions when I have worked on projects in Python I have tried to work using Jupyter notebooks.

Jupyter was developed as a project to allow for interactive computing across different programming languages such as R, Julia, Python, and others. Jupyter notebooks are web applications that allow you to simultanously include live code in your desired language alongside markdown blocks that would allow you to write text and equations. By allowing the code to be live, anyone who was reading the notebook could instantly run the code themselves to check that they were receiving the same output or download the notebook and expand/edit the code easily wihout having to copy and paste. In addition, Jupyter notebooks automatically render[^1] within GitHub as you can see from this [notebook](https://github.com/williazo/microbiomeDASim/blob/master/inst/script/mouse_microbiome_approximation.ipynb) which I used when writing documentation for my pacakge `microbiomeDASim` to simulate longitudinal differential abundance.

While I enjoyed all of these features about Jupyter notebooks, I still had challenges transitioning to working in them full-time as I found it difficult and clunky to open notebooks from the terminal which seemed to regularly throw error messages whenever I updated Python. I was so grateful to find that once I started using vscode that it natively supported working Jupyter notebooks. For any file with extension .ipynb vscode will automatically open the Jupyter notebook editor. Below I have included a short GIF that shows the vscode interface for Jupyter notebooks. In this GIF I can click a markdown block, enter text, run Python chunks, and even view local variables.

![alt text]({{ "assets/images/posts_images/2020-06-18-vscode/vscode_pynb_ex.gif" | relative_url }})

The full Jupyter notebook used in the GIF can be downloaded [here]({{ "/assets/code/2020-06-18-vscode-intro-for-python.ipynb" | relative_url }}) for those interested in trying to play around with some of the features. Overall, I have enjoyed discovering many of the features within vscode that make programming slighlty easier, especially when working in Python.

## Additional Notes

- There are extensions for working in R with vscode. From my brief experience it works really well for handling R Markdown, i.e., files with .rmd extensions, but lacks many of the qualities that make working in RStudio seamless such as viewing the data environment and plots. I need to spend some more time playing around with writing R code using vscode-R, and I will refrain full judgement until that point. As an alternative, you can also change the language selected in the .ipynb file to support R allowing you to write Jupyter notebooks in R.
- For sharing Jupyter notebooks it can be helpful to transport the code to the [Google Collab](https://colab.research.google.com/notebooks/intro.ipynb) platform as they will allow you to run notebooks and create a simple link for other users to access the code rather than installing Jupyter and its dependencies locally.

[^1]: While the notebooks are rendered the cannot run code live when displayed within a GitHub page as they are not running using the Jupyter server.
