package com.multi.animal.sitter;

import org.springframework.stereotype.Service;

@Service
public class PageService {
	public int pages(int count) {
		int pages = 0;
		if (count % 9 == 0) {
			pages = count / 9;
		} else {
			pages = count / 9 + 1;
		}
		return pages;
	}
}
