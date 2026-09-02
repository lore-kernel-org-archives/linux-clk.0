Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C8471D09;
	Wed,  2 Sep 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346234; cv=fail; b=X0zGzC+O+UNDjZvZAovufbqK6Cjk6Zs5wGnWBK9+jw+SjOJnTxaCbNa2RPHUcklgBj5s+zR1zlOMLWnJfpXxjk4XR2GDD6uaHjLT637vX/wRH4cIX4KKzs1aMguTWRjpROOopCvxd3UcuAIhD9vU8/WxDoWFMdh5fbmv2AiM4n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346234; c=relaxed/simple;
	bh=5AigjdDJ/b7w/Q/wRdDERTbFA7kn9P6m6SxWQ4tAuTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ub9u+0X0RFPx8bigLjTGCykh6Soi8XNbfHWKe3Om/vfau3K9oVrRPWKXyN0q3TDIoxrThgRMcuF8mqMM9yiltzSt9e5heHG38WJm6tZKwgXpKeggr4JdXLZeOZli+Pz2lsoBruv4GM+8er8O/15acKoIBz+y1wUNezYXujfRMAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QvmPE8r9; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QvmPE8r9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtlrBxY4SS1X6/TGno6QaCAfTYxdwa62j79YV1s/qImjk141Sfz84gzVR4EJwv58oLg0eq/2GfHGeSLB/FeTZGH87JQWrGqilXJ0T8cI5uvL+DZsWV5YeCT/1mcYMABM35ZF7B6iZEZZ83x5OzbTlZwYFJxSuBFrlId162wkuSDISMoFeKo77kMBkYv7V0PDMPEKC6b7/a0nhon+GN4iusUvTt84vyGjpiLODNpyb+RhnvoGigc7yiF4Gox2j77pTsSXTvUaKcVbH1UhWT5rpaUObZ4a/8q9IQKQWM53lyDTlSGXbMAC0TzwOyPGQ1LKy2apmfU0oSchLo4/7bF6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Id3RktlXnBbQKHSL1NdKnBXqzx2Sf58akpnxUFtP/o=;
 b=PwG2pn6USynCDGSMwkrqDlyOtkUW0AfR1LHX6x2mm08c4UYg6tgKlSsXzq163sE1Z29PZDijRfpknyvEVWvj4A/gPdcmV2ojjFcOgPEEK8kDRo88M4QFquM7+Qv94yuVsWqNIv8BHECGkpBRi/HkwAH7TImEJ/l1WdY2jUOb3pTj4OIXlV7W959MJRtfqEmLNhDhAKVakMR191XvybddaiCpRvHAf9wwCUX45qgidvyapEr5dgpaUaAVZ8wHMXCM1TASxY0bDRsFucEIkEFrtzLOg6P+rQF9gMXf7gq7q6hJ0ZbdzP8ZQPkBg3TBq+cPB/wSDmQtaPgS9Z3CtEEUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=baylibre.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Id3RktlXnBbQKHSL1NdKnBXqzx2Sf58akpnxUFtP/o=;
 b=QvmPE8r9rmQxzmVX7BprMnfTQcoCEI+tLMiWQhqUvRiFIFkxKJZbi7OhaWUjM8TDPzzpOv+fodKxcdbvz/7niGi6svphsVy9m6ERXlT1sMC2Dn5/5HEqYknPGICW7CVI9vaXcvgIrXl6odbB2NyoAvy0yGllHk0J6vzwPrIyQwc=
Received: from TYCPR01CA0140.jpnprd01.prod.outlook.com (2603:1096:400:2b7::10)
 by TYCPR01MB7137.jpnprd01.prod.outlook.com (2603:1096:400:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:50:17 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b7:cafe::53) by TYCPR01CA0140.outlook.office365.com
 (2603:1096:400:2b7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 10:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:50:16 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com [10.226.92.24])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 27545300024A;
	Wed,  2 Sep 2026 19:50:13 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH 2/2] clk: renesas: rzv2h: Convert to clk_hw based provider API
