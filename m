Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A734C74A5B
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 07:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCQHfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 03:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCQHfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 03:35:53 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CC615CBF
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 00:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjfkpkWwYw3sOEwfwFPJvc6Z5lrelUnMJvmheKUytHYmpF2oR8sXAiP4K2/7DMB5VP8TXoclQj4eUPY3jTe5aGsz4ecZFR9S95Q6hFRHGSaMT8ZdchKqnnc66Wp6r4OjAKqwevkuyRFt5VhfAcX81SJZc8Ue3kVAwnQ8VMHNB3JX0RAHDjlHLN1AVXZK/tyHPBH3bq8PLZHrHnqXH30S0BjHn4RFbkkblM8yXqyASq2t9Wab99PoBgxYBLrgrLHtBXcnGgy1GZur+l6MlePfM+G/3NTH3Phf8Q/XmXOoVC/584tyGJXYOUhjp29RvK+xS3KeuP0uJHU1PGWLwc/wFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9K2+GH8JuKOLw4YwS3Yu6CAt5CttkNqF93LC0fEkJk=;
 b=dllu0H0i8GMJt/81f3y3ylZww9nrKI+XuH2Fzg1v+5YPQoBoxQQyy/CkB4sXKRD+axEIPTHvPmZjrhMcfdQebGLXV0Rnq0Q2FVAT3ABMYsEuAXcyDJVl1V8niJ8eP/YDCm7ovANJULIhMAA4t9dBqqQsnWniPyShP4qJ78e57TEc7KHLdESkHh30he0nVhEzSvmL90uID7wByg4hb6dtEXlaivDq/QZc8okrpJprTcJ408qi/liiU8onX5MYKiv59kc0qVqHgHuHY1HPuFWmsRWZXuAcdHO8G8KS6DzQw11zHQS2jEbs/oyf9vyuxrR59wB556OMgPbZ1APPOU9s6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9K2+GH8JuKOLw4YwS3Yu6CAt5CttkNqF93LC0fEkJk=;
 b=tajTF6GTNS1tWwo9WlCLab2XOJ/a/V2AYiWZBEh8qkK+P/FXYX73hovBUc6k77oPNvbamtCM/OkiVHpWsuhoDh9l34GzpPKbMKN3kwDO+kpEyiXpSg4yAm4badzc25gMsHmnbe5YqdBoufpe957wUc+avmlJUzM6V19u+wnBKUE=
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 07:35:43 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::a2) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33 via Frontend
 Transport; Fri, 17 Mar 2023 07:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6199.20 via Frontend Transport; Fri, 17 Mar 2023 07:35:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Mar
 2023 02:35:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 17 Mar
 2023 00:35:41 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 17 Mar 2023 02:35:40 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <michal.simek@xilinx.com>
Subject: [PATCH v3] clocking-wizard: Support higher frequency accuracy
Date:   Fri, 17 Mar 2023 13:05:39 +0530
Message-ID: <20230317073539.13288-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 7084020d-37f2-4273-f151-08db26ba3755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SvG6z/cKBrOoR7gvMmV//x79IvDAhH/J9G6E9/cson/GEPmoF3hsHKexhLsKZklsOFbFpA8SH+BofTwNr1cZhW3UQrTKwKd16/iqktdPCWpOhtCGe8TlgdykyP7dDESIGkSNiLsJnDPR0LZPb31R6qCpUDr+Cjbu2CYFwt4H359fDfc7U3hdnZgEM/KKERlc0BOXhotjmp+ZuIbZvs6sfa0mPl9n+JOqwAxQzDxi4rEgRzFHXCjJzEwxw9gnYDaml50thoyzQ0b5K9YQ+4D3WSIfrTQVjEmN45Ja70xSwGD9qKiYB5IKjWjzbWgHL/r5vIApWg8F+u8Sr169dXDkbcvLZqqzMqBQq7XbczGetWXji2O7x/acovm0FYbjWlbRKohLvj3nB701lZC6lDJp1OMl4oIK9GaZnVPfGMhUXjuFaC29VD282AR09qFbrqBsDSY+h3LjOhg4DmqrRB7TdfLPqXBZ2DsbOvV6uouotH9WYG6CyyE70Y0j8EDDZf8daDhypl+2Zhy/vNtddoXw4jZsPGjO1Q2GKVujoZ1ra0TV5OQKRYhP1TTuym29hACcRcCM4MUEJGdSdt7GIbKiCjIOKxu14vcsB1g+CU347S1+aa9pIHTF+DyfAoT9AK8Yho+rHym62YwvSVD7uD1s2UiiCcgTYThHPq7tNKVOpYIDbsNQu0yQhyMeS2WTStQoFTtsLbiB+tylphRya0ebtrnUnWRP/AsaDsvCDK0jEng=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(40470700004)(46966006)(36840700001)(36860700001)(81166007)(36756003)(82740400003)(356005)(86362001)(30864003)(44832011)(5660300002)(2906002)(8676002)(6916009)(4326008)(70206006)(70586007)(8936002)(41300700001)(82310400005)(336012)(47076005)(426003)(40460700003)(2616005)(186003)(83380400001)(478600001)(40480700001)(316002)(54906003)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 07:35:43.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7084020d-37f2-4273-f151-08db26ba3755
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Change the multipliers and divisors to support a higher
frequency accuracy if there is only one output.
Currently only O is changed now we are changing M, D and O.
For multiple output case the earlier behavior is retained.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Move to devm
Remove the extra paranthesis
remove the cast

Changes in v2:
remove an unneeded assignment

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 213 ++++++++++++++++++---
 1 file changed, 189 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index c495d709f9e2..6828911b6342 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -8,12 +8,14 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
