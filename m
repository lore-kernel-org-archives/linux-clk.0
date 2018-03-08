Return-Path: <t-kristo@ti.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] TI clock changes for 4.17
Message-ID: <06cc5fe8-cecd-2b6c-415d-74f533c75be0@ti.com>
Date: Thu, 8 Mar 2018 12:13:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen, Michael,

These patches are targeted for 4.17 merge window. I grouped both 
omap+keystone clock changes into single pull request.

Tero

---

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

   https://github.com/t-kristo/linux-pm.git tags/ti-clk-for-4.17

for you to fetch changes up to 3c13933c60338ce6fb2369bd0e93f91e52ddc17d:

   clk: keystone: sci-clk: add support for dynamically probing clocks 
(2018-03-08 11:43:15 +0200)

----------------------------------------------------------------
Tero Kristo (6):
       dt-bindings: clock: ti: add latching support to mux and divider 
clocks
       clk: ti: add support for register read-modify-write low-level 
operation
       clk: ti: add generic support for clock latching
       clk: ti: add support for clock latching to divider clocks
       clk: ti: add support for clock latching to mux clocks
       clk: keystone: sci-clk: add support for dynamically probing clocks

  .../devicetree/bindings/clock/ti/divider.txt       |   3 +
  Documentation/devicetree/bindings/clock/ti/mux.txt |   3 +
  drivers/clk/keystone/sci-clk.c                     | 380 
+++++----------------
  drivers/clk/ti/clk.c                               |  38 +++
  drivers/clk/ti/clock.h                             |   4 +
  drivers/clk/ti/divider.c                           |  26 +-
  drivers/clk/ti/mux.c                               |  13 +-
  include/linux/clk/ti.h                             |   2 +
  8 files changed, 170 insertions(+), 299 deletions(-)
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
