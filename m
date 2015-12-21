Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL v2] rockchip clock changes for 4.5
Date: Mon, 21 Dec 2015 02:15:57 +0100
Message-ID: <2321556.9PKkgq9foB@diego>
In-Reply-To: <3167734.Jiqp72JFJP@diego>
References: <3167734.Jiqp72JFJP@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

the original pull request seems to have fallen through the cracks, probably
due to christmas/travels. So this new v2 _supersedes the original one
and includes changes that happened during the last 3 weeks.

So please pull

Thanks
Heiko


The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.5-rockchip-clk1_1

for you to fetch changes up to dfff24bde7fb8d57482e907d5dfb0be3a9e28119:

  clk: rockchip: only enter pll slow-mode directly before reboots on rk3288 (2015-12-21 02:01:19 +0100)

----------------------------------------------------------------
Rockchip clock changes for 4.5 containing
- a new pll-type used on rk3036 and other Cortex-A7 socs
- new clock-trees for rk3036 and rk3228
- switch rk3288 plls to slow mode on reboot
- a bunch of new clock ids
- some more critical clocks
- wrong register offsets for the rk3368 cpuclks
- allowing more than 2 parents for the cpuclk

----------------------------------------------------------------
Caesar Wang (1):
      clk: rockchip: Force rk3368 PWM clock (and its parents) on

Chris Zhong (3):
      clk: rockchip: add id for mipidsi sclk on rk3288
      clk: rockchip: add mipidsi clock on rk3288
      clk: rockchip: switch PLLs to slow mode before reboot for rk3288

Heiko Stuebner (5):
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      clk: rockchip: fix rk3368 cpuclk divider offsets
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      clk: rockchip: only enter pll slow-mode directly before reboots on rk3288

Jeffy Chen (4):
      clk: rockchip: allow more than 2 parents for cpuclk
      clk: rockchip: add dt-binding header for rk3228
      dt-bindings: add documentation of rk3228 clock controller
      clk: rockchip: add clock controller for rk3228

Jianqun xu (1):
      clk: rockchip: protect rk3368 aclk_bus and aclk_peri clocks

Xing Zheng (4):
      clk: rockchip: add dt-binding header for rk3036
      dt-bindings: add documentation of rk3036 clock controller
      clk: rockchip: add new pll-type for rk3036 and similar socs
      clk: rockchip: add clock controller for rk3036

Yakir Yang (1):
      clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for aclk_vio

Zain Wang (2):
      clk: rockchip: add an id for rk3288 crypto clk
      clk: rockchip: set the id for crypto clk

ZhengShunQian (2):
      clk: rockchip: Add the clock ids of rk3288 eFuses
      clk: rockchip: use rk3288-efuse clock ids

 .../bindings/clock/rockchip,rk3036-cru.txt         |  56 ++
 .../bindings/clock/rockchip,rk3228-cru.txt         |  58 ++
 drivers/clk/rockchip/Makefile                      |   2 +
 drivers/clk/rockchip/clk-cpu.c                     |   4 +-
 drivers/clk/rockchip/clk-pll.c                     | 258 +++++++-
 drivers/clk/rockchip/clk-rk3036.c                  | 478 +++++++++++++++
 drivers/clk/rockchip/clk-rk3188.c                  |   2 +-
 drivers/clk/rockchip/clk-rk3228.c                  | 678 +++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3288.c                  |  42 +-
 drivers/clk/rockchip/clk-rk3368.c                  |  13 +-
 drivers/clk/rockchip/clk.c                         |   7 +-
 drivers/clk/rockchip/clk.h                         |  43 +-
 include/dt-bindings/clock/rk3036-cru.h             | 193 ++++++
 include/dt-bindings/clock/rk3228-cru.h             | 220 +++++++
 include/dt-bindings/clock/rk3288-cru.h             |   4 +
 15 files changed, 2025 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3036.c
 create mode 100644 drivers/clk/rockchip/clk-rk3228.c
 create mode 100644 include/dt-bindings/clock/rk3036-cru.h
 create mode 100644 include/dt-bindings/clock/rk3228-cru.h
