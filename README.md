# create-wordpress-fse-block-theme
Simple bash script to create a WordPress full site editor Block Theme structure.

To use this, simply place the `create.sh` file in the root folder of you WordPress installation.

Then from a terminal `cd` into your WordPress root folder

*run*
`sh create.sh`

Follow the prompts in the terminal.

A theme folder with the following structure will be created with all the relevant naming and content in the `style.css` and the `theme.json` file will be created:

```
/yourthemename
|-- /templates
|-- |-- index.html
|-- /parts
|-- |-- header.html
|-- |-- footer.html
|-- style.css
|-- theme.json
```
