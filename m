Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECECE1CEAC2;
	Mon, 15 Jun 2026 03:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495361; cv=fail; b=aJP15QIIkKAID7kf1Mkmb/FROMZPu9cinYBRuJEIVVIz7vFsHVlPYwtlFcio4HM9O/jm37Lk2ngbqeF0jX4+xuFAXQr7AbIFLFf2UdI3GPW+oIit2cHXbmun9jHyK9rrjpFWBWa/F6EPS1C/WyiAXeAMuF76WVTiyZXWAcnfCwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495361; c=relaxed/simple;
	bh=pnoJZtbeX/okqMD4NnVHrAr8hi6iuLN3OEsz6V3K5Q0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/lrqvUQP52wD4fWjxlcwH4vXWIIupXrkRJiCnevMrQKNMDns6+cNfotQqw3h01IydW28g460ZH3pf0KXhc3L9NHDUzeWXQ8oc9aD6ahsMhGqVKwtCg6KGAzJMkCCuB0rENuVS8e0a/ZPB6vWhDSC47gCu/r2MlcAntP00A6Wlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HMYzVfq6; arc=fail smtp.client-ip=52.101.46.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HMYzVfq6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPgmO9L1iovMG97g7oZkcfsiAUKuTdWnog5Qj00D9QM2gx/miQqQuQM9YvwIvxRVfblRtxNgArdYoA+NtWGF+r9VW1Y0FUp0Tx5rMbDuexKS+xhjGI4B+8PO38u1DCTFgkm/2o9gyBvWzX5fDJY6LhTAG7hGedz7ceyvqiZrCp/PuwgZ+NZafMDiKwob3kQi1MR311TOO2qGnMxcfkTcK/TVLeNOEWlVOzYjyQQdpLJ4puQ2q4n6H/WKoxTo6lQWVHeT6pgTV+GUOfx39SJ/ZYfxXgNYTk5pLqMnWizxSNBrM+Ci7aFy84NfgDl1o6VSguUcpSM/S4j5ogkh3p61LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Q3NIRhsuL6tJaDY5AbciOmjhgsEN4lySYWnXZ4OBs=;
 b=v/oW9umLowaR4wIwG+p1uormQoqHixrk3rgJjg/d8598DOKjI1JyU6n+6Jgb4iPeEsyNnn1PROvXQEukvLl2PGnWRtTn2TDT7Mbt+E31fZkQRAAvHnkZqhE4t9iMa9OOmrOUumSPR7eT1FFO7cNNajrr+fIBmSc0v3b58HpqEUQfh1jkxq1j/cm0dRrE40JfYDTjjrauscMLA6raQ8uxrFsdoquqMfI+NdG4giTbKZ7Xm/mIZUrvC9DBweesS2L0O6QunxdxXpjDNciEZKoTCLhDzQTS8dmeRcspm0DNJ/O9FTftZrC5Z40kR+GGxUxJsdwRDkuAC3Sfnv6GVtd/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+Q3NIRhsuL6tJaDY5AbciOmjhgsEN4lySYWnXZ4OBs=;
 b=HMYzVfq6dBJX0nr0xIxA6sIm7dmJ0/KgA/IOnAJllibpVfQVfs2C7CGrKNMpBI++aYbKxV5ng5zURERsnBCrWgHtkfulbwGQ6AeQImxrAsQUI2+6Z4qU1Tp3910VzSRxxCw5aGVR/70WRg/7lgIL6ClaMMPQWYZsDg9JrQdVVhQ=
Received: from SN6PR04CA0101.namprd04.prod.outlook.com (2603:10b6:805:f2::42)
 by CH3PR12MB8457.namprd12.prod.outlook.com (2603:10b6:610:154::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:49:14 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::37) by SN6PR04CA0101.outlook.office365.com
 (2603:10b6:805:f2::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:12 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:49:09 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/8] clk: clocking-wizard: Add static-config clock provider support
