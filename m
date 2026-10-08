Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E649B5C6;
	Thu,  8 Oct 2026 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462928; cv=fail; b=XXDMO+LN0aBLJhGRDKCCj8CCwXKq5tHQh7hPbnXmyYSjnPzcsRNrLYmWpeQlupUEe7Z7aaibrslc3MjGevyJdwxfEEUE2myamH+6UoDbKNX0/I4EhObRobMRFqdkVaepxQsG1ItM6TreIXtbiQp1qNDr3+SKCIHMsGcqGS2lEAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462928; c=relaxed/simple;
	bh=QcQSu1mnIlZPrk8Uu3Faz42x2fNYbGzMEj5orf157BY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MuNcK82PrhyySLAzBjXc92aqyouSXoGfIBWoiGm5WWg131pPZuc+9r6LzvLd1yRlcqKLTVRvU09xYH6rC1RylJxOxEHSbTXTENkLvuHqQNm99/d/xyMheb3wBuFGlL9Z63XoAW3EYjX5X73AzalOa8FoSU/Fp25C8CAWsIFT5HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqWzkgdR/6FXVqkhOUoxWJACnDsH0103AEXbZrrqnHTIsNnxJ4eyX7fPmCzv1m5NPeSNKocf3s/zr/pKYl7LqBVGxEFxI7kuNneHPxd+7LmZLazOPBEmFS4UAQdmGiShL9b7Qqwv3gh9iADS4T8IdH999KAYTwrfmafKjXJGOUtigkFwgMGpaba1Pkht9EM0ohP7Mj04aXCD/64rFMbsJR5Q2ullhR9iuajIcnfhvspD0T8NxeVBGOKUttGi5i1BUJvw+M4ymUZW+BLrQq2fa4Yn58w0IgxUayXIjQepxHqYKwTJ0Kbr/0uhZrQK+1jlnzbGUOsvb0KSg7hNmpjgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xun51H6Hs8wkodTe3PnaKo+c8L/r4MLjDymQAigNhBk=;
 b=FWtNuKSmT6V2A0OULqW2/t20wLRoeYP9Z8ggMknbW2rOK7ck7IlWgCaK+uwqF9B2jdK0ga2Bqg1OxgPwjgMm+HrKIZZ6bVk7+dzL65nZOANWdqvNSOoe/F5BYpzel9cCozRxsCeG3ckS7T80JmUR9/OW1L2yX/ijG3bBComoLe3ehMrConnT66z3GTAAEqd8iLeOWT80Q9SxAgRfKXxZAKu6dJ0SZ1WaavmdyfiNlkvJs73lLaMmPPDlWdGOhlgrm2Ta6eU04NLQmnl0tQUhjxVko+4bmdR2ql7FDzyhIwxAuBCbgLVxrgv7ginXbG/mRUcL4wSClZ8wdDvPl9LsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:34:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:34:04 +0000
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
Subject: [PATCH v6 14/15] reset: starfive: jh71x0: Support discontiguous reset IDs
Date: Thu,  8 Oct 2026 05:33:37 -0700
Message-Id: <20261008123338.11081-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59011b0f-90a3-4fa4-e491-08df25387087
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	C5v80zUiz+C//V7SWr2jaZUCc77OtMSAbBl8gkuWg6ulNGeS1c3zl4xczj44kgzt1aXcgw8XndtKqkiclXrkXxoCkh9i6vE9gNQX1B7NdnaOeISjFPVr8sxmlVAJF0Qn8urcCC0Hj3mpo3Dc21XD73dHQT/fbTS3S09ao0TpmVmHUqNg1xWYD8OvEeQaI5CerOMzNabZoVKfMduYJv54JqCTuGnHJrNRjrC/idIpKX3apr+arIcgbKzJqpAfaFxrnk771tgG5zVyL9B7ioTcnIvLb96PxkOvwHs8H/iucnQDufHMhoNs09R/HdeNQ1AQKFZZU1rhqTACVxYQeLWUKNPW/Xx6nwq97G7tnq3oVOtWs30VGZMHXYzYc25e9x1YQo2O9tYAQ5LBcqLzec0FB41sfOwj+edQhOFnjFBK+pgLlrC3dyd/rYLRCVvlj3nnplKglDmQx3xFxQzzg8kjaiO4Svs+9MGaupm5mSgDSxxWbObdZlBhDN6HubpXxBOB/KnTt/l5VJKyphBWjYxrsFRwGzG3HqltZkKt494ZTR4XRMihyd3d2/bScki0Uyot
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RGg36Fuwf8Ux6QTE3I2eZhS6DKGxcxoVHCKyfCPJ0wlHRriC51S2C+zkRCJs?=
 =?us-ascii?Q?7WAWmcl8c3wYj7BngVALbyI+9DK8A9FI6+W1jvTJNiICVwJA4kG3qeyak/G8?=
 =?us-ascii?Q?nrc4J7sje4qklRp2ozwFiUVgloDalKwXDWS3BjoVXTQ+y3UPz3VOfulLAUgv?=
 =?us-ascii?Q?6g3A8bjNdHd9jU0OLd9iIT4gbBjeGo20NidQ0paL7GGiOiZ8BXy0J13YXQ2t?=
 =?us-ascii?Q?NWcPBwFu1s9SWKpJFf8OCIyMDV768e+a8NLZmJnlcxuIDCkBZI0aD/8NpLDs?=
 =?us-ascii?Q?KdopYrsXeRvD0Gx3TTO++JRcv2f0aUUXD5joK1iK3JbumD8x8AodWQuBWg/A?=
 =?us-ascii?Q?GRZaVnrVqTpz7DlLk3FxgQPULRVeNBg+QmbXD1W3Pmgz5XDDs29qlb5VZv93?=
 =?us-ascii?Q?KLfN5ax28EZlC3pGIuMeWloP/j5Z9LczSCzfTJKmfjvBeuuFFoPKPhApCXeH?=
 =?us-ascii?Q?5AnUFfl019fd2XDenmscSal4wzXsey2LUk8/iSYrakLkYMQXLzjpy4sQvxyU?=
 =?us-ascii?Q?DKYP1FfFxbB+j19i2mQpVdVx9gbrxRifSpSTuYxvwi/3ilrqCV+IVvgiytp0?=
 =?us-ascii?Q?M2wpLa364Dgu85k/uA/F8jmDb4Svpx+Vr603599poUV8LP6kE8raR5Pyd1Zp?=
 =?us-ascii?Q?n/WnMYXbDjkMOaU0TQOEKp1padsvBZjRyVUTYleAkjtPP7zizSxFmTOTab+T?=
 =?us-ascii?Q?QbSm/UaThV1B35uW9Mb1yccEsrV5yD6Mz8OSwKLGJ66jguBnB94XMSK2xsz2?=
 =?us-ascii?Q?yrNcywABnIWCUGLgNQrLc67Hrws9Uh18P+P/gwlHfCG7KzO9MhbkUwxNI9Xr?=
 =?us-ascii?Q?6WIIjv1/pH+cRvgkaRgN+w0U3yfiDoLh8YwbCL6ECbfUFZb8ifJJiDkFCSBs?=
 =?us-ascii?Q?Q09/XBR6qGrr8NYVxnXe/PZfPA/IaznVuyi8TUpqxUHpoNMHMeNH8qETkWf4?=
 =?us-ascii?Q?mfNi0/AQfdhoDGf//F0ov8kuNDZOvP0lyR9drgRv21GX8FgxLHgta/1FanRT?=
 =?us-ascii?Q?FRn7pNSvj9P4dDd6ZRrBcioHAZhGAGXcX+s+Efp+3IvtN9W9ee1CBAgbSasQ?=
 =?us-ascii?Q?wYJUyhsnfs6hxMG/7+l7y8CHdGr3DHR93Bk6BExP6z97eJszXE4YcZP22hLx?=
 =?us-ascii?Q?4ot8EFLAvtsmUSrbfGE2iI3HXKdqpE2ZxUArc8/o7MyFqfEqiwOqP2Yc9qJn?=
 =?us-ascii?Q?0jCOHwi/Ft6xdaO9/c3MStjIH1e3/y6Wwhu1Plcx/sW2zpRaZwNO6fpoL+EP?=
 =?us-ascii?Q?6QCEelZ4pgDZ7A/SGW+Mfr9r4RbuKFQSIpAzwtnZUDNotGR2lkWsXx5SYHyQ?=
 =?us-ascii?Q?HNDAfokErM3AWFPBD8+HN+IkdYm/SI3IF7AktYLueiAnov1l4ZdBZLhfvllF?=
 =?us-ascii?Q?NIQmT+8pN5mM8yJjVHSs6mRWI88w96NdoVXIhcAyZFje6yDcOl7Ha8g6uKyS?=
 =?us-ascii?Q?9TIpaluVF2f13JlGjlF4UDD9FrRuTXxyLttCQEJNBCliyVcHVKl1V44MccSm?=
 =?us-ascii?Q?FOxtOtSxQ0VY3ukptNA4RF/4JvTxdeFEwnqznCCI0qp2AzsRuRf8m59Scy2v?=
 =?us-ascii?Q?9yJ6Q2B+AmkvW3JI+uVzxjVYGNLeSzsxUeCdF6Qu53D567vfg4jVP3wt78dc?=
 =?us-ascii?Q?VohS3MYpweofEBkCwjQMtTILR1hlFfhKLhB8O1+Wn4F6CUlOCY1ty7GMAvww?=
 =?us-ascii?Q?1Do0tjHsdkfW8eb53MWuqtzIJpCv1VQg7c7w8EeD97CLSPkUpvHfMp0dzKuW?=
 =?us-ascii?Q?ZpNdZPZ9cG7mdnOfxl04mAvPCNNW/TsoW7595O66GaCFFztfIo7E?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59011b0f-90a3-4fa4-e491-08df25387087
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:34:04.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HAqzcbw5HS7S+s9B8evnWfG4+JZqWiXzDG8G1JuupcGYyngLFwdypVohqpk0e437E5m9NpfdHMHPunJGnV27kQoT4VcDKkmFbbX2kEHOyA03Av50MVzA1ZbsNFXF/xR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

