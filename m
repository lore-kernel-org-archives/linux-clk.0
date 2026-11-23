Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795432879;
	b=Dj3kYX4qJ3A2YtwbL39QgKm4mYy9ZY75Glo6YCky4CkhrLh+n5WpFnkbA9eO07En/ZYF
	 ktB8ZTTdZiPwoXxQ89sk0kfzBKlN6OmmZkVbeHYF0hRMmtn8FZdNw3oeKUE/uK9K2vo5G
	 Qyvm++jigJ2clc22FR6Ag39nXKhdpUaEqPOv1aidRuZWqqAz3Eqf85EwBkGQMLf5Xf/zK
	 TEyekqxAAjo5xV9PEoKkQOCTR+T1BZMe8khiPu0ZvI6IvToy6AVnO7cf4d6RVSV0ejkIk
	 vJqwLzbed06YloguAH51AmNc1kwSjp/2y7Sh+cpHLXMOeIl/IZRYuiaMrkDQ2zzKqzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432879;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zVR9EyvHQQvi4Go8ERrELDyBK3kY5YGRk1fgZV0+70I=;
	b=WmbAIl3QJjBpxMtOCalDtMgi9GQ0Ba1fdWZGEDgDQToD8zJphDmsc45xg7cdjmPdAz4e
	 fhKshHRxYOrFMcZiVvZDVvwSDNv9OEtBbyoJb32jPb03TAw1saVVfWVJbsgnsQY79fjX8
	 vyGZ3P6pWwNUCv1MSZx1uDaRsvuI0nbZFzWOuVUWEZtkfsaz5aLpSFJMTT/SW4RYmfaIQ
	 KcfW8G55wYiyjlfUTTPZ1suN9RrHRzi5jJAVDrQw0gzeoHGYCQ2ZU2A4wACMWoozpLl/8
	 iegdwnXwfVZE1u/lcwaq8gUx7bMTWq8bcX/8W/obSF19M+FqqB1w5KpaXZ3O8Yr2aRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C4606A337;
	Mon, 23 Nov 2026 11:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F9C4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh8anaw0yvxN4vRn+t9dg4qKZPXc5l5UfZ7xD/qv17BweEuksT0EGb9YWQ7gMnRDOhCEhye3H42UGehTR7FzDoPHUmCVCXaYIPiL0eT9Wlhj2shvHnu9HbMIapl9Y1XHPqXyLyZSlEr8wAWJ73SnRQgN/uSRYuH604ZfmX/arZgp3v2Ni4aBqkOJ+WroKfIxXezrlitp1eVfvye7dYcWFr/JG3L1RVB5KW6NqnUfbx5mrUM2i0/ZqUjqAIcMm/MqvFApifV+h0FnmMDZbnIK4TUzKWFlokwl1hqGKc7kEdwndq9ji3/IF/YOew1K1l9gO+Zh1tPZqnBPUH4jv4tSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVR9EyvHQQvi4Go8ERrELDyBK3kY5YGRk1fgZV0+70I=;
 b=dGRBSdVF+WiaEmnqIJdOAhgVCWV0WodO0nMay0NcRL7mqf3CcD7YJogmu0lAemLBVQnSIpGt9l8n/ZoHkrHuvm6Qduq0shR2NBl34nETqHKsZnJXaNKd3n5pLxPXOPz5y/3pjmM6ZzU49uXEaR+imraKlkJYlVIuI1kG3vsjxvPUXeDa236J9z1+UW0u/RnVEOJPGyZkkpRUw+BGEqkE6XWLH6yYvjEnpIC7i8+sGCl1WwcdCtwwTx5LigOnoc0LWB5/5QYWGTZ/FZ76GY/MMW1MuM1jTuRHVJdUQ0yauoV5RCj8nIjERxqk40EWGuU82K7JfMjq1Fd7WtNV5s4pFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:07 +0000
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
Subject: [PATCH v3 3/6] clk: starfive: jh71x0: Add generic CRG probe helper
Date: Mon, 23 Nov 2026 03:20:50 -0800
Message-Id: <20261123112053.20400-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::13) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: dd89e70b-c0a0-48d2-c1d0-08df4953deb9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261022113327099003|261102130727099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	KjJxcOiY/GHVbUC9SeM0+us5c5hum6H/b5/BJx2VJhxgd4UT9T4csF6tkcJCncmjhOKsAvISj/AxjIIDl0QUlJ8IwR7gvdkc593bKc2/WzD4+hghiHXPwcniSiiiGzJVJzZmxcRAeXIKdE1xiu8r/nfX15QaXU4BSzoclcbMxYVkzv8bmilXdJFJzTAzZWxFE+ZIdqkNP2s2cocGs/Vv3IqSBE/DjU1qDozXXM4IZqzMBJh1hKrSGqQkvGn/oEtFT5MIEwdvTxofWE9B0WkinxvuPmZBPFkNPgyo7hJ4OksnBmEfrfI0zy8hDQEqpA1PUY9uKIuwqxiezpINnKZIwWAz/UeNVnKW/6xI5HOOeVWpBbOhd+o5iQeAtGRogzVaQ3KXmziQeJxXG0rjs/DO64NWywMGJf2of5UDdNMXiW7kuhrSwMuOU3qVoBRG4CQjHfR1GzayNNo/McSSZcxhNETAZN2EuYz7IQOaovMB3nR+u/v+5j8/onIRb3JCUf7UiIjYLp0h+ZMyxhcN1oIoMkMtaQbymxdpJJASUGtfO5xlgDZE/ZVjoN6ly9vjhnwx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261022113327099003)(261102130727099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSpMXLK4Ojf7oap3w2oGNNJu4G1a0FTCMXyQ9q+YGb6W1pJFfv0bGFqV+4IU?=
 =?us-ascii?Q?6tkfrtvv/OeIQGBBTB5IY5eUTWyluP3IFM8fuOiYA9O1XVGauYykn03/rVXs?=
 =?us-ascii?Q?BT6J1+ejNRnQskjQ3zQz7IaMiq8C+WjiI71Tm7+iL7EVxvtdMBYkUL0Z2atp?=
 =?us-ascii?Q?RA868glIvOxN7Bzka0uJ57rVuqAYvkZTenfx85a2vIZg2FqPl9cfJFD2s+By?=
 =?us-ascii?Q?xGrkJ7GbrOvTVVhtQIuyNknHzjHpnXWxJuSgcuWPZwt1rMHBCG6CDJm/oiZt?=
 =?us-ascii?Q?FBiIMkJDIii52P6rlbkVV5Zuz/1ZppfHaiKkJWCUHM1gEoSZMHXit2iq4GEf?=
 =?us-ascii?Q?fj4om9nIyxE3vT1ocWEemiw+676WBCIqCnQz3hfMFU/136kuI9pw7VrnZ3o4?=
 =?us-ascii?Q?0hRYLeMXnidoy/yJlVdXi8VBynJppw7ltfShZR319A5vB9IT/UPMiuyCKWKQ?=
 =?us-ascii?Q?5gRR+t/FLJdEOwstzOzOAo5VLwxph9X4SE+1WAb5SfylPepzDcEjIYnAZm0z?=
 =?us-ascii?Q?fc3xzOr2+t/8bHYZ2GyiJrIZ8HNE3pE9BmEk29jyx2fB3VqEG/Gr3dUNor4r?=
 =?us-ascii?Q?wP4on45syrcoZ7i40HZCrdNX0VukaA6tR2e7EzciDuaWRxtzd2vwCBAt7H24?=
 =?us-ascii?Q?aapnMZ3bhdCqkwdodiUvMDK+3hZ47tjneWfFNc13vEAIASMPUAHe/dhC46nq?=
 =?us-ascii?Q?jliuiNq6weu0/J8n4wBl0/K+SD+Iz9k5lsM/f+JhppG4W8130GF+FAPxBgN3?=
 =?us-ascii?Q?hEybC8tZzOasHkdoklR+e9VoeK2sgJvBw8WF/V9TzE0gQfj4am7zqyWGcIyk?=
 =?us-ascii?Q?DeobniiSb3e32xUyrMK4J+U6UnDvQtk78TlGIb7sB0hRzxDCQJkiiMuMHY2y?=
 =?us-ascii?Q?D4/y6E1w3tNeCMbvDaaObEbHQFrt479aQXOwLfgiXKSeyykOlBZF1XAFn8TX?=
 =?us-ascii?Q?t4xm1gJIGuQpcxbh3P49Uaw9e/f+0ZnaDB/TAPP28U8HULFvJW4ny9k1YkLP?=
 =?us-ascii?Q?dggFG5gFEy3oKKWW2uAo3x/o7cUqrcBu1YG2e+JwU207qY5JTGkpA4hkI3a+?=
 =?us-ascii?Q?fByxE1BXQL0bLtw3RPVQkAKLl3wp/OWo9NJKrFAWfDjP7R7FO1ITCcVHzNm3?=
 =?us-ascii?Q?/AIKQz/jgR/Yt0PfLRHh8y26L6f8LXAbFszf0XzHZj2AJdp0dYvekzCZZRRZ?=
 =?us-ascii?Q?Qr+KEcpPrD9FUD5RPl6m2UI9GRADmqgiV5+YzavYJ/oHXhZRxYPiXw/sxO+Y?=
 =?us-ascii?Q?kckvcSWmTIdd2UtIt9FMjDStv7nskgpVoI+ANT6GdHH+7R90+um+haeZxhgj?=
 =?us-ascii?Q?J9bPVJBJI1xavDBymwHhjuCVnhBk9/FhOwj3wkWwxfBWztDovemhiJ8FNU7X?=
 =?us-ascii?Q?B7X+cBZiQws5ZOQjKJ8h6JRo0sMGpCFQ1tnEk3RUf5oq0dWHCmQ348AEFnm2?=
 =?us-ascii?Q?4QnlUVfObhv86+UeF48DWdc5FMs4Vm+jtoFwsrJm/tX30GPliyA6FpbJ2NDy?=
 =?us-ascii?Q?1IJ6B4evyQ3DYGaIbdrS63BooxIZwMg4YHDr5walu0fcSXKLKipDTBfeEqcu?=
 =?us-ascii?Q?FKr1y7Q7s9ojQoDg8M6+2E6IuZNSUV5b8TFJ5rp4qLwitiq09pJPueCX78SL?=
 =?us-ascii?Q?nFW4mGCMeALZBcIoG9ou0USOGg9Bgq4Q4W/0Eq62inhOGx/ZAr6AAhmLwLeF?=
 =?us-ascii?Q?HLJRs77JZBO94J+Jd1Nu1/coEJiplcK6rg8iVofSy4553c19A9IEElKIZDSN?=
 =?us-ascii?Q?7PpfwNcIy5Wsqd+W19HlxGDy06Hr7V+KHE26yHnhEeOYn4dtmpBs?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd89e70b-c0a0-48d2-c1d0-08df4953deb9
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:07.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnTciqFahE/l3y/mTLnNU36bRgYNLtLVTwzPesGLIOQ+m39kyfHcGMH/1yudhQQBqB0P42xZKYiWTm+aXPh+8DYHts9XWD4Psv5UdOhHZRzGpT44oARVBCJC5mU5VBKc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

The StarFive JHB100 SoC has several clock and reset generators (CRGs)
which share the same probe flow: map the registers, register all the
clocks described by a table, add the clock provider and register the
auxiliary reset device.

Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
that each CRG driver only needs to provide its clock table and reset
auxiliary device name. The reset auxiliary device is registered with
jh71x0_reset_controller_register().

The clock table is made of struct jh71x0_crg_clk_data entries, where
each parent is described by a struct jh71x0_parent_data: either the
name of an external clock or the index of another clock of the CRG.
This way the external clocks need no index of their own, and the number
of clocks a CRG can provide is not limited by the width of a parent
index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
used to fill the table.

The JH7100 and JH7110 drivers keep their own probe functions and the
index based struct jh71x0_clk_data for now.

The clock index space of these CRGs is sparse, so reject parents that
refer to an index that is not registered, and also make jh71x0_clk_get()
reject such indexes when the domain info is available.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 92 +++++++++++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h | 34 ++++++++
 2 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index db8c3571ea5e..97f8782df211 100644
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
 
@@ -361,3 +366,84 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
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
+	priv = devm_kzalloc_flex(&pdev->dev, *priv, reg, info->num_clk);
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
+			const struct jh71x0_parent_data *parent =
+				&info->clk_data[idx].parents[i];
+
+			if (parent->fw_name) {
+				parents[i].fw_name = parent->fw_name;
+				continue;
+			}
+
+			if (parent->idx >= info->num_clk ||
+			    !info->clk_data[parent->idx].name)
+				return dev_err_probe(priv->dev, -EINVAL,
+						     "clock %s: invalid parent index %u\n",
+						     init.name, parent->idx);
+
+			parents[i].hw = &priv->reg[parent->idx].hw;
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
index 322a05157faf..775c1012a889 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -5,6 +5,7 @@
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
 /* register fields */
@@ -29,6 +30,31 @@ struct jh71x0_clk_data {
 	u8 parents[4];
 };
 
+/*
+ * Parent of a clock registered by jh71x0_crg_probe(): either an external clock
+ * of the CRG, looked up by its name in the "clock-names" property, or another
+ * clock provided by the CRG itself.
+ */
+struct jh71x0_parent_data {
+	const char *fw_name;	/* external clock if not NULL */
+	unsigned int idx;	/* index of a clock of this CRG */
+};
+
+#define JH71X0_EXT_PARENT(_fw_name)	{ .fw_name = _fw_name }
+#define JH71X0_INT_PARENT(_idx)		{ .idx = _idx }
+
+/*
+ * Clock data for jh71x0_crg_probe(). The JH71X0_GATE(), JH71X0__DIV(), ...
+ * macros below can be used to fill it, with the parents described by
+ * JH71X0_EXT_PARENT() or JH71X0_INT_PARENT().
+ */
+struct jh71x0_crg_clk_data {
+	const char *name;
+	unsigned long flags;
+	u32 max;
+	struct jh71x0_parent_data parents[4];
+};
+
 #define JH71X0_GATE(_idx, _name, _flags, _parent)				\
 [_idx] = {									\
 	.name = _name,								\
@@ -109,6 +135,12 @@ struct jh71x0_clk {
 	unsigned int max_div;
 };
 
+struct jh71x0_crg_domain_info {
+	const struct jh71x0_crg_clk_data *clk_data;
+	unsigned int num_clk;
+	const char *rst_name;
+};
+
 struct jh71x0_clk_priv {
 	/* protect clk enable and set rate/parent from happening at the same time */
 	spinlock_t rmw_lock;
@@ -116,6 +148,7 @@ struct jh71x0_clk_priv {
 	void __iomem *base;
 	struct clk *original_clk;
 	struct notifier_block pll_clk_nb;
+	const struct jh71x0_crg_domain_info *info;
 	struct clk_hw *pll[3];
 	unsigned int num_reg;
 	struct jh71x0_clk reg[] __counted_by(num_reg);
@@ -125,5 +158,6 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
 struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);
 int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
 				     const char *adev_name);
+int jh71x0_crg_probe(struct platform_device *pdev);
 
 #endif
-- 
2.25.1

