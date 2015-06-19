Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20150619150137.9112.25990@quantum>
Subject: [GIT PULL] clk: fixes for 4.1, part 2
Date: Fri, 19 Jun 2015 08:01:37 -0700
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 0f57d86787d8b1076ea8f9cbdddda2a46d534a27:

  Linux 4.1-rc8 (2015-06-14 15:51:10 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 909aa10e6d6a9524f95dadb6b3ded1c38ec34e11:

  Merge branch 'ccf/atmel-fixes-for-4.1' of https://github.com/bbrezillon/linux-at91 into clk-fixes (2015-06-19 07:37:14 -0700)

----------------------------------------------------------------

Very late clk regression fixes for the ARM-based AT91 platform. These went
unnoticed by me until recently, hence the late pull request.

----------------------------------------------------------------
Boris Brezillon (2):
      clk: at91: pll: fix input range validity check
      clk: at91: fix PERIPHERAL_MAX_SHIFT definition

Michael Turquette (1):
      Merge branch 'ccf/atmel-fixes-for-4.1' of https://github.com/bbrezillon/linux-at91 into clk-fixes

Nicolas Ferre (2):
      clk: at91: trivial: typo in peripheral clock description
      clk: at91: fix h32mx prototype inclusion in pmc header

 Documentation/devicetree/bindings/clock/at91-clock.txt |  2 +-
 drivers/clk/at91/clk-peripheral.c                      |  8 ++++----
 drivers/clk/at91/clk-pll.c                             | 12 ++++++++++--
 drivers/clk/at91/pmc.h                                 |  2 +-
 4 files changed, 16 insertions(+), 8 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
Please read the FAQ at  http://www.tux.org/lkml/
