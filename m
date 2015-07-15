Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/4] TI clk driver cleanups
Date: Wed, 15 Jul 2015 13:08:15 -0700
Message-Id: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some cleanups for the TI clk driver move.

Stephen Boyd (4):
  clk: ti: Check kzalloc() for failures
  clk: ti: Mark ti_clk_features static
  clk: ti: clk-3xxx: Remove unused structures
  clk: ti: Force pointer to be __iomem

 drivers/clk/ti/clk-3xxx.c | 10 ----------
 drivers/clk/ti/clk.c      |  6 ++++--
 2 files changed, 4 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
