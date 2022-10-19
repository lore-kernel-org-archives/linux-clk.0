Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A7AC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 19 Oct 2022 05:37:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiJSFhF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Oct 2022 01:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiJSFhE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2022 01:37:04 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B644E19B
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 22:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbgSzXBVX53db7wNo2Gmxpm9fZGT9HQEwVqUaamoVHgZT+yoZSTVZ2TPD7yx8DPyUOjPB7LIkhaEmJsnt6VP+G1ZF7E8PaWtN5wE0jEtSc0natORIfnzk+H8iMk1Gr3THKiG3Eu4tdYnTr6hWVCQyZw/8hIN59cgCoBs9JgOdJqdfHboygqGmPMLddzgNuxE2l0rTZjt7rafBYMUXSCiZcQFs2hPdZxJe1jxnDNvvQw4/Qd9aGwDr7/hgMeSU9t/OgK4oWQnQkry6QDE16rzmZy5N0fa3fwdgDRpydr3f9P91xWscm77EdspQSSla2rwl+/euUdF+bUZ83c9Uwl+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jF/xDOfMi48rbJ5c/nOvBDysma8gjrqZeR9Mi8V0Ghg=;
 b=U3pJ4de+kUuCZJXjkkVzN1bfDJhw4lP15xnqBc5wbOqpKxWUvMm++/a1OEQ3hwVsOJdCZU1V4FUfaej8OAYGcUbeUpkbKMqEcCNEYL8rZPlym2NRLzjgFl1wQ06CR1vmy2iBwZCgjZGAGBHzJoQPFFloPvrLFGIp481Av3PMfKLeLexWjLYqSD2B2qoBYs5cJqxKh74qCPP2WxH7xAPyNBoKTVUe0gxnqY6/P9y+JOe0aQZWSgNR5ma2uG/uweUzO8AcqrGmuFn3VRBJ41ejLDSPiIvWDA58aPfCUKFy0ZetoIHKT0QCr7FqG2jH5I7ZleCz3oTYZRGyD8CigcVviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF/xDOfMi48rbJ5c/nOvBDysma8gjrqZeR9Mi8V0Ghg=;
 b=HGcEmS+SAGHTtU1U92bg/JORz5z71axkJ7qa7eyj3jYniAxHR5W/SBcuW4gKgvx+WrgRvvuRtXIMzYQ9L6ZvOnbh9dGs+6mkE0Z5WYTtIMHORAlvDzzqWjhMjhw7tCGmg1GbG9xi/TgT+l8KcGLp2SPKk/nqnQrE3N5JwyjzLnc=
