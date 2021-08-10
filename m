Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF5EC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E053360EBB
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 07:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhHJH0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 03:26:32 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:39040
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhHJH0Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 10 Aug 2021 03:26:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5uiX0fPf5wpfsYJv2E/GClmUNhLODalisAG5+T9ggdxtePjpzDUldNsSbL8MpLZ/t13gz18RAU93aW6xIhbvdjrnarDVAFocIj4W8NqDfVEtfglzRc5Q0k117LOwWYm11skSvqJN1PDw1RCcnH8neXOUPs/1ONbgPHWMPowQ1uI2yDLzG6DL6SjAKG/Ywsb+3eQAv3rsEa7RNqaK9cb1/aJ5eNeyJ1RIX8CMJ+Dyq/MgYhX9b6kgLFyQdMxujzMgGlRQPf9CJ5BAoUcDtKWOCJgaOcTC1sD/BdQrbzlSf6ciw2xvQEddg+EbdANk4Ev5BDw0aJ6HyjKAlPbOCy5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpJ+3mqkTOVXlCa8e+hyf9bnKf+lENWSyyBWyPcd9hM=;
 b=DvmE95WnQLs2fpXAdV1uvgVZQKwPZULp+Hm3oQQIlnMm0d+9BxQMjbAZBBCeEK3XgB/4Vk86iMBcJg8ScrCg5pJsJoBNC6sNrNzSGjf6eqwVTeC+suy5GCWmRUYSELOBdrxCBcGj8/jxHXH+nB6UlE+F2XW+9/XUMJrnNfD+9YzM4OkwdVBJZ1KVcJxIDLPbjB/UbF9s5+ZnawBHmFuDSy4IQWN9wax6mM+QVFRjDnhjcEc5h6ztq5PcLrKOvHAj3l/lSUz73DEkmFfw36e8GQd6eKul65jyU58JejBtGPTKcEDo/+7bA9C8QKxu9PQazDKlAr5lZIfztZfmSRwIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpJ+3mqkTOVXlCa8e+hyf9bnKf+lENWSyyBWyPcd9hM=;
 b=ZkiwmcUWANc6FOlAOi2MQwomv9QoTSps+ogpf84tJQM5wTkqh1nA/mqJYBdEc2jFNGHDKo3+BdvFcb3Zpn/DM6GjhZyj+2BRiRBTkwGkvBdvrI3PirobTS8QTriPea8c6ODAWbejRRHYr0vZpTt1jBFr8igVzPoaFfYLswOxAMo=
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by SN1PR02MB3694.namprd02.prod.outlook.com (2603:10b6:802:2c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 07:25:59 +0000
Received: from BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::ed) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Tue, 10 Aug 2021 07:25:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT057.mail.protection.outlook.com (10.13.2.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 07:25:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 10 Aug 2021 00:25:42 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 10 Aug 2021 00:25:42 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=48216 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mDM8q-0005zG-Tl; Tue, 10 Aug 2021 00:25:41 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v12 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
Date:   Tue, 10 Aug 2021 12:55:30 +0530
Message-ID: <20210810072533.27620-3-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
References: <20210810072533.27620-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 103af16e-dd0b-4906-bbc9-08d95bd019a9
X-MS-TrafficTypeDiagnostic: SN1PR02MB3694:
X-Microsoft-Antispam-PRVS: <SN1PR02MB36944854226A6E42346C1903AAF79@SN1PR02MB3694.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4bdYc+m71OiphGC/7kHyeDh/y8dQddy+zwf1JyK7AYdWrbQ2MKenqMtJc7mOGNxLizsiAVgQeiSOlLbf7zXCb/9iu8SKQcic0RMH0GXc3bWCMiHebcDe3OCJDIMaSWyBOcQerx8BFF5+pS2+sBbp5I1+zYkKItjJrGfX7TCEeKdNjf4sbgmPp1CET52WHOwfZKJeUBwBIsPTz6Nl9ARM40psrRqt8yxTV1KK/Rm0lENX5xkg0Z0ASjCgIWRkx9CImeNH4ycpBar34ZjBFwky9lg2blGQGeIT4VRDop3BcnP+da+gWY0vhpwhZdQyqbbPIG1u/QgPXL7MBVjVqc187bTqyE75m68ctAhtcdmsObfViUJLNK09x5tKOS22J/hXSW7Vpmyo/8X4BJgSWs+qlLdxYi8hbIcs47hfu4tkKWV65H8oU6z2cVtkSSzSuWDgiec0cdJAlKPVoGAjEejQsop9msJd3wml3RMEu+2m62qSyL5XugfVoyMc/mqQTNXekXedBBgvQk55jYIPGv/v98o3awXR8rJgB+4evOFiAub978vhTVWVswXXf1Jz1d7bkWk/uDqMVNXRhdV5mh4vC4Dn2zw1yNNyYri4X9C6MZw1zpWee3g17RyIYTkCmr2Ya5y/zhzuuXNNsHRVtiaLkE7oJpBdQ251RBfL1ZvyfWjipmbt3zTagJZYMNtqGALCyXOhCYnalLTURZn7JO9GlnUlMsUmYXxG/xP6UlPzmg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(66574015)(83380400001)(478600001)(336012)(9786002)(186003)(6666004)(54906003)(6636002)(316002)(36906005)(356005)(4326008)(110136005)(36756003)(107886003)(82310400003)(426003)(47076005)(2616005)(30864003)(1076003)(8936002)(70206006)(36860700001)(70586007)(82740400003)(8676002)(2906002)(5660300002)(7696005)(26005)(44832011)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:25:59.0185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 103af16e-dd0b-4906-bbc9-08d95bd019a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3694
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocking wizard driver to clk.
And delete the driver from the staging as it is in drivers/clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---

 drivers/clk/Kconfig                 |   9 +
 drivers/clk/Makefile                |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c | 635 ++++++++++++++++++++++++++++
 3 files changed, 645 insertions(+)
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e873f9ea2e65..22817be89bd8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -390,6 +390,15 @@ config COMMON_CLK_K210
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
index 2b91d34c582b..15a75aa3f351 100644
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
index 000000000000..ec377f0d569b
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
-- 
2.17.1

