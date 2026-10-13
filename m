Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC573F58E7;
	Tue, 13 Oct 2026 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887258; cv=fail; b=hRElnwaYAhXW0uCsMxiTjs0v11Ji8ROOjSxfQXrFAD2kBHLwAxkW4btSoPEIX5RfhfBqzHOmUHQnBJnqtFdcQItLXTipwevlA3AvJ8AEQhU+MTTBrQBxU1SDClitqPsHteX8BG1OMk23Xk+Mv9uXCR0z3hHwsfl8O9cw2w061lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887258; c=relaxed/simple;
	bh=WMOKfwYRFogMlBehg0BBfne2QQqKQa49LcR0V/skCVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSMXLe1TViBW8nLx1G09uMPzb1vQe8kv3lmSXJ9xj6YdFxCyWc8O5Kb9BErN/gbi1E0jZPN+6xsua3BbWYsyPlHj+PWocMnY0zjCYWO3FQt+gaIh56O0UawUvOOQWFg4MTMlviYpy8nwlDNcK7UWhIxAY4763/OGSFBz85LKmOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng1kUkUoW6mx7+P14WWE+i1taAKN/2ycPlBX2TblvCXeYq9yUYEAMSL64HdLmQqu5ghxTS1PwkW9IV4AOm4vLsf8VuJueTabtgamCyX1WOa9QpoEf++nVKzCN9f6p+MJySR+wwKcts3rO5FB8rgfOGz3H2RUTCpmtSyd7WyNFchvooRwy4XnZ8pk78NbSa5lpfJLM6gM+toN816h62gcc5tt+xRFv8X5/jRQvtimHjxXrcRDXLHWZME7IWCtHcbyUIndKlG8q3nNyqTBg9WnHCO1QeslwCqbgEI5MYETJWfAjfjJiclTeoy3wmgSXW8ee3bqOcluhemPFMqs2oRBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm5dCf1MMCv4LwCU1prd6LAWkJwKhzkVTniNqdyTmbQ=;
 b=JYrVbSsLCfnfECIUzfsPn08CpOmrkEV60DFA/gRFTuwO1FcEcMtUDds3ah5HxB07rGWVho6FGnnJqozsTkG+dyTOD+focauuP8pCTVthH2UhRXvrclYSKZ2RXop0SKz6lLtrYuYrU6JZ0tMehjaQtIWr8kHgh/EZpT9V7/5mMiuENHMnjKW03gtmqdW8xpGcv+3Ula4lWaxJYFkR13znTYdrGHKZhmXHckAhHDzthoBRXwDbEAUqTA30JwpkrbHl2hp86HMtRq5qeR5kX0m9pKckhgmd/gU4cHg01ALohSjRm0xarBezNwLMl/5RzlCpUh0ausuhnCAPi3RFAMcx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 3/6] clk: starfive: jh71x0: Add generic CRG probe helper