Date: Wed,  2 Sep 2026 10:49:39 +0000
Message-ID: <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TYCPR01MB7137:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 67fb4bd2-8fe2-4336-ce6d-08df08dff9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	BFZGGLgbPxAnfNFjEBxN3XNTVclZfEzySXONuZXa0mmBV99B8yh1P8T25WQt260+cjXPFX7Kl5eQwSacNHtPxGRtk+ZAq16fYlRMhg5GbnWnKBP1obFFG/m++QfFRG/6rtpz66k6htq7L3Ds6yrOjwpEKO/4q3ASGoB+QVYVHMJPKrYcUdCp6BF3lIQsFRU/p55m3tIspdg2kWwIqE2oG3Qd9AfkTnMPSOTX+d75nPtsc0yNYQsgsNSyxpK13Lcni6+tplNPvEl5R/BqFOgdIMH56K/Fr4L9Tx0A0tnkVtnoRKRY6Xqe2oDEJ+ggO27s942C+UBSTRYjahqhXJjHV2iVzwNxNTK5G6tCJlXBuX5uH21WyyyJNoK+vcl6dN2UT5EsPLklf9tLs3BZRGqINHP07G+0fA/L+8FpLGbF/C5sF1w3d0oLFko+8Axjkbh2FJOL4UEnUQ+uNa1EzRIEPc0Rw6kXhyvTCLGZopI7qIvSR3QmEA3wqtw00V7rbWp6kZGdYfejU+naC1EDI2w4Yg1/1PI4C8p9M+gtQBsK8pEHiiMhn7VHAFh22D+AY3gAo3C550a2lLusVFl4nYtn4FwKy3m2Wx330snjpBz1KOInhL19JZtqsYAZ+J0mH5KngSmC+TR/OMIxwI62iWYmEUwNwLPGPhrx1t7kJRFT6KYBE/6R+MF4jZNcH+hL+bVHkIvSVvOjjoRNwLoFWyY72A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yNL6QotNCL8WL9jhbpBw20hle1EjufsIzWqTTvzOUayHR9t+zzDW2Dd6+CY522OJw7gY7Ml7F0us3m1k265CEU/Ny31hqIGWh+BzCs809XepCvKdGsSqgKxXeeNVbHq4XGm/+LRwaIvhJwoCmACI+2jIPt6mnwVrp29MBFEYeBwIOxhG5PLY6UnZylBkFeOZjPCkhPYB4mD0bZ6f/0eMVXqidf9QVtfO5WNbly42SwtJo922InSQrZq0c4ImHO0ieMR8l9KQA4WEaeIeFBlVxIimg8NxGVMA6UKlYH7W6HAtjOeHDk+GFZVQISe5gI+OyeYua4ZUUfbHs0p/lyI8m24ZdNnxmJhW9Tdbd9F6lM6ScAkTbPIkWMxWo7/9cC/720JfvgyjqmXta3ZL8cizd9DhSXnZ7Gwn2/Iz8RWGxZz/TlL5m4VcI00GPpE8urT6
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:50:16.9905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fb4bd2-8fe2-4336-ce6d-08df08dff9ba
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7137

From: John Madieu <john.madieu.xa@bp.renesas.com>

The driver mixes the clk consumer API with the clk_hw provider API for
its internal clock storage and OF lookup callback. Convert it to use
clk_hw consistently.

