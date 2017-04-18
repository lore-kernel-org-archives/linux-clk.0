Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/6] clk-Hisilicon: Fine-tuning for some function
 implementations
Message-ID: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:34:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:27:32 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use kcalloc() in hisi_clk_init()
  Delete error messages for failed memory allocations in hisi_clk_init()
  Use devm_kmalloc_array() in hisi_clk_alloc()
  Use kcalloc() in hi3620_mmc_clk_init()
  Delete error messages for a failed memory allocation in two functions
  Fix a typo in one variable name

 drivers/clk/hisilicon/clk-hi3620.c | 16 ++++++----------
 drivers/clk/hisilicon/clk.c        | 18 ++++++++----------
 2 files changed, 14 insertions(+), 20 deletions(-)

-- 
2.12.2