Date: Tue, 13 Oct 2026 03:27:04 -0700
Message-Id: <20261013102707.9207-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fd57e8-4356-427d-8ad0-08df29149185
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P4Q60JXQI2aYkX4uutbYzlvX8P9RyZMt+NAW436wJSaPFlBEtLJmkOwP212TpvegQ0ugsKdzwCRCjFeiat9w+6CXQYoJ8R5YbFTS8Rx8zwCZ/l2H6PXTUx2BL/g2/bwqlQiYZ3QceDDraBLQ44Of5enOp1POQIBEreYfdcn17UWEv8GtfUIfR8Qe999Rb/YzcxMdMXiYtGDe7n2xGMJxOxZj4XL//au8rhMBqhJif1R8zWNy7Din9aiX9frjlGhMQ66D06kkYSogsxzO67x+CTcVGavNZabrztGLMvJznR8qrnoSQ/TP2X724wnRuu8fzazq6H9RPPRzC2OpH7vpkh8/ixpQlt0/scYWHJOOtDOQ6s2OeoJSy2AMyJ0qFHX0bhrjSPJyhYAg7BaB2WX/OVYnGdVmAwqBw0kFIBg7x+asXF5I23aOM4FAgfHJsNbLV/c8s1zO2dH0x6FQVYp8Qswt2bjmyzjj9zSIV50HWtklI+lrAM0j/vrha298oLCs84LPSYlVpoQrW6LrE2920BHBAWVCHAN3qIOgPoaeY5SIVUEC96csedqU7eAlsrTg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kzddwDPYPdLQSjUjzjCJz7xgt2F4ykGCz72DZV2iVP92RaKihFRc8QrO0A2g?=
 =?us-ascii?Q?LlU4fiy/KlhJZ6anJQvC3NX73Ve9Wgs3dmDGSY3SGOhzOWqfB0xXdOpQ/wFD?=
 =?us-ascii?Q?X0jXfc0XS39Dhq0zOtcRALU6AJZCBV+iqHQb9MMtTj3Hi4Fwv4Zqmag/GCbU?=
 =?us-ascii?Q?R/TCEYfDl4EKtUp2wEajSClKKNgNmIVjO5eUGNQ8zcngmmUUBBz5PGy934GG?=
 =?us-ascii?Q?GfrKUw+fG2lvuZLYkrJd8jMiBCPI6go/rkDeCoJ90M8IAHjYtVNlorsyBA2p?=
 =?us-ascii?Q?Gp/L5iHGKN0CA3YH0mDE8dbkDioAeMa/+PKWoQh+eBXhZ2YwJz+27ESVYl0Y?=
 =?us-ascii?Q?UwcxI9eTzyppyRkbu5/S7IjjvHP033MsaCuDw/RTizWqpdph85Xjmuv5vtl9?=
 =?us-ascii?Q?+BPE0l3mMoEPR59KJXA1J3pwSXUVckyMtoOxSJD3s+1baBWYLJi4XtFBWRH4?=
 =?us-ascii?Q?LCmByf643zOy4A4JLeEt19nXaDmLYzvk8+uktrvRjfdBt0hijeOo692Dd1K+?=
 =?us-ascii?Q?knAXlt5xrH1eJ+Paub1qOsLoB7q4sEzQagyXJX61Nl/N6aT9p6xKOHqsILV8?=
 =?us-ascii?Q?XeN8uphazHl3xRn9+tDDPTiLoaA5uNoCL6LDxus+dIqjcDRmvvYwquzK3tKK?=
 =?us-ascii?Q?+EPsextJNpGlTmRIwSt2Qi2HSpebRup52mwVccNom1aEekphNF1YPk69Pfad?=
 =?us-ascii?Q?ifvfu0o2sv1vXYO5MUBQCyHvFiIE+7dHq+ZMUdJTHc92x16yC9+3tLubepjW?=
 =?us-ascii?Q?ETX/V3bO+BoQgURLl6h1Ftzrr63xeBmjMj+FuVBraXJ/2Ox0ihJ2ne7Rg7mb?=
 =?us-ascii?Q?qZdazIVQdYFTOfYlBCZciposr+EiWXFj9i6vvIVBjwmwua5WBiq7Hkib7ps4?=
 =?us-ascii?Q?aQTyQDRSUtauyawquaIZLxM5LhdQ7xvT2/0FRJzSh755jBvs5lu+q6CpusbH?=
 =?us-ascii?Q?vv52lXwT15q0cdDOdd5TjYBd7IIFQ2Hvvnp9b9jiXmO2HpjIma9JAmD61BE6?=
 =?us-ascii?Q?y2iHZxRHnEku2uCHxhS3Mpb5lSkDxExZrSDs9IiDEidrcNnayrvX9OpraqXU?=
 =?us-ascii?Q?J0Whvxn0DZOfLati8hgvWdL2cSMrO3E4sp/RvcsZ6CaECkKQ7Tj1ld2nR8dE?=
 =?us-ascii?Q?LWzPymMWVhE5koo7swV1/3sCzb7fYhwTd69khkJND7YSfilfNggtouJgYaU9?=
 =?us-ascii?Q?TWgVnLoC0N1Yb8K/C4VnPrXvXz5xYKZDQOuRVJYJ4wHJ5LtrkTfcY8GR605Y?=
 =?us-ascii?Q?Z0sqfwqpdGjwz5Eek4RIXZbq59gv0n1K6RvSUbZ9bn3QQw48tuAk8rkk+3Cl?=
 =?us-ascii?Q?8vV0IykBECljhHhxve4wpPnwP9PqUpZmjZ03jio652bONlxY5rspUyh5rjWn?=
 =?us-ascii?Q?BlioLOIUZtnpbaTOQL6u7V/UFnvesBrTvUPp7yYhOiqnOv2CcxHdC7bHHY9a?=
 =?us-ascii?Q?CFlQ4sGcpV4e06jVpk9NIIxEXwnj91p/udBH3dFSY5XJtnw8PmIjZlR2ghLy?=
 =?us-ascii?Q?4x4k9Lk9qT4OxIViHUUt6wS0U9yPMErEHQWOoanD0cdujBOwCZ49b/vlhsSj?=
 =?us-ascii?Q?CZBD59SioQUBXwnwAqJOY0LdRzzMH/m+Djp13ZNuTfDtTLQOffLOC2QbzCyQ?=
 =?us-ascii?Q?9LWgAl/0O1VHiXxPiFRc3pVn9xg33ZlXYwPyhLc1/Hn0/NKFAlxbOuAK+0PL?=
 =?us-ascii?Q?+tp4IWfVVRu3h60ZmduCq6PHCmBASq774A3UXETc6xF3Li/efJ2JmnQvTaBa?=
 =?us-ascii?Q?T1TkIUWAWdPPw10ktMPAOFOcK3+gds/F/VSNuqBsVb2FKiua9nCs?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fd57e8-4356-427d-8ad0-08df29149185
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:22.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1YRfDfri9JXWJEn4RTpVRuE/O20ewx3RbtYIfwf9roa64kDJdq/sjuSdL490z1xReS11eHPXTZJanCqpzMvYCYibxehmiGNgbn8H8DHDVzzE8eK5GyAAL2g/crohZhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

