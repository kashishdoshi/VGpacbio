<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# repository-template

[![Project Image][project-image]](https://bccrc.ca)

## Table of Contents

<!-- TABLE OF CONTENTS -->
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#requirements">Requirements</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#examples">Examples</a></li>
    <li><a href="#documentation">Documentation</a></li>
    <li>
      <a href="#developers">Developers</a>
      <ul>
        <li><a href="#contributing">Contributing</a></li>
        <li><a href="#installation-1">Installation</a></li>
        <li><a href="#testing">Testing</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments-and-citations">Acknowledgments and Citations</a></li>
  </ol>

## About the Project

This repository contains the scripts used to analyse the long-read RNA sequencing generated using PacBio sequencing. 

### Built With

This section should list any major frameworks/libraries used to create your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

* [![Python][Python-shield]][Python-url]
* [![R][R-shield]][R-url]
* [![TypeScript][TypeScript-shield]][TypeScript-url]
* [![React][React.js]][React-url]
* [![Bootstrap][Bootstrap-shield]][Bootstrap-url]

## Getting Started

### Requirements

List here any requirements for installation. For example, if your package doesn't support Windows,
you should mention that here.

### Installation

These scripts depends on [flair](https://flair.readthedocs.io/en/latest/) and assumes that it has been installed in the environment. 

If you have flair installed within a conda environment, make sure to run the scripts from within the environment. 

#### Linux
The recommended way to install flair is to use conda. Below is the script that can be used to install flair.
`
conda create -n flair -c conda-forge -c bioconda flair
conda activate flair
`

## Usage

Describe how to use your package.

## Examples

Give some examples on how to use your code. If you are analyzing data, some plots could be useful here.

## Documentation

If your package has a documentation site, link to it here.

## Developers

This section is for developers who would like to work on this package.

### Contributing

If you want to have other contributors on your project, in this section you can describe how they can do so.

### Installation

If the installation is different for developers (for example, developers using Python packages will want to install an
editable version), include the details here.

### Testing

Describe how to run tests.

## License

License details.

## Contact

Your Name - your_email@example.com

## Acknowledgments and Citations

1. [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
2. Citation #2


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[project-image]: images/bccrc-website.png
[Python-shield]: https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54
[Python-url]: https://www.python.org/
[R-shield]: https://img.shields.io/badge/R-2266b8?style=for-the-badge&logo=r&logoColor=white
[R-url]: https://www.r-project.org/
[TypeScript-shield]: https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white
[TypeScript-url]: https://www.typescriptlang.org/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Bootstrap-shield]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com

