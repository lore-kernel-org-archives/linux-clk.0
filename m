Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15633B1ED0;
	Thu,  8 Oct 2026 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463768; cv=fail; b=kyhxrqEe3tjLGBlpWOw9/5K5JALqje6FbscfienF2nS8DXO61hqET3HpGAewrD2nZ4rgFveycVbZzgzGWv69J0QxTJGTk1ypgdyUaNkLqYgaliTiiuDCXUwta8RjJLwSQGaBsLnsZJv3/7mAo8BXy1va577rpgqsVsYXiyJ+qO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463768; c=relaxed/simple;
	bh=+hGGUykbLQtFQB2nQpyOZt6cx6lKrWHH2Pjf2xS2StE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sEkWV7lD5VgUBoUOVc5NWCxn6YDe9DiXWmbu8X66GuOY4tNSSIEPmqSVpkeXLjzL9KZYLl2UNZA3OlDqK16/GxAlwzjybS8psfvX4HnK5Yv1X65AaqUKbIjo/uUEJPVaUs4ePqTN3GjLbZV2PVAmBa+oRh7g0Wws/kncyDbtt7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgeRS1FXy4RAFzdBdpIOTdEewdZQpE5QuxIAOIILktgFF+nGcSF8o33TpiKMiPjslvM4pKL2yphoskRTSXsav0Ipw85CjPW1taR1JHi10ajjPqf6GzRQsHEtHj8uzVaRLTML/FWRE7bb8Z2DAWJxIQE01EQmaZEYes8Id99Wsu0RdWN0Otht3aUWgQ93z4BR3TLbSANyy84qT8K0vCIs38tcKM7OBqljS2lwtcaFWC5KVoLpl7qqLaiUHGeFKC8s1hmi5KZSZgxWr6khuaiTXOx+c4wVqIckCJpOZ6MTDVH8oP3+P85a4iEXMKE7HTp3tlZCkcrGcAd+FdMms8zISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgQJzqNzMNQKSUJiz/5fjNJ3DzvoNFpu5AquOA3Mohw=;
 b=X4fdQyJBApcu9OIBUW3Nz9LZIgm7xEP00vhCo988T7pUTjlZ3OnTHlF8ts7ts1K3rxMY4rRa53JzhXDq2Gj/zuGNTA6X7OrbPnsTlDaC5whHi1zwOdeY3Ykbb3aiDvt0mbZqRIwiu//uDa80lDMZ771IMc+btV2Jav1sfyptU5YVhye9ILX0YO79oOjK/ZGeK1YlmSPr76JVPcajvhugXkqbOXkG0kbz5CfQGYGDCGSVYkzU1qxBOKLbW+nKHxjJ5/9EjhB0fB/cCDev8iKbap8abaUNzj36KAOGICcrNXkCBJVPQ1ocxEDNC9igYHJjmRGwxMJGaHgD4RQAVzqH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:52 +0000
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
Subject: [PATCH v6 03/15] reset: starfive: jh7110: Match auxiliary device names to jh71x0 clk driver
Date: Thu,  8 Oct 2026 05:33:26 -0700
Message-Id: <20261008123338.11081-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 328c0713-7b90-4ed1-c381-08df2538690f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	vlE0OFO6OYdVb4SRZb0vCbHT3anfQkK1/VcTBICN5iCUfinPT0rSGpp5o8KvLuQLi/OyNksWZ3JX1cX/QTXV8OTusH4rnGewHa5zRULW96H6uGob2hCAEF3f8iEK3CIJ0Sfpnia6j4k0NGwm6resw8Gf7yaAot082Hr4/kqRv/GDgXlxr0OgWZlXQ8gXBXg0Df+TtIUG/tbW/6u+136Ay6vst9qK15qzWwA8yHxNBZfWdyzzINGxv5+gNLQbV1fPL+e07jJhD6vRSrfRJzbNVyVIrNgj7ksAdhzGd+Hv1TwZzrQKAaFTaHhng85n8tgiVTsG14j79jxAKRqJ3ihL8VZnlKr3rgHOL3Ru3wi6DQj15xosPkAUr0EqAQmW+DD/LbfwLd/RqqDInbvA2E8ZLl5BivKKij9QPrbNv881j183nAiE2UrESUhnNHG9/LzktXgJatsOfyht6196sGfRvvqgLhRxUibeuLTmyP3bQyk0hl25VDU9hDBhdG7+OgWbdWSx4p/7Y8fm5AQ9IlJJIopsqULDcL8dExqBeqhYsyYV52bk3D85WqA+vY0MoK5y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4hLW1IDp7wKfWPpsWjQVEFZi8hYIr98JnMlynuHFd6I6TTTgfQL2JsLS5pcM?=
 =?us-ascii?Q?TIL+TE8BY/qz+5tJxm5KAbhFAiJd63eOAXbiHCRIG71w6Ld7n231lIHmtjEV?=
 =?us-ascii?Q?VgrPbY7tCPnlvHt0QDlnOQ6xjwlL8wcrvVdHUkREP/6SGRzG/KCi1boX20rP?=
 =?us-ascii?Q?I9qmOPIubgMPjkZhthoUWIGxW7Fup0TfpEcZy95RqL77A0BhBK7uAHIIlKm9?=
 =?us-ascii?Q?PDzLT/b+kC8fwGjszv8DcE6Iw9wHNARvPBJt/4vL62/mHD5RXW6Nw9OCTulm?=
 =?us-ascii?Q?iXHGyzGf+TL0Iet0Uab85eENoqkcUWxJgo4/a8843WlnX6LyzQpudOmyWbci?=
 =?us-ascii?Q?96mjXWPuaSAZbQvGpY9vHdjXOfSAB4dKL/BorQu0+eWCX2IJAqWJ83HYoqga?=
 =?us-ascii?Q?EPDfNebSyLdGWen2aJKRkt1x+pDpyr/YOd+RhzVDjXEzIDYywbJH+LiUlFhR?=
 =?us-ascii?Q?xJsCJZCri6C1YJj/PJfo3rSzcR/I2KazunYgQHF+qnFb48meLChfG268cAA0?=
 =?us-ascii?Q?fArXQBSN6hOV4Jn5JhXtsFX2F3+4GimRykb01fvk1LlzkxfhLmzbZhwzVBOG?=
 =?us-ascii?Q?yUzB0+Oi1w6+gOL+VvjOntEM/DrArgJAxOUgcrpWB/6Z6nXaCweK3VOBZ2Xv?=
 =?us-ascii?Q?lL2Is4d16xYOi0zLI3avPDciG9nrfXVMPTh4ijE13aDCQc+nh2IEJb0RW7+q?=
 =?us-ascii?Q?VNmdVaxNCC60w1nUqM91kjeXzHW46TOFu+1Fnl49EbPRFexDob9ViMvSKCMk?=
 =?us-ascii?Q?fJIClhl8Pa4Knv38GyIkt4lEnpVFLmzz0aAwBAfO7vj13UiusU90CIxkyxWc?=
 =?us-ascii?Q?2nr9ad3HlRRXDeu+WE/vYY562Mt+rB2kTQmUrdgze7jh4iF80iRJxcNHrPGo?=
 =?us-ascii?Q?o6cpfOJMKQrXer3yr6t5mmkYwYOIuTbIuMg4Qwz+2hcNf865fmi5jbcHRFOH?=
 =?us-ascii?Q?BpQSsoCIjVDt2vW4jiOrOnOwZ7LhN9IPZZFNC1sXW0rATePtYwHtiX4Zr3Tl?=
 =?us-ascii?Q?holX7yFVFjCKk4aLKvVXa+hlvw6kKYHeGAW7jkv/Z60tWs6L/ewta8ybGms6?=
 =?us-ascii?Q?O3bbYYZUR0DaBb7MMRBQhYVnzcHGwRT/1EADySxn/pNGpfXgmRX4Lv/iPnio?=
 =?us-ascii?Q?3gZhlwz61z/k2rUTxokO25yiiCyNhApKvBYVbTtBfXl18scBE3+e9KcWN4Ex?=
 =?us-ascii?Q?eFIocptFDnWOOU5HNBXYT9cYim630iiXBzrBGc9FHwn/SF+Qb9/Krel7x8f3?=
 =?us-ascii?Q?+8u9mPl/HGcCM+uYV0yHJmdGA9e25CSazx/aF+yxur0816OhdVUEVBhXfdiA?=
 =?us-ascii?Q?jD2pObBW+V83YxjnBFVirSzHlEjshgt0klbqDJs7v9HvnRtL5v6z4Vz/Z/ec?=
 =?us-ascii?Q?ZOVOJUWw0r7tYtDrHgV5T4tP2MnpwUjwPy7n6eKKbDMdALL1KJEzrM/Pekvd?=
 =?us-ascii?Q?L5USy6EKJg9dYH2TtKj0CDhB73b1zaAZSJhobVcomOp9VRaEzgoe3DTCmjvS?=
 =?us-ascii?Q?sIMFs4yFHlE58fzvztQk7sZLerKcNp3bp5C4EDEunrLLDYQfXFeuzcJBizOi?=
 =?us-ascii?Q?xO2M712qlvVjnlnSCR6v889n/BDmTeVrYbOyjVTMgzlXpsvmKtdMhQP7fOwd?=
 =?us-ascii?Q?KHapqsglU6fsHT8peZl30tyujt0WoAysKWeXNmNGK29og04sOi2UTS8sal9b?=
 =?us-ascii?Q?Z66zvx9ElQWwajJOxRkvsLfSX9Wlzpk2tOfaf+29IcwQEZAOK6mBALr+0Nqo?=
 =?us-ascii?Q?RM6gPyujudkKgIlTyio+400T/fqkiwp7AbLWYzRE8NDhLT1pvbRn?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328c0713-7b90-4ed1-c381-08df2538690f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:52.1929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cCknNX6kJ7mw5I322AIK0M/INRUsX1ro+cc1vBlwli4uMywW2g6otfC+/jVuzt3m2UmTHxOqsPcjQ8tJSuB2wtssONsK1rKpru1alSKlVribwExZfEK9Fo24rzFv4EI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

The JH7110 reset driver binds to auxiliary devices created by the
StarFive clock driver. As part of moving the reset controller registration
helper into clk-starfive-jh71x0.c so that it can be shared by other
StarFive SoCs, the auxiliary device names are now prefixed with
"clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".

Update the auxiliary_device_id table accordingly, otherwise the reset
driver fails to probe.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..c936e61156a2 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 
 static const struct auxiliary_device_id jh7110_reset_ids[] = {
 	{
-		.name = "clk_starfive_jh7110_sys.rst-sys",
+		.name = "clk_starfive_jh71x0.rst-sys",
 		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-aon",
+		.name = "clk_starfive_jh71x0.rst-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-stg",
+		.name = "clk_starfive_jh71x0.rst-stg",
 		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-isp",
+		.name = "clk_starfive_jh71x0.rst-isp",
 		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-vo",
+		.name = "clk_starfive_jh71x0.rst-vo",
 		.driver_data = (kernel_ulong_t)&jh7110_vout_info,
 	},
 	{ /* sentinel */ }
-- 
2.25.1

