# Learn business automation

Access the labs currently at: https://timwuthenow.github.io will be coming to IBM Open Source community soon!

---

## Contributing to this project

The training labs are displayed using mkdocs so they can be easily published to GitHub pages.

Environment setup to deploy locally:

~~~bin/bash
  pip install mkdocs
  pip install mkdocs-material
  pip install mkdocs-awesome-pages-plugin
  pip install mkdocs-enumerate-headings-plugin
  pip install mkdocs-markdownextradata-plugin
  pip install mkdocs-git-revision-date-localized-plugin
~~~

Development:

After cloning this repo and during development check the changes. It will start the live-reloading docs server.

~~~bash
mkdocs serve
~~~

Publish:

~~~bin
mkdocs gh-deploy --force
~~~
