Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1443678253.1714.2.camel@mtksdaap41>
Subject: [GIT PULL] clk: mediatek: New clocks support and fixes
From: James Liao <jamesjj.liao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
CC: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Pi-Cheng Chen
	<pi-cheng.chen@linaro.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Date: Thu, 1 Oct 2015 13:44:13 +0800
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

This is a collection of new Mediatek clocks support and fixes. These
patches come from Joe [1] and me [2], including clock
support for subsystems, GPT and some minor fixes.

[1] https://patchwork.kernel.org/patch/6777041/
[2] https://lkml.org/lkml/2015/8/10/194

----------------------------------------------------------------

The following changes since commit 9ffecb10283508260936b96022d4ee43a7798b4c:

  Linux 4.3-rc3 (2015-09-27 07:50:08 -0400)

are available in the git repository at:

  https://github.com/jamesjjliao/linux.git v4.3-rc3-clk

for you to fetch changes up to cdb2bab78aff97101da767b9643fbd692af4623b:

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

 .../bindings/arm/mediatek/mediatek,imgsys.txt      |   22 ++
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |   22 ++
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   22 ++
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   |   22 ++
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |   22 ++
 drivers/clk/mediatek/Makefile                      |    2 +-
 drivers/clk/mediatek/clk-apmixed.c                 |  107 ++++++
 drivers/clk/mediatek/clk-gate.c                    |    2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |  347 +++++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.c                     |   36 +-
 drivers/clk/mediatek/clk-mtk.h                     |   24 +-
 drivers/clk/mediatek/clk-pll.c                     |    7 +-
 include/dt-bindings/clock/mt8173-clk.h             |  104 +++++-
 13 files changed, 705 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
 create mode 100644 drivers/clk/mediatek/clk-apmixed.c
