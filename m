Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] first bunch of rockchip clock changes for 4.6
Date: Thu, 11 Feb 2016 14:00:02 +0100
Message-ID: <3862076.Cf1OAGsbuq@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

no new clock trees this time, but more clock ids and fixes for issues
present for a longer time (not introduced during the 4.5-rc1 merge wind=
ow)
that Stephen thought should go through the regular process.

Most "interesting" change might be that we now handle factors correctly=

according to their position in the clock-tree instead of registering th=
em
individually during init - which became a clutch.

So if nothing stands out, please pull


Thanks
Heiko

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04=
f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v4.6-rockchip-clk1

for you to fetch changes up to 36714529f8bbd4f8eaf93b50f4a64c52a24879aa=
:

  clk: rockchip: convert manually created factor clocks to the new type=
 (2016-02-04 15:54:20 +0100)

----------------------------------------------------------------
Introduction of a factor type and a variant containing a gate
to be able to also declare factor clocks in their correct
place in the clock tree instead of having to register factor
clocks in the init callback separately. And as always some more
clock-ids and non-regression fixes for mistakes introduced in
past kernel releases.

----------------------------------------------------------------
Alexander Kochetkov (2):
      clk: rockchip: add hclk_cpubus to the list of rk3188 critical clo=
cks
      clk: rockchip: Allow sclk_i2s0 and i2s0_frac to change their pare=
nts rate on rk3188

Heiko Stuebner (9):
      clk: rockchip: rk3368: fix cpuclk mux bit of big cpu-cluster
      clk: rockchip: rk3368: fix cpuclk core dividers
      clk: rockchip: rk3368: fix parents of video encoder/decoder
      clk: rockchip: rk3368: fix hdmi_cec gate-register
      clk: rockchip: fix usbphy-related clocks
      Merge branch 'v4.6-shared/clkids' into v4.6-clk/next
      clk: rockchip: fix parent of hclk_vcodec on rk3036
      clk: rockchip: add a factor clock type
      clk: rockchip: convert manually created factor clocks to the new =
type

Pawe=C5=82 Jarosz (2):
      clk: rockchip: Add new id for rk3066 tsadc clock
      clk: rockchip: add tsadc clock on rk3066

Shawn Lin (2):
      clk: rockchip: fix wrong mmc phase shift for rk3228
      clk: rockchip: free memory in error cases when registering clock =
branches

Yakir Yang (1):
      clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for hclk=
_vio_bus

zhangqing (3):
      clk: rockchip: rk3368: fix edp_24m parent
      clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for sp=
dif_8ch
      clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for i2=
s_2ch

 arch/arm/boot/dts/rk3288-veyron.dtsi          |  2 +-
 drivers/clk/rockchip/clk-rk3036.c             | 33 +++--------
 drivers/clk/rockchip/clk-rk3188.c             | 27 +++------
 drivers/clk/rockchip/clk-rk3228.c             | 38 +++----------
 drivers/clk/rockchip/clk-rk3288.c             | 38 ++++---------
 drivers/clk/rockchip/clk-rk3368.c             | 82 +++++++++++--------=
--------
 drivers/clk/rockchip/clk.c                    | 64 +++++++++++++++++++=
+-
 drivers/clk/rockchip/clk.h                    | 28 +++++++++
 include/dt-bindings/clock/rk3188-cru-common.h |  1 +
 9 files changed, 159 insertions(+), 154 deletions(-)
