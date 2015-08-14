Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 14 Aug 2015 01:17:00 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.2
Message-ID: <20150814081700.GA14330@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit bc0195aad0daa2ad5b0d76cce22b167bc3435590:

  Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to b93028c9af807b9474789e6aba34a6135b6cb708:

  clk: pxa: pxa3xx: fix CKEN register access (2015-08-07 16:53:13 -0700)

----------------------------------------------------------------
A one-liner for a regression found in the PXA clock driver.

----------------------------------------------------------------
Robert Jarzmik (1):
      clk: pxa: pxa3xx: fix CKEN register access

 drivers/clk/pxa/clk-pxa3xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
