Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD33CF69F;
	Fri, 28 Aug 2026 11:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916728; cv=fail; b=GHfHuxJwwTYxCZvThvtITNwe9zPYbtTVIyz0NoDcweyFmaDlwdJpBOwCnC5aBUvQU8bwXjcVqg54IIpDGUpgwZ3+uXl1viYMpJtn/G0I/jxVunag1mzbOZCksO/IZVcYXcMwn9Wyo3s/9wrNYUkhT6qpmy9B5bPBhi/+cPXLyv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916728; c=relaxed/simple;
	bh=bkzPstVN1lUd7+ObvCLSJi945OAgUQkWqyaK7jO8oQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ep97S41ptWM9BZYaWZCLthm5WB3iZZeIKg7qimLvtkNvKYe7a66+jrTnU1OTSVdtkOBja9Wtzzr+LZX7+86Y6ozcuozzq/uvwGF4qiahkkp+Vqz8cggg1uzTmrjhMEar2ArUUZAXdzx5SZNEy6SNmYc/n2WmrOKDLl/Ur1p7BKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODiicN46aM3DLh5vyLDx3JHCDeozky5AxyCNCJCIAf2mlBIJy9PHYZMtd58kA88v9xi2wvY09B6uCsjG2I81D0XBbzymJfFWjaOY6PhfcXiD01s79VJlVSDzIszHsOLm9bSwxhTQ11jh2Jg/gD6iLZAvQ73G7fDZ4mVzmXUe6qkTyKDGHJFMTN7e5YCVc91YhlDuGUMXI7PGymPbNb0AJx0vBq1OcTgcs1C4JVgOGVhXJocW42N+n7deFhOtsNDoI1ZbGxgpjICT1MYwg9vxGWspougIz0JlBPRbZKSVfzWuOGn9hk6lXHQxcSsd55Va6o53dhqrMUtvsX/u9cTQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak97mMsm5zVvi9rr7ZL8RvZur96iFxmWabLHjSQvUcc=;
 b=m4t3RwEICjjePpNG/Armm/a1kDLqkFXQZv6Ai2GhF98ZEVlYoJhxUSxhr+iPw4vnyxVvOcwq+ks/vwlt+1cpAGYY5/VXV0tDwRfxfri9AT0cWSRCGFH2HbtsXmC2tu0OK2IUirrsH8KaiqFjxcqVMfvfhusGq3qgUbtpzHfABs2hIG4Rpkkp4SZ+VeXUncj+BSfrSOh+rToTMXsBHzlYfpC+HzuLDVs65E71PyxPnVrzR+KKoCOkN3z/2zGva/JiKF2xi7l2dWxRxFS7ZiiWSnU5pTdRtUNRwkM0ow1Rpe5WCQz0tYQcG+GZO1rv7ORFvRI4OUcnj+d3GHDjR4Xc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:27 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
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
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 5/8] reset: starfive: Introduce active_low
Date: Fri, 28 Aug 2026 02:56:05 -0700
Message-Id: <20260828095608.19955-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: 64356b87-899c-465e-0e91-08df04eaa0ca
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	aF1SZQ1MMCMEmDgxuJsiPvBaeAxytXpKjUoPuR0Gsx4jRNJk922SnVdulp8SbFBwPsgCmSFbjBR3vWBe7DHTTyq2Pzb4B4+p355m/0Y1tQzy5Tcunm7+17Sh56tmV1vtUmOHbIvO+wvjHaT7cvCJORMGW1gYc55MxdatLFkRYSdiIRIw+dirYJGAZc0ujRKlNgbodPFhxsfPepFmg3odvrDRjxQ3CQ6XH12Y6pfv5TeZmEtOK9/tXSiBSMhvpTxVWnBlTRigaRzf8ztNGQ1PDEWXHRzaRLYoou7h6vcfxoxH74BcD8igjtx2rm9AajfYYYE8eXgzMjPfchRa9AbjPja8X2aC6GTMENinFyV91EjV44ljtT9tBekwZBNnWyAzgKu7q8pm9m8eMxBbuWlVl4mZCWotzMAh6lRKl8S19vTLwygBWuwcd0PSgqwnqBvMPdOXP7/CzFqM2PdZ66AgMJkWHMcamiw6JelvXu0igSomFFKRgzMDcK4rmR8r5+N+nXaBIifr2e/VIellniG6lSsK5rxS2wFcBSiADxdScc46PH1tcL80ygI60g6uJAjRKJUcO+OtmjBtDDMbsiiTsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oZVRu2NzonNb7aDkbcgqA1I6JmkXPejDIRRClym3i2qjMbcMJnKSU7Ev5/Hs?=
 =?us-ascii?Q?1PFs7tSW0bjG2RRM0RC215pK2/IvCg3wGgiCAtj7lt/69sMHUz3MkOQIar5V?=
 =?us-ascii?Q?EZsQfVsVosytzT19Bjje7FzNL/fA1tVe0y5/ppohS1/SItMvVDxMe0yY83vB?=
 =?us-ascii?Q?Q1a1DXs10/CnDuX/OC4/aWj0KCxHn7H73zs7ISgmmrMSbEtSRodN60orbk1z?=
 =?us-ascii?Q?QoDKLpPbwDIhUXaGAPd8T+CUCBxDMm7bHEYSyp8mzptsKx2iFzEQwZOI5NHy?=
 =?us-ascii?Q?GwrwxDfvd9k/lWq4kPcGQ2vbgE9Pf6CCeLZ8zHkECW0EnzBSceVJP7gp2aC2?=
 =?us-ascii?Q?ghEoHQ42sGUiR3hVnpeLruVtsDdk4YhGCkF70dWEB9K6urDz4swP1QJX8hWz?=
 =?us-ascii?Q?GP+FMmk/yXjaWZDzWiVLC68Pk+GCxbhvfRYSbwAmjkHcV9/WLejdj+OFi86j?=
 =?us-ascii?Q?IWBF+vE9XWt0IOuE9ya7ZLvUPtB1qv5p5+w3o1JAytDeRqnKlJ24ZaVXbLc/?=
 =?us-ascii?Q?imRotdris+Lgn6FnsXPu6npY6BOX0DCAkF4qIwYtQhdMJAVZmnt9k14keC1W?=
 =?us-ascii?Q?Crxmz/phLIByDvAI05slB2PaXEiP+F6tt4OSJBhtiChSZhg3WUsEYsIqXwND?=
 =?us-ascii?Q?cKwps6GZWXq+X+uTCnfHwOk95J656nhOljYdJwcQZla7tvMZZqDPKuhx2wnI?=
 =?us-ascii?Q?JAYmxHcI5ztVtBNSztSpJA06a0Tf4F1QhPWZxKdvw8vUY9tK+JOChD/ma9+o?=
 =?us-ascii?Q?A5Qktb78sh45/nhLFB2BWjsgsgoLw1GsjyyCKcdzRJAQL2ShSXKRPmVu6Fi0?=
 =?us-ascii?Q?Kww0MId7tQ5Hdh8QpN4mD/IR7z/mLtjtx1F2YkE0PsgMVU8n6afR19PctCS3?=
 =?us-ascii?Q?PcVZij3W2H1dfMA/V/u/RRsfObBWwKxbWi5YpUbQCgCtPGBmvTethTrRaohR?=
 =?us-ascii?Q?S8aIKZeSgVX/wQDtx8FwPx95wsNGd1NPPdTsCE85RSsoQrAUy7VxMm25m/nL?=
 =?us-ascii?Q?x17xtH02EfxJj2g1MHT/XbPSzWCJFBcFbWvFA7i6NwmApvh7m7iLV0P+xhJA?=
 =?us-ascii?Q?vlg4R66UIdlIBcWKKmDvMkbunM+4Dx6Tgo3/zCuJKndoibbuwquaUqpDW99Z?=
 =?us-ascii?Q?dTT/42ajOY0L9BzuNs3Z6xx2Cdwe9OgKHXeceq2eDQs+I+DoaMqPIVXCLhx6?=
 =?us-ascii?Q?CcP14XbcrY9Ix4kZP9HyNlAFLPMb7BzeLNBYRkSYI92yuBiHjzCdN2V7Q6gz?=
 =?us-ascii?Q?Bysp53JNy9+/EVbcMZlAEYvCQTqR67cecwrhwhfnsYyTJMBbdHRgk0I7Ae8w?=
 =?us-ascii?Q?LGXQGEO1thO8agxru2mCm2tgOXraaztnpu3SRQ7d1zdI4esyG23wvu8l6Fy3?=
 =?us-ascii?Q?VO7pS8jDBg7uMMyfh9wdCmk+uSjRTAZHHOAkZoEleTGbNDD5+Dvy9t3WzRGX?=
 =?us-ascii?Q?DEO/gpqe/wnuTSsLb6ZfMp5W2y1JCb7ZDWLFrMF9IuowI16kZljMdq/CziLi?=
 =?us-ascii?Q?hsYMuqtlVv5H6+j9eCw0rkiYBZoP2KpTbHEEJ+XZ94erhZH/+2t+jEzL2nq1?=
 =?us-ascii?Q?xnd9CkaQpVmTqCsGruv4zcKEUicU23Ly69Q9YSASXFav6pdENjzmmwppSSJN?=
 =?us-ascii?Q?GuDtFYx59rCnhe7ESvseDuQaDnENbYG/P6jlUwW4zry27H5n/WuT6cPS4quI?=
 =?us-ascii?Q?Y13kG64tIxQXzdZHBguYQKClxC/YyDB+45jJxQMeFbIjmweVdqBp4LaJbDzm?=
 =?us-ascii?Q?hgJiVyV0d20yJwZs+9j82DdOhldJrqtyzaBmNmLFhdxdBToBO8PH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64356b87-899c-465e-0e91-08df04eaa0ca
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:27.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWPUByaM64NZplrCV5/AGIjy+e8OEW1dYN+Rp3ZoJSwMHWLEUx+t1WDKzG/pigMAnbnjCSYtqStsAZHjwnLR2Qp7UiXKr1foEB4fOqP7/BN+XzfIPdCKcPn3RZ5s1lSq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

