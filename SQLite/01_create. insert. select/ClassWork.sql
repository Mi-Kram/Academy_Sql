select au_fname, au_lname, title from titles
inner join titleauthor on titleauthor.title_id = titles.title_id
inner join authors on titleauthor.au_id = authors.au_id




