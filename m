Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE18430C152;
	Sun,  9 Aug 2026 01:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240356; cv=fail; b=rGu60MelSz/LnntK02KNpI/FkSOMkPgHto0iiATdvtKBFFTX2VZ+R2qrhUjNEbRVCHlUwU1jXmbM549KxkCQrfvEBJrkWGDWQ9suKeA263J74w7TCNomVelZmq+lOoVqJrOmv0Jdc0U6T8kY7BJ2EkPs4el0Krr2D3p9GI90v7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240356; c=relaxed/simple;
	bh=bkzPstVN1lUd7+ObvCLSJi945OAgUQkWqyaK7jO8oQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWBiCdVB1/MNDTsPjARw31h6DiWFS5E3a2n7oTDLphDu5kf3Kr7JJhMQ4c2q25x2nwyEHAAGCNU41Em6idoOAhcx5ldXMN5Jg6C4WUIh/NkxwXZoEJ4dvg2AHefQ/kEhzinZFdKh0w6itcWPAnXYjSBgAv5E6KGRfolqqpGRfeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7QPoNXMZ8YHvDCCCMgy57xm3/Afk7g90VrBLkDcR94Zd6tWaQKae4JUCjKP9tE5AeMSM7V+g6eYmLNkRUJRZj5PT9lKIaz0AwPh4QuCWeexvSQW2CgO6hVgjMtBS/sj3ccgPSxndWBULEShNZ8YmuKsIUFfsTn0QzUo6qREFAa0aPdnU4CclnW+2EmFrPj950gykDHOqB0BKL+yj7mVjqeN/XwWQrN77W6uE6ut3t8k33yIhPbMd0TVF3BOBh9LKep8r5B6mRB5YoFAiWnA5EuhKq+P9ANB2f4bUxuWacTHNxOx+Q7y+tt7ZLsesvwqAHltPmS7IffEbo3OpwcbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak97mMsm5zVvi9rr7ZL8RvZur96iFxmWabLHjSQvUcc=;
 b=IfiCSNHYPGUAI8Xk2h7GsOwq+Z4/NGri2c+3h/QcDz9UGn6mqJMVNkj2XBr/Icny6kfQElC2PkrbxGs2UHc9NcpokvCm2XbESYEmKXmdfbW9m1yvnHmFIy48nNbbidXTQif+lwjcQAdrup/73fGeAYHF2K1h+bZFy8ZXHaSlMfqD2geEwqR6qCfGnWj/cXRSkHhxR9l0PV7jwfmv1rj4gOnP/d0JcE9je/C3FaPnaZI8ao+Dz+cq+SlOYVdldxC5fHpGn31qkM64wNy3qWGfXighOK/yDAW3eo3r5Hzxr5IGnsfU1KpJogiH/37unOazDP036iKdfMn/m4jLSqUshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:12 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v4 5/8] reset: starfive: Introduce active_low
