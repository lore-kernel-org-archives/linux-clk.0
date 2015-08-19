Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1439956826.26894.8.camel@mtksdaap41>
Subject: [GIT PULL] clk: mediatek: New clocks support and fixes
From: James Liao <jamesjj.liao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
CC: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Date: Wed, 19 Aug 2015 12:00:26 +0800
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

This is a collection of new Mediatek clocks support and fixes. These
patches come from Joe [1], Pi-cheng [2] and me [3], including clock
support for subsystems, CPU, GPT and some minor fixes.

[1] https://patchwork.kernel.org/patch/6777041/
[2] https://patchwork.kernel.org/patch/7023951/
[3] https://lkml.org/lkml/2015/8/10/194

----------------------------------------------------------------

The following changes since commit bc0195aad0daa2ad5b0d76cce22b167bc3435590:

  Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)

are available in the git repository at:

  https://github.com/jamesjjliao/linux.git v4.2-rc2-clk

for you to fetch changes up to f4f5326e99f951c8dfed9c3f4d027a3246cb7a8b:

  clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS (2015-05-20 15:59:21 +0800)

----------------------------------------------------------------

James Liao (8):
  clk: mediatek: Removed unused dpi_ck clock from MT8173
  clk: mediatek: Remove unused code from MT8173.
  clk: mediatek: Add __initdata and __init for data and functions
  clk: mediatek: Add fixed clocks support for Mediatek SoC.
  clk: mediatek: Fix rate and dependency of MT8173 clocks
  dt-bindings: ARM: Mediatek: Document devicetree bindings for clock
    controllers
  clk: mediatek: Add subsystem clocks of MT8173
  clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS

Joe.C (1):
  clk: mediatek: add 13mhz clock for MT8173

pi-cheng.chen (1):
  clk: mediatek: Export CPU mux clocks for CPU frequency control

 .../bindings/arm/mediatek/mediatek,imgsys.txt      |   22 ++
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |   22 ++
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   22 ++
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   |   22 ++
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |   22 ++
 drivers/clk/mediatek/Makefile                      |    2 +-
 drivers/clk/mediatek/clk-apmixed.c                 |  107 ++++++
 drivers/clk/mediatek/clk-cpumux.c                  |  127 +++++++
 drivers/clk/mediatek/clk-cpumux.h                  |   22 ++
 drivers/clk/mediatek/clk-gate.c                    |    2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |  370 +++++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.c                     |   36 +-
 drivers/clk/mediatek/clk-mtk.h                     |   24 +-
 drivers/clk/mediatek/clk-pll.c                     |    7 +-
 include/dt-bindings/clock/mt8173-clk.h             |  106 +++++-
 15 files changed, 879 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
 create mode 100644 drivers/clk/mediatek/clk-apmixed.c
 create mode 100644 drivers/clk/mediatek/clk-cpumux.c
 create mode 100644 drivers/clk/mediatek/clk-cpumux.h