Date: Mon, 15 Jun 2026 09:18:43 +0530
Message-ID: <20260615034845.3320286-7-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|CH3PR12MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e6d6ee-07d5-41c4-ecfb-08deca911114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	6ah/Kr/gg3wunjXPNlPD6NATSTS409VUU5JpTQmRhJGSea5PPsjq+oZCgr3bDBg+8zxiSoSKrbdjYe55THIAfr7eb4pR/q6cNnyL7xI8PitdU71OByl0VIFPx9vNzunIeKjkJi7NUh1hHbxYYD0oxtYTf/1NRCeGR2FHhOlOHkTgbD3apXEs3APpZIvvsnzKrBOOQrN1haRde1yariPOxENnNmzK6m/UDet5ZbrJsbXebSVtAK5Nti2MvyfRAFPVajnn/iys4z1FktsLLkt/LEcTijlah7CKHHWfuOiXelsJW0n2fXVM4wlfwz0hWvjF6lLwyolnERpnT8suDa9F5I5v527QcEtL2ABK9JCtNzWu3l+3KDY4GY8kQGSN9NyH4W4lDbjviPS3+ZWWg1vuX/jxqrqFxTxWIOf7pW8MeIWe3LZo82cwOPOfL1DovRsDojKNGelq7MTLy7mMHsYPITzOR8KRZTLAzChZTjLME4iZrKLcJk6Z+cqapJL3vsQhhTnDjzX4C3/AWJGO7SKP9x8GV/wXI+BQFYy2bgSisQejX4VPKY1/VM6d08e1/eALRUgI39ZfeqaB9HdBtyUSb8izGG4RIEHz5D94J9VuyHv4AKuTYCS/82yy0AYe18XHv16ADz8B+Fvhj6GvaKgg6fi6SsVNWAUuVmG+S1h8kWmhntbmo/NlXX+mLvypcGn1kmzn2ZjzQvpiSKwL/Ir60rM/SivcuDHxZxc0YvUCXsI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u+LP4/CQCTgsVv+rknfYcETAuFUMCUoq0yF6Um7i2aJzTs/i0V0qIqIwtmg/Lfc0v9oR2tBZZuOwoWc868y808Pm4NVKIJDqnZsceG9M9EorlG8rh/FfuG51WB4bUjXKZkcDjCwYuBZ5m8lnTVqONAvf2yY/4emYOw8k/Cm+wAv4hoJ+bEd8IyGD9/A5SyuNFW/pF9mUOQOXg+ZFfjA0KELo1SU74ZQ34382AWk25ZuE7P4B9P/tPCtVJx+9idMCykzW5H8+OxFHQ6I6oZrh/BKLWghkf2pF89bfFm6UfBc+33lunzluVdVthLuW2RY47EzBNznCMzk0mTDQXCdKMLJS3FXnvJuWGlkNUqSe/przaaA+oot9R2PE3zvrGsYZ4iV2egV0MHwtgJU93maPqAcwixfjyRd+U/ADeq6+VrZHsnN6bKcZjm6fTNRWExxu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:13.8233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e6d6ee-07d5-41c4-ecfb-08deca911114
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8457

When xlnx,static-config is present the divider/multiplier path is
synthesized inside the Wizard without exposing runtime MMIO
reconfiguration, so omit the AXI register mapping and advertise each
routed output clock as a clk_fixed_factor child of clk_in1 using the
synthesized ratios exported through xlnx,clk-mul-div.

However the parent clock of clk_in1 can still be gated, disabled, or
(re-)enabled after FPGA programming (typical FPGA Manager flows,
CCF-managed parents, PLL fabric power sequencing).

Add a 10 us delay in each output clock's .enable() hook so consumers
wait for reference settling before first access.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 137 ++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index ffc78c90bee6..5470a717fccc 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -107,6 +108,7 @@
 #define VER_WZRD_O_MAX			511
 #define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
