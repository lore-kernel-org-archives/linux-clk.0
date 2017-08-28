Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	mturquette@linaro.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] constify ux500 clk_ops.
Date: Mon, 28 Aug 2017 12:32:38 +0530
Message-Id: <1503903761-21730-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

clk_ops are not supposed to change at runtime. All functions
working with clk_ops provided by <linux/clk-provider.h> work
with const clk_ops. So mark the non-const clk_ops as const.

Here, Function "clk_reg_prcc" is used to initialized clk_init_data.
clk_init_data is working with const clk_ops. So make clk_reg_prcc
non-const clk_ops argument as const.

Arvind Yadav (3):
  [PATCH 1/3] clk: ux500: prcmu: constify clk_ops.
  [PATCH 2/3] clk: ux500: sysctrl: constify clk_ops.
  [PATCH 3/3] clk: ux500: prcc: constify clk_ops.

 drivers/clk/ux500/clk-prcc.c    |  6 +++---
 drivers/clk/ux500/clk-prcmu.c   | 14 +++++++-------
 drivers/clk/ux500/clk-sysctrl.c |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

-- 
1.9.1
