Return-Path: <linux-omap-owner@vger.kernel.org>
Message-ID: <55A6494F.7090508@ti.com>
Date: Wed, 15 Jul 2015 14:51:43 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
CC: "tony@atomide.com" <tony@atomide.com>,
	Paul Walmsley <paul@pwsan.com>, <linux-clk@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: [GIT PULL]
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-omap-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Mike,

Here is the updated pull-request based on Stephen's request. This is on 
top of 4.1-rc2. The branch is force updated version of the one Stephen 
tried yesterday, the old one contained the minor build issues present on 
v3 of the patch set.

I did a quick try of merging this branch on top of 4.2-rc2 and it works 
fine without any conflicts.

-Tero

----------------------------------------------------------------

The following changes since commit 5ebe6afaf0057ac3eaeb98defd5456894b446d22:

   Linux 4.1-rc2 (2015-05-03 19:22:23 -0700)

are available in the git repository at:

   https://github.com/t-kristo/linux-pm.git for-4.2/ti-clk-move

for you to fetch changes up to 989feafb84118a840ff21250a1e5f516f43e3dbb:

   clk: ti: move low-level access and init code under clock driver 
(2015-06-02 12:31:46 +0300)

----------------------------------------------------------------
Tero Kristo (27):
       ARM: OMAP2+: clock: export driver API to setup/get clock features
       clk: ti: move generic OMAP DPLL implementation under drivers/clk
       clk: ti: move OMAP4+ DPLL implementation under drivers/clk
       clk: ti: move interface clock implementation under drivers/clk
       ARM: OMAP3: dpll3-m2: get rid of obsolete clksel access
       ARM: OMAP2+: clk: remove obsolete clksel support code
       ARM: OMAP2+: clock: remove clock_common_data.c file
       ARM: OMAP36xx: remove clock36xx.c/.h files
       clk: ti: autoidle: move generic autoidle handling code to clock 
driver
       clk: ti: move omap2_clk_enable_init_clocks under clock driver
       ARM: OMAP2+: clock: remove support for legacy mpurate command 
line param
       ARM: OMAP2+: clock: add support for clkdm ops to the low level 
clk ops
       ARM: OMAP2+: clock: add support for specific CM ops to ti_clk_ll_ops
       clk: ti: dpll: move omap3 DPLL functionality to clock driver
       ARM: OMAP3: clock: remove clock3xxx.c file
       ARM: OMAP2+: clock: remove clkdm_control static boolean from code
       clk: ti: dflt: move support for default gate clock to clock driver
       clk: ti: omap2430: move clock support code under clock driver
       clk: ti: clkdm: move clkdm gate clock support code to clock driver
       clk: ti: omap34xx: move omap34xx clock type support code to clock 
driver
       ARM: OMAP4: clock: remove clock44xx.h header
       clk: ti: am3517: move remaining am3517 clock support code to 
clock driver
       clk: ti: move some public definitions to private header
       ARM: OMAP2+: clock: remove dead definitions from the clock header 
file
       clk: ti: remove exported ll_ops struct, instead add an API for 
registration
       ARM: OMAP2+: clock: remove legacy omap2_clk_readl/writel APIs
       clk: ti: move low-level access and init code under clock driver

  arch/arm/mach-omap2/Makefile                       |   22 +-
  arch/arm/mach-omap2/clkt34xx_dpll3m2.c             |    7 +-
  arch/arm/mach-omap2/clkt_clksel.c                  |  466 --------------
  arch/arm/mach-omap2/clkt_iclk.c                    |   68 --
  arch/arm/mach-omap2/clock.c                        |  675 
+-------------------
  arch/arm/mach-omap2/clock.h                        |  205 +-----
  arch/arm/mach-omap2/clock2430.c                    |   57 --
  arch/arm/mach-omap2/clock2xxx.c                    |   57 --
  arch/arm/mach-omap2/clock34xx.c                    |  138 ----
  arch/arm/mach-omap2/clock34xx.h                    |   18 -
  arch/arm/mach-omap2/clock3517.c                    |  118 ----
  arch/arm/mach-omap2/clock3517.h                    |   14 -
  arch/arm/mach-omap2/clock36xx.c                    |   69 --
  arch/arm/mach-omap2/clock36xx.h                    |   13 -
  arch/arm/mach-omap2/clock3xxx.c                    |  135 ----
  arch/arm/mach-omap2/clock44xx.h                    |   20 -
  arch/arm/mach-omap2/clock_common_data.c            |  115 ----
  arch/arm/mach-omap2/io.c                           |    3 +-
  drivers/clk/ti/Makefile                            |   17 +-
  drivers/clk/ti/apll.c                              |    2 +
  drivers/clk/ti/autoidle.c                          |  121 +++-
  drivers/clk/ti/clk-2xxx.c                          |    2 +
  drivers/clk/ti/clk-33xx.c                          |    2 +
  drivers/clk/ti/clk-3xxx.c                          |  244 +++++++
  drivers/clk/ti/clk-43xx.c                          |    2 +
  drivers/clk/ti/clk-44xx.c                          |    2 +
  drivers/clk/ti/clk-54xx.c                          |    2 +
  drivers/clk/ti/clk-7xx.c                           |    3 +-
  drivers/clk/ti/clk-816x.c                          |    2 +
  drivers/clk/ti/clk.c                               |  145 ++++-
  drivers/clk/ti/clkt_dflt.c                         |  316 +++++++++
  .../arm/mach-omap2 => drivers/clk/ti}/clkt_dpll.c  |   27 +-
  drivers/clk/ti/clkt_iclk.c                         |  101 +++
  drivers/clk/ti/clock.h                             |  113 ++++
  drivers/clk/ti/clockdomain.c                       |   78 +++
  {arch/arm/mach-omap2 => drivers/clk/ti}/dpll3xxx.c |  157 ++---
  {arch/arm/mach-omap2 => drivers/clk/ti}/dpll44xx.c |   23 +-
  drivers/clk/ti/fixed-factor.c                      |    2 +
  include/linux/clk/ti.h                             |  157 ++---
  39 files changed, 1328 insertions(+), 2390 deletions(-)
  delete mode 100644 arch/arm/mach-omap2/clkt_clksel.c
  delete mode 100644 arch/arm/mach-omap2/clkt_iclk.c
  delete mode 100644 arch/arm/mach-omap2/clock2430.c
  delete mode 100644 arch/arm/mach-omap2/clock2xxx.c
  delete mode 100644 arch/arm/mach-omap2/clock34xx.c
  delete mode 100644 arch/arm/mach-omap2/clock34xx.h
  delete mode 100644 arch/arm/mach-omap2/clock3517.c
  delete mode 100644 arch/arm/mach-omap2/clock3517.h
  delete mode 100644 arch/arm/mach-omap2/clock36xx.c
  delete mode 100644 arch/arm/mach-omap2/clock36xx.h
  delete mode 100644 arch/arm/mach-omap2/clock3xxx.c
  delete mode 100644 arch/arm/mach-omap2/clock44xx.h
  delete mode 100644 arch/arm/mach-omap2/clock_common_data.c
  create mode 100644 drivers/clk/ti/clkt_dflt.c
  rename {arch/arm/mach-omap2 => drivers/clk/ti}/clkt_dpll.c (94%)
  create mode 100644 drivers/clk/ti/clkt_iclk.c
  rename {arch/arm/mach-omap2 => drivers/clk/ti}/dpll3xxx.c (84%)
  rename {arch/arm/mach-omap2 => drivers/clk/ti}/dpll44xx.c (91%)