@@ -37,6 +39,7 @@
 #define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
 #define WZRD_CLKOUT_FRAC_SHIFT		8
 #define WZRD_CLKOUT_FRAC_MASK		0x3ff
+#define WZRD_CLKOUT0_FRAC_MASK		GENMASK(17, 8)
 
 #define WZRD_DR_MAX_INT_DIV_VALUE	255
 #define WZRD_DR_STATUS_REG_OFFSET	0x04
@@ -49,6 +52,22 @@
 
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
 
@@ -97,6 +116,9 @@ struct clk_wzrd {
  * @width:	width of the divider bit field
  * @flags:	clk_wzrd divider flags
  * @table:	array of value/divider pairs, last entry should have div = 0
+ * @valuem:	value of the multiplier
+ * @valued:	value of the common divider
+ * @valueo:	value of the leaf divider
  * @lock:	register lock
  */
 struct clk_wzrd_divider {
@@ -107,6 +129,9 @@ struct clk_wzrd_divider {
 	u8 width;
 	u8 flags;
 	const struct clk_div_table *table;
+	u32 valuem;
+	u32 valued;
+	u32 valueo;
 	spinlock_t *lock;  /* divider lock */
 };
 
@@ -198,12 +223,140 @@ static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
 	return *prate / div;
 }
 
+static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	unsigned long vco_freq, freq, diff;
+	u32 m, d, o;
+
+	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
+		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
+			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
+			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
+				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
+					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
+					diff = abs(freq - rate);
+
+					if (diff < WZRD_MIN_ERR) {
+						divider->valuem = m;
+						divider->valued = d;
+						divider->valueo = o;
+						return 0;
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
+	vco_freq = DIV_ROUND_CLOSEST(parent_rate * divider->valuem, divider->valued);
+	rate_div = DIV_ROUND_CLOSEST_ULL((vco_freq * WZRD_FRAC_POINTS), rate);
+
+	clockout0_div = div_u64(rate_div,  WZRD_FRAC_POINTS);
+
+	pre = DIV_ROUND_CLOSEST_ULL(vco_freq * WZRD_FRAC_POINTS, rate);
+	f = (u32)(pre - (clockout0_div * WZRD_FRAC_POINTS));
+	f &= WZRD_CLKOUT_FRAC_MASK;
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
+	return readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET, value,
+				 value & WZRD_DR_LOCK_BIT_MASK,
+				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
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
@@ -280,7 +433,7 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 					  void __iomem *base, u16 offset,
 					  u8 shift, u8 width,
 					  u8 clk_divider_flags,
-					  const struct clk_div_table *table,
+					  u32 div_type,
 					  spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -307,7 +460,6 @@ static struct clk *clk_wzrd_register_divf(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret =  devm_clk_hw_register(dev, hw);
@@ -324,7 +476,7 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 					     void __iomem *base, u16 offset,
 					     u8 shift, u8 width,
 					     u8 clk_divider_flags,
-					     const struct clk_div_table *table,
+					     u32 div_type,
 					     spinlock_t *lock)
 {
 	struct clk_wzrd_divider *div;
@@ -337,7 +489,12 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
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
@@ -349,7 +506,6 @@ static struct clk *clk_wzrd_register_divider(struct device *dev,
 	div->flags = clk_divider_flags;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;
 
 	hw = &div->hw;
 	ret = devm_clk_hw_register(dev, hw);
@@ -425,6 +581,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	const char *clk_name;
 	void __iomem *ctrl_reg;
 	struct clk_wzrd *clk_wzrd;
+	const char *clkout_name;
 	struct device_node *np = pdev->dev.of_node;
 	int nr_outputs;
 	unsigned long flags = 0;
@@ -469,6 +626,26 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
+	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
+	if (ret || nr_outputs > WZRD_NUM_OUTPUTS) {
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_out0", dev_name(&pdev->dev));
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
@@ -476,20 +653,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	reg = reg & WZRD_CLKFBOUT_MULT_MASK;
 	reg =  reg >> WZRD_CLKFBOUT_MULT_SHIFT;
 	mult = (reg * 1000) + reg_f;
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
+	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
 	if (!clk_name) {
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
@@ -500,7 +668,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
+	clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
 	if (!clk_name) {
 		ret = -ENOMEM;
 		goto err_rm_int_clk;
@@ -521,9 +689,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 	/* register div per output */
 	for (i = nr_outputs - 1; i >= 0 ; i--) {
-		const char *clkout_name;
-
-		clkout_name = kasprintf(GFP_KERNEL, "%s_out%d", dev_name(&pdev->dev), i);
+		clkout_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					     "%s_out%d", dev_name(&pdev->dev), i);
 		if (!clkout_name) {
 			ret = -ENOMEM;
 			goto err_rm_int_clk;
@@ -537,7 +704,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		else
 			clk_wzrd->clkout[i] = clk_wzrd_register_divider
 				(&pdev->dev, clkout_name,
@@ -546,7 +713,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				WZRD_CLKOUT_DIVIDE_SHIFT,
 				WZRD_CLKOUT_DIVIDE_WIDTH,
 				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
-				NULL, &clkwzrd_lock);
+				DIV_O, &clkwzrd_lock);
 		if (IS_ERR(clk_wzrd->clkout[i])) {
 			int j;
 
@@ -559,8 +726,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		}
 	}
 
-	kfree(clk_name);
-
+out:
 	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
 	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
@@ -585,7 +751,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 err_rm_int_clks:
 	clk_unregister(clk_wzrd->clks_internal[1]);
 err_rm_int_clk:
-	kfree(clk_name);
 	clk_unregister(clk_wzrd->clks_internal[0]);
 err_disable_clk:
 	clk_disable_unprepare(clk_wzrd->axi_clk);
-- 
2.17.1

