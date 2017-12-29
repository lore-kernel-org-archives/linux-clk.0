Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1514569451.7439.3.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.16 - 3rd round
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>
Date: Fri, 29 Dec 2017 18:44:11 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers

Here is a last round of update for meson clock for v4.16. There is just
one simple fix

Thanks for pulling
Jerome

The following changes since commit 78b4af312f910e4f28ebf4cb0a8c1983daa16924:

  clk: meson-axg: add clock controller drivers (2017-12-14 10:19:37 +0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-v4.16-3

for you to fetch changes up to 86aacdca66774051cbc0958110a48074b57a060b:

  clk: meson: mpll: use 64-bit maths in params_from_rate (2017-12-23 23:14:20
+0100)

----------------------------------------------------------------
Fix overflow in the mpll driver on 32bits arch

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: mpll: use 64-bit maths in params_from_rate

 drivers/clk/meson/clk-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