The reset IDs exposed to consumers of the StarFive JHB100 reset
controllers do not map one-to-one to the hardware reset bits.

Add struct jh71x0_reset_info, which describes the number of resets, the
assert/status register offsets and, for discontiguous controllers, a
table mapping reset IDs to hardware bits. Add
reset_starfive_jh71x0_register_with_info() to register such a
controller, and translate the reset ID in the update and status
callbacks when a map is provided.

Existing users of reset_starfive_jh71x0_register() are unaffected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
 .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
 2 files changed, 107 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index 29ce3486752f..fd1c755a0017 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -14,6 +14,8 @@
 
 #include "reset-starfive-jh71x0.h"
 
+#define JH71X0_RESET_ID_INVALID	ULONG_MAX
+
 struct jh71x0_reset {
 	struct reset_controller_dev rcdev;
 	/* protect registers against concurrent read-modify-write */
@@ -21,6 +23,11 @@ struct jh71x0_reset {
 	void __iomem *assert;
 	void __iomem *status;
 	const u32 *asserted;
+
+	/* Only exists in reset controllers that use the
+	 * reset_starfive_jh71x0_register_with_info helper.
+	 */
+	const struct jh71x0_reset_info *info;
 };
 
 static inline struct jh71x0_reset *
@@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
 	return container_of(rcdev, struct jh71x0_reset, rcdev);
 }
 
