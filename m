Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:50085 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931AbcDWHvo (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2016 03:51:44 -0400
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <yanhaifeng@hisilicon.com>,
	<yanghongwei@hisilicon.com>, <suwenping@hisilicon.com>,
	<raojun@hisilicon.com>, <ml.yang@hisilicon.com>,
	<gaofei@hisilicon.com>, <zhangzhenxing@hisilicon.com>,
	<hermit.wangheming@hisilicon.com>, <jiangheng@hisilicon.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 0/3] clock: hisilicon: Add CRG driver for hi3519 soc
Date: Sat, 23 Apr 2016 15:40:27 +0800
Message-ID: <1461397230-1757-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch set is mainly used to support CRG driver for hi3519 soc.
It's inherited from the patchset "[RESEND PATCH v10 0/6] ARM: hisi:
Add initial support including clock driver for Hi3519 soc" (see 
https://lkml.org/lkml/2016/3/31/175) and includes the patch "[PATCH
v2] reset: hisilicon: add reset controller driver for hisilicon SOCs"(
see https://lkml.org/lkml/2016/4/21/126). If the reset patch is OK, I
hope it can be merged seperately. Because other upcoming hisilicon CRG
drivers also depend on it. Thank you very much!

change log
v1:
-Added header <linux/clk-provider.h>.
-Removed CLK_IS_ROOT.
-Added some cleanup codes in error case in the probe function. 
-Removed module_exit(hi3519_clk_exit)
    The reason is that this clock driver won't be removed during
 the system running actually. Just like some clock drivers use 
 builtin_platform_driver(). 

Jiancheng Xue (3):
  reset: hisilicon: add reset controller driver for hisilicon SOCs
  clk: hisilicon: export some hisilicon APIs to modules
  clk: hisilicon: add CRG driver for hi3519 soc

 .../devicetree/bindings/clock/hi3519-crg.txt       |  46 +++++++
 drivers/clk/hisilicon/Kconfig                      |  15 +++
 drivers/clk/hisilicon/Makefile                     |   2 +
 drivers/clk/hisilicon/clk-hi3519.c                 | 131 ++++++++++++++++++++
 drivers/clk/hisilicon/clk.c                        |  23 ++--
 drivers/clk/hisilicon/clk.h                        |  14 +--
 drivers/clk/hisilicon/reset.c                      | 134 +++++++++++++++++++++
 drivers/clk/hisilicon/reset.h                      |  36 ++++++
 include/dt-bindings/clock/hi3519-clock.h           |  40 ++++++
 9 files changed, 426 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt
 create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h
 create mode 100644 include/dt-bindings/clock/hi3519-clock.h

-- 
1.9.1