The StarFive JHB100 SoC has several clock and reset generators (CRGs)
which share the same probe flow: map the registers, register all the
clocks described by a table, add the clock provider and register the
auxiliary reset device.

Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
that each CRG driver only needs to provide its clock table, external
clock names and reset auxiliary device name. The reset auxiliary device
is registered with jh71x0_reset_controller_register().

Parents that refer to an external clock are tagged with
JH71X0_EXT_CLK_FLAG in the parent index, so the external clock indexes
of a driver do not depend on how many clocks the CRG provides and do
not shift when a clock is added to the binding.

The clock index space of these CRGs is sparse, so also make
jh71x0_clk_get() reject indexes that were never registered when the
domain info is available.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 96 +++++++++++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h | 21 +++++
 2 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index 37bab563c5e0..52c5ae737dbd 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/property.h>
 #include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include "clk-starfive-jh71x0.h"
@@ -333,10 +334,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
 	struct jh71x0_clk_priv *priv = data;
 	unsigned int idx = clkspec->args[0];
 
-	if (idx < priv->num_reg)
-		return &priv->reg[idx].hw;
+	if (idx >= priv->num_reg)
+		return ERR_PTR(-EINVAL);
 
-	return ERR_PTR(-EINVAL);
+	/* Index space is sparse: reject holes that were never registered. */
+	if (priv->info && !priv->info->clk_data[idx].name)
+		return ERR_PTR(-ENOENT);
+
+	return &priv->reg[idx].hw;
 }
 EXPORT_SYMBOL_GPL(jh71x0_clk_get);
 
