Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F83603E0;
	Fri,  3 Apr 2026 05:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195419; cv=fail; b=l9wzYoMD2HkQRvQN68gBHaXgDGjMwjaPUGkmGkYhQFQI8A1m7zvG0FG8ut9VcljgoSK68EIeSfy6qHwsV46ctYxUVsVfAUrgkK4XRMFYzV1sf8oP1PToGMM0AycxWMKdLl+rD35a2QF4fhVZsCTeJXh4ErM5lPudWlfqwsVFMyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195419; c=relaxed/simple;
	bh=lAfIdRrlR/PZxuchfbUcew3pr0cq+9qIJ48V5sKx5DE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lA39JNAcK1+x8dfZcaH8A/WAIAqp67iYWEWiZ6WbaPYFV2T2e12X5oIug7uhaPcF8pHBll7t4dzo3C1TtA52hnX+wq4A2K3lMOml8mruCmqI5sedcdqNV2y/jybSOuhC/VSN8ULvLM8Wk6R495xM0BIkM4O59DyhezXwpJsz0xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjA7wYn7sUZf9K8ko7dYBdqAbMn8KP6dKNLLDFLuwMytR0keZgUECqpWRSbdfvoXlKGWcbCVqqWi/tFAoUjaTDMNe5FVbXArTpxlLdY/548tP5XgvX2qKZHBQtfS8+F3cLiVwI0UpMyRQfwYuvDyNJbDeCK9ie+CZpUhAbcM+jiMuiwV3fmqFmfrxhM7ZJaTZaZiMy6eg9vFFDsmIGYzEuN34gHpLpGveC0xJsNzw0QAXXBpl3EvYJvzcifExA9j2/VBd+JUf5xIZarCvcboaCJIV/dnelA5Avm1z8tv7i6BlZPmlzpwWmFoxB8qRsfwwGOSbSsSmyOU+Faqw/YKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDmUaObwL4o4kcRBpP9ZaKsZVYAQ8BkIgPB1m4Wl6ns=;
 b=iSk4F3wm0C0LJgy+hVX5O07MLZS87UyMXxh0DCZRa0snn4lq8IbR/dElCHv3epce0PlSLOmh+6cM5hjXFlWEZJcw4ynjlcVLrNyLuhgMBxPF+OSzkAQh3660IxQZrPBtk8fkpYbs3192NqE+n8u+EbaCgwSeTC/L4owJH9hrvvKcp36w/WRgWnAJx0pBnWyzQahYWReY4mX38tXDx2fYLxjRC2lalhoPtiCMtXx1ZJxezzyBHcg8eCKetTQk4xPgy9mUqAcIpOBuO6r8lHpHzmIPKaJodgH3MksL5L+xWWUDpU5alKk4aKwGMaCoNPc0oCyJZk0UGX6VkXKPX0b85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:11 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:11 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 09/13] reset: starfive: Introduce assert_polarity