+static unsigned long
+jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned int nr_resets,
+			 unsigned long reset_id)
+{
+	for (u32 i = 0; i < nr_resets; i++) {
+		if (map[i].reset_id == reset_id)
+			return map[i].hw_id;
+	}
+
+	return JH71X0_RESET_ID_INVALID;
+}
+
 static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = id / 32;
-	u32 mask = BIT(id % 32);
-	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
-	void __iomem *reg_status = data->status + offset * sizeof(u32);
-	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
-	u32 value;
-	unsigned long flags;
+	unsigned long offset, flags;
+	void __iomem *reg_assert;
+	void __iomem *reg_status;
+	u32 mask, done, value;
 	int ret;
 
+	if (data->info && data->info->discontiguous) {
+		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
+		if (id == JH71X0_RESET_ID_INVALID)
+			return -EINVAL;
+	}
+
+	offset = id / 32;
+	mask = BIT(id % 32);
+	reg_assert = data->assert + offset * sizeof(u32);
+	reg_status = data->status + offset * sizeof(u32);
+	done = data->asserted ? data->asserted[offset] & mask : 0;
+
 	if (!assert)
 		done ^= mask;
 
@@ -89,10 +117,20 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = id / 32;
-	u32 mask = BIT(id % 32);
-	void __iomem *reg_status = data->status + offset * sizeof(u32);
-	u32 value = readl(reg_status);
+	void __iomem *reg_status;
+	unsigned long offset;
+	u32 mask, value;
+
+	if (data->info && data->info->discontiguous) {
+		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
+		if (id == JH71X0_RESET_ID_INVALID)
+			return -EINVAL;
+	}
+
+	offset = id / 32;
+	mask = BIT(id % 32);
+	reg_status = data->status + offset * sizeof(u32);
+	value = readl(reg_status);
 
 	if (!data->asserted)
 		return !(value & mask);
@@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
+
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner)
+{
+	struct jh71x0_reset *data;
+	int ret;
+
+	if (info->discontiguous && (!info->map || !info->nr_resets))
+		return dev_err_probe(dev, -EINVAL,
+				     "discontiguous controller without a valid ID map\n");
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->rcdev.ops = &jh71x0_reset_ops;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
+	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->asserted = asserted;
+	data->info = info;
+
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
+
+	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index db7d39a87f87..36f198139602 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,9 +6,28 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
+struct jh71x0_reset_map {
+	unsigned long reset_id;
+	unsigned long hw_id;
+};
+
+struct jh71x0_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+	bool discontiguous;
+	const struct jh71x0_reset_map *map;
+};
+
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner);
+
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.25.1

