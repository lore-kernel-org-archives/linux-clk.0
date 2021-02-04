Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C931C433E6
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46D3D64F10
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 13:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236482AbhBDNze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:55:34 -0500
Received: from mail-bn7nam10on2057.outbound.protection.outlook.com ([40.107.92.57]:54241
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236461AbhBDNzP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 08:55:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npOJY1bK34Mvjfd7M1xLCZTb24yHg5t5/AXFDGN6uHZrLMqSK8F74FY2+qjkzxwmgvqKttQQmrDlNAVP+6+RFH+AuqrR3Kaf4+KMmlP41WzzAL6JkqHTbJcRMcOdHTNgB4eo9AtX2mh2PHaFRfP7Z2sMk52Ae8zebbHytRP2tV0s5eODTjLFKrrrh2E2ItXPB3sIVDsK984pv1GKYQ0vpxK8rtnlpVmbaBSEFxGYq/lAejbnq/zN0/1i8M27iu9R/Qp7cdLpRRmMDZ4OODPnTQT9uSKPHSYJD26rrRKI7uKx2JdvjSvk/WTYLE0+PSQZC0ufionH6XkUcDQs+seQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piePE8p91gavipu5CJKchcefOGcrwahdkDbeEzaDfxA=;
 b=YzL8ysX/8P3FztQtS1odqe1FKUH1omezh047PTgnmKgslEUZRXsjAGtz/FfcCBuJfGzOyTDKE1JWRk2RgcbJyelVSDcj56k9Vo1hpvcnzoN3jqIdiyba4O+c7PQ0sp4H/WwJw9UmiBw1trBT7wic6G/ZLw0QqNG+kPq2RyBY0sxwiykaaI7NvkIf8nrefy3MtxBzwTjgKZ5kYUi7TTeCgSTc8apdvrOcyDnV04VV/DlGMqMgD3cVb0yJONbZFjbrV/TaS2yZyD1+tSZnJ86c0c7vlXXL4Ah85GbsIvOtZ2jMSmy+cYWCffCE4LOtypLzWV4nJQOVn2/UDnyCf63h+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piePE8p91gavipu5CJKchcefOGcrwahdkDbeEzaDfxA=;
 b=QcDzf3w5KB+q5ss6/aVQwmM7luK6DwQXjZWIj6KSxpUH6oPerBg409brgh5iaLD670Y9A3ki5AlexhBTugsRDWQuYw4iEe2G0kz3g1phy4U1nWmFpOsdGwaPyOfMlrYG5hTACGGJ5FLgcGsxyBh2jqwJXbF664xd0hp7fBkAkaU=
Received: from SA0PR11CA0173.namprd11.prod.outlook.com (2603:10b6:806:1bb::28)
 by BYAPR02MB5448.namprd02.prod.outlook.com (2603:10b6:a03:9b::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Thu, 4 Feb
 2021 13:54:13 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::4d) by SA0PR11CA0173.outlook.office365.com
 (2603:10b6:806:1bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 13:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Thu, 4 Feb 2021 13:54:12 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 05:53:49 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 05:53:49 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@gmail.com,
 sboyd@kernel.org,
 robh+dt@kernel.org,
 gregkh@linuxfoundation.org
Received: from [10.140.6.59] (port=57876 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1l7f4u-0000Tm-BU; Thu, 04 Feb 2021 05:53:48 -0800
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <git-dev@xilinx.com>
CC:     <devicetree@vger.kernel.org>, <shubhrajyoti.datta@gmail.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v8 5/7] clk: clock-wizard: Add support for fractional support
Date:   Thu, 4 Feb 2021 19:23:28 +0530
Message-ID: <1612446810-6113-6-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a419df1-b8af-46eb-b582-08d8c9145a88
X-MS-TrafficTypeDiagnostic: BYAPR02MB5448:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5448C6383E71DA18AE16F25EAAB39@BYAPR02MB5448.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvwv0jiX/5+tykcbLTvUcQ1cvXnyAuEWMZpoKeS+Tcj82TB6wqFDl6ZeDADjLyfIvQ5h7qEclMJIX0TYsUPjRv7exP6LgXYmdX8OIGa8ONTDFuJ1OClfzbKk9Aap671a700DE6ke25sG5h9Cn7ljEaRDvj8UVCiWU8BOWQs6rvQTVbvVgFcVuYm7k4+apmdQ6vcPxwvZoRDosn9tBy88i2N9DEVn4ExILSt0dgTM9yi9NXNmen9y8WUw4VWP5k6vQiD0af1ZGg4qRuncIc6sI4t6Y3sqRxa4u3IncUWekmwjpjKUMEF2h3cFi37xZNNSS2cmIZ/5J5vDnL5RcU9cbWvexjFp/9xRi9RKHSNFke+TrHyVdbM13Tx2VCpga1l68905NaPoot7ry8Ptp60FGabQgjFyh1V3RxP/Qq8/2FJgUmf+tOlvdX3UDAdxh+nVGTYA28GLQbbGDSFz8k2VVY8gI1wgEyZ6s2hPfebT9vEQlQGERJYF3PL2mkRmmJRqUt2gdkeuDvHBn5ItfdsRF71iflRbcQZwzjm6cLvF8Hs8mDvT7NRMITsVH4BcoMowCg2vln51yPZbDiUAZgoGYVUNCh8y7ZlYOr97HtX4ISAwyCaVrGzGivO+dETkuaeJhpRS325c5iIwRpbkfs6qnB2r8tFBxPpAtd52piVH7Vma8jf0DoGtre4T99W6pVBM
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(70586007)(7636003)(82740400003)(107886003)(70206006)(110136005)(9786002)(36906005)(44832011)(356005)(316002)(8936002)(4326008)(26005)(82310400003)(336012)(6636002)(8676002)(186003)(2616005)(426003)(478600001)(5660300002)(6666004)(2906002)(54906003)(83380400001)(36860700001)(36756003)(7696005)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:54:12.7563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a419df1-b8af-46eb-b582-08d8c9145a88
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5448
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

