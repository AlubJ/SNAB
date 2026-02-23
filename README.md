<h1 align="center">SNAB v1.0</h1>

<p align="center">A binary format for serializing and deserializing struct and array data by <a href="https://alub.dev/" target="_blank">Alun Jones</a> and <a href="https://chosenfewsoftware.com">Isabelle Santin</a> and based on <a href="https://github.com/JujuAdams/SNAP">SNAP Custom Binary</a> by <a href="https://jujuadams.com">Juju Adams</a>.</p>

<!---------------------------------[ Buttons ]---------------------------------->

<div align = center>

[![Badge License]][License]   [![Badge Download]][Download]   [![Badge Documentation]][Documentation]   ![Badge Tests]

</div>

<!---------------------------------------------------------------------------->

[License]: License
[Download]: https://github.com/AlubJ/bufkit/release/latest
[Documentation]: https://docs.alub.dev/bufkit


<!---------------------------------[ Badges ]---------------------------------->

[Badge License]: https://img.shields.io/badge/License-MIT-blue
[Badge Download]: https://img.shields.io/badge/Download-Latest-red
[Badge Documentation]: https://img.shields.io/badge/Read%20the-Docs-purple
[Badge Tests]: https://img.shields.io/badge/Tests-Passing-green

<!---------------------------------[ Content ]---------------------------------->

---

SNAB (Struct n' Array Binary) is a specification which describes how nested struct and array based data is stored in a binary based file format. It is based on work by Juju Adams and takes inspiration from Binary-JSON. The aim of the format is to have cross-compatible data sharing between languages whilst keeping the data-footprint as small as possible.