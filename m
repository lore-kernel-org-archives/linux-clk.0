Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69C3B9D9E;
	Thu,  8 Oct 2026 14:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468405; cv=fail; b=KbDrtq+LN06ymu9JOmboZGExrMOesdr5pjKDgQpelRbGSp8xSAiN9aDlfF8JYC/oLi4YiG5HY7iaUy1LBB052etlrhQFHafHbbXbyoDsr0f0a9HkUY2o7A2EbyzuAggTxhL83UUxS4UwT6QgeSzVOt54yUqfOSjIAaTbjSLeCzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468405; c=relaxed/simple;
	bh=NuCZCPE5c8kGWnlaCoPrwGeiDvNRM1Bd2PAeJAZBMTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQf2f03srSaV8P6jSIZ7wcpPTzzWKhbfBlxXYUbGGYUzL16DxqgSetuKeqgWkTcN3KPGHh0OmePKd1cHA64goqX7iLWoXSwiFX9vTHf0Z5WV0/kbhrve4ZEHWKnet/Z8hugVO3dsvWnD1QszD7Vkpte/SxrKLa4sWq0SbAFfYqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVsBWVy/MmsBSuMMJqsr56FYdV3Y4g9vYA4D4U4Fyc4IGuhexM2XwdCvUE+dS5nD6K+3+iUfL0RLEHRUJP1BUhASnEM12xk1SiouFaJ197QaQmVzqxTMUHL5Y8OOe0/F2uyzFsHRmDM2kTEFz83n7/lT+5U2EK7EKfpzMV+V+NgNywANJ3oqSFQgiQkYQqGiE13G8jO4FKl54sU1QjMlIRsRBqPPSr0LOKcA3n1z/pXokLp2nipRRMtBDSiChXW2quJ1fE8sAZNyuoMJ9zOSyZFPoZWuv3yeSkDD2ff+7ykeJW0MiVvgcitf/NoHZVtHiQIaLw0VkNzHFGLqHdZklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDUVuvUeUSgZncDkk5sariq56OB8KqyUDfKKqGjzloU=;
 b=c7/W7WP2WLbKMFWA7krzm8FyuSj5wx8ICyoDe/BGW49TQwKz/1AkCuhd5biZ/IFdot8nVaGX+UKOexqaD9P7k6mKHKYMdcNd8TrG6ZN0TRgjfr7mIdcBOr4EgIXwXzlNZkNVuz//777ni4up99vsesUX56rgJMe0q76ffgUExc4s1NhrZshpBUf+7dppSUCrpRYpL4sI6WEPs+iRve3f9jWvTefbP9UXEwgXK5xyzzEV31Y9044zz0FfitxqNaC7uNoPZYbE2rvGqCTBo+cJ/GJhlt64bsHVKpS1MUr6mebSFSAFMwOQ6zo9tS0dHIz9VQMNEZDxlcivNVElsROD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:53 +0000
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
Subject: [PATCH v6 04/15] clk: starfive: jh71x0: Add generic CRG probe helper
Date: Thu,  8 Oct 2026 05:33:27 -0700
Message-Id: <20261008123338.11081-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b5db67-3780-4e1f-fa35-08df253869b6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	o6t9PpXMrQGcEtu7jkeQsDlzTx2QRMTFA13UI4ffc9Mu71JVqoiEGGSugQifbg9z5tJOK2iV1VjTkKbV2jEgSObxTTrop/i/MBL2uqJsuqedi3b3a0/+9j/Yq02adMJBlcHarjhmWShL9T35u0qcpWWDRotnJEvrbFi7klJLa4gef/Buf3CfXVFU7wzX+1IqCWPbKetF/qAvUOimjX5Qb1AsvZ+DZbribOfIfQrM/Lcn141TjyGxHTpXEe1f60K6e0TZ6cT5cn5OfAS+AyBk8lVCHdz459slt5Qql2VxDqF5z86T3gRFqIh1Wh97m1oB/4aCFO7Dvfa/5Bnqd30Egwaqmsh7tXwRyalBe613+9699BHZszFTUQcV5Zy0fquTDDr3V6T50n6xmBR0xNlxbPH9WT6DZ/OeR9ygngW1rfexn9c+z4lbq2fJiTRhJMl4huqX0zKeVzEV7LkmAMPC06S7yb+6iaUezR7+/ZqaATrAcS82avi4uWc70yDP5kWtXQpEQN6HYsbbHUr1jZGMUS6xpKVfjvXFRtSiUhvr9p1Xk9/1YDASZmITDvpNdEi8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oBuUQkAta2KpqqnB2dQe9915M2TPaZpHbQWzTfC0Xo+RK6n8GVK7l0hozBSO?=
 =?us-ascii?Q?5UQX8eRZFteTUehFyPEM4CCQ1XIGDv1ytL1Brqp17xfLBKMbpG6wQrtGhXp4?=
 =?us-ascii?Q?BGRo0tDcKXsqkL8ubgcbdlB4J0sOspq3qCbwKt/nJpThWmADzdJJreeK8O45?=
 =?us-ascii?Q?8FWp4HuUXbx51zNVk+BEq3f3GyBmVlbUSBnatxtiYGmo+/Tb9iqwFV96wxT9?=
 =?us-ascii?Q?WG9JsjekInA6Wrr9oELHsDDzeZMhb1YsLL90zgKU0E8KkY7ZeNzqk1jQDs3i?=
 =?us-ascii?Q?ZXGnYjh7+M49Hh8Sfq4oOVdEmuh2PJsb6urESMtfhzf3VSAHqixUTjqSO4aq?=
 =?us-ascii?Q?UtVXdSAVen5jH25XS4xBq7zbJF3VURFTeHegKo9L4sNvcylXXMfY8IhUODsf?=
 =?us-ascii?Q?LQ+s5B2GreC84IdIBSLaDmIOybi3+RkzJ/VEAzvs7dhI3qJdPKXj2uSbGQyI?=
 =?us-ascii?Q?s9VOGL2nrdq5qXLaW/bb5eOfChOtDuJRfvwvCgjNjtyb6AnI+AVjv/pl6Asi?=
 =?us-ascii?Q?99j47LMPeUtTZ320i33MTWM/XWjJF8KC9XDBTG6p0hyfSucHCjT9CbAHe8zd?=
 =?us-ascii?Q?tIBTrvyGMXUcgKx++yEyAwidLX/DKY3WTwwn4jgH+x9USGXctU76yUz4w0/G?=
 =?us-ascii?Q?AxLG4md/Qa7gyqV6WNGkeu9LczMvlWtbQ5fwYHt3lvpj7yfSMvr70VpSj27S?=
 =?us-ascii?Q?Mkl7OXpPSiQKwLaQGEwkHgQ0+MeQJMxh/SZalxeUvO4vcOiRxHsEjpWOR1il?=
 =?us-ascii?Q?iILMK97EIKgDD/UTdja90zlef2QX57fNWiC0Ee7gObz5S1q1aWlq9YLNZqGm?=
 =?us-ascii?Q?shKytqpnDjMx2Q0qtItbOeGsVwB57YzzlQHRegMinZT0KT6XPjkog/gF1+Tr?=
 =?us-ascii?Q?lKHttH3iBECMTvOt4ZC+q00w+PUBagOVYW+c3iFFLOwzwEVoTXTzJp4NT/qq?=
 =?us-ascii?Q?lCy1WO4GIHSCG4TdOjz7NYDULhvLGF9eR3NLazVhBjlzI/aC4r4VQXzSoO05?=
 =?us-ascii?Q?fXyMtyXH3hG8svCeeiWqAPue/oh8dJXRm6D75rJgqzQ0sX+fs1guhnKqFSi2?=
 =?us-ascii?Q?U8XeosSCHjOgzJVvkQbEmT/mFBi1h3Dcn3NKOzYHpoVf+a8DouWBiCykzXK9?=
 =?us-ascii?Q?Spihq8Zs4aVmnQdyA6GSrY3Vg2Irn5eS9U55nUgMJ1Nsfhhh5BrWntbSVOXP?=
 =?us-ascii?Q?7DiXUwsxDVkFYABfeiIYclsNcAFo+3X9kHdV7aqewv0CjCMs8SzcggqiPFLQ?=
 =?us-ascii?Q?2fAK61oV6faT4faLf+H81Pk9eqFANeyi4hEnD/hgYw6BQR/r4eS8fa5R3UQI?=
 =?us-ascii?Q?qUoYsCoc+yGK/apU9EfOqObZdHXHV7cksHXGbRakL/+Ov5mxkDeN4SGrlbrm?=
 =?us-ascii?Q?kV4oBVHkNwYHnCdXK2SEzSVJSN85AHb4p3FntJW1TpNUDp2l4kNICm394659?=
 =?us-ascii?Q?c7wnbhU2Zk04ZOyQvMoC/H8gvj78WXXCgy0nGSw2VKqNl2/jphlPr8cdSgwU?=
 =?us-ascii?Q?fUY4+tc54p7OW2a5mn6AnaOw1an5tlB9J9Px0T5I82+MP/l9RsjOzo+dPyP1?=
 =?us-ascii?Q?4HgCzSagLmy78kn7vWY9WTfQEFy9VVpep0onRf45ZpdMFtreQLXDdhVuwUmh?=
 =?us-ascii?Q?JNGXzEPnXRCR7W+IKZXHMf0t8wk5eBGZkMhUmn4YeeKS+DOsyTYBVytD9MIM?=
 =?us-ascii?Q?NHCHIkEotsotATPgrBkmC1Qi0S+7JpxDLVkW7V9utDaiN8OtoBYcPgt0uz/d?=
 =?us-ascii?Q?8jI2bKRGxsOAi4ZpBWcweQJRSOnHGUdYChOHuUxzxJ5URiOxX8Cg?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b5db67-3780-4e1f-fa35-08df253869b6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:53.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+2ZIZYE0hzfjrCQR/3VWeMoBN13s4ep3spnLlkIffEJ0d6Q+DJfpiS/C9Ng6+sjVBAGFfi79KM5VlT3JzxMyFYezhDnh8hr8fZYfXsAyQPsQYn98gMBIalF8dVsW92a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