Date: Sat,  8 Aug 2026 18:50:51 -0700
Message-Id: <20260809015054.210577-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
X-MS-Office365-Filtering-Correlation-Id: dce619a1-7125-4553-339f-08def5b8b089
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YMNL5M+oPxhRQlWGVafD2O5fKvKWkZPmJj6fGAa3/B/9w1HeCwd/3ZhZq/pLkiE+/zuLnwKdZ7oAYox/KK+ZLw7OfmV7VyOtBjCeo+86liDu4mj0KRibMAxb7E9p7zhEA72CDBAq5djpRCrIGJqQEDL+Oj0GybB1W075H5+TgnbZSLn1cRkvlw+XFGUVa9w4GUlnOI8xpW1z5Ww/7fBQUHfbpXOhvoXRoZPXOJdLorIVkGIsi7BffPUfpKTaDieHddpwZVzK75WicW1xhe3chczn9YdFkLkci08QeGEk0oHtJbuVGIMJAG5oAq8rKcYzcUkyAptTB6IE0WZRPlEDpkyfJ0kRkU9hhsupOkhACNpmHIk8tW/EFXXBFjurnSu0o/uJTbs6KRA8Tk0rGUotu+WgzfRUnX5Xco5qqnBPzaWPOxdPbwNe4gmNDvfnJ1xcGvSOyFoQ2npLZ1HtPnp8nhldntyg/BMLfNfUlB9Ls/g6fg8bCmNt9z2pKJreG5wz00/pqWJl/2g7SyJYZFE/o0akA5GY6n9qWs1kPLUQ+WBmardjoxuHp3beeANcChXWI26FhJwxZhJ+pdLOoGT2wg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cjHkG5+QO+ik/ni0CmoiH1/EGR1OIB3WCrC6bXPUpevJ8chNRNGT7j40Y1gY?=
 =?us-ascii?Q?BYKe5eC5QZ+nHPAr4UMRhr+s6YNLZlBCRrif9ZwIMr5jpzxZj4AFHPSoglux?=
 =?us-ascii?Q?KTJJw+ZCbnlsXAysSaip8z9QbLJds6EeQkZP97rBTWTv+WnxTTPC2BQ9treb?=
 =?us-ascii?Q?T0CX/iZmw8+XK3RH8A76GNAhUXq9wfBvkCHI2V13o5rcFAQTx22XMpDI2LZ3?=
 =?us-ascii?Q?6mrfa5Z/i5WLPSXCrF0kIDY2HzQnb29T9Yo4N7QKyEbATTUIZYy0yMVCVxZA?=
 =?us-ascii?Q?ZGme+gSW0X0i/ok4M030uT5D6As9tif/rqgQfDhSWUbeOlZpkYwWkkrqVVa4?=
 =?us-ascii?Q?qx9XhPkNioGNmZ+3xSfkLHZpeCStnmk7Mc1Tz/P2GajvDCbAV7Jt7i9ItQIf?=
 =?us-ascii?Q?su3i5M5WNV7YREtt+YjqOnD0D7VSfO4hSIXorBdZhOotnQrVvSi24sGdji46?=
 =?us-ascii?Q?1HL35fit+EWfG1nez0t16hvbRoS/wRbYoybR5cXj0B5em10Mka6R8spQHfqX?=
 =?us-ascii?Q?pjBLOfxdhitRQHBIoRds2Q8/hASkosDOT2YXIWjF+NFv3ENwzVK7HhfkEhb6?=
 =?us-ascii?Q?WqJfDtqUxQ+4j+5y3DzqV9ylIyn4gKCJhFFNffBjXEiNRKlicE2rq9CupCsb?=
 =?us-ascii?Q?i2S1rVW18xJp+oZYCT7e2g5TxjfROt/aADvk1pSUxg9Apdul0r/hXR7uhCZM?=
 =?us-ascii?Q?ithaM1KstUlQnyZMfMIxw7gObsO7QdLyRfbPBvS+hh7nq7FGXYYyWfPbFYwL?=
 =?us-ascii?Q?3tp7O3XE4PoDrZzR4HULYFOrp6NNekP7cnevLsvIjlr99elCjIwdCeJ7Lb1X?=
 =?us-ascii?Q?8XRkbMe9TUahcOZ5onMo2j9pNVvtqsPIh3Mq9K0ocesKTZdcxCzngpTTE4pu?=
 =?us-ascii?Q?lsu0i5D/P5iP3p2OKY2lgFUQaxpdKdTY1eZDATwcWaLe89VVgKAhImUm1IV1?=
 =?us-ascii?Q?zY9DhonkotO4IpRBXsm82PCuoQJk6+YaYB8V8txoonzYibM2INXxMX4SQbby?=
 =?us-ascii?Q?UFzGqqB09XyIHEeCEVcS77JKoLhdpAimWMfDIew8lNr80PqwIhf+nx2VqruP?=
 =?us-ascii?Q?4XrpUzEA0JfCaQuUCYo5pgYKV3lpo5ZuwW62yrhGFKrTOSGVVoKC9C7iSg56?=
 =?us-ascii?Q?K0AOaw0DRZ3Z4dRSOTdtYFC5FGgXw77YOOZwtL7wGHz+sHU7OiEdC8lmcXle?=
 =?us-ascii?Q?Hhua23rnDfxmKgzMPoL9VwD/RHBxM+U18Y8fAqe6JM46BpLhg2l58Y2Rdq6r?=
 =?us-ascii?Q?9XnXyFpPWf4o9nhQziqwxpdY2YoMAFOeVnX8LpqZOMCxDhkVBBVC+gL4RCwm?=
 =?us-ascii?Q?Od6URhnoJi+oXEiDtMzyoTht4ZJ4t3STZvDliJt0r0QEfwBBI/EmbxWuRyTK?=
 =?us-ascii?Q?dqBi6NJHWxs6+dM7eAMlVha/9AEksYIyUb1Mry27itmEP2GF6RmAW+Jqs426?=
 =?us-ascii?Q?vH+DixnlFChxyHDiSxl9tclCCvswiBsYft64EL2jONLVoXH+MYt2H8Go/pMA?=
 =?us-ascii?Q?WyNWAlY+YIunIjrIClJDph5s7inbS6BQVnn1EDPwN2cUzvzOb7o7JzRVRLSN?=
 =?us-ascii?Q?hk3uWUenfLlSc8xDMpCibyWQSH06vtIyVlddYijxMjVQeGoPo+JLFboMWvd8?=
 =?us-ascii?Q?AzpGGwBTAkU/zCM8mnMAW7pWMHnB/wJYOVUt4Z2MyDpdmsK4Dplt1RQSjI1j?=
 =?us-ascii?Q?hqjhei7ZwtAuHd/2RjsjDiaFj/VmHCSNgPCDFDMvp8C562JfCMqRqslUtbom?=
 =?us-ascii?Q?259uP7qdBcRhz9APpdVqmGb/7BwRZHAW5xBjaQtMp0oiZh7jfyvE?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce619a1-7125-4553-339f-08def5b8b089
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:11.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtvAL80uRad5gufdw8xjYgEPZPXA2CHT1lCxgS8ENK4oHKjN4urpLz4yVkBV3vGHqa12ChU+yk67CQBSAcmtw63q09em5CPGamm/3dPy4Ao90L4W4NRpAOm+Ne1n0xKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

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