Received: from MW4PR04CA0276.namprd04.prod.outlook.com (2603:10b6:303:89::11)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 05:36:59 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::6d) by MW4PR04CA0276.outlook.office365.com
 (2603:10b6:303:89::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32 via Frontend
 Transport; Wed, 19 Oct 2022 05:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 05:36:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:36:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 00:36:57 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 00:36:55 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
Subject: [PATCH] clocking-wizard: Support higher frequency accuracy
Date:   Wed, 19 Oct 2022 11:06:54 +0530
Message-ID: <20221019053654.22234-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a8509b-26ef-4b4d-f764-08dab193f139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: daZQZ5xwZJNNG9xqlSAAuCJoCuNPj7EArV+llcw2Hf+BNhjuec3CivV8vSlZo/x9Fh5MSWBde9QxdYCiJouaYEJue9wFeu+0x732uyQb8cbQ9LZwMaTjhjaqmwag1WAX+JTp3yIJphnxTNOTgFkpQmMbeAUexXmKpmAGMt2XJVZwoHQ0P4WvMCUBnJfwJMeZ0eLYoIKkVBsKk+yn7yveNj1OWg2dw9e6S25ELIcvDec3AuTgJTz7aN1sFK15YaR5rZx/cNF8tSFrc1fUqFwZ0FbUR/WHF12U+MGbpeHUT8R/DEiQxDRdKicalWA3+0iuAoImOmDcEyydGDZtaYj4zWJbyJwSYT6URua/l9WbtbT9ryxUs45K6zbk8ZUHCK+eaIVwwCrNnZ2prEdS/s7jdaBbpBu9+RiPKZxErkhdSGxN7rv5cGkT8CXAByRQoDwLF7WHBiqP2yd+PXz2EpCa3BXXf7tXSHex6Wa+i2UZYcmrefuI+3hs6eS3Xb2p9MMElWi4NZam1dWigqBEQtspojCRaeIoXPq/fVDpFyFHJOJv0tcNyvA4ocKqBu0Sp8pK0vjsf5uuf+Y/qJMy/+wGJkYXJ3Bw2KWhWQOH1skY3sU1Wfs+zLxX1/IzsT+P5+OsvkPknSuZ+G7lrVj8XFJmfkDfxaSU3Uie8xG+8/xknuSbsNzqGFyQH2SiJ331/gU/Cd+amGZqBEYBdMiNSRGfd+85odzZdBUiz6fKotUuYLV3zcaKnarYDvRENyt0G+SK0rpGKTa8tUEwZzrBuDaiuGwc52aiu300EYiGc17g22SzOVqZAs+uXlRAIfbSQ4jj
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(70206006)(36756003)(478600001)(8676002)(316002)(82310400005)(70586007)(6916009)(4326008)(54906003)(41300700001)(81166007)(40480700001)(40460700003)(26005)(36860700001)(186003)(336012)(2616005)(86362001)(47076005)(82740400003)(83380400001)(356005)(1076003)(426003)(5660300002)(30864003)(44832011)(8936002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:36:59.0044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a8509b-26ef-4b4d-f764-08dab193f139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change the multipliers and divisors to support a higher
frequency accuracy if there is only one output.
Currently only O is changed now we are changing M, D and O.
For multiple output case the earlier behavior is retained.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---


 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 217 +++++++++++++++++++--
 1 file changed, 198 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index eb1dfe7ecc1b..2835cfa9c492 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -8,6 +8,7 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -37,6 +38,7 @@
 #define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
 #define WZRD_CLKOUT_FRAC_SHIFT		8
 #define WZRD_CLKOUT_FRAC_MASK		0x3ff
+#define WZRD_CLKOUT0_FRAC_MASK		GENMASK(17, 8)
 
 #define WZRD_DR_MAX_INT_DIV_VALUE	255
 #define WZRD_DR_STATUS_REG_OFFSET	0x04
@@ -49,6 +51,22 @@
 
 #define WZRD_USEC_POLL		10
 #define WZRD_TIMEOUT_POLL		1000
+
+/* Divider limits, from UG572 Table 3-4 for Ultrascale+ */
+#define DIV_O				0x01
+#define DIV_ALL				0x03
+
+#define WZRD_M_MIN			2
+#define WZRD_M_MAX			128
+#define WZRD_D_MIN			1
+#define WZRD_D_MAX			106
+#define WZRD_VCO_MIN			800000000
+#define WZRD_VCO_MAX			1600000000
+#define WZRD_O_MIN			1
+#define WZRD_O_MAX			128
+#define WZRD_MIN_ERR			20000
+#define WZRD_FRAC_POINTS		1000
+
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
 
@@ -97,6 +115,9 @@ struct clk_wzrd {
  * @width:	width of the divider bit field
  * @flags:	clk_wzrd divider flags
  * @table:	array of value/divider pairs, last entry should have div = 0
+ * @valuem:	value of the multiplier
+ * @valued:	value of the common divider
+ * @valueo:	value of the leaf divider
  * @lock:	register lock
  */
 struct clk_wzrd_divider {
@@ -107,6 +128,9 @@ struct clk_wzrd_divider {
 	u8 width;
 	u8 flags;
 	const struct clk_div_table *table;
+	u32 valuem;
+	u32 valued;
+	u32 valueo;
 	spinlock_t *lock;  /* divider lock */
 };
 
@@ -198,12 +222,151 @@ static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate / div;
 }
 
+static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, freq, diff;
+	u32 m, d, o;
+	u64 diff2 = U64_MAX;
+
+	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
+		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
+			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
+			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
+				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
+					freq = DIV_ROUND_CLOSEST(vco_freq, o);
+					diff = abs(freq - rate);
+
+					if (diff < WZRD_MIN_ERR) {
+						divider->valuem = m;
+						divider->valued = d;
+						divider->valueo = o;
+						return 0;
+					}
+					if (diff < diff2) {
+						divider->valuem = m;
+						divider->valued = d;
+						divider->valueo = o;
+						diff2 = diff;
+					}
+				}
+			}
+		}
+	}
+	return -EBUSY;
+}
+
+static int clk_wzrd_dynamic_all_nolock(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, rate_div, f, clockout0_div;
+	u32 reg, pre, value;
+	int err;
+
+	err = clk_wzrd_get_divisors(hw, rate, parent_rate);
+	if (err)
+		return err;
+
+	vco_freq = DIV_ROUND_CLOSEST((parent_rate * divider->valuem), divider->valued);
+	rate_div = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
+
+	clockout0_div = rate_div / WZRD_FRAC_POINTS;
+
+	pre = DIV_ROUND_CLOSEST((vco_freq * WZRD_FRAC_POINTS), rate);
+	f = (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));
+	f = f & WZRD_CLKOUT_FRAC_MASK;
+
+	reg = FIELD_PREP(WZRD_CLKOUT_DIVIDE_MASK, clockout0_div) |
+	      FIELD_PREP(WZRD_CLKOUT0_FRAC_MASK, f);
+
+	writel(reg, divider->base + WZRD_CLK_CFG_REG(2));
+	/* Set divisor and clear phase offset */
+	reg = FIELD_PREP(WZRD_CLKFBOUT_MULT_MASK, divider->valuem) |
+	      FIELD_PREP(WZRD_DIVCLK_DIVIDE_MASK, divider->valued);
+	writel(reg, divider->base + WZRD_CLK_CFG_REG(0));
+	writel(divider->valueo, divider->base + WZRD_CLK_CFG_REG(2));
+	writel(0, divider->base + WZRD_CLK_CFG_REG(3));
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		return -ETIMEDOUT;
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
+	if (err)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int clk_wzrd_dynamic_all(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long flags = 0;
+	int ret;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	ret = clk_wzrd_dynamic_all_nolock(hw, rate, parent_rate);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return ret;
+}
+
+static unsigned long clk_wzrd_recalc_rate_all(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	u32 m, d, o, div, reg, f;
+
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(0));
+	d = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+	m = FIELD_GET(WZRD_CLKFBOUT_MULT_MASK, reg);
+	reg = readl(divider->base + WZRD_CLK_CFG_REG(2));
+	o = FIELD_GET(WZRD_DIVCLK_DIVIDE_MASK, reg);
+	f = FIELD_GET(WZRD_CLKOUT0_FRAC_MASK, reg);
+
+	div = DIV_ROUND_CLOSEST(d * (WZRD_FRAC_POINTS * o + f), WZRD_FRAC_POINTS);
+	return divider_recalc_rate(hw, parent_rate * m, div, divider->table,
+			divider->flags, divider->width);
+}
+
+static long clk_wzrd_round_rate_all(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	return rate;
+}
+
 static const struct clk_ops clk_wzrd_clk_divider_ops = {
 	.round_rate = clk_wzrd_round_rate,
 	.set_rate = clk_wzrd_dynamic_reconfig,
 	.recalc_rate = clk_wzrd_recalc_rate,
 };
 