The JHB100 SoC supports inverted operations for reset
assertion/deassertion, introducing an active_low field to distinguish
between different operation logics.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-common.c | 6 +++++-
 drivers/reset/starfive/reset-starfive-common.h | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
index 86dbb33bb216..7723520637ca 100644
--- a/drivers/reset/starfive/reset-starfive-common.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -52,12 +52,16 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
 	struct starfive_reset *data = starfive_reset_from(rcdev);
+	bool active_low = data->info && data->info->active_low;
 	unsigned long offset, flags;
 	void __iomem *reg_assert;
 	void __iomem *reg_status;
 	u32 mask, done, value;
 	int ret;
 
+	if (active_low)
+		assert = !assert;
+
 	if (data->info && data->info->discontiguous) {
 		id = starfive_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
 		if (id == STARFIVE_RESET_ID_INVALID)
@@ -70,7 +74,7 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 	reg_status = data->status + offset * sizeof(u32);
 	done = data->asserted ? data->asserted[offset] & mask : 0;
 
-	if (!assert)
+	if (active_low == assert)
 		done ^= mask;
 
 	spin_lock_irqsave(&data->lock, flags);
diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
index 0d4e634de58e..c7f80e744700 100644
--- a/drivers/reset/starfive/reset-starfive-common.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -15,6 +15,12 @@ struct starfive_reset_info {
 	unsigned int nr_resets;
 	unsigned int assert_offset;
 	unsigned int status_offset;
+
+	/* If active_low is false, setting the bit to 1 asserts
+	 * the signal while clearing it to 0 deasserts it, and vice
+	 * versa.
+	 */
+	bool active_low;
 	bool discontiguous;
 	const struct starfive_reset_map *map;
 };
-- 
2.25.1