@@ -361,3 +366,88 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
+
+int jh71x0_crg_probe(struct platform_device *pdev)
+{
+	const struct jh71x0_crg_domain_info *info;
+	struct jh71x0_clk_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	info = device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->rmw_lock);
+	priv->info = info;
+	priv->num_reg = info->num_clk;
+	priv->dev = &pdev->dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	for (idx = 0; idx < info->num_clk; idx++) {
+		u32 max = info->clk_data[idx].max;
+		struct clk_parent_data parents[4] = {};
+		struct clk_init_data init = {
+			.name = info->clk_data[idx].name,
+			.ops = starfive_jh71x0_clk_ops(max),
+			.parent_data = parents,
+			.num_parents =
+				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
+			.flags = info->clk_data[idx].flags,
+		};
+		struct jh71x0_clk *clk = &priv->reg[idx];
+		unsigned int i;
+
+		if (!init.name)
+			continue;
+
+		if (init.num_parents > ARRAY_SIZE(parents))
+			return dev_err_probe(priv->dev, -EINVAL,
+					     "clock %s: too many parents (%u > %zu)\n",
+					     init.name, init.num_parents, ARRAY_SIZE(parents));
+
+		for (i = 0; i < init.num_parents; i++) {
+			unsigned int pidx = info->clk_data[idx].parents[i];
+
+			if (pidx & JH71X0_EXT_CLK_FLAG) {
+				pidx &= ~JH71X0_EXT_CLK_FLAG;
+				if (pidx >= info->num_ext_clk)
+					return dev_err_probe(priv->dev, -EINVAL,
+							     "clock %s: invalid external parent %u\n",
+							     init.name, pidx);
+
+				parents[i].fw_name = info->ext_clk[pidx];
+			} else {
+				if (pidx >= info->num_clk)
+					return dev_err_probe(priv->dev, -EINVAL,
+							     "clock %s: invalid parent index %u\n",
+							     init.name, pidx);
+
+				parents[i].hw = &priv->reg[pidx].hw;
+			}
+		}
+
+		clk->hw.init = &init;
+		clk->idx = idx;
+		clk->max_div = max & JH71X0_CLK_DIV_MASK;
+
+		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
+		if (ret)
+			return dev_err_probe(priv->dev, ret, "Failed to register clock %s\n",
+					     init.name);
+	}
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
+	if (ret)
+		return ret;
+
+	return jh71x0_reset_controller_register(priv, info->rst_name);
+}
+EXPORT_SYMBOL_GPL(jh71x0_crg_probe);
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 322a05157faf..666d44e6a752 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -5,6 +5,7 @@
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
 /* register fields */
@@ -29,6 +30,16 @@ struct jh71x0_clk_data {
 	u8 parents[4];
 };
 
+/*
+ * Parent indexes with this bit set refer to an external clock, i.e. an entry
+ * of jh71x0_crg_domain_info::ext_clk, instead of a clock provided by the CRG
+ * itself. This keeps the external clock indexes independent of the number of
+ * clocks the CRG provides, which in turn must stay below the flag; drivers
+ * check this with a static_assert() on their clock table.
+ */
+#define JH71X0_EXT_CLK_FLAG	BIT(7)
+#define JH71X0_EXT_CLK(_n)	(JH71X0_EXT_CLK_FLAG | (_n))
+
 #define JH71X0_GATE(_idx, _name, _flags, _parent)				\
 [_idx] = {									\
 	.name = _name,								\
@@ -109,6 +120,14 @@ struct jh71x0_clk {
 	unsigned int max_div;
 };
 
+struct jh71x0_crg_domain_info {
+	const struct jh71x0_clk_data *clk_data;
+	unsigned int num_clk;
+	const char * const *ext_clk;
+	unsigned int num_ext_clk;
+	const char *rst_name;
+};
+
 struct jh71x0_clk_priv {
 	/* protect clk enable and set rate/parent from happening at the same time */
 	spinlock_t rmw_lock;
@@ -116,6 +135,7 @@ struct jh71x0_clk_priv {
 	void __iomem *base;
 	struct clk *original_clk;
 	struct notifier_block pll_clk_nb;
+	const struct jh71x0_crg_domain_info *info;
 	struct clk_hw *pll[3];
 	unsigned int num_reg;
 	struct jh71x0_clk reg[] __counted_by(num_reg);
@@ -125,5 +145,6 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
 struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);
 int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
 				     const char *adev_name);
+int jh71x0_crg_probe(struct platform_device *pdev);
 
 #endif
-- 
2.25.1

