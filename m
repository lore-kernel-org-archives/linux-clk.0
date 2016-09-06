Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.9 part 1
Date: Tue, 06 Sep 2016 17:28:28 +0200
Message-ID: <2115968.yvb8ppzjmL@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below the pull request with main Rockchip-releated clock
changes for 4.9.

The signed tag should hopefully explain the contents sufficiently,
so if nothing stands out please pull.

On the matter of critical clocks, I'm still hoping for the handover type
to materialize soonish and am hoping of doing the conversion in one go,
instead of making everything critical now and then having to go through
the list yet again.

Thanks
Heiko


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v4.9-rockchip-clk1

for you to fetch changes up to 7b0f9e357ac838f640b10fb3db1ac35d9a5fa8de:

  clk: rockchip: use the dclk_vop_frac clock ids on rk3399 (2016-09-04 23:4=
8:19 +0200)

=2D---------------------------------------------------------------
The biggest addition is probably the special clock-type for ddr clock
control. While reading that clock is done the normal way from the
registers, setting it always requires some sort of special handling
to let the system survive this addition.

As the commit message explains, there are currently 3 handling-types
known. General SRAM-based code on rk3288 and before (which is waiting
essentially for the PIE support that is currently being worked on),
SCPI-based clk setting on the rk3368 through a coprocessor, which we
might support once the support for legacy scpi-variants has matured
and now on the rk3399 (and probably later) using a dcf controller that
is controlled from the arm-trusted-firmware and gets accessed through
firmware calls from the kernel. This is the variant we currently
support, but the clock type is made to support the other variants in
the future as well.

Apart from that slightly bigger chunk, we have a mix of PLL rates,
clock-ids and flags mainly for the rk3399.

And interestingly an iomap fix for the legacy gate driver, where I
hopefully could deter the submitter from actually using that in any
new works.

=2D---------------------------------------------------------------
Arvind Yadav (1):
      clk: rockchip: handle of_iomap failures in legacy clock driver

Chris Zhong (1):
      clk: rockchip: mark rk3399 hdcp_noc and vio_noc as critical

Douglas Anderson (1):
      clk: rockchip: drop CLK_SET_RATE_PARENT from rk3399 fractional divide=
rs

Elaine Zhang (1):
      clk: rockchip: delete the CLK_IGNORE_UNUSED from aclk_pcie on rk3399

Heiko Stuebner (2):
      Merge branch 'v4.9-shared/sip-hdr' into v4.9-clk/next
      Merge branch 'v4.9-shared/clkids' into v4.9-clk/next

Heiko St=FCbner (1):
      clk: rockchip: use general clock flag when registering pll

Lin Huang (4):
      clk: rockchip: add SCLK_DDRC id for rk3399 ddrc
      soc: rockchip: add header for ddr rate SIP interface
      clk: rockchip: add new clock-type for the ddrclk
      clk: rockchip: add rk3399 ddr clock support

Shunqian Zheng (1):
      clk: rockchip: add 2016M to big cpu clk rate table on rk3399

Xing Zheng (1):
      clk: rockchip: add 65MHz and 106.5MHz rates to rk3399 plls used for H=
DMI

Yakir Yang (2):
      clk: rockchip: add dclk_vop_frac ids for rk3399 vop
      clk: rockchip: use the dclk_vop_frac clock ids on rk3399

 drivers/clk/rockchip/Makefile          |   1 +
 drivers/clk/rockchip/clk-ddr.c         | 154 +++++++++++++++++++++++++++++=
++++
 drivers/clk/rockchip/clk-pll.c         |   4 +-
 drivers/clk/rockchip/clk-rk3399.c      |  56 ++++++++----
 drivers/clk/rockchip/clk-rockchip.c    |   7 +-
 drivers/clk/rockchip/clk.c             |  11 ++-
 drivers/clk/rockchip/clk.h             |  35 +++++++-
 include/dt-bindings/clock/rk3399-cru.h |   3 +
 include/soc/rockchip/rockchip_sip.h    |  27 ++++++
 9 files changed, 278 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/rockchip/clk-ddr.c
 create mode 100644 include/soc/rockchip/rockchip_sip.h
