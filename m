Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.7 part 2 - fixups
Date: Wed, 20 Apr 2016 10:04:09 +0200
Message-ID: <2965049.JkTOR6r5pq@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

as Stephen pointed out in the last pull-request, some unfortinuate style
errors slipped in. This pull fixes these up. In the header file as well as a
general sweep in terms of overly long lines in general code areas.


So if it looks ok, please pull.


Thanks
Heiko

The following changes since commit 115510053e5e5872f1f19a2220b04aab5542c5c4:

  clk: rockchip: add clock controller for the RK3399 (2016-03-28 14:57:07 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk2

for you to fetch changes up to 03ae1747869437a8e4d0d4e79d4c88c25c6df39c:

  clk: rockchip: fix checkpatch warning in core code (2016-04-20 09:53:39 +0200)

----------------------------------------------------------------
Fix quite some checkpatch warnings in the newly added
rk3399 header and also in the clock code itself.

----------------------------------------------------------------
Heiko Stuebner (5):
      clk: rockchip: fix checkpatch errors in rk3399 dt-binding header
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next
      clk: rockchip: reign in some overly long lines in the rk3399 controller
      clk: rockchip: drop unnecessary header comment
      clk: rockchip: fix checkpatch warning in core code

 drivers/clk/rockchip/clk-mmc-phase.c   |   3 +-
 drivers/clk/rockchip/clk-rk3399.c      | 139 +++++++++++++++++++--------------
 drivers/clk/rockchip/clk.c             |  44 ++++++-----
 drivers/clk/rockchip/clk.h             |   3 +-
 include/dt-bindings/clock/rk3399-cru.h |  24 +++---
 5 files changed, 120 insertions(+), 93 deletions(-)
