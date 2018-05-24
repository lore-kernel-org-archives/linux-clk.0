Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.18
Date: Thu, 24 May 2018 15:16:06 +0200
Message-ID: <6125058.CyqeWxRe4B@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below the pull request for 4.18 Rockchip clock updates.
As the tag describes this contains two cleanups for an open-coded
search and removing the old dt-based gate-clocks.

Please pull
Heiko


The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.18-rockchip-clk-1

for you to fetch changes up to 1d646229f28d2c413572905f03f71af33b903cc5:

  clk: rockchip: remove deprecated gate-clk code and dt-binding (2018-05-23 13:19:06 +0200)

----------------------------------------------------------------
Conversion to match_string helper of open-coded string comparison
and removal of the initial devicetree-based gate-clocks, which were
deprecated since 2014.

----------------------------------------------------------------
Heiko Stuebner (1):
      clk: rockchip: remove deprecated gate-clk code and dt-binding

Yisheng Xie (1):
      clk: rockchip: use match_string() helper

 .../devicetree/bindings/clock/rockchip.txt         | 77 -----------------
 drivers/clk/rockchip/Makefile                      |  1 -
 drivers/clk/rockchip/clk-rockchip.c                | 98 ----------------------
 drivers/clk/rockchip/clk.c                         | 16 ++--
 4 files changed, 5 insertions(+), 187 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip.txt
 delete mode 100644 drivers/clk/rockchip/clk-rockchip.c
