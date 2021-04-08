Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E91C43460
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E70661104
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 12:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhDHM7h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 08:59:37 -0400
Received: from mail-bn8nam11on2071.outbound.protection.outlook.com ([40.107.236.71]:47329
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231420AbhDHM7f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 08:59:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBlzWKqQE9WsUmSWPmn7xDq8jRsFATlo3dAVJPIb912Qn99vTKGCWNKW+4CQHQpqK0rzAZIdzdPbRaE+yPv49hocvNwsLjjPRuo3aSpl8t6o8HfRYPVvgD9BZJClpVS67AI4OMK6LDQOA04iaPySnGw34gA8ID/x09pIK4D/cfM6UNrLt00LlTHTjwJqOAKtsa3qZgQHJsUV7pRPU6w4zWvswOlS4AzQTdH3DKnyWiJpol5ZSpK+4sNE1DDTh7TkLueVRF/YnJfnosvJ5yiC7qQZaYH/aGpvSa7hymQ7plH7enQm6DK9oGxNUOqZrMbZKMWMeuz/5iWEJrHzVizjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P1r9mPDNaHu7kxrbvNgTnJP+gJv916tOwOiJy9JHWU=;
 b=P/l0jXBOBWR7WF2oIIm5LX4q/6BYq1YWgSprSpBczEwEJYFTxmR1GkvG2NX/BR3ARcY6cKEYR1OTeio0PM9hVT8f/tXpS1gHBf6PmbdNT/V60isONtmnLr4NAz11Y02bpxpUrJ3v74sZgCifyKMy1Gp2G+KbnPgqXWmjYnQjWiGOqkJlhA6XrCSCjmDmjMDRh4LQxhkTnE6aTZpbe34DJ3d7eyMmizLj46cUawk1OCBS/sW9yKslfUjUSpWPP0No3VHwWpZOgzkfVK4xjD5C3NLVkdrnyMRXrLPKYEGychLBulmg2xBqDS1NCLYcGe5sO7mBi6IaJq20kTXuPv7hlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P1r9mPDNaHu7kxrbvNgTnJP+gJv916tOwOiJy9JHWU=;
 b=HhganAzTxOzMy1+A5WedPtQGX/KT8sl21bYjKQycSRQO7cCl0mWJ9Fs+h6TT8ufc8pRkGae44pDLDMdp9CksQ1oyk+dHww0+p8D0ROZFw66ECvJ6gQvqR2XQvJWALdTbqJho3Fdu8sO5xHoBMmJdpq9PoT9BqSIOxcrQAj4UVYI=
Received: from CY1PR07CA0021.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::31) by BYAPR02MB4501.namprd02.prod.outlook.com
 (2603:10b6:a03:5c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Thu, 8 Apr
 2021 12:59:21 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:e400:c60a:cafe::5e) by CY1PR07CA0021.outlook.office365.com
 (2a01:111:e400:c60a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Thu, 8 Apr 2021 12:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 12:59:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 8 Apr 2021 05:58:56 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 8 Apr 2021 05:58:56 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev,
 zhengxunli.mxic@gmail.com
Received: from [10.140.6.59] (port=57650 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lUUFK-0000kJ-Jc; Thu, 08 Apr 2021 05:58:55 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-staging@lists.linux.dev>, <git@xilinx.com>,
        <michals@xilinx.com>, <zhengxunli.mxic@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v11  2/5] clk: clocking-wizard: Add the clockwizard to clk directory
Date:   Thu, 8 Apr 2021 18:28:40 +0530
Message-ID: <1617886723-27117-3-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1617886723-27117-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 591c184f-a34e-4194-456d-08d8fa8e206a
X-MS-TrafficTypeDiagnostic: BYAPR02MB4501:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4501217A6D9B55539F72E548AA749@BYAPR02MB4501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjYge0Up26xcCyETi257bE9NXKqpTOHko0qCfQtB/chL7KNy1ZBxeJ38jME3K0L44nEsVh0+l88zXhlCZQlBYoIIjNB9L9r7K1u1ke3dumyYr4jHf+GyCb/TIyy1hEkTJ2/LuSMWi1b5QYZt9dqHwZ2lA4m+6ocHUJyA6mHXQHOPZu3P9ibztBV2NPQPkwBubZ/V858DC/ZbzGS5Md8lU3r7X5ak9fmWXCmQSK7uTnuDJsRPeglkfuiQWr0LJnFElzIf1RbjkQ0ls8oC0/s/19TkgUx4T48+eohpY2lGveEI88BTrHujuXMekp74hZEb1RfjalB5xdE2XPjaztV+rQtREfOof2+3WIR2eQHFprIArpxZc69URYHeeGWx5qvwyEOqJ0oTgB8yHPxy4jA91a2nzdZoSrvVCDBvPyY9VMAf8WyjbXawGAWcgMbM9TVBybKPDoOLlLiEAyiyOrX5YdApbOu1YzsUJzkxUTf+McG1NldXfv92mIPTJUk5E9zuFfC1yfA3xd5BhRc45A/71azxiG4n61mEQTGAPbiyyXi6dGXQhUV3PbAuXnnFntxA7Lnl/7YOj+OB9Xk5DK2HG9VQFuZLibxHqHuC5Byfl+v3yeFaZEyM15WRMxLo/o9mYupbrnndKK3oLRbcnA2CqmGPq/AiuoY7MTApwA7XZBABHuaeXfhfGvT+sxh+K0CjjcOdckTAEEAyq56KYnFKxaVJ99YRs5nkRa1h/97kiSzEAJNtAVxCwuzsHyu8puyuHK+k8ybB5YMKGnsktYse8Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(36840700001)(46966006)(70586007)(8936002)(9786002)(8676002)(54906003)(82740400003)(83380400001)(70206006)(356005)(47076005)(66574015)(36756003)(36906005)(316002)(7636003)(82310400003)(6666004)(426003)(26005)(6916009)(186003)(107886003)(966005)(36860700001)(478600001)(44832011)(7696005)(30864003)(336012)(5660300002)(2616005)(2906002)(4326008)(102446001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:59:20.8421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 591c184f-a34e-4194-456d-08d8fa8e206a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4501
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocking wizard driver to clk.
And delete the driver from the staging as it is in drivers/clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v11:
no change

 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c                | 635 +++++++++++++++++++++
 drivers/staging/Kconfig                            |   2 -
 drivers/staging/Makefile                           |   1 -
 drivers/staging/clocking-wizard/Kconfig            |  10 -
 drivers/staging/clocking-wizard/Makefile           |   2 -
 drivers/staging/clocking-wizard/TODO               |  13 -
 .../clocking-wizard/clk-xlnx-clock-wizard.c        | 634 --------------------
 drivers/staging/clocking-wizard/dt-binding.txt     |  30 -
 10 files changed, 645 insertions(+), 692 deletions(-)
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/Kconfig
 delete mode 100644 drivers/staging/clocking-wizard/Makefile
 delete mode 100644 drivers/staging/clocking-wizard/TODO
 delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
 delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a588d56..e5943dd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -376,6 +376,15 @@ config COMMON_CLK_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
 
+config COMMON_CLK_XLNX_CLKWZRD
+	tristate "Xilinx Clocking Wizard"
+	depends on COMMON_CLK && OF
+	help
+	  Support for the Xilinx Clocking Wizard IP core clock generator.
+	  Adds support for clocking wizard and compatible.
+	  This driver supports the Xilinx clocking wizard programmable clock
+	  synthesizer. The number of output is configurable in the design.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b22ae4f..8f2cd56 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
+obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
new file mode 100644
index 0000000..ec377f0
--- /dev/null
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -0,0 +1,635 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx 'Clocking Wizard' driver
+ *
+ *  Copyright (C) 2013 - 2021 Xilinx
+ *
+ *  Sören Brinkmann <soren.brinkmann@xilinx.com>
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+
+#define WZRD_NUM_OUTPUTS	7
+#define WZRD_ACLK_MAX_FREQ	250000000UL
+
+#define WZRD_CLK_CFG_REG(n)	(0x200 + 4 * (n))
+
+#define WZRD_CLKOUT0_FRAC_EN	BIT(18)
+#define WZRD_CLKFBOUT_FRAC_EN	BIT(26)
+
+#define WZRD_CLKFBOUT_MULT_SHIFT	8
+#define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
+#define WZRD_CLKFBOUT_FRAC_SHIFT	16
+#define WZRD_CLKFBOUT_FRAC_MASK		(0x3ff << WZRD_CLKFBOUT_FRAC_SHIFT)
+#define WZRD_DIVCLK_DIVIDE_SHIFT	0
+#define WZRD_DIVCLK_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+#define WZRD_CLKOUT_DIVIDE_SHIFT	0
+#define WZRD_CLKOUT_DIVIDE_WIDTH	8
+#define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+#define WZRD_CLKOUT_FRAC_SHIFT		8
+#define WZRD_CLKOUT_FRAC_MASK		0x3ff
+
+#define WZRD_DR_MAX_INT_DIV_VALUE	255
+#define WZRD_DR_STATUS_REG_OFFSET	0x04
+#define WZRD_DR_LOCK_BIT_MASK		0x00000001
+#define WZRD_DR_INIT_REG_OFFSET		0x25C
+#define WZRD_DR_DIV_TO_PHASE_OFFSET	4
+#define WZRD_DR_BEGIN_DYNA_RECONF	0x03
+
+#define WZRD_USEC_POLL		10
+#define WZRD_TIMEOUT_POLL		1000
+/* Get the mask from width */
+#define div_mask(width)			((1 << (width)) - 1)
+
+/* Extract divider instance from clock hardware instance */
+#define to_clk_wzrd_divider(_hw) container_of(_hw, struct clk_wzrd_divider, hw)
+
+enum clk_wzrd_int_clks {
+	wzrd_clk_mul,
+	wzrd_clk_mul_div,
+	wzrd_clk_mul_frac,
+	wzrd_clk_int_max
+};
+
+/**
+ * struct clk_wzrd - Clock wizard private data structure
+ *
+ * @clk_data:		Clock data
+ * @nb:			Notifier block
+ * @base:		Memory base
+ * @clk_in1:		Handle to input clock 'clk_in1'
+ * @axi_clk:		Handle to input clock 's_axi_aclk'
+ * @clks_internal:	Internal clocks
+ * @clkout:		Output clocks
+ * @speed_grade:	Speed grade of the device
+ * @suspended:		Flag indicating power state of the device
+ */
+struct clk_wzrd {
+	struct clk_onecell_data clk_data;
+	struct notifier_block nb;
+	void __iomem *base;
+	struct clk *clk_in1;
+	struct clk *axi_clk;
+	struct clk *clks_internal[wzrd_clk_int_max];
+	struct clk *clkout[WZRD_NUM_OUTPUTS];
+	unsigned int speed_grade;
+	bool suspended;
+};
+
+/**
+ * struct clk_wzrd_divider - clock divider specific to clk_wzrd
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @base:	base address of register containing the divider
+ * @offset:	offset address of register containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @flags:	clk_wzrd divider flags
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ * @lock:	register lock
+ */
+struct clk_wzrd_divider {
+	struct clk_hw hw;
+	void __iomem *base;
+	u16 offset;
+	u8 shift;
+	u8 width;
+	u8 flags;
+	const struct clk_div_table *table;
+	spinlock_t *lock;  /* divider lock */
+};
+
+#define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
+
+/* maximum frequencies for input/output clocks per speed grade */
+static const unsigned long clk_wzrd_max_freq[] = {
+	800000000UL,
+	933000000UL,
+	1066000000UL
+};
+
+/* spin lock variable for clk_wzrd */
+static DEFINE_SPINLOCK(clkwzrd_lock);
+
+static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+	unsigned int val;
+
+	val = readl(div_addr) >> divider->shift;
+	val &= div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+			divider->flags, divider->width);
+}
+
+static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	int err;
+	u32 value;
+	unsigned long flags = 0;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	value = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+	/* Cap the value to max */
+	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
+
+	/* Set divisor and clear phase offset */
+	writel(value, div_addr);
+	writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				 value, value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		goto err_reconfig;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
+				 value, value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+err_reconfig:
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+	return err;
+}
+
+static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *prate)
+{
+	u8 div;
+
+	/*
+	 * since we don't change parent rate we just round rate to closest
+	 * achievable
+	 */
+	div = DIV_ROUND_CLOSEST(*prate, rate);
+
+	return *prate / div;
+}
+
+static const struct clk_ops clk_wzrd_clk_divider_ops = {
+	.round_rate = clk_wzrd_round_rate,
+	.set_rate = clk_wzrd_dynamic_reconfig,
+	.recalc_rate = clk_wzrd_recalc_rate,
+};
+
+static unsigned long clk_wzrd_recalc_ratef(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	unsigned int val;
+	u32 div, frac;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+
+	val = readl(div_addr);
+	div = val & div_mask(divider->width);
+	frac = (val >> WZRD_CLKOUT_FRAC_SHIFT) & WZRD_CLKOUT_FRAC_MASK;
+
+	return mult_frac(parent_rate, 1000, (div * 1000) + frac);
+}
+
+static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	int err;
+	u32 value, pre;
+	unsigned long rate_div, f, clockout0_div;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr = divider->base + divider->offset;
+
+	rate_div = ((parent_rate * 1000) / rate);
+	clockout0_div = rate_div / 1000;
+
+	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
+	f = (u32)(pre - (clockout0_div * 1000));
+	f = f & WZRD_CLKOUT_FRAC_MASK;
+	f = f << WZRD_CLKOUT_DIVIDE_WIDTH;
+
+	value = (f  | (clockout0_div & WZRD_CLKOUT_DIVIDE_MASK));
+
+	/* Set divisor and clear phase offset */
+	writel(value, div_addr);
+	writel(0x0, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		return err;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				value & WZRD_DR_LOCK_BIT_MASK,
+				WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+}
+
+static long clk_wzrd_round_rate_f(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *prate)
+{
+	return rate;
+}
+
+static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
+	.round_rate = clk_wzrd_round_rate_f,
+	.set_rate = clk_wzrd_dynamic_reconfig_f,
+	.recalc_rate = clk_wzrd_recalc_ratef,
+};
+
+static struct clk *clk_wzrd_register_divf(struct device *dev,
+					  const char *name,
+					  const char *parent_name,
+					  unsigned long flags,
+					  void __iomem *base, u16 offset,
+					  u8 shift, u8 width,
+					  u8 clk_divider_flags,
+					  const struct clk_div_table *table,
+					  spinlock_t *lock)
+{
+	struct clk_wzrd_divider *div;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+
+	init.ops = &clk_wzrd_clk_divider_ops_f;
+
+	init.flags = flags;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	div->base = base;
+	div->offset = offset;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	hw = &div->hw;
+	ret =  devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw->clk;
+}
+
+static struct clk *clk_wzrd_register_divider(struct device *dev,
+					     const char *name,
+					     const char *parent_name,
+					     unsigned long flags,
+					     void __iomem *base, u16 offset,
+					     u8 shift, u8 width,
+					     u8 clk_divider_flags,
+					     const struct clk_div_table *table,
+					     spinlock_t *lock)
+{
+	struct clk_wzrd_divider *div;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_wzrd_clk_divider_ops;
+	init.flags = flags;
+	init.parent_names =  &parent_name;
+	init.num_parents =  1;
+
+	div->base = base;
+	div->offset = offset;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	hw = &div->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		hw = ERR_PTR(ret);
+
+	return hw->clk;
+}
+
+static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
+				 void *data)
+{
+	unsigned long max;
+	struct clk_notifier_data *ndata = data;
+	struct clk_wzrd *clk_wzrd = to_clk_wzrd(nb);
+
+	if (clk_wzrd->suspended)
+		return NOTIFY_OK;
+
+	if (ndata->clk == clk_wzrd->clk_in1)
+		max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
+	else if (ndata->clk == clk_wzrd->axi_clk)
+		max = WZRD_ACLK_MAX_FREQ;
+	else
+		return NOTIFY_DONE;	/* should never happen */
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (ndata->new_rate > max)
+			return NOTIFY_BAD;
+		return NOTIFY_OK;
+	case POST_RATE_CHANGE:
+	case ABORT_RATE_CHANGE:
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+{
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+	clk_wzrd->suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused clk_wzrd_resume(struct device *dev)
+{
+	int ret;
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(dev, "unable to enable s_axi_aclk\n");
+		return ret;
+	}
+
+	clk_wzrd->suspended = false;
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+			 clk_wzrd_resume);
+
+static int clk_wzrd_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	u32 reg, reg_f, mult;
+	unsigned long rate;
+	const char *clk_name;
+	void __iomem *ctrl_reg;
+	struct clk_wzrd *clk_wzrd;
+	struct device_node *np = pdev->dev.of_node;
+	int nr_outputs;
+	unsigned long flags = 0;
+
+	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
+	if (!clk_wzrd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, clk_wzrd);
+
+	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(clk_wzrd->base))
+		return PTR_ERR(clk_wzrd->base);
+
+	ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
+	if (!ret) {
+		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
+			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
+				 clk_wzrd->speed_grade);
+			clk_wzrd->speed_grade = 0;
+		}
+	}
+
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(clk_wzrd->clk_in1)) {
+		if (clk_wzrd->clk_in1 != ERR_PTR(-EPROBE_DEFER))
+			dev_err(&pdev->dev, "clk_in1 not found\n");
+		return PTR_ERR(clk_wzrd->clk_in1);
+	}
+
+	clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(clk_wzrd->axi_clk)) {
+		if (clk_wzrd->axi_clk != ERR_PTR(-EPROBE_DEFER))
+			dev_err(&pdev->dev, "s_axi_aclk not found\n");
+		return PTR_ERR(clk_wzrd->axi_clk);
+	}
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
+		return ret;
+	}
+	rate = clk_get_rate(clk_wzrd->axi_clk);
+	if (rate > WZRD_ACLK_MAX_FREQ) {
+		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
+			rate);
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
+	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
+	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
+
+	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
+	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
+	mult = (reg * 1000) + reg_f;
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
+
+	ret = of_property_read_u32(np, "nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+	if (nr_outputs == 1)
+		flags = CLK_SET_RATE_PARENT;
+
+	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
+			(&pdev->dev, clk_name,
+			 __clk_get_name(clk_wzrd->clk_in1),
+			0, mult, 1000);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
+		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
+		goto err_disable_clk;
+	}
+
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_rm_int_clk;
+	}
+
+	ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(0);
+	/* register div */
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
+			(&pdev->dev, clk_name,
+			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
+			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
+			CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
+		dev_err(&pdev->dev, "unable to register divider clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
+		goto err_rm_int_clk;
+	}
+
+	/* register div per output */
+	for (i = nr_outputs - 1; i >= 0 ; i--) {
+		const char *clkout_name;
+
+		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
+		if (!clkout_name) {
+			ret = -ENOMEM;
+			goto err_rm_int_clk;
+		}
+
+		if (!i)
+			clk_wzrd->clkout[i] = clk_wzrd_register_divf
+				(&pdev->dev, clkout_name,
+				clk_name, flags,
+				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				NULL, &clkwzrd_lock);
+		else
+			clk_wzrd->clkout[i] = clk_wzrd_register_divider
+				(&pdev->dev, clkout_name,
+				clk_name, 0,
+				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				NULL, &clkwzrd_lock);
+		if (IS_ERR(clk_wzrd->clkout[i])) {
+			int j;
+
+			for (j = i + 1; j < nr_outputs; j++)
+				clk_unregister(clk_wzrd->clkout[j]);
+			dev_err(&pdev->dev,
+				"unable to register divider clock\n");
+			ret = PTR_ERR(clk_wzrd->clkout[i]);
+			goto err_rm_int_clks;
+		}
+	}
+
+	kfree(clk_name);
+
+	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
+	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
+
+	if (clk_wzrd->speed_grade) {
+		clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
+
+		ret = clk_notifier_register(clk_wzrd->clk_in1,
+					    &clk_wzrd->nb);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "unable to register clock notifier\n");
+
+		ret = clk_notifier_register(clk_wzrd->axi_clk, &clk_wzrd->nb);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "unable to register clock notifier\n");
+	}
+
+	return 0;
+
+err_rm_int_clks:
+	clk_unregister(clk_wzrd->clks_internal[1]);
+err_rm_int_clk:
+	kfree(clk_name);
+	clk_unregister(clk_wzrd->clks_internal[0]);
+err_disable_clk:
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return ret;
+}
+
+static int clk_wzrd_remove(struct platform_device *pdev)
+{
+	int i;
+	struct clk_wzrd *clk_wzrd = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	for (i = 0; i < WZRD_NUM_OUTPUTS; i++)
+		clk_unregister(clk_wzrd->clkout[i]);
+	for (i = 0; i < wzrd_clk_int_max; i++)
+		clk_unregister(clk_wzrd->clks_internal[i]);
+
+	if (clk_wzrd->speed_grade) {
+		clk_notifier_unregister(clk_wzrd->axi_clk, &clk_wzrd->nb);
+		clk_notifier_unregister(clk_wzrd->clk_in1, &clk_wzrd->nb);
+	}
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return 0;
+}
+
+static const struct of_device_id clk_wzrd_ids[] = {
+	{ .compatible = "xlnx,clocking-wizard" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
+
+static struct platform_driver clk_wzrd_driver = {
+	.driver = {
+		.name = "clk-wizard",
+		.of_match_table = clk_wzrd_ids,
+		.pm = &clk_wzrd_dev_pm_ops,
+	},
+	.probe = clk_wzrd_probe,
+	.remove = clk_wzrd_remove,
+};
+module_platform_driver(clk_wzrd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Soeren Brinkmann <soren.brinkmann@xilinx.com");
+MODULE_DESCRIPTION("Driver for the Xilinx Clocking Wizard IP core");
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index b22f73d..d032fb5 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -74,8 +74,6 @@ source "drivers/staging/gs_fpgaboot/Kconfig"
 
 source "drivers/staging/unisys/Kconfig"
 
-source "drivers/staging/clocking-wizard/Kconfig"
-
 source "drivers/staging/fbtft/Kconfig"
 
 source "drivers/staging/fsl-dpaa2/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 2245059..2327185 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_LTE_GDM724X)	+= gdm724x/
 obj-$(CONFIG_FIREWIRE_SERIAL)	+= fwserial/
 obj-$(CONFIG_GS_FPGABOOT)	+= gs_fpgaboot/
 obj-$(CONFIG_UNISYSSPAR)	+= unisys/
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
 obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_FSL_DPAA2)		+= fsl-dpaa2/
 obj-$(CONFIG_MOST)		+= most/
diff --git a/drivers/staging/clocking-wizard/Kconfig b/drivers/staging/clocking-wizard/Kconfig
deleted file mode 100644
index 69cf514..0000000
--- a/drivers/staging/clocking-wizard/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Xilinx Clocking Wizard Driver
-#
-
-config COMMON_CLK_XLNX_CLKWZRD
-	tristate "Xilinx Clocking Wizard"
-	depends on COMMON_CLK && OF && IOMEM
-	help
-	  Support for the Xilinx Clocking Wizard IP core clock generator.
diff --git a/drivers/staging/clocking-wizard/Makefile b/drivers/staging/clocking-wizard/Makefile
deleted file mode 100644
index b1f9152..0000000
--- a/drivers/staging/clocking-wizard/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
diff --git a/drivers/staging/clocking-wizard/TODO b/drivers/staging/clocking-wizard/TODO
deleted file mode 100644
index c7e1dc5..0000000
--- a/drivers/staging/clocking-wizard/TODO
+++ /dev/null
@@ -1,13 +0,0 @@
-TODO:
-	- support for fractional multiplier
-	- support for fractional divider (output 0 only)
-	- support for set_rate() operations (may benefit from Stephen Boyd's
-	  refactoring of the clk primitives:
-	  https://lore.kernel.org/lkml/1409957256-23729-1-git-send-email-sboyd@codeaurora.org)
-	- review arithmetic
-	  - overflow after multiplication?
-	  - maximize accuracy before divisions
-
-Patches to:
-	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-	Sören Brinkmann <soren.brinkmann@xilinx.com>
diff --git a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c b/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
deleted file mode 100644
index 3936771..0000000
--- a/drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c
+++ /dev/null
@@ -1,634 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Xilinx 'Clocking Wizard' driver
- *
- *  Copyright (C) 2013 - 2014 Xilinx
- *
- *  Sören Brinkmann <soren.brinkmann@xilinx.com>
- */
-
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/slab.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/module.h>
-#include <linux/err.h>
-#include <linux/iopoll.h>
-
-#define WZRD_NUM_OUTPUTS	7
-#define WZRD_ACLK_MAX_FREQ	250000000UL
-
-#define WZRD_CLK_CFG_REG(n)	(0x200 + 4 * (n))
-
-#define WZRD_CLKOUT0_FRAC_EN	BIT(18)
-#define WZRD_CLKFBOUT_FRAC_EN	BIT(26)
-
-#define WZRD_CLKFBOUT_MULT_SHIFT	8
-#define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
-#define WZRD_CLKFBOUT_FRAC_SHIFT	16
-#define WZRD_CLKFBOUT_FRAC_MASK		(0x3ff << WZRD_CLKFBOUT_FRAC_SHIFT)
-#define WZRD_DIVCLK_DIVIDE_SHIFT	0
-#define WZRD_DIVCLK_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
-#define WZRD_CLKOUT_DIVIDE_SHIFT	0
-#define WZRD_CLKOUT_DIVIDE_WIDTH	8
-#define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
-#define WZRD_CLKOUT_FRAC_SHIFT		8
-#define WZRD_CLKOUT_FRAC_MASK		0x3ff
-
-#define WZRD_DR_MAX_INT_DIV_VALUE	255
-#define WZRD_DR_STATUS_REG_OFFSET	0x04
-#define WZRD_DR_LOCK_BIT_MASK		0x00000001
-#define WZRD_DR_INIT_REG_OFFSET		0x25C
-#define WZRD_DR_DIV_TO_PHASE_OFFSET	4
-#define WZRD_DR_BEGIN_DYNA_RECONF	0x03
-
-#define WZRD_USEC_POLL		10
-#define WZRD_TIMEOUT_POLL		1000
-/* Get the mask from width */
-#define div_mask(width)			((1 << (width)) - 1)
-
-/* Extract divider instance from clock hardware instance */
-#define to_clk_wzrd_divider(_hw) container_of(_hw, struct clk_wzrd_divider, hw)
-
-enum clk_wzrd_int_clks {
-	wzrd_clk_mul,
-	wzrd_clk_mul_div,
-	wzrd_clk_mul_frac,
-	wzrd_clk_int_max
-};
-
-/**
- * struct clk_wzrd - Clock wizard private data structure
- *
- * @clk_data:		Clock data
- * @nb:			Notifier block
- * @base:		Memory base
- * @clk_in1:		Handle to input clock 'clk_in1'
- * @axi_clk:		Handle to input clock 's_axi_aclk'
- * @clks_internal:	Internal clocks
- * @clkout:		Output clocks
- * @speed_grade:	Speed grade of the device
- * @suspended:		Flag indicating power state of the device
- */
-struct clk_wzrd {
-	struct clk_onecell_data clk_data;
-	struct notifier_block nb;
-	void __iomem *base;
-	struct clk *clk_in1;
-	struct clk *axi_clk;
-	struct clk *clks_internal[wzrd_clk_int_max];
-	struct clk *clkout[WZRD_NUM_OUTPUTS];
-	unsigned int speed_grade;
-	bool suspended;
-};
-
-/**
- * struct clk_wzrd_divider - clock divider specific to clk_wzrd
- *
- * @hw:		handle between common and hardware-specific interfaces
- * @base:	base address of register containing the divider
- * @offset:	offset address of register containing the divider
- * @shift:	shift to the divider bit field
- * @width:	width of the divider bit field
- * @flags:	clk_wzrd divider flags
- * @table:	array of value/divider pairs, last entry should have div = 0
- * @lock:	register lock
- */
-struct clk_wzrd_divider {
-	struct clk_hw hw;
-	void __iomem *base;
-	u16 offset;
-	u8 shift;
-	u8 width;
-	u8 flags;
-	const struct clk_div_table *table;
-	spinlock_t *lock;  /* divider lock */
-};
-
-#define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
-
-/* maximum frequencies for input/output clocks per speed grade */
-static const unsigned long clk_wzrd_max_freq[] = {
-	800000000UL,
-	933000000UL,
-	1066000000UL
-};
-
-/* spin lock variable for clk_wzrd */
-static DEFINE_SPINLOCK(clkwzrd_lock);
-
-static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
-					  unsigned long parent_rate)
-{
-	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	void __iomem *div_addr = divider->base + divider->offset;
-	unsigned int val;
-
-	val = readl(div_addr) >> divider->shift;
-	val &= div_mask(divider->width);
-
-	return divider_recalc_rate(hw, parent_rate, val, divider->table,
-			divider->flags, divider->width);
-}
-
-static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
-				     unsigned long parent_rate)
-{
-	int err;
-	u32 value;
-	unsigned long flags = 0;
-	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	void __iomem *div_addr = divider->base + divider->offset;
-
-	if (divider->lock)
-		spin_lock_irqsave(divider->lock, flags);
-	else
-		__acquire(divider->lock);
-
-	value = DIV_ROUND_CLOSEST(parent_rate, rate);
-
-	/* Cap the value to max */
-	min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
-
-	/* Set divisor and clear phase offset */
-	writel(value, div_addr);
-	writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
-
-	/* Check status register */
-	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
-				 value, value & WZRD_DR_LOCK_BIT_MASK,
-				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
-	if (err)
-		goto err_reconfig;
-
-	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF,
-	       divider->base + WZRD_DR_INIT_REG_OFFSET);
-
-	/* Check status register */
-	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
-				 value, value & WZRD_DR_LOCK_BIT_MASK,
-				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
-err_reconfig:
-	if (divider->lock)
-		spin_unlock_irqrestore(divider->lock, flags);
-	else
-		__release(divider->lock);
-	return err;
-}
-
-static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
-{
-	u8 div;
-
-	/*
-	 * since we don't change parent rate we just round rate to closest
-	 * achievable
-	 */
-	div = DIV_ROUND_CLOSEST(*prate, rate);
-
-	return *prate / div;
-}
-
-static const struct clk_ops clk_wzrd_clk_divider_ops = {
-	.round_rate = clk_wzrd_round_rate,
-	.set_rate = clk_wzrd_dynamic_reconfig,
-	.recalc_rate = clk_wzrd_recalc_rate,
-};
-
-static unsigned long clk_wzrd_recalc_ratef(struct clk_hw *hw,
-					   unsigned long parent_rate)
-{
-	unsigned int val;
-	u32 div, frac;
-	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	void __iomem *div_addr = divider->base + divider->offset;
-
-	val = readl(div_addr);
-	div = val & div_mask(divider->width);
-	frac = (val >> WZRD_CLKOUT_FRAC_SHIFT) & WZRD_CLKOUT_FRAC_MASK;
-
-	return mult_frac(parent_rate, 1000, (div * 1000) + frac);
-}
-
-static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
-				       unsigned long parent_rate)
-{
-	int err;
-	u32 value, pre;
-	unsigned long rate_div, f, clockout0_div;
-	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
-	void __iomem *div_addr = divider->base + divider->offset;
-
-	rate_div = ((parent_rate * 1000) / rate);
-	clockout0_div = rate_div / 1000;
-
-	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
-	f = (u32)(pre - (clockout0_div * 1000));
-	f = f & WZRD_CLKOUT_FRAC_MASK;
-	f = f << WZRD_CLKOUT_DIVIDE_WIDTH;
-
-	value = (f  | (clockout0_div & WZRD_CLKOUT_DIVIDE_MASK));
-
-	/* Set divisor and clear phase offset */
-	writel(value, div_addr);
-	writel(0x0, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
-
-	/* Check status register */
-	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
-				 value & WZRD_DR_LOCK_BIT_MASK,
-				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
-	if (err)
-		return err;
-
-	/* Initiate reconfiguration */
-	writel(WZRD_DR_BEGIN_DYNA_RECONF,
-	       divider->base + WZRD_DR_INIT_REG_OFFSET);
-
-	/* Check status register */
-	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
-				value & WZRD_DR_LOCK_BIT_MASK,
-				WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
-}
-
-static long clk_wzrd_round_rate_f(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
-{
-	return rate;
-}
-
-static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
-	.round_rate = clk_wzrd_round_rate_f,
-	.set_rate = clk_wzrd_dynamic_reconfig_f,
-	.recalc_rate = clk_wzrd_recalc_ratef,
-};
-
-static struct clk *clk_wzrd_register_divf(struct device *dev,
-					  const char *name,
-					  const char *parent_name,
-					  unsigned long flags,
-					  void __iomem *base, u16 offset,
-					  u8 shift, u8 width,
-					  u8 clk_divider_flags,
-					  const struct clk_div_table *table,
-					  spinlock_t *lock)
-{
-	struct clk_wzrd_divider *div;
-	struct clk_hw *hw;
-	struct clk_init_data init;
-	int ret;
-
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-
-	init.ops = &clk_wzrd_clk_divider_ops_f;
-
-	init.flags = flags;
-	init.parent_names = &parent_name;
-	init.num_parents = 1;
-
-	div->base = base;
-	div->offset = offset;
-	div->shift = shift;
-	div->width = width;
-	div->flags = clk_divider_flags;
-	div->lock = lock;
-	div->hw.init = &init;
-	div->table = table;
-
-	hw = &div->hw;
-	ret =  devm_clk_hw_register(dev, hw);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return hw->clk;
-}
-
-static struct clk *clk_wzrd_register_divider(struct device *dev,
-					     const char *name,
-					     const char *parent_name,
-					     unsigned long flags,
-					     void __iomem *base, u16 offset,
-					     u8 shift, u8 width,
-					     u8 clk_divider_flags,
-					     const struct clk_div_table *table,
-					     spinlock_t *lock)
-{
-	struct clk_wzrd_divider *div;
-	struct clk_hw *hw;
-	struct clk_init_data init;
-	int ret;
-
-	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
-	init.name = name;
-	init.ops = &clk_wzrd_clk_divider_ops;
-	init.flags = flags;
-	init.parent_names =  &parent_name;
-	init.num_parents =  1;
-
-	div->base = base;
-	div->offset = offset;
-	div->shift = shift;
-	div->width = width;
-	div->flags = clk_divider_flags;
-	div->lock = lock;
-	div->hw.init = &init;
-	div->table = table;
-
-	hw = &div->hw;
-	ret = devm_clk_hw_register(dev, hw);
-	if (ret)
-		hw = ERR_PTR(ret);
-
-	return hw->clk;
-}
-
-static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
-				 void *data)
-{
-	unsigned long max;
-	struct clk_notifier_data *ndata = data;
-	struct clk_wzrd *clk_wzrd = to_clk_wzrd(nb);
-
-	if (clk_wzrd->suspended)
-		return NOTIFY_OK;
-
-	if (ndata->clk == clk_wzrd->clk_in1)
-		max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
-	else if (ndata->clk == clk_wzrd->axi_clk)
-		max = WZRD_ACLK_MAX_FREQ;
-	else
-		return NOTIFY_DONE;	/* should never happen */
-
-	switch (event) {
-	case PRE_RATE_CHANGE:
-		if (ndata->new_rate > max)
-			return NOTIFY_BAD;
-		return NOTIFY_OK;
-	case POST_RATE_CHANGE:
-	case ABORT_RATE_CHANGE:
-	default:
-		return NOTIFY_DONE;
-	}
-}
-
-static int __maybe_unused clk_wzrd_suspend(struct device *dev)
-{
-	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
-
-	clk_disable_unprepare(clk_wzrd->axi_clk);
-	clk_wzrd->suspended = true;
-
-	return 0;
-}
-
-static int __maybe_unused clk_wzrd_resume(struct device *dev)
-{
-	int ret;
-	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
-
-	ret = clk_prepare_enable(clk_wzrd->axi_clk);
-	if (ret) {
-		dev_err(dev, "unable to enable s_axi_aclk\n");
-		return ret;
-	}
-
-	clk_wzrd->suspended = false;
-
-	return 0;
-}
-
-static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
-			 clk_wzrd_resume);
-
-static int clk_wzrd_probe(struct platform_device *pdev)
-{
-	int i, ret;
-	u32 reg, reg_f, mult;
-	unsigned long rate;
-	const char *clk_name;
-	void __iomem *ctrl_reg;
-	struct clk_wzrd *clk_wzrd;
-	struct device_node *np = pdev->dev.of_node;
-	int nr_outputs;
-	unsigned long flags = 0;
-
-	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
-	if (!clk_wzrd)
-		return -ENOMEM;
-	platform_set_drvdata(pdev, clk_wzrd);
-
-	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(clk_wzrd->base))
-		return PTR_ERR(clk_wzrd->base);
-
-	ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
-	if (!ret) {
-		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
-			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
-				 clk_wzrd->speed_grade);
-			clk_wzrd->speed_grade = 0;
-		}
-	}
-
-	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
-	if (IS_ERR(clk_wzrd->clk_in1)) {
-		if (clk_wzrd->clk_in1 != ERR_PTR(-EPROBE_DEFER))
-			dev_err(&pdev->dev, "clk_in1 not found\n");
-		return PTR_ERR(clk_wzrd->clk_in1);
-	}
-
-	clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
-	if (IS_ERR(clk_wzrd->axi_clk)) {
-		if (clk_wzrd->axi_clk != ERR_PTR(-EPROBE_DEFER))
-			dev_err(&pdev->dev, "s_axi_aclk not found\n");
-		return PTR_ERR(clk_wzrd->axi_clk);
-	}
-	ret = clk_prepare_enable(clk_wzrd->axi_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
-		return ret;
-	}
-	rate = clk_get_rate(clk_wzrd->axi_clk);
-	if (rate > WZRD_ACLK_MAX_FREQ) {
-		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
-			rate);
-		ret = -EINVAL;
-		goto err_disable_clk;
-	}
-
-	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
-	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
-	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
-
-	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
-	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
-	mult = (reg * 1000) + reg_f;
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
-	if (!clk_name) {
-		ret = -ENOMEM;
-		goto err_disable_clk;
-	}
-
-	ret = of_property_read_u32(np, "nr-outputs", &nr_outputs);
-	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
-		ret = -EINVAL;
-		goto err_disable_clk;
-	}
-	if (nr_outputs == 1)
-		flags = CLK_SET_RATE_PARENT;
-
-	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
-			(&pdev->dev, clk_name,
-			 __clk_get_name(clk_wzrd->clk_in1),
-			0, mult, 1000);
-	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
-		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
-		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
-		goto err_disable_clk;
-	}
-
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
-	if (!clk_name) {
-		ret = -ENOMEM;
-		goto err_rm_int_clk;
-	}
-
-	ctrl_reg = clk_wzrd->base + WZRD_CLK_CFG_REG(0);
-	/* register div */
-	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_divider
-			(&pdev->dev, clk_name,
-			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
-			flags, ctrl_reg, 0, 8, CLK_DIVIDER_ONE_BASED |
-			CLK_DIVIDER_ALLOW_ZERO, &clkwzrd_lock);
-	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
-		dev_err(&pdev->dev, "unable to register divider clock\n");
-		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
-		goto err_rm_int_clk;
-	}
-
-	/* register div per output */
-	for (i = nr_outputs - 1; i >= 0 ; i--) {
-		const char *clkout_name;
-
-		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
-		if (!clkout_name) {
-			ret = -ENOMEM;
-			goto err_rm_int_clk;
-		}
-
-		if (!i)
-			clk_wzrd->clkout[i] = clk_wzrd_register_divf
-				(&pdev->dev, clkout_name,
-				clk_name, flags,
-				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
-				WZRD_CLKOUT_DIVIDE_SHIFT,
-				WZRD_CLKOUT_DIVIDE_WIDTH,
-				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
-		else
-			clk_wzrd->clkout[i] = clk_wzrd_register_divider
-				(&pdev->dev, clkout_name,
-				clk_name, 0,
-				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
-				WZRD_CLKOUT_DIVIDE_SHIFT,
-				WZRD_CLKOUT_DIVIDE_WIDTH,
-				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
-		if (IS_ERR(clk_wzrd->clkout[i])) {
-			int j;
-
-			for (j = i + 1; j < nr_outputs; j++)
-				clk_unregister(clk_wzrd->clkout[j]);
-			dev_err(&pdev->dev,
-				"unable to register divider clock\n");
-			ret = PTR_ERR(clk_wzrd->clkout[i]);
-			goto err_rm_int_clks;
-		}
-	}
-
-	kfree(clk_name);
-
-	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
-	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
-	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
-
-	if (clk_wzrd->speed_grade) {
-		clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
-
-		ret = clk_notifier_register(clk_wzrd->clk_in1,
-					    &clk_wzrd->nb);
-		if (ret)
-			dev_warn(&pdev->dev,
-				 "unable to register clock notifier\n");
-
-		ret = clk_notifier_register(clk_wzrd->axi_clk, &clk_wzrd->nb);
-		if (ret)
-			dev_warn(&pdev->dev,
-				 "unable to register clock notifier\n");
-	}
-
-	return 0;
-
-err_rm_int_clks:
-	clk_unregister(clk_wzrd->clks_internal[1]);
-err_rm_int_clk:
-	kfree(clk_name);
-	clk_unregister(clk_wzrd->clks_internal[0]);
-err_disable_clk:
-	clk_disable_unprepare(clk_wzrd->axi_clk);
-
-	return ret;
-}
-
-static int clk_wzrd_remove(struct platform_device *pdev)
-{
-	int i;
-	struct clk_wzrd *clk_wzrd = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(pdev->dev.of_node);
-
-	for (i = 0; i < WZRD_NUM_OUTPUTS; i++)
-		clk_unregister(clk_wzrd->clkout[i]);
-	for (i = 0; i < wzrd_clk_int_max; i++)
-		clk_unregister(clk_wzrd->clks_internal[i]);
-
-	if (clk_wzrd->speed_grade) {
-		clk_notifier_unregister(clk_wzrd->axi_clk, &clk_wzrd->nb);
-		clk_notifier_unregister(clk_wzrd->clk_in1, &clk_wzrd->nb);
-	}
-
-	clk_disable_unprepare(clk_wzrd->axi_clk);
-
-	return 0;
-}
-
-static const struct of_device_id clk_wzrd_ids[] = {
-	{ .compatible = "xlnx,clocking-wizard" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
-
-static struct platform_driver clk_wzrd_driver = {
-	.driver = {
-		.name = "clk-wizard",
-		.of_match_table = clk_wzrd_ids,
-		.pm = &clk_wzrd_dev_pm_ops,
-	},
-	.probe = clk_wzrd_probe,
-	.remove = clk_wzrd_remove,
-};
-module_platform_driver(clk_wzrd_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Soeren Brinkmann <soren.brinkmann@xilinx.com");
-MODULE_DESCRIPTION("Driver for the Xilinx Clocking Wizard IP core");
diff --git a/drivers/staging/clocking-wizard/dt-binding.txt b/drivers/staging/clocking-wizard/dt-binding.txt
deleted file mode 100644
index efb67ff..0000000
--- a/drivers/staging/clocking-wizard/dt-binding.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Binding for Xilinx Clocking Wizard IP Core
-
-This binding uses the common clock binding[1]. Details about the devices can be
-found in the product guide[2].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Clocking Wizard Product Guide
-https://www.xilinx.com/support/documentation/ip_documentation/clk_wiz/v5_1/pg065-clk-wiz.pdf
-
-Required properties:
- - compatible: Must be 'xlnx,clocking-wizard'
- - reg: Base and size of the cores register space
- - clocks: Handle to input clock
- - clock-names: Tuple containing 'clk_in1' and 's_axi_aclk'
- - clock-output-names: Names for the output clocks
-
-Optional properties:
- - speed-grade: Speed grade of the device (valid values are 1..3)
-
-Example:
-	clock-generator@40040000 {
-		reg = <0x40040000 0x1000>;
-		compatible = "xlnx,clocking-wizard";
-		speed-grade = <1>;
-		clock-names = "clk_in1", "s_axi_aclk";
-		clocks = <&clkc 15>, <&clkc 15>;
-		clock-output-names = "clk_out0", "clk_out1", "clk_out2",
-				     "clk_out3", "clk_out4", "clk_out5",
-				     "clk_out6", "clk_out7";
-	};
-- 
2.1.1

