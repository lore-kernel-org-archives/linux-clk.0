Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <146914847907.8780.16498849872279969633@resonance>
Subject: [GIT PULL] clk fixes for v4.7-rc8
Date: Thu, 21 Jul 2016 17:47:59 -0700
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 086347705be7530feabb6274a3ad81dd545e7914:

  Merge tag 'v4.7-rockchip-clk-fixes1' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/mmind/linux-rockchip into clk-fixes (2016-06-20 17:01:45 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixe=
s-for-linus

for you to fetch changes up to f96423f483b1a7854270335b319e8d1cdd6f3585:

  clk: at91: fix clk_programmable_set_parent() (2016-07-18 17:45:41 -0700)

----------------------------------------------------------------
Fix a bug in the at91 clk driver, two compile time warnings in sunxi clk
drivers, and one bug in a sunxi clk driver introduced in the 4.7 merge
window.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi: remove unused variable

Boris Brezillon (1):
      clk: at91: fix clk_programmable_set_parent()

Maxime Ripard (2):
      clk: sunxi: tcon-ch1: Do not return a negative error in get_parent
      clk: sunxi: display: Add per-clock flags

Michael Turquette (1):
      Merge tag 'sunxi-clk-fixes-for-4.7' of https://git.kernel.org/.../mri=
pard/linux into clk-fixes

 drivers/clk/at91/clk-programmable.c    | 2 +-
 drivers/clk/sunxi/clk-sun4i-display.c  | 5 ++++-
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c | 4 ----
 3 files changed, 5 insertions(+), 6 deletions(-)
