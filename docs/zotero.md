# Zotero

The following sections provide information about how to install Zotero and export your library with Better BibTeX.

## [Zotero](#Table-of-Contents)

Zotero is an open-source reference management software that allows you to save bibliography data, PDFs, notes, or other files.
Rather than ending up with an dizzying array of folders on your hard drive (or desktop!) crammed with documents, Zotero lets you easily create and destroy project folders without creating multiple versions of each paper (unless you want that).
Additionally, Zotero will download and organize the associated PDF with the reference, all with the click of a single button in your web browser.
That way, building your reference database is the passive result of sorting through papers that interest you online.
Most importantly, this software allows you to generate bibliographies from any selected project folders or files.

Download and install [Zotero](https://www.zotero.org/) together with a plugin/extension for your preferred browser.

Now run a simple test, finding a paper you would like to download from a journal website.
If you use a VPN provided by your research institution, make sure that it is turned on.
If you use an AdBlocker, make sure that it is not blocking pop-ups for the journal’s website.
Before downloading the paper as you normally would, notice the small Zotero icon in the top-right of your browser.
If Zotero has located a single paper, the icon will look like a paper.
If Zotero has located multiple papers, the icon will look like a folder.
Click the icon and, if need be, select the desired paper.
If all goes as it should, a small banner will pop up in the upper right-hand side of the screen that indicates that it has scraped the bibliographic data and downloaded the PDF, giving you the option to file the paper in a project folder if you desire.
Alternatively, if you open a project folder in Zotero by clicking on it on the left side of Zotero, then any papers you download will be automatically filed in that project folder.

Now switch from your browser to Zotero and check to see if the bibliographic data has been stored along with the PDF.
If it did not work, or it did not grab the PDF with the bibliographic data, make sure that you are logged into the journal website and repeat.
You can also always add the file manually by right-clicking the paper in question in Zotero.
Some of the journal websites work better than others.
For books, Amazon is a good resource for scraping bibliographic data, though no PDF will be downloaded.

## Better BibTeX

In order to integrate Zotero and LaTeX, download and install Better BibTex by following these [instructions](https://retorque.re/zotero-better-bibtex/installation/), restarting Zotero after the installation finishes.

Under `Edit` in the Zotero menu bar, select `Preferences` and open up the `Better BibTex` tab.
Under the `Citation` sub-tab, replace the citation key format with `auth + year`.

> **Note:** This is just the look up key, not the citation style included in your bibliography.
> There are a lot of options for citation key styles [here](https://retorque.re/zotero-better-bibtex/citing/), but it is good to keep the keys relatively simple.

Also check `On item change` at the bottom left.
Now switch to the `Automatic Export` sub-tab and check `On Change`.
This means that the instant you update your database with a new bib entry, or edit an old bib entry, Zotero will update the .bib files where your database is exported.
If your library is extremely large, this could be slow, and so you might want to select the 'When Idle' option (this is not typically a problem even for large bibliographies).

Close the `Preferences` window, returning to the main Zotero window.
Right-click the main library folder in the left-most column, select `Export Library` (alternatively you can export other project folders).
Under the `Format` drop-down menu, select `Better BibTex`.
Then check the `Keep Updated` box.
Save the file as `Zotero` (the extension will be added automatically) in the `texmf -> bibtex -> bib` directory that you [previously](#LaTeX) created.

You can now run a test to see if everything is working.
Open VSCodium, create a new file, and copy this [template](https://github.com/benbrastmckie/VSCodium/blob/master/templates/PhilPaper.tex) into the file.
Save and click the "Play" button on the top right corner, as well as the "View LaTeX PDF" just beside it to view the PDF (assuming it generated successfully).

> **Note:** Occasionally, it can help to refresh the auxiliary files if the PDF is not generating properly.
> You can do this by opening the `TeX` tab on the left, clicking `Commands -> Build LaTeX project -> Clean up auxiliary files`.

Once your file typesets, open Zotero and click on one of the files in your library, looking for the `Citation Key` in the details on the right.
If no key is present or if the key data is not of the form `[auth][year]`, you can right-click the file in your library and select `Generate BibTex Key`.
Once you have the citation key, you can cite this paper by writing ‘\citet{CITEKEY}’ in the tex file that you are creating (this must go in the body of the document).

> **Note:** To list multiple sources by the same, or different authors, separate the cite keys with a comma.
> For other citation styles, refer to the preamble of the [PhilPaper](https://github.com/benbrastmckie/VSCodium/blob/master/templates/PhilPaper.tex) template for further commands, e.g., ‘\citepos’ for possessive.

Upon saving, the citation should be automatically generated and added to the references.

If you have any trouble, make sure that the `Zotero.bib` file has been correctly stored in the `textmf -> bibtex -> bib` directory as explained above (you might open this file to make sure it contains the right contents).
You should also confirm that `Phil_Review` is stored in `textmf -> bibtex -> bst`. 
Additionally, you can open the log by opening the `TeX` tab on the left, clicking `Commands -> View Log messages -> View LaTeX compiler log`.
If you can't make out what the log is telling you, cut and paste any warnings or error messages into ChatGPT, asking it to interpret the messages for you.