No functional change intended.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 151 ++++++++++++++------------------
 1 file changed, 68 insertions(+), 83 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 86f6f2f700a6..9b0d691b1f5d 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -99,7 +99,7 @@ struct rzv2h_pll_dsi_info {
  * @dev: CPG device
  * @base: CPG register block base address
  * @rmw_lock: protects register accesses
- * @clks: Array containing all Core and Module Clocks
+ * @clks: Array containing all Core and Module clk_hw entries
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @resets: Array of resets
@@ -115,7 +115,7 @@ struct rzv2h_cpg_priv {
 	void __iomem *base;
 	spinlock_t rmw_lock;
 
-	struct clk **clks;
+	struct clk_hw **clks;
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
 	struct rzv2h_reset *resets;
@@ -332,14 +332,14 @@ static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
 	.set_rate = rzv2h_cpg_plldsi_div_set_rate,
 };
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
 				  struct rzv2h_cpg_priv *priv)
 {
 	struct rzv2h_plldsi_div_clk *clk_hw_data;
-	struct clk **clks = priv->clks;
+	struct clk_hw **clks = priv->clks;
 	struct clk_init_data init = {};
-	const struct clk *parent;
+	const struct clk_hw *parent;
 	const char *parent_name;
 	struct clk_hw *clk_hw;
 	int ret;
@@ -356,7 +356,7 @@ rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
 	clk_hw_data->ddiv = core->cfg.ddiv;
 	clk_hw_data->dtable = core->dtable;
 
-	parent_name = __clk_get_name(parent);
+	parent_name = clk_hw_get_name(parent);
 	init.name = core->name;
 	init.ops = &rzv2h_cpg_plldsi_div_ops;
 	init.flags = core->flag;
@@ -370,7 +370,7 @@ rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return clk_hw->clk;
+	return clk_hw;
 }
 
 static int rzv2h_cpg_plldsi_determine_rate(struct clk_hw *hw,
@@ -577,7 +577,7 @@ static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
 	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
 };
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
 				   struct rzv2h_cpg_priv *priv)
 {
@@ -620,7 +620,7 @@ rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return clk_hw->clk;
+	return clk_hw;
 }
 
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
@@ -705,14 +705,14 @@ static const struct clk_ops rzv2h_cpg_pll_ops = {
 	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
 };
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 			   struct rzv2h_cpg_priv *priv,
 			   const struct clk_ops *ops)
 {
 	struct device *dev = priv->dev;
 	struct clk_init_data init = {};
-	const struct clk *parent;
+	const struct clk_hw *parent;
 	const char *parent_name;
 	struct pll_clk *pll_clk;
 	int ret;
@@ -729,7 +729,7 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 		priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limits =
 			core->cfg.pll.limits;
 
-	parent_name = __clk_get_name(parent);
+	parent_name = clk_hw_get_name(parent);
 	init.name = core->name;
 	init.ops = ops;
 	init.flags = 0;
@@ -744,7 +744,7 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return pll_clk->hw.clk;
+	return &pll_clk->hw;
 }
 
 static unsigned long rzv2h_ddiv_recalc_rate(struct clk_hw *hw,
@@ -820,7 +820,7 @@ static const struct clk_ops rzv2h_ddiv_clk_divider_ops = {
 	.set_rate = rzv2h_ddiv_set_rate,
 };
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 			    struct rzv2h_cpg_priv *priv)
 {
@@ -829,7 +829,7 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 	struct device *dev = priv->dev;
 	u8 shift = cfg_ddiv.shift;
 	u8 width = cfg_ddiv.width;
-	const struct clk *parent;
+	const struct clk_hw *parent;
 	const char *parent_name;
 	struct clk_divider *div;
 	struct ddiv_clk *ddiv;
@@ -839,7 +839,7 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
-	parent_name = __clk_get_name(parent);
+	parent_name = clk_hw_get_name(parent);
 
 	if ((shift + width) > 16)
 		return ERR_PTR(-EINVAL);
@@ -872,15 +872,15 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return div->hw.clk;
+	return &div->hw;
 }
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
 			   struct rzv2h_cpg_priv *priv)
 {
 	struct smuxed mux = core->cfg.smux;
-	const struct clk_hw *clk_hw;
+	struct clk_hw *clk_hw;
 
 	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
 					  core->parent_names, core->num_parents,
@@ -890,7 +890,7 @@ rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
 
-	return clk_hw->clk;
+	return clk_hw;
 }
 
 static int
@@ -906,14 +906,14 @@ rzv2h_clk_ff_mod_status_is_enabled(struct clk_hw *hw)
 	return !!(val & bitmask);
 }
 
-static struct clk * __init
+static struct clk_hw * __init
 rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 					struct rzv2h_cpg_priv *priv)
 {
 	struct rzv2h_ff_mod_status_clk *clk_hw_data;
 	struct clk_init_data init = { };
 	struct clk_fixed_factor *fix;
-	const struct clk *parent;
+	const struct clk_hw *parent;
 	const char *parent_name;
 	int ret;
 
@@ -922,7 +922,7 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
-	parent_name = __clk_get_name(parent);
+	parent_name = clk_hw_get_name(parent);
 
 	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
 	if (!clk_hw_data)
@@ -946,18 +946,18 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return clk_hw_data->fix.hw.clk;
+	return &clk_hw_data->fix.hw;
 }
 
