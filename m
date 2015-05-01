Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Dong Aisheng <aisheng.dong@freescale.com>
Subject: [PATCH 0/6] clk.c cleanups
Date: Thu, 30 Apr 2015 17:14:15 -0700
Message-Id: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Here are some cleanups spurned by some patches from Dong Aisheng.
No functionality is changed, just reordering of code, etc.

Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Dong Aisheng <aisheng.dong@freescale.com>

Dong Aisheng (1):
  clk: Squash __clk_{enable,disable}() into callers

Stephen Boyd (5):
  clk: s/clk/core/ for struct clk_core
  clk: Drop unnecessary OOM prints
  clk: Remove impossible if condition in clk_core_get_phase()
  clk: Remove forward declared function prototypes
  clk: Update some comments to reflect reality

 drivers/clk/clk.c | 1572 +++++++++++++++++++++++++----------------------------
 1 file changed, 755 insertions(+), 817 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
