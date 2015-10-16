Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Oct 2015 16:41:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.3-rc6
Message-ID: <20151016234103.GF10182@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 9f30a04d768f64280dc0c40b730746e82f298d88:

  Merge branch 'for-4.3-rc/ti-clk-fixes' of https://github.com/t-kristo/linux-pm into clk-fixes (2015-10-02 11:22:23 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to e79b202c632f24f49f2eb9459b88b5fd9e332263:

  Partially revert "clk: mvebu: Convert to clk_hw based provider APIs" (2015-10-14 11:28:17 -0700)

----------------------------------------------------------------
Just one revert for Armada XP devices. The conversion to
of_clk_get_parent_name() wasn't a direct translation, so we
revert back to of_clk_get() + __clk_get_name(). We could make
of_clk_get_parent_name() more robust, but that may have unintended
side-effects, so we'll do that in the next version.

----------------------------------------------------------------
Stephen Boyd (1):
      Partially revert "clk: mvebu: Convert to clk_hw based provider APIs"

 drivers/clk/mvebu/clk-cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