-static struct clk
+static struct clk_hw
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
 {
 	unsigned int clkidx = clkspec->args[1];
 	struct rzv2h_cpg_priv *priv = data;
 	struct device *dev = priv->dev;
+	struct clk_hw *clk_hw;
 	const char *type;
-	struct clk *clk;
 
 	switch (clkspec->args[0]) {
 	case CPG_CORE:
@@ -966,7 +966,7 @@ static struct clk
 			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
 			return ERR_PTR(-EINVAL);
 		}
-		clk = priv->clks[clkidx];
+		clk_hw = priv->clks[clkidx];
 		break;
 
 	case CPG_MOD:
@@ -975,7 +975,7 @@ static struct clk
 			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
 			return ERR_PTR(-EINVAL);
 		}
-		clk = priv->clks[priv->num_core_clks + clkidx];
+		clk_hw = priv->clks[priv->num_core_clks + clkidx];
 		break;
 
 	default:
@@ -983,25 +983,25 @@ static struct clk
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (IS_ERR(clk))
+	if (IS_ERR(clk_hw))
 		dev_err(dev, "Cannot get %s clock %u: %ld\n", type, clkidx,
-			PTR_ERR(clk));
+			PTR_ERR(clk_hw));
 	else
-		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
-			clkspec->args[0], clkspec->args[1], clk,
-			clk_get_rate(clk));
-	return clk;
+		dev_dbg(dev, "clock (%u, %u) is %s at %lu Hz\n",
+			clkspec->args[0], clkspec->args[1],
+			clk_hw_get_name(clk_hw), clk_hw_get_rate(clk_hw));
+	return clk_hw;
 }
 
 static void __init
 rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 			    struct rzv2h_cpg_priv *priv)
 {
-	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
+	struct clk_hw *clk_hw = ERR_PTR(-EOPNOTSUPP), *parent;
 	unsigned int id = core->id, div = core->div;
 	struct device *dev = priv->dev;
 	const char *parent_name;
-	struct clk_hw *clk_hw;
+	struct clk *clk;
 
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
@@ -1009,70 +1009,72 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
+		if (IS_ERR(clk)) {
+			clk_hw = ERR_CAST(clk);
+			goto fail;
+		}
+		clk_hw = __clk_get_hw(clk);
 		break;
 	case CLK_TYPE_FF:
 		WARN_DEBUG(core->parent >= priv->num_core_clks);
 		parent = priv->clks[core->parent];
 		if (IS_ERR(parent)) {
-			clk = parent;
+			clk_hw = parent;
 			goto fail;
 		}
 
-		parent_name = __clk_get_name(parent);
+		parent_name = clk_hw_get_name(parent);
 		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name,
 							   parent_name, CLK_SET_RATE_PARENT,
 							   core->mult, div);
-		if (IS_ERR(clk_hw))
-			clk = ERR_CAST(clk_hw);
-		else
-			clk = clk_hw->clk;
 		break;
 	case CLK_TYPE_FF_MOD_STATUS:
 		if (!priv->ff_mod_status_ops) {
 			priv->ff_mod_status_ops =
 				devm_kzalloc(dev, sizeof(*priv->ff_mod_status_ops), GFP_KERNEL);
 			if (!priv->ff_mod_status_ops) {
-				clk = ERR_PTR(-ENOMEM);
+				clk_hw = ERR_PTR(-ENOMEM);
 				goto fail;
 			}
 			memcpy(priv->ff_mod_status_ops, &clk_fixed_factor_ops,
 			       sizeof(const struct clk_ops));
 			priv->ff_mod_status_ops->is_enabled = rzv2h_clk_ff_mod_status_is_enabled;
 		}
-		clk = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
+		clk_hw = rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLL:
-		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
+		clk_hw = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
 		break;
 	case CLK_TYPE_DDIV:
-		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
+		clk_hw = rzv2h_cpg_ddiv_clk_register(core, priv);
 		break;
 	case CLK_TYPE_SMUX:
-		clk = rzv2h_cpg_mux_clk_register(core, priv);
+		clk_hw = rzv2h_cpg_mux_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLLDSI:
-		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops);
+		clk_hw = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops);
 		break;
 	case CLK_TYPE_PLLDSI_DIV:
-		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
+		clk_hw = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
 	case CLK_TYPE_PLLDSI_SMUX:
-		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		clk_hw = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
 		break;
 	default:
 		goto fail;
 	}
 
-	if (IS_ERR(clk))
+	if (IS_ERR(clk_hw))
 		goto fail;
 
