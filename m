Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.5-rc5
Date: Fri, 26 Feb 2016 16:07:24 -0800
Message-Id: <1456531644-32524-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 4462b4bbfc33a44f19710ead784ff361bda2c3b3:

  clk: gpio: Really allow an optional clock= DT property (2016-02-18 19:10:22 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to a0d54c3899aaeb047969d9479263c6bcf385c331:

  clk: ti: omap3+: dpll: use non-locking version of clk_get_rate (2016-02-22 14:03:02 -0800)

----------------------------------------------------------------
One small fix to keep OMAP platforms working across a suspend/resume
cycle.

----------------------------------------------------------------
Tero Kristo (1):
      clk: ti: omap3+: dpll: use non-locking version of clk_get_rate

 drivers/clk/ti/dpll3xxx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
