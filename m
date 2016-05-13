Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:51614 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752634AbcEMCS5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2016 22:18:57 -0400
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <haojian.zhuang@linaro.org>,
	<zhangfei.gao@linaro.org>, <xuwei5@hisilicon.com>,
	<yanghongwei@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v2 0/5] clk: hisilicon: Fix some problems of clk-hi3519
Date: Fri, 13 May 2016 10:05:50 +0800
Message-ID: <1463105155-20385-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
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

