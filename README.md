# 🖥️ Fancy Desktop

> One command to make your GNOME desktop look the way it should.

Fancy Desktop applies my personal GNOME customisations — theme, keybindings, and extensions — all in a single script. No manual tweaking, no forgetting what settings I changed. Just clone and run.

---

## ⚙️ Requirements

Make sure the following are available on your system before running:

- **OS:** Debian-based distro only (Ubuntu, Pop!_OS, etc.)
- `dconf`
- `gnome-extensions`
- A working GNOME desktop session

---

## 🚀 Installation

```bash
git clone https://github.com/laxmikantm05/fancy-desktop.git ~
cd ~/fancy-desktop
bash install.sh
```

That's it. The script handles the rest.

---

## 📦 What It Does

- Applies a custom **GNOME theme**
- Sets personal **keybindings** via `dconf`
- Enables preferred **GNOME extensions**

---

## 🙏 Acknowledgements

- [GNOME](https://www.gnome.org/) — for the extensible desktop that makes this possible
- [dconf](https://wiki.gnome.org/Projects/dconf) — for storing and restoring settings cleanly
- [GNOME Extensions](https://extensions.gnome.org/) — for the ecosystem of shell customisations

---

## 📄 License

Personal use only. Not intended for redistribution.