Date: Thu,  2 Apr 2026 22:49:41 -0700
Message-Id: <20260403054945.467700-10-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 089634f9-d41b-4758-4918-08de9144dea1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sj1Kh5pmLqw3BvBht3gNZWHF9hq2YmDF/FmalTXtsHjqW6xyDja/ArYCgwuHgW+e4hXbaESP2M9Xz7UPuga/43xxlprGwJ1hgXw9gsTPiue7jp7JxHID4q4pBfT3/ZKzBkwdzPUoKnkARxPqpQyp8zPqP+kLErGYkr6tg1ADZPFneIBDCn4wAMFFpkLxgqxa8cea4ng/Fj8LrbVn6D/y+1xtKiys9CmFevWL0nNgwOCGlrOltczKRnr7hXUOCA+EP76HBu9PErE56AET8WgxBoY82pqDOwIgfU7MUclNMpZXlqpUJ/A8o0HJM5EXU/JFb/6/rfq17FVPA6G4ngwvxynQZHylfbMO7W9DqtvY/VXEp0kq0OOFqoLt7oS6ez982NGzBlW+cOHvdk8V7z0Mwr3JLgqKBNroCV1amlYTLJPUW816OL1XMHbpKq1o3Z0ZnieArQvcaDW376OARPKDehfQqGtrVfEmSSmwtLHRkLkxUb0YoUkivO+HmEi1eufezW17vAx4Zss4qFiZSo8jPezCaqZb++udEYG6oy/oOH8evylFplpB5Dwc2EF7dHFDIxGH/uUMYiQ65biu5+N9uZ/JOcN0JQESwigHVIeM7Cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?borWh7IU6sUWswJaLnC9Dj/FZ3d9ArIq4YlRomzw7yr5OJ/0NOrLnEs3SGm+?=
 =?us-ascii?Q?P13TwSonwzKw5z9csh0uCO0ggNQHYrKKRaHtQKwZPadqdLpNeTE5SDjE2cai?=
 =?us-ascii?Q?Y0v1SBbn0EpP1HL4UDEO3k9ifW75suw0wfgGHNDZPSzCRXCEJWS7RSmM2L7D?=
 =?us-ascii?Q?Q1P9/kP0mqIHA2wsnEaiKL0o+x1OBcX9Iqr+Q2xI4MAk8KaOq1hNLVnuVz3+?=
 =?us-ascii?Q?B0hBIEQBuK4svbdrLd2BZVJHIHWZaDBGCaqf7OPHMEmPB0263fzmYEFOu7Xe?=
 =?us-ascii?Q?DY3EFCa23fiQbQwSmUjQtJ0YRVr5D4GvoMaNKynfYY1c/iN56oQTWZB5YeUv?=
 =?us-ascii?Q?OgNEEG2rESYfYVuJVpgjv/XCwrDatQWBdV/ha4zABT9Tb810Xh9veMzAOSj/?=
 =?us-ascii?Q?2hxqwvAcqCiKCmmmL4Y39jTpcQNLYJ1OAgNdeJwqyQAWs8O6AxNSAebSratA?=
 =?us-ascii?Q?+FmneAgNsJae8CFN/a8nhyZOaqtDQK6rSqSwbE2Vo98ndPMTIc4ydMW52kcg?=
 =?us-ascii?Q?kjTDlIjivxzPCwWJjGQrTmHjT6nxUyJS7OkGGDblqMq9VXCmg9sCiLF9T8nP?=
 =?us-ascii?Q?bWCWH2hde/jE6t5wkX92dJUiDBmrPZ+CST0Sl+wB5KW+fWsjTo6GohSDA2QK?=
 =?us-ascii?Q?ZZZNEzqUFMLWCyqrOjCAoE3wPH/mLhdGdGGilaATYedknM3yw743CD5y3QMM?=
 =?us-ascii?Q?kMmfuThS8SBVSUzpxoWpmwj4wPgaPIGrIzaH54WVvk23TXZ67GpPptXLPhoz?=
 =?us-ascii?Q?vez+sDfpOrkpVYuo2Nb+JqqHdb71yG2CvpwDi01iZ15ZNbugjdwR3klluldZ?=
 =?us-ascii?Q?8mJGe9t++qVrYj7m1fhGxiM1RS/sA/Tg9vDnuBl+ZZyigHoGs40Q+9S0KfhE?=
 =?us-ascii?Q?Gem3wFRRsuBDppGJ9C2xJoP66V3cduxZzWU8+oe07TXVg1JxTepOmIkbhSvE?=
 =?us-ascii?Q?C/MBp4BGxKfeKtPcBt8rLBfL0hIlMw6mKqfUwAj0TyZY+SzsZwHqSO86LuMD?=
 =?us-ascii?Q?9ZFZqoyDcXwpOYmoXQGTgyXuCcXIzzo7Mx4Bi4ivHC0nSQxJS2ray5Dg0G5v?=
 =?us-ascii?Q?PQV9RyOb1LNYCr2B53QgefVvrS2jMhmSjE9rd6REa355LhukLScpoQhi1QGJ?=
 =?us-ascii?Q?KCNfoKDdoormrIcNAvNuFIng/XvmGygoU7t/DgIqAtyCGmj93zz2qSoqdJV5?=
 =?us-ascii?Q?iG7/I+z4p1BokCgt+TCni0BxoeV1WuSSWgENoWGPqgYhz3e58uJC81imKE60?=
 =?us-ascii?Q?Xw9ms3hmk6YJXIWI2RHSdfB6kOxCIoGU1GogLr9HliBVhdN0dMN7VU40w/v4?=
 =?us-ascii?Q?d9NImpPZyhizUZPJZ9UdrkxMx9AkcWxs7gDfwX5lhgP8pBq4tjsbbZT3up1R?=
 =?us-ascii?Q?dv3+71+E3lGbts8xxrn9zcs+9lQZaomWY2bMLPahw7cURYXweo2PDpFqvrg2?=
 =?us-ascii?Q?+bWhK1p0EwT3IZ7tqdGVOIpmrT+Xpb2ccfBVrgDF8lUvVzEkua0hi3p9pwKy?=
 =?us-ascii?Q?ihNYtc3xaw0US+pY9QsrnhSExbtxDLC0PF7s/DxYp4duYRKLeHEbPqPLDDc6?=
 =?us-ascii?Q?JW6GkcRZMfNtUNOn4XdnccSHF4f20hxXwAKcH9V4bLa1u3rpcu3hO1fg6s0O?=
 =?us-ascii?Q?C5+9uuGgEjhMMrx6zWWUPRSjGFbWGUmnnl+6HwLArEWhgu+ufXAFC4dnKR6/?=
 =?us-ascii?Q?uBans1kokeAzlzcoL85wRLqU0RtcjZlNg6JFtk+sHs7AvsPR4Zo3hgLurrx+?=
 =?us-ascii?Q?AZkEXX6aNgtCNfWeX3pjtlIVzoxVes8qiacnKWU2QwUI8bYU/sRD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089634f9-d41b-4758-4918-08de9144dea1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:11.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWojXQcLfMydDZLbm7jHi1zcUk5sW4FodKhiZkW1ozQHCzGeDnyQx6pxrK8ujGoqZeFKGBr8zLh5JUwcQVlBamwYF6sgmamv4SxVRzvwwihUpzKG4ZTnrJ4HSgd+Vd/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

