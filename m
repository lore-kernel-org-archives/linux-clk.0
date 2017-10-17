Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.15 round 1
Date: Tue, 17 Oct 2017 19:43:31 +0200
Message-ID: <14384670.j3hM3TuojQ@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below the (tiny) first round of Rockchip clock changes for 4.15.
Right now there isn't any more in the pipeline, but who knows that may
change yet.

Please pull.
Thanks
Heiko

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.15-rockchip-clk-1

for you to fetch changes up to 47e3ec0e4dae1714cc76596e38d16913f0e574e2:

  clk: rockchip: use new cif/vdpu clock ids on rk3188 (2017-10-14 21:32:11 +0200)

----------------------------------------------------------------
Some new clock ids for rk3188 and rk3368 as well as removal of a
superfluous memory allocation error message.

----------------------------------------------------------------
Heiko Stuebner (3):
      clk: rockchip: add more rk3188 graphics clock ids
      Merge branch 'v4.15-shared/clkids' into v4.15-clk/next
      clk: rockchip: use new cif/vdpu clock ids on rk3188

Markus Elfring (1):
      clk: rockchip: Remove superfluous error message in rockchip_clk_register_cpuclk()

Romain Perier (2):
      clk: rockchip: add clock id for PCLK_EFUSE256 of RK3368 SoCs
      clk: rockchip: export clock pclk_efuse_256 for RK3368 SoCs

 drivers/clk/rockchip/clk-cpu.c                |  2 --
 drivers/clk/rockchip/clk-rk3188.c             | 12 ++++++------
 drivers/clk/rockchip/clk-rk3368.c             |  2 +-
 include/dt-bindings/clock/rk3188-cru-common.h |  9 +++++++--
 include/dt-bindings/clock/rk3368-cru.h        |  1 +
 5 files changed, 15 insertions(+), 11 deletions(-)