-	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
+	dev_dbg(dev, "Core clock %s at %lu Hz\n",
+		clk_hw_get_name(clk_hw), clk_hw_get_rate(clk_hw));
+	priv->clks[id] = clk_hw;
 	return;
 
 fail:
 	dev_err(dev, "Failed to register core clock %s: %ld\n",
-		core->name, PTR_ERR(clk));
+		core->name, PTR_ERR(clk_hw));
 }
 
 static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
@@ -1119,15 +1121,10 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
 
 static int rzv2h_parent_clk_mux_to_index(struct clk_hw *hw)
 {
-	struct clk_hw *parent_hw;
-	struct clk *parent_clk;
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
 	struct clk_mux *mux;
 	u32 val;
 
-	/* This will always succeed, so no need to check for IS_ERR() */
-	parent_clk = clk_get_parent(hw->clk);
-
-	parent_hw = __clk_get_hw(parent_clk);
 	mux = to_clk_mux(parent_hw);
 
 	val = readl(mux->reg) >> mux->shift;
@@ -1227,8 +1224,8 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	struct mod_clock *clock = NULL;
 	struct device *dev = priv->dev;
 	struct clk_init_data init = {};
-	struct clk *parent, *clk;
 	const char *parent_name;
+	struct clk_hw *parent;
 	unsigned int id;
 	int ret;
 
@@ -1239,13 +1236,13 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	parent = priv->clks[mod->parent];
 	if (IS_ERR(parent)) {
-		clk = parent;
+		ret = PTR_ERR(parent);
 		goto fail;
 	}
 
 	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
 	if (!clock) {
-		clk = ERR_PTR(-ENOMEM);
+		ret = -ENOMEM;
 		goto fail;
 	}
 
@@ -1255,7 +1252,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	if (mod->critical)
 		init.flags |= CLK_IS_CRITICAL;
 
-	parent_name = __clk_get_name(parent);
+	parent_name = clk_hw_get_name(parent);
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
@@ -1270,12 +1267,10 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->mstop_data = mod->mstop_data;
 
 	ret = devm_clk_hw_register(dev, &clock->hw);
-	if (ret) {
-		clk = ERR_PTR(ret);
+	if (ret)
 		goto fail;
-	}
 
-	priv->clks[id] = clock->hw.clk;
+	priv->clks[id] = &clock->hw;
 
 	/*
 	 * Ensure the module clocks and MSTOP bits are synchronized when they are
@@ -1314,8 +1309,8 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	return;
 
 fail:
-	dev_err(dev, "Failed to register module clock %s: %ld\n",
-		mod->name, PTR_ERR(clk));
+	dev_err(dev, "Failed to register module clock %s: %d\n",
+		mod->name, ret);
 }
 
 static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
@@ -1448,7 +1443,7 @@ static bool rzv2h_cpg_is_pm_clk(struct rzv2h_cpg_pd *pd,
 		if (priv->clks[priv->num_core_clks + id] == ERR_PTR(-ENOENT))
 			return false;
 
-		clock = to_mod_clock(__clk_get_hw(priv->clks[priv->num_core_clks + id]));
+		clock = to_mod_clock(priv->clks[priv->num_core_clks + id]);
 
 		return !clock->no_pm;
 	}
@@ -1547,19 +1542,13 @@ static int __init rzv2h_cpg_add_pm_domains(struct rzv2h_cpg_priv *priv)
 	return of_genpd_add_provider_simple(np, &pd->genpd);
 }
 
-static void rzv2h_cpg_del_clk_provider(void *data)
-{
-	of_clk_del_provider(data);
-}
-
 static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	const struct rzv2h_cpg_info *info;
 	struct rzv2h_cpg_priv *priv;
 	unsigned int nclks, i;
-	struct clk **clks;
+	struct clk_hw **clks;
 	int error;
 
 	info = of_device_get_match_data(dev);
@@ -1610,11 +1599,7 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	for (i = 0; i < info->num_mod_clks; i++)
 		rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);
 
-	error = of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv);
-	if (error)
-		return error;
-
-	error = devm_add_action_or_reset(dev, rzv2h_cpg_del_clk_provider, np);
+	error = devm_of_clk_add_hw_provider(dev, rzv2h_cpg_clk_src_twocell_get, priv);
 	if (error)
 		return error;
 
-- 
2.34.1