The StarFive JHB100 SoC has several clock and reset generators (CRGs)
which share the same probe flow: map the registers, register all the
clocks described by a table, add the clock provider and register the
auxiliary reset device.

Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
that each CRG driver only needs to provide its clock table, external
clock names and reset auxiliary device name. The reset auxiliary device
is registered with jh71x0_reset_controller_register().

The clock index space of these CRGs is sparse, so also make
jh71x0_clk_get() reject indexes that were never registered when the
domain info is available.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 98 +++++++++++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h | 12 +++
 2 files changed, 107 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index 2cc71f49ddee..c5ee82db3c92 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -10,6 +10,8 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <soc/starfive/reset-starfive-jh71x0.h>
 
@@ -334,10 +336,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
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
 
@@ -391,3 +397,89 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
 					jh71x0_reset_unregister_adev, adev);
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
+	if (info->power_domain) {
+		ret = devm_pm_runtime_enable(priv->dev);
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+					     "failed to enable runtime PM\n");
+	}
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
+			if (pidx < info->num_clk) {
+				parents[i].hw = &priv->reg[pidx].hw;
+			} else {
+				if (pidx - info->num_clk >= info->num_ext_clk)
+					return dev_err_probe(priv->dev, -EINVAL,
+							     "clock %s: invalid parent index %u\n",
+							     init.name, pidx);
+
+				parents[i].fw_name = info->ext_clk[pidx - info->num_clk];
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
index 322a05157faf..2a1f0fb4cbb1 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -5,6 +5,7 @@
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
 /* register fields */
@@ -109,6 +110,15 @@ struct jh71x0_clk {
 	unsigned int max_div;
 };
 
+struct jh71x0_crg_domain_info {
+	const struct jh71x0_clk_data *clk_data;
+	unsigned int num_clk;
+	const char * const *ext_clk;
+	unsigned int num_ext_clk;
+	const char *rst_name;
+	bool power_domain;
+};
+
 struct jh71x0_clk_priv {
 	/* protect clk enable and set rate/parent from happening at the same time */
 	spinlock_t rmw_lock;
@@ -116,6 +126,7 @@ struct jh71x0_clk_priv {
 	void __iomem *base;
 	struct clk *original_clk;
 	struct notifier_block pll_clk_nb;
+	const struct jh71x0_crg_domain_info *info;
 	struct clk_hw *pll[3];
 	unsigned int num_reg;
 	struct jh71x0_clk reg[] __counted_by(num_reg);
@@ -125,5 +136,6 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
 struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);
 int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
 				     const char *adev_name);
+int jh71x0_crg_probe(struct platform_device *pdev);
 
 #endif
-- 
2.25.1

