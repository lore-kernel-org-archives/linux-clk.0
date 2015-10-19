Return-Path: <rjui@broadcom.com>
From: Ray Jui <rjui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>, Simran Rai <ssimran@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] Fix iProc PLL output clock frequency calculation
Date: Mon, 19 Oct 2015 15:27:18 -0700
Message-ID: <1445293639-5863-1-git-send-email-rjui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rjui@broadcom.com
List-ID: <linux-clk.vger.kernel.org>

This patch fixes incorrect iProc PLL clock frequency calculation. The issue
is exposed when Cygnus audio PLL was being added.

This patch is based on v4.3-rc5 and has been tested on Cygnus bcm958305k
wirelss audio board

This full tree is available here:
repo: https://github.com/Broadcom/cygnus-linux.git
branch: iproc-clk-pll-fix-v2

Changes from v1:
 - Added "Fixes: ..." tag so the patch is merged back to stable kernel

Simran Rai (1):
  clk: iproc: Fix PLL output frequency calculation

 drivers/clk/bcm/clk-iproc-pll.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
1.9.1