+static const struct clk_ops clk_wzrd_clk_div_all_ops = {
+	.round_rate = clk_wzrd_round_rate_all,
+	.set_rate = clk_wzrd_dynamic_all,
+	.recalc_rate = clk_wzrd_recalc_rate_all,
+};
+
 static unsigned long clk_wzrd_recalc_ratef(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
@@ -280,7 +443,7 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 					  void __iomem *base, u16 offset,
 					  u8 shift, u8 width,
 					  u8 clk_divider_flags,
-					  const struct clk_div_table *table,
+					  u32 div_type,
 					  spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -307,7 +470,7 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
+	div->table = NULL;
 
 	hw = &div->hw;
 	ret =  devm_clk_hw_register(dev, hw);
@@ -324,7 +487,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 					     void __iomem *base, u16 offset,
 					     u8 shift, u8 width,
 					     u8 clk_divider_flags,
-					     const struct clk_div_table *table,
+					     u32 div_type,
 					     spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -337,7 +500,12 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
-	init.ops = &clk_wzrd_clk_divider_ops;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_ro_ops;
+	else if (div_type == DIV_O)
+		init.ops = &clk_wzrd_clk_divider_ops;
+	else
+		init.ops = &clk_wzrd_clk_div_all_ops;
 	init.flags = flags;
 	init.parent_names =  &parent_name;
 	init.num_parents =  1;
@@ -349,7 +517,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
+	div->table = NULL;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
@@ -425,6 +593,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	const char *clk_name;
 	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
+	const char *clkout_name;
 	struct device_node *np = pdev->dev.of_node;
 	int nr_outputs;
 	unsigned long flags = 0;
@@ -469,6 +638,26 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	clkout_name = kasprintf(GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
+	if (nr_outputs == 1) {
+		clk_wzrd->clkout[0] = clk_wzrd_register_divider
+				(&pdev->dev, clkout_name,
+				__clk_get_name(clk_wzrd->clk_in1), 0,
+				clk_wzrd->base, WZRD_CLK_CFG_REG(3),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				DIV_ALL, &clkwzrd_lock);
+
+		goto out;
+	}
+
 	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0));
 	reg_f = reg & WZRD_CLKFBOUT_FRAC_MASK;
 	reg_f =  reg_f >> WZRD_CLKFBOUT_FRAC_SHIFT;
@@ -481,19 +670,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err_disable_clk;
 	}
-
-	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
-	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
-		ret = -EINVAL;
-		goto err_disable_clk;
-	}
-	if (nr_outputs == 1)
-		flags = CLK_SET_RATE_PARENT;
-
 	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
 			(&pdev->dev, clk_name,
 			 __clk_get_name(clk_wzrd->clk_in1),
 			0, mult, 1000);
+	kfree(clk_name);
 	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
 		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
 		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
@@ -521,8 +702,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 	/* register div per output */
 	for (i = nr_outputs - 1; i >= 0 ; i--) {
-		const char *clkout_name;
-
 		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
 		if (!clkout_name) {
 			ret = -ENOMEM;
@@ -537,7 +716,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		else
 			clk_wzrd->clkout[i] = clk_wzrd_register_divider
 				(&pdev->dev, clkout_name,
@@ -546,7 +725,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		if (IS_ERR(clk_wzrd->clkout[i])) {
 			int j;
 
@@ -560,7 +739,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	kfree(clk_name);
-
+out:
 	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
 	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
-- 
2.17.1

