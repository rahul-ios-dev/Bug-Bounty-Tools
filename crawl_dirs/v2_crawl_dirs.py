#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
import sys

requests.packages.urllib3.disable_warnings()

visited = set()
to_visit = []

output_file = open("urls.txt", "w")

def save_url(url):
    print(url)
    output_file.write(url + "\n")
    output_file.flush()

def normalize_url(u):
    """Ensure directory URLs always end with '/'"""
    if not u.lower().endswith(".php") and not u.lower().endswith(".txt") and not '.' in u.split('/')[-1]:
        if not u.endswith('/'):
            u += '/'
    return u

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
        if href in ["../", "/"]:
            continue

        new_url = normalize_url(urljoin(url, href))
        if urlparse(new_url).netloc == urlparse(base).netloc:
            links.append(new_url)

    for link in links:
        if link not in visited:
            visited.add(link)
            save_url(link)
            if link.endswith("/"):
                to_visit.append(link)

def main(start_url):
    normalized = normalize_url(start_url)
    to_visit.append(normalized)
    visited.add(normalized)
    save_url(normalized)

    while to_visit:
        current = to_visit.pop(0)
        crawl(current, start_url)

    output_file.close()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 crawl_dirs.py <start_url>")
        sys.exit(1)

    main(sys.argv[1])


## version 2.0
# #!/usr/bin/env python3
# import requests
# from bs4 import BeautifulSoup
# from urllib.parse import urljoin, urlparse
# import sys

# # Disable SSL warnings
# requests.packages.urllib3.disable_warnings()

# visited = set()
# to_visit = []

# # Open file for writing output
# output_file = open("urls.txt", "w")

# def save_url(url):
#     print(url)
#     output_file.write(url + "\n")
#     output_file.flush()

# def crawl(url, base):
#     try:
#         r = requests.get(url, verify=False, timeout=10)
#     except Exception as e:
#         print(f"[!] Error visiting {url}: {e}")
#         return

#     if r.status_code != 200:
#         return

#     soup = BeautifulSoup(r.text, "html.parser")
#     links = []

#     for a in soup.find_all("a", href=True):
#         href = a['href']
#         # Ignore parent directory links
#         if href in ["../", "/"]:
#             continue

#         # Build absolute URL
#         new_url = urljoin(url, href)
#         # Stay in the same host
#         if urlparse(new_url).netloc == urlparse(base).netloc:
#             links.append(new_url)

#     for link in links:
#         if link not in visited:
#             visited.add(link)
#             save_url(link)
#             # If it's a directory (ends with "/"), crawl further
#             if link.endswith("/"):
#                 to_visit.append(link)

# def main(start_url):
#     to_visit.append(start_url)
#     visited.add(start_url)
#     save_url(start_url)

#     while to_visit:
#         current = to_visit.pop(0)
#         crawl(current, start_url)

#     output_file.close()

# if __name__ == "__main__":
#     if len(sys.argv) != 2:
#         print("Usage: python3 crawl_dirs.py <start_url>")
#         sys.exit(1)

#     main(sys.argv[1])


# version 1.0
# #!/usr/bin/env python3
# import requests
# from bs4 import BeautifulSoup
# from urllib.parse import urljoin, urlparse
# import sys

# # Disable SSL warnings
# requests.packages.urllib3.disable_warnings()

# visited = set()
# to_visit = []

# def crawl(url, base):
#     try:
#         r = requests.get(url, verify=False, timeout=10)
#     except Exception as e:
#         print(f"[!] Error visiting {url}: {e}")
#         return

#     if r.status_code != 200:
#         return

#     soup = BeautifulSoup(r.text, "html.parser")
#     links = []

#     for a in soup.find_all("a", href=True):
#         href = a['href']
#         # Ignore parent directory links
#         if href in ["../", "/"]:
#             continue

#         # Build absolute URL
#         new_url = urljoin(url, href)
#         # Stay in the same host
#         if urlparse(new_url).netloc == urlparse(base).netloc:
#             links.append(new_url)

#     for link in links:
#         if link not in visited:
#             visited.add(link)
#             print(link)
#             # If it's a directory (ends with "/"), crawl further
#             if link.endswith("/"):
#                 to_visit.append(link)

# def main(start_url):
#     to_visit.append(start_url)
#     visited.add(start_url)
#     print(start_url)

#     while to_visit:
#         current = to_visit.pop(0)
#         crawl(current, start_url)

# if __name__ == "__main__":
#     if len(sys.argv) != 2:
#         print("Usage: python3 crawl_dirs.py <start_url>")
#         sys.exit(1)

#     main(sys.argv[1])
