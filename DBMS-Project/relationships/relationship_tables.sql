alter table book_copy
    add FOREIGN KEY(returns_list_id) REFERENCES returns_list(id);

alter table book_copy
    add FOREIGN KEY(issues_list_id) REFERENCES issues_list(id);


create table if not exists author_book (
    author_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(book_id) REFERENCES book(id)
);
