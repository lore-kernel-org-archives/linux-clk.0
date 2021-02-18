Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F8DC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A441364E79
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 04:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhBREvS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Feb 2021 23:51:18 -0500
Received: from mail-co1nam11on2087.outbound.protection.outlook.com ([40.107.220.87]:22075
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230295AbhBREvR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Feb 2021 23:51:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xmq5/Qa1ZH1VPEU9bT8vdxm17Lr9yZZSkzRImBg/pxLAThwktVU5jG2quq45xv24cfzZjhjtD62gokRw+EZj3hCyz3gjEPimmHdlXM0dgqjfLAXWBVhyaHC/BP298yjRt7JsFguv3iVs7BM9pp6G8cqFqenlu1uQbLljx2WsKi7oKQcZ2wj9mN5xkvN4hdeNip0Gd+8/ea7gAw0M97xk3k5OyDVqWJANphe+qOvFvc/6/r7eI2ZPua5grO6vstpmHvJgs1yedlKCASfPMZKNxx1el1PsuEsg1MRG27jHFIdat6Ewgtv0K0GIJjfb3jTy1b4TOekDEoqiAUoizfh2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piePE8p91gavipu5CJKchcefOGcrwahdkDbeEzaDfxA=;
 b=HdiXl8Mf2tk0vKRMHn4jlfx28AuTYWYdO+hbJj3yrcUg9Ku3bWjqJx2GlebH2hwxrodpORLZ6udig+tjWkipxaZKFN5DsAnpAsDSH5RG1zdbsyEN0wesneDjstZsqDZRlEFwJbOAHgjhMu+m3tg8TGVnJ2pmMyvSNXVRyHQBJ5HpuhOQF4MPwWadwNQcI2wV2oMK21hsjQdEJqXoOPYAjqZujBw8aOparrUJmpWaGcILazczfW/OroKYRF1Nbr+2w7LpX+djV2T2tmhRlJpuwxRd/THJgq3CuFCz5Q4begxr6Dx+1Q9KOart9kVnyY0SIPW34EfaymHReaFU0t224w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piePE8p91gavipu5CJKchcefOGcrwahdkDbeEzaDfxA=;
 b=i/k2+gGgXMfJ55gRuE6c9P2/2/lzX8zlM7B3g7CYVEWhoS7InNi+sd2qoHp2BLZJswpUpKWAGeiI65EikZV7xRX7ZFP1fXekNJToyQ5VhGI2gLUm26Ge/O4ZLJr6rhlqsJePn7XDtzGf37ns111+BjERaWe3onMr2hMHNUuqcFo=
Received: from DM6PR02CA0127.namprd02.prod.outlook.com (2603:10b6:5:1b4::29)
 by BYAPR02MB5047.namprd02.prod.outlook.com (2603:10b6:a03:66::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 04:50:23 +0000
Received: from DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::57) by DM6PR02CA0127.outlook.office365.com
 (2603:10b6:5:1b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 04:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT047.mail.protection.outlook.com (10.13.4.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 04:50:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 17 Feb 2021 20:50:15 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 17 Feb 2021 20:50:15 -0800
Envelope-to: shubhrajyoti.datta@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com,
 miquel.raynal@bootlin.com
Received: from [10.140.6.59] (port=35054 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1lCbGZ-0004qG-44; Wed, 17 Feb 2021 20:50:15 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <miquel.raynal@bootlin.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v9 5/7] clk: clock-wizard: Add support for fractional support
Date:   Thu, 18 Feb 2021 10:19:49 +0530
Message-ID: <1613623791-4598-6-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c0bd574-8dba-4dfb-3231-08d8d3c8b322
X-MS-TrafficTypeDiagnostic: BYAPR02MB5047:
X-Microsoft-Antispam-PRVS: <BYAPR02MB50476C94D74D8632A38D8B01AA859@BYAPR02MB5047.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0N5vGbtiYwpy9d0K8U7tYBVcOkPM4adbHg+6KUdTFEjtvGFCaFgcbtduLozifZCJBZ1wKpyBBaZLl+Xa4qSxzOi0c5N6Bk7nelOJ1NU4Z8HEU9QVn8Xth7wGfo6u0356ArINV0siIIq/YDWWFJ+yxKppEhLTmYAeBuJCxWv+WJapkZS9iUeCaZsiEhqBYdX/PmhUoyR3JpSFL1N9aH+c5zdyGy2+84T5+e0O2g75E8MfUPYlAKDxM2oMhUWPijFelvnkyV01EFIC1fP9FdEOuZKj2KMU97bdI5TnaAXMUdFmjSMd5k37tchOX/Cx+zc8vEJNaNAT732rLfsN0KK31rpQ7xMOb7rVQdEgkZ5KXOw9a8vAJmjiJw0Lk2Nk89QBmQGipvtVeR9yXp43KBAwdQ2yKVEJ5HDEtPQx7V7u7P+ZeQS7NSh2H1rLl5gDLlnGrDAd+aSqDjbd6Cb/fSPXE/+ZxNg6J7K30j1UwVo01dywGniaj8NwVEmFnz0s92N9P94GeeMdlfED5tjh1TkvexrxLmdCxOkhL5xasCJ7HBUWEZR4eE/KuDUWKnpvhh0UPdDEDcKb/WdjPxwILriPLJRjeaGnUJAlfmDfVQQZQ3U3UCXJbndUPTuFihCOgz40/+y0dRdoJ8PfSCaYqEzSbHKWgPrisRnMJyeIyjULOUEu/CHe5RQAB7C4qcwV0ir
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(46966006)(47076005)(9786002)(6916009)(36860700001)(5660300002)(82740400003)(54906003)(83380400001)(70206006)(6666004)(70586007)(26005)(36756003)(336012)(82310400003)(316002)(8936002)(356005)(44832011)(7696005)(36906005)(4326008)(186003)(426003)(8676002)(2906002)(7636003)(2616005)(107886003)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 04:50:22.4308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0bd574-8dba-4dfb-3231-08d8d3c8b322
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5047
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the set rate granularity is to integral divisors.
Add support for the fractional divisors.
Only the first output0 is fractional in the hardware.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v7:
Remove unnecessary comments
use mult_frac
use a common divisor function.

 drivers/clk/clk-xlnx-clock-wizard.c | 219 ++++++++++++++++++++++++++++++++----
 1 file changed, 199 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
index 5581b24..ed3b0ef 100644
--- a/drivers/clk/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -29,20 +29,25 @@
 
 #define WZRD_CLKFBOUT_MULT_SHIFT	8
 #define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
+#define WZRD_CLKFBOUT_FRAC_SHIFT	16
+#define WZRD_CLKFBOUT_FRAC_MASK		(0x3ff << WZRD_CLKFBOUT_FRAC_SHIFT)
 #define WZRD_DIVCLK_DIVIDE_SHIFT	0
 #define WZRD_DIVCLK_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
 #define WZRD_CLKOUT_DIVIDE_SHIFT	0
 #define WZRD_CLKOUT_DIVIDE_WIDTH	8
 #define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+#define WZRD_CLKOUT_FRAC_SHIFT		8
+#define WZRD_CLKOUT_FRAC_MASK		0x3ff
 
 #define WZRD_DR_MAX_INT_DIV_VALUE	255
-#define WZRD_DR_NUM_RETRIES		10000
 #define WZRD_DR_STATUS_REG_OFFSET	0x04
 #define WZRD_DR_LOCK_BIT_MASK		0x00000001
 #define WZRD_DR_INIT_REG_OFFSET		0x25C
 #define WZRD_DR_DIV_TO_PHASE_OFFSET	4
 #define WZRD_DR_BEGIN_DYNA_RECONF	0x03
 
+#define WZRD_USEC_POLL		10
+#define WZRD_TIMEOUT_POLL		1000
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
 
@@ -52,6 +57,7 @@
 enum clk_wzrd_int_clks {
 	wzrd_clk_mul,
 	wzrd_clk_mul_div,
+	wzrd_clk_mul_frac,
 	wzrd_clk_int_max
 };
 
@@ -186,7 +192,7 @@ static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	div = DIV_ROUND_CLOSEST(*prate, rate);
 
-	return (*prate / div);
+	return *prate / div;
 }
 
 static const struct clk_ops clk_wzrd_clk_divider_ops = {
@@ -195,6 +201,117 @@ static const struct clk_ops clk_wzrd_clk_divider_ops = {
 	.recalc_rate = clk_wzrd_recalc_rate,
 };
 
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
 static struct clk *clk_wzrd_register_divider(struct device *dev,
 					     const char *name,
 					     const char *parent_name,
@@ -229,7 +346,6 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	div->hw.init = &init;
 	div->table = table;
 
-	/* register the clock */
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
@@ -237,7 +353,6 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 
 	return hw->clk;
 }
-
 static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 				 void *data)
 {
@@ -267,6 +382,61 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	}
 }
 
+static int clk_wzrd_register_dividers(struct platform_device *pdev,
+				      const char *clk_name)
+{
+	int i, ret;
+	struct device_node *np = pdev->dev.of_node;
+	int outputs;
+	unsigned long flags = 0;
+	struct clk_wzrd *clk_wzrd = platform_get_drvdata(pdev);
+	const char *clkout_name;
+
+	outputs = of_property_count_strings(np, "clock-output-names");
+	if (outputs == 1)
+		flags = CLK_SET_RATE_PARENT;
+
+	for (i = outputs - 1; i >= 0 ; i--) {
+		if (of_property_read_string_index(np, "clock-output-names", i,
+						  &clkout_name)) {
+			dev_err(&pdev->dev,
+				"clock output name not specified\n");
+			ret = -EINVAL;
+			return ret;
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
+
+		if (IS_ERR(clk_wzrd->clkout[i])) {
+			int j;
+
+			for (j = i + 1; j < outputs; j++)
+				clk_unregister(clk_wzrd->clkout[j]);
+			dev_err(&pdev->dev,
+				"unable to register divider clock\n");
+			ret = PTR_ERR(clk_wzrd->clkout[i]);
+			return ret;
+		}
+	}
+	return 0;
+}
 static int __maybe_unused clk_wzrd_suspend(struct device *dev)
 {
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
@@ -298,8 +468,8 @@ static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 
 static int clk_wzrd_probe(struct platform_device *pdev)
 {
-	int i, ret;
-	u32 reg;
+	int ret;
+	u32 reg, reg_f, mult;
 	unsigned long rate;
 	const char *clk_name;
 	struct clk_wzrd *clk_wzrd;
@@ -349,17 +519,13 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	/* we don't support fractional div/mul yet */
-	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
-		    WZRD_CLKFBOUT_FRAC_EN;
-	reg |= readl(clk_wzrd->base + WZRD_CLK_CFG_REG(2)) &
-		     WZRD_CLKOUT0_FRAC_EN;
-	if (reg)
-		dev_warn(&pdev->dev, "fractional div/mul not supported\n");
+	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
+	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
+	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
 
-	/* register multiplier */
-	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
-		     WZRD_CLKFBOUT_MULT_MASK) >> WZRD_CLKFBOUT_MULT_SHIFT;
+	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
+	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
+	mult = (reg * 1000) + reg_f;
 	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
@@ -368,8 +534,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clk_in1),
-			 0, reg, 1);
-	kfree(clk_name);
+			0, mult, 1000);
 	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
 		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
 		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
@@ -407,8 +572,18 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 			ret = -EINVAL;
 			goto err_rm_int_clks;
 		}
-		clk_wzrd->clkout[i] = clk_wzrd_register_divider(&pdev->dev,
-								clkout_name,
+		if (!i)
+			clk_wzrd->clkout[i] = clk_wzrd_register_divf
+				(&pdev->dev, clkout_name,
+				clk_name, 0,
+				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				NULL, &clkwzrd_lock);
+		else
+			clk_wzrd->clkout[i] = clk_wzrd_register_divider
+				(&pdev->dev, clkout_name,
 				clk_name, 0,
 				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
 				WZRD_CLKOUT_DIVIDE_SHIFT,
@@ -427,6 +602,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = clk_wzrd_register_dividers(pdev, clk_name);
+	if (ret)
+		goto err_rm_int_clks;
+
 	kfree(clk_name);
 
 	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
-- 
2.1.1

