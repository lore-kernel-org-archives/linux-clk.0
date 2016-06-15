Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>,
        Jiancheng Xue
	<xuejiancheng@hisilicon.com>
Subject: [RESEND PATCH v2 0/5] clk: hisilicon: Fix some problems of clk-hi3519
Date: Wed, 15 Jun 2016 14:26:33 +0800
Message-ID: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

This patch is base on branch clk-hi3519 in clk tree. It mainly fixes the
following issues:
1. Add driver remove path.
2. Fix the ordering issue about clock provider being published.
3. Add error checking upon registering clocks. 

change log
v2:
-Redivided patches to make sure every patch can be compiled successfully.

Jiancheng Xue (5):
  reset: hisilicon: change the definition of hisi_reset_init
  clk: hisilicon: add hisi_clk_alloc function.
  clk: hisilicon: add error processing for hisi_clk_register_* functions
  clk: hisilicon: add hisi_clk_unregister_* functions
  clk: hisilicon: hi3519: add driver remove path and fix some issues

 drivers/clk/hisilicon/clk-hi3519.c | 116 ++++++++++++++++++++++++++++++++-----
 drivers/clk/hisilicon/clk.c        |  89 ++++++++++++++++++++++++----
 drivers/clk/hisilicon/clk.h        |  34 +++++++++--
 drivers/clk/hisilicon/reset.c      |  19 +++---
 drivers/clk/hisilicon/reset.h      |   5 +-
 5 files changed, 220 insertions(+), 43 deletions(-)

-- 
1.9.1
