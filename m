Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.13-rc4
Date: Fri,  4 Aug 2017 16:41:28 -0700
Message-Id: <20170804234128.15826-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to f54d2cd3c1a231e00732442fca329341d4f4250b:

  clk: keystone: sci-clk: Fix sci_clk_get (2017-08-02 18:37:26 -0700)

----------------------------------------------------------------
A handful of critical fixes for changes introduce this merge window. The TI
sci_clk_get() API was pretty broken and nobody noticed. There were some
CPUfreq crashes on C.H.I.P devices because we failed to propagate rates
up the clk tree. Also, the Intel Atom PMC clk driver needs to mark a clk
critical if the firmware has it enabled already so that audio doesn't get
killed on Baytrail. Gemini devices have a dead serial console because
the reset control usage in the serial driver assume one method of reset
that gemini doesn't support (this will be fixed in the next version in
the reset framework so this is the small fix for -rc series). Finally
we have two rate calculation fixes, one for Exynos and one for Meson SoCs,
that fix rate inconsistencies.

----------------------------------------------------------------
Carlo Caione (1):
      clk: x86: Do not gate clocks enabled by the firmware

Jerome Brunet (1):
      clk: meson: mpll: fix mpll0 fractional part ignored

Linus Walleij (1):
      clk: gemini: Fix reset regression

Maxime Ripard (1):
      clk: sunxi-ng: sun5i: Add clk_set_rate_parent to the CPU clock

Stephen Boyd (2):
      Merge tag 'meson-clk-fixes-for-4.13-rc4-v2' of git://github.com/baylibre/clk-meson into clk-fixes
      Merge tag 'sunxi-clk-fixes-for-4.13' of https://git.kernel.org/.../sunxi/linux into clk-fixes

Sylwester Nawrocki (1):
      clk: samsung: exynos5420: The EPLL rate table corrections

Tero Kristo (1):
      clk: keystone: sci-clk: Fix sci_clk_get

 drivers/clk/clk-gemini.c             | 14 ++++++++
 drivers/clk/keystone/sci-clk.c       | 66 +++++++++++++++++++++++-------------
 drivers/clk/meson/clk-mpll.c         |  7 ++++
 drivers/clk/meson/clkc.h             |  1 +
 drivers/clk/meson/gxbb.c             |  5 +++
 drivers/clk/meson/meson8b.c          |  5 +++
 drivers/clk/samsung/clk-exynos5420.c | 16 ++++-----
 drivers/clk/sunxi-ng/ccu-sun5i.c     |  2 +-
 drivers/clk/x86/clk-pmc-atom.c       |  7 ++++
 9 files changed, 90 insertions(+), 33 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
