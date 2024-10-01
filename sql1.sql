alter table board
add CONSTRAINT bidx_midx_fk FOREIGN KEY(midx) REFERENCES MEMBER(midx);