Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996351;
	b=N/MPBIhVLwtxpHK/k4LvMS4+zkv8WlidyYSps5Xkt3u1mHl/0Rf603W3bbOuGI/YtKID
	 k3pfkrty+2Hn4jXW+z4z4wTj4JAa5SL0n7VCMRGWFIwjoctLaRArKnjyh1Is6FvMFC41h
	 ryRWZYQ7uB2FokXa/ykBYSzO+BtLH+FxgYMK6PFTEoUH8cBYo0+BagyXdqfeW7K38wGwK
	 +XARarUesirjcVoTsYq+9f1Ja+E8nZ9l9h+QD127IPlNIY0/SxTCk05m0cvEVwMecOH5G
	 EmGQvT1S3AcRAmJGgPQevukfM2qECByus8uaByYrQQGxQ5Uoc3HXHX6s1Pio7xvf1UQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996351;
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
	bh=y5r09nw85BFCAXXmw7vbVSX4NoE3v+3vs41lvNiylYU=;
	b=A1dKnEMw8EetaZehq0d95vAew5010v61ej3wiOhuZ2G1Np/RVsLdm6ZkgmkVY/qWXPo1
	 sOqVHQ6cgKmF0pGhpjdUuCoDH2+XxnoKB7bo260fhWhUfgtQjkx3cwrEup1hSbVop1TAP
	 1whPDSdFf5Tlj70DoV2jfofS+73NHYDMNRlh/a5YAAw2z2+Cixi7bI1N6B1N2r0sbS0q0
	 aciw+NgvSplGF4RdvkrKJSD0uoYhDhKCDtNv5GUhySYTyjYiQ7f/CDiR69VI92JGHUyT0
	 o/e7ldiG4OjvU2P1QRSTfDj/jdAWMTXAnAy3m/f/wIvQ3XbajP9iv35Q+DtiUrcDsHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.117
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2117.outbound.protection.partner.outlook.cn [139.219.146.117])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9828606A33D;
	Wed, 18 Nov 2026 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9828606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFlKbxifMpJF5rbnCqZkdrt/nJO+6rxOSCsyswlKSqttV2E+9Q8tFqqcivizbsMJFVYQJZbAxutiYE0zYwy74t6o0a9wPZfTRd46L99WO0OBzaq8tpUe0lsi5AcTJpNNjkrtnOYNwWcXeVr2ZtUSuH8D1gvyEdhdBr074ldfKXG9ukXDVZzlF/3zn7ym3bTgJyb7EyKrmHkq0V4uiV5jKhIppQQJGpCpbtMhzGtTVQUyrr/75388ex4K1YPyla27Rqz+nGdoFchZn2AKGaLiBfzBeU0iZgRNhxG50TSCSv3kOWKrCDj/cRIK7b+NG2MxKvJ92QaXvyGSyvS/OtnGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5r09nw85BFCAXXmw7vbVSX4NoE3v+3vs41lvNiylYU=;
 b=nvsIKvEHOeiN/emTG5tDCZdZlYilUwxrb9EOpKd5JqOy7Sj97DrUT7Zpx1BuVGpcjIwZMjMsv9llYdq4U/dVfVarRogdlgfGESVqL154yG5dAWg3x2smWAA7beTGsaHRV2EfK9hscPbNFVklOsIUrsle5GcaV7yqcCtCAnv5F7HkFFLC1BXddOcqIcnY2DYpoorlKsiekcXOpjw7ahCrqQVv5PTA11iyeCz74vsIlLbFoz63DK8jPihEnJwf2XbNamMk68ztNlMRA2ydtAZx2weVKj3KVisXg2QCr16y02rnOog5+Gh9UVCF6BCN6DAPwZvV6WDV/sjxEv3EohUBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:39 +0000
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
Subject: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe helper
Date: Wed, 18 Nov 2026 02:05:20 -0800
Message-Id: <20261118100523.11395-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af5f7f3-1927-4f06-db9c-08df455b7f88
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|56012099006|261022105027099003|261022113327099003|261102123227099003|261022075727099003|261021123027099003|261028144727099003|261102130727099003|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	e1TKYLLlmhkb0GYY/EE54MrGxFd4IqWkzJmqFYKuXcgJF3y5OTNL8u17qqWS0XDc4yh7CGaFG4sFLzyMa1n8TfPf//N+zTwxF8FtWMulsc5JZHT2LWat2uezvHA1EPiHn+Eo2oZ4DKrkf5YU5xJerxLRQtrlUH2ui+ln4f17JptO8EqU0nXjrTqJsSd7WrGWuvqQZWcCg15CqVSK3e+0aQ1F5nRlat/XUcqCRRqsU01ZCpNrdPwp3pwsV1DTXP5X7cbtAqFf+Bp17WBTE+P31DjcCjYsa8BHLTB9Kg2kd6t/nYeFm/WlELrBvIF1GgScgjMG5PEzsj9rLUn8oEdvf5l2bVDeySBuQZ1yhT5PuSnbLglUX2Tvx8krLJIsX5rSrj4z/j6beSCgWRj/nZ6IrrhQO4peMSAyNemG++YV1R/U/C/OdpoZ6NI63ha0e9uHer4Ljpf/tb6z9Tni+l3Rwmwyoz1DQPz3f9601eKO8xAzMdkwEYBVTF4YmULDBChNEO/DakbkVGI3fbN5+R9hl+TqYzDp3L7f7WXzi1WuAtzcyuSz3eh+9fdmVsH4MCfG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(56012099006)(261022105027099003)(261022113327099003)(261102123227099003)(261022075727099003)(261021123027099003)(261028144727099003)(261102130727099003)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4XaAceEmGRnQYe1FQxg6JljGgdivofb9UEDDp9jR6+/CbLUUTsdXuNH/LxnM?=
 =?us-ascii?Q?RYKXtciAZtt03xnDGd3MJlfzZ6/V4dxMrzY+0U9ZXAH/2AgSf+0PoF7N0eu1?=
 =?us-ascii?Q?ZV7bYSscWEV7NUchClOHx6eqb/mcYl6RtTTZfkPIXq/GlFEIkHisG1pUG5UY?=
 =?us-ascii?Q?ZokkS7pDv93nTXT2ZzM+qcIDIKCtcfZV6XItTdB/h10bUfrdqy1kFsmddJqz?=
 =?us-ascii?Q?5fb5+qNZg52QmxIeHqSMq2FPOKwoRhPkNv1b9a5bmD6SvDqOO64c4R3Dk1B/?=
 =?us-ascii?Q?vODyAdWqRTWyZFmBQW7Ho5rMZgs73LdoqdUNqZul9zh4L1vwWRXgTIWAFZws?=
 =?us-ascii?Q?6TJ1aEWzTihdIhtVQmF/js9R+fYdNp+pmMQzbSs6hIgkgd0oF4Z0W6FJ8KSv?=
 =?us-ascii?Q?Z6RT3p81bkAcyWnyHbXDLe4P2aY1c8vMchDXsa6ZrQWWVJIpfVsLt/zVSAuK?=
 =?us-ascii?Q?yzTYAPWb/XUACFxHC3gKV9aOPoNtGwSDBmcT77idrLN0QhOe9FgGGJt+CgIv?=
 =?us-ascii?Q?JiluwOpALRxtp75Up30XGRLEzKiu3Il5rvptfXt6V7dlApve7Ic0sKV6HkTK?=
 =?us-ascii?Q?WmdilMiSKb45zK+CRBl9+SFf2Q0lZXEEYkYZYuGI81Pdwf0XG6VIZbM8PQR0?=
 =?us-ascii?Q?XXLR/qMgVjYUgLokJ53ihpmjZC2IJ/WQhHdG0au4Z+bwl9S0x3zWJXa1Ipc2?=
 =?us-ascii?Q?toqNT/EolisKw6hSicVrp2RuuLUj3WlPD6E2io53soxKDnj/hDTwnqftbcv4?=
 =?us-ascii?Q?74A1gN7x/fTImoeRMgJpod0XhiiGbKoKoFpk85kvceU6OSfwDt/Enp99sHpV?=
 =?us-ascii?Q?rqm0yc0tn9TjjS0VbSaPuGi9tVTpdzmOy9ASuRfvR8RyxzyZtZD/3/aXCsre?=
 =?us-ascii?Q?+POeo7OWTj+20XqqcBhz8O0RmVFf/XZecWZUIBpXJa2abtz6WvWH1POs9oMz?=
 =?us-ascii?Q?p7LAOJvzH8DRFX5xWittCMy/zOBQcaSq/zZYFv5T8KyQfzlsJoStpdAaf+Sd?=
 =?us-ascii?Q?8mquyiydqCC0lRlXa7lIudChE4L/2cK3CHHtDqegcMKXbkD53VtsuWywW6ja?=
 =?us-ascii?Q?2ZFRhTX7ugzXBAtixcFfzRqewFP71QPD4xy69Oc4Whv8tkw5wMnnvCJzh4sg?=
 =?us-ascii?Q?DmNQ98aYjdj4TD1Kli8X4sa5Xvb1GJa9b9tjEiATDqa9HYHanaQQPZBQkEGV?=
 =?us-ascii?Q?F8uTy41e2obu8KVIv7k+wDd1RgpYQH2u2q8wxPkweRqp/03fzIiWVuw5qVSF?=
 =?us-ascii?Q?kGMbpqihEM94d/Xd700hOGXm6y5yFOhwPwcQ4j8FonJ7ESZxd8twwVtfbjwc?=
 =?us-ascii?Q?67nwcyDeV9C0aE2gag4QtNTkgpEzM2yMPa+ZlozCHaCEGO0wRRX/MR00AFCo?=
 =?us-ascii?Q?vfIGU4rwhrrF0c+cmmr9aZdFl6DegFoqeNBbKrtybqfh9Fc8hnW0thc9C1WW?=
 =?us-ascii?Q?L7/IvxlJZk651lMOXZzDbJc7hZpyyZ6CKLg26VzcWOczw+ci/kDb8IVcArbX?=
 =?us-ascii?Q?h2W0+ukqolmQ+2eguuoHCzDoVuvM0x45yrF9zx67msVgS91rmigHlQLWebmL?=
 =?us-ascii?Q?c8SWEAebd66WYt8Ybvdq69hbQf3hDYLm/3b614ySxy3c3zgIfZtOh5orRh4g?=
 =?us-ascii?Q?dRDCTIE2yuLj+FSP55XZ2ZAiACtev9fE+aH1CT/yZ+QHR81AEVtVeH5Vcm8n?=
 =?us-ascii?Q?mF9721sWljLzQntk79eA89KfrmhYOBnjmnTm/MJ4bgdyC2YeJBh4XExkf3/b?=
 =?us-ascii?Q?oEJLppBAStdldF1vRUTko57vIC4leMIC7eVT87jCYtnNVCfJ7Cms?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af5f7f3-1927-4f06-db9c-08df455b7f88
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:39.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDUSkIWku33TPzwBHf1em372zDG5Hdh8xDxqOzVPSjC5T8YYi3qWS+uzYINRN03YF0zSMqzRz8KKEj9QP+hsU62dk6tEOXdjnBNTs+B4yvhXh6+J0AHzyg6ZsT01HlmK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

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

