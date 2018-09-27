Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v4.20
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk
	 <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>
Date: Thu, 27 Sep 2018 16:45:02 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.
There is not much out of the ordinary there, except:
- Even if we don't like it, the entire meson8b is now using
  CLK_OF_DECLARE_DRIVER(). Previously, only the reset controller
  part used this but it seems there is no way around it (yet) to
  handle certain things on this SoC, such as the TWD timer.
- We are a bit late compared to the usual schedule, sorry about that.

Thanks for pulling

Cheers
Jerome

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.20-1

for you to fetch changes up to 93c873d686461652921fe18b137ac28002dfe166:

  clk: meson: meson8b: use the regmap in the internal reset controller (2018-09-26 12:02:00 +0200)

----------------------------------------------------------------
Update for meson clocks targeted at v4.20

- clk-pll driver improvements and updates
- add axg audio controller system clocks
- drop mpll3 from the possible pcie clock parent of the axg
- register meson8b clock controller early

----------------------------------------------------------------
Jerome Brunet (5):
      clk: meson: clk-pll: add enable bit
      clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
      clk: meson: clk-pll: remove od parameters
      clk: meson: clk-pll: drop hard-coded rates from pll tables
      clk: meson: axg: round audio system master clocks down

Martin Blumenstingl (2):
      clk: meson: meson8b: register the clock controller early
      clk: meson: meson8b: use the regmap in the internal reset controller

Yixun Lan (1):
      clk: meson-axg: pcie: drop the mpll3 clock parent

 drivers/clk/meson/axg-audio.c |  34 ++-
 drivers/clk/meson/axg.c       | 332 +++++++++++++++------------
 drivers/clk/meson/axg.h       |   8 +-
 drivers/clk/meson/clk-pll.c   | 156 ++++++++-----
 drivers/clk/meson/clkc.h      |  16 +-
 drivers/clk/meson/gxbb.c      | 518 +++++++++++++++++++++---------------------
 drivers/clk/meson/gxbb.h      |  10 +-
 drivers/clk/meson/meson8b.c   | 280 +++++++++++------------
 drivers/clk/meson/meson8b.h   |   5 +-
 9 files changed, 732 insertions(+), 627 deletions(-)