+#define WZRD_ENABLE_DELAY_US		10
 
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
@@ -697,6 +699,13 @@ static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_wzrd_enable(struct clk_hw *hw)
+{
+	/* Allow the output clock to settle after enable */
+	udelay(WZRD_ENABLE_DELAY_US);
+	return 0;
+}
+
 static const struct clk_ops clk_wzrd_ver_divider_ops = {
 	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_ver_dynamic_reconfig,
@@ -790,6 +799,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
 	.recalc_rate = clk_wzrd_recalc_ratef,
 };
 
+static unsigned long
+clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * fix->mult;
+	do_div(rate, fix->div);
+	return (unsigned long)rate;
+}
+
+static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (req->rate / fix->mult) * fix->div;
+		req->best_parent_rate =
+			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	}
+
+	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
+
+	return 0;
+}
+
+static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	return 0;
+}
+
+static const struct clk_ops clk_wzrd_static_fixed_factor_ops = {
+	.enable = clk_wzrd_enable,
+	.determine_rate = clk_wzrd_static_factor_determine_rate,
+	.set_rate = clk_wzrd_static_factor_set_rate,
+	.recalc_rate = clk_wzrd_static_factor_recalc_rate,
+};
+
+static struct clk_hw *
+clk_wzrd_devm_register_static_fixed_factor(struct device *dev,
+					   const char *name,
+					   const struct clk_parent_data *parent_data,
+					   unsigned long flags,
+					   unsigned int mult,
+					   unsigned int div)
+{
+	struct clk_init_data init = {};
+	struct clk_fixed_factor *fix;
+	struct clk_hw *hw;
+	int ret;
+
+	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	fix->mult = mult;
+	fix->div = div;
+
+	init.name = name;
+	init.ops = &clk_wzrd_static_fixed_factor_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	fix->hw.init = &init;
+
+	hw = &fix->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw;
+}
+
 static struct clk_hw *clk_wzrd_register_divf(struct device *dev,
 					  const char *name,
 					  const char *parent_name,
@@ -1154,9 +1242,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
+	const char *clk_name;
 	unsigned long rate;
+	struct clk_hw *hw;
 	int nr_outputs;
-	int ret;
+	int ret, i;
 
 	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
 	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
@@ -1224,6 +1314,51 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 		}
+	} else {
+		u32 mul_div[WZRD_NUM_OUTPUTS * 2];
+		const struct clk_parent_data parent_data = { .fw_name = "clk_in1" };
+		int num_elems = nr_outputs * 2;
+
+		/*
+		 * xlnx,clk-mul-div is a uint32-matrix of <mul div> pairs;
+		 * FDT encodes it as a flat u32 array so we can read it directly.
+		 */
+		ret = of_property_read_u32_array(np, "xlnx,clk-mul-div",
+						 mul_div, num_elems);
+		if (ret) {
+			dev_err(&pdev->dev, "xlnx,clk-mul-div missing or invalid\n");
+			return ret;
+		}
+
+		for (i = 0; i < nr_outputs; i++) {
+			u32 mul = mul_div[2 * i];
+			u32 div = mul_div[2 * i + 1];
+
+			if (!mul || !div)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "invalid mul/div for clkout%d\n", i);
+
+			clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s_out%d", dev_name(&pdev->dev), i);
+			if (!clk_name)
+				return -ENOMEM;
+
+			hw = clk_wzrd_devm_register_static_fixed_factor(&pdev->dev, clk_name,
+									&parent_data,
+									CLK_SET_RATE_PARENT,
+									mul, div);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			clk_wzrd->clk_data.hws[i] = hw;
+		}
+
+		clk_wzrd->clk_data.num = nr_outputs;
+
+		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+						  &clk_wzrd->clk_data);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "unable to register clock provider\n");
 	}
 
 	return 0;
-- 
2.49.1