The JHB100 SoC supports inverted operations for reset
assertion/deassertion, introducing the an assert_polarity field to
distinguish between different operation logics.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive/reset-starfive-common.c    | 51 +++++++++++++++++--
 .../reset/starfive/reset-starfive-common.h    |  5 ++
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
index 772bdf6763d1..61d69cef4bc9 100644
--- a/drivers/reset/starfive/reset-starfive-common.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -20,6 +20,12 @@ struct starfive_reset {
 	spinlock_t lock;
 	void __iomem *assert;
 	void __iomem *status;
+
+	/* If assert_polarity is false, setting the bit to 1 asserts
+	 * the signal while clearing it to 0 deasserts it, and vice
+	 * versa.
+	 */
+	bool assert_polarity;
 	const u32 *asserted;
 };
 
@@ -42,7 +48,7 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 	unsigned long flags;
 	int ret;
 
-	if (!assert)
+	if (data->assert_polarity == assert)
 		done ^= mask;
 
 	spin_lock_irqsave(&data->lock, flags);
@@ -64,13 +70,25 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 static int starfive_reset_assert(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	return starfive_reset_update(rcdev, id, true);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
+	bool assert = false;
+
+	if (!data->assert_polarity)
+		assert = true;
+
+	return starfive_reset_update(rcdev, id, assert);
 }
 
 static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
 				   unsigned long id)
 {
-	return starfive_reset_update(rcdev, id, false);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
+	bool deassert = false;
+
+	if (data->assert_polarity)
+		deassert = true;
+
+	return starfive_reset_update(rcdev, id, deassert);
 }
 
 static int starfive_reset_reset(struct reset_controller_dev *rcdev,
@@ -132,3 +150,30 @@ int reset_starfive_register(struct device *dev, struct device_node *of_node,
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_starfive_register);
+
+int reset_starfive_register_polarity(struct device *dev, struct device_node *of_node,
+				     void __iomem *assert, void __iomem *status,
+				     const u32 *asserted, unsigned int nr_resets,
+				     struct module *owner)
+{
+	struct starfive_reset *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->rcdev.ops = &starfive_reset_ops;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
+	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->assert_polarity = true;
+	data->asserted = asserted;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(reset_starfive_register_polarity);
diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
index 83461b22ee55..bad56613deb9 100644
--- a/drivers/reset/starfive/reset-starfive-common.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -11,4 +11,9 @@ int reset_starfive_register(struct device *dev, struct device_node *of_node,
 			    const u32 *asserted, unsigned int nr_resets,
 			    struct module *owner);
 
+int reset_starfive_register_polarity(struct device *dev, struct device_node *of_node,
+				     void __iomem *assert, void __iomem *status,
+				     const u32 *asserted, unsigned int nr_resets,
+				     struct module *owner);
+
 #endif /* __RESET_STARFIVE_COMMON_H */
-- 
2.25.1

