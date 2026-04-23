# 🚀 NV_FPSBOOSTER - Premium Performance Optimizer

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![License](https://img.shields.io/badge/license-Proprietary-red.svg)
![FiveM](https://img.shields.io/badge/FiveM-Recommended-orange.svg)

**NV_FPSBOOSTER** is a high-performance, visually premium optimization tool for FiveM servers. Designed with a sleek "Cyberpunk Glass" aesthetic, it allows players to fine-tune their game performance on the fly with a modern NUI interface.

---

## ✨ Features

- 💎 **Cyberpunk Glass UI**: A beautiful, responsive interface that matches premium server aesthetics.
- 📊 **Dynamic Optimization Levels**:
  - **Off**: Standard game settings.
  - **Lite**: Basic shadow and siren optimizations.
  - **Medium**: Disables advanced shadows and lighting tweaks.
  - **High**: aggressive LOD scaling and widget optimization.
  - **Ultra**: Maximum performance with low LOD scaling and occlusion disabling.
- ⚡ **Special NV Boost**: Applies cinematic filters to smooth out visual stuttering.
- 🧹 **Memory Cleaner**: Instant Lua garbage collection to free up system cache.
- 🌃 **Night Performance**: Toggle city lights for an extra FPS boost during nighttime.
- 🔔 **Integrated Notifications**: Seamlessly works with `ox_lib`.

---

## 🛠️ Installation

1. **Download** the resource.
2. **Extract** the `nv_fpsbooster` folder into your server's `resources` directory (preferably under a `[nv]` or `[scripts]` category).
3. **Ensure Dependencies**:
   - Make sure you have [ox_lib](https://github.com/overextended/ox_lib) installed and started.
4. **Add to Server Config**:
   Add the following line to your `server.cfg`:
   ```cfg
   ensure nv_fpsbooster
   ```
5. **Restart** your server or start the resource in-game.

---

## 🎮 Usage

Simply type the following command in the in-game chat:
```bash
/fps
```
The menu will appear, allowing you to select your preferred optimization level and toggle extra features.

---

## 📂 Project Structure

```text
nv_fpsbooster/
├── client/
│   └── main.lua      # Core logic and optimization engine
├── html/
│   ├── assets/       # UI Images and Icons
│   ├── css/          # Premium Styling
│   ├── js/           # UI Logic
│   └── index.html    # NUI Interface
└── fxmanifest.lua    # Resource Manifest
```

---

## 📜 License

© 2026 **NVCore**. All rights reserved.
This script is provided as a free resource but is **not** open source. Unauthorized redistribution or modification is prohibited.

---

## 🤝 Support

Join our community for updates and support:
[Discord Link / Website Link Here]
