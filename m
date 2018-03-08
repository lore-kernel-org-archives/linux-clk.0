Return-Path: <t-kristo@ti.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
From: Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] TI clock fixes for 4.16
Message-ID: <7b11c937-8738-9098-96d1-d6675e0efab2@ti.com>
Date: Thu, 8 Mar 2018 12:19:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Michael,

Here are a couple of TI clock fixes against 4.16. These fix some display 
issues on am33xx devices.

-Tero

---

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

   https://github.com/t-kristo/linux-pm.git tags/ti-clk-fixes-4.16

for you to fetch changes up to 762790b75210f5219c6896565f811271405a9632:

   clk: ti: am43xx: add set-rate-parent support for display clkctrl 
clock (2018-03-08 12:14:44 +0200)

----------------------------------------------------------------
TI SoC clock fixes for 4.16.

----------------------------------------------------------------
Tero Kristo (3):
       clk: ti: clkctrl: add support for CLK_SET_RATE_PARENT flag
       clk: ti: am33xx: add set-rate-parent support for display clkctrl 
clock
       clk: ti: am43xx: add set-rate-parent support for display clkctrl 
clock

  drivers/clk/ti/clk-33xx.c | 2 +-
  drivers/clk/ti/clk-43xx.c | 2 +-
  drivers/clk/ti/clkctrl.c  | 2 ++
  3 files changed, 4 insertions(+), 2 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
