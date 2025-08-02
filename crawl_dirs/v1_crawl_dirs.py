#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
import sys

# Disable SSL warnings
requests.packages.urllib3.disable_warnings()

visited = set()
to_visit = []

def crawl(url, base):
    try:
        r = requests.get(url, verify=False, timeout=10)
    except Exception as e:
        print(f"[!] Error visiting {url}: {e}")
        return

    if r.status_code != 200:
        return

    soup = BeautifulSoup(r.text, "html.parser")
    links = []

    for a in soup.find_all("a", href=True):
        href = a['href']
        # Ignore parent directory links
        if href in ["../", "/"]:
            continue

        # Build absolute URL
        new_url = urljoin(url, href)
        # Stay in the same host
        if urlparse(new_url).netloc == urlparse(base).netloc:
            links.append(new_url)

    for link in links:
        if link not in visited:
            visited.add(link)
            print(link)
            # If it's a directory (ends with "/"), crawl further
            if link.endswith("/"):
                to_visit.append(link)

def main(start_url):
    to_visit.append(start_url)
    visited.add(start_url)
    print(start_url)

    while to_visit:
        current = to_visit.pop(0)
        crawl(current, start_url)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 crawl_dirs.py <start_url>")
        sys.exit(1)

    main(sys.argv[1])
