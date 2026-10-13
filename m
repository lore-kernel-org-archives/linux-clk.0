Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn [139.219.146.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B229C4DEC0C;
	Tue, 13 Oct 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889332; cv=fail; b=RyXCwo/4dlmU8z/D4tHRdTetPhNnJezPNN+RqaXG1Ng/SMY5FpIxvv2ZlOQ/IwRwZkjMAnE51SIaoV1Zzlm97pDCp46ofBxNH2CZiiirD6CO/n90gYJDqboN0koHfqESvM+KvViuuYPMcQu8nrPoOLupC1UPUiBpCmNppWTxmgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889332; c=relaxed/simple;
	bh=8lWxfAOsaHBffaAbkxdXFZXJtqZwLBpWcoJvYAOnX5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lx4gMbgIWn2Da50wPq7XYA4o+A81gr17hBAnJPdxbasXGu1MgAqxYYQTg3MqY3PpqSpP5ZGY4wiKox/9FKinp751kiR03VY+yMt1QnZJ181thFlJE2BgB4oYni/hva9b9+UeugTVoG9k4EPp5NuyBsRTKg/SC6DGIruqs2ewCzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5c6/0tzj5eG/gMQXN/jXCXvwvcijBMFvh6GwJkF4n41l/9spIs/Wq38QPD97tLyXUwZ8qaYPbM5zFUwchzUU+KryW+QFzTeYlHGc3m9bmCiDCqJT2UyGmT2kNWcVJM/d2GhCxWHpDimA7sEMwudDGj12lebDcVpuj9QW9j2pTBnF7LqMaoiaRZfEICp4fdsclETEAiYCE/C+ZOsC88zf8UMkz7qVcZaCji/SJwhUa/gD+XUfrqzAxj+iALPNZcrzXVzjthKobljC5JUVDzC4zvjdJjYyRDEFPGEn+MmrjwUndojk9OccR+WABqULYDo7wDoEdo2Jv5NPaNMxu7IJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1f2xFXSgf6pEF6Bna7bhxXyHlJVkbR15W8k9DfrGGQ=;
 b=PAvALoNk0B8f9xxki6/yN6Ql5s3VN99HtVAPAGqHp/nTh4XKUIWzsu04jk/2MQd4XDnQ/mIs1tUQb2AsWwJ9LM5JgmgoPLV8OVEK7Z+T4LSVi3rJFVsd7rsUYmXFul+OAUMZ/qC5W3VmVdyfY2UW+Hlsl48yWfiUZYZR4cr1xCnldmJ+VWZZpywWOPATacsZMKI7/jPDLr52KMZwebfcV39k7sBXRYm2FGBFxpPfpw8jy+Yr4wQ/h2m0fnH5jIngM1ERjEErxTcGYp8PAhzHUhaTWUscdXbCvn/ScvjahqbVWmAXDbbKktBOUHNgNf1uVMBKyipQPJ83FQaa5FkbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:21 +0000
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
Subject: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
Date: Tue, 13 Oct 2026 03:27:03 -0700
Message-Id: <20261013102707.9207-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f948252-31c8-4cac-5b12-08df291490db
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aXYYLKLKIc50bFUKYxCBYg9vfsJ7zOww1gVJRA8ecOek5CiEOTyVvgbY9SHOKMM8edj7V8FDP0XTKfxQvEko3Hl/RVo/1JqKohdN3ALKyYX4yECM59bokOL1Zceg72SKRnPhc+Rk9j5Dw7k0m5jMqfdWWQm0p7DWJHj4yJ8CC9tzi3le4Bal1IfPILt4DlHA4OMRCjCmFtN8q9KU/XPZvWWg9SM3XhQG97ZzmTaQeUuH99HxW+53+8oSGC1VIv874A9i+99mqTiuNAS2k5NhX/fbD72/w/qLc+MPMSaT26ej288VVlvH3CKjUL7t/r4vWxcpFngM6cBThp0kdG2XCyxXHhZk0n+cpr2PFBfpy4jMRwCYoQYbxLSl9zcG255FuqyJGr9ULC/fOT4Jpo90dlk/iKRxMN93NI/P34v8vwDJV5HpQd9GFbNv8hoSVXL5m6Z+vFu2EoINm8lbwmPvabL3pA+u2L6Q4j2bwHwnm2HWMcLU9G0X8unVj4HW89FShKLdmn9i0skSXcd1gWxfNR9g5o2OTvBRuzixlzXEEUS4HiwqyxCFWkaJhw5bFbL6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JgI2JYre1u7vyxQlhaJTpYD3Cfyd8tbPQnGCi+t9n8MLMHhj5XbKlGCYIf+Q?=
 =?us-ascii?Q?QpnkqxXTa1RcUjv0/P8hsc/5xFDcOoysZJvgUCemwin7CX+BbeUsgd8aDRIC?=
 =?us-ascii?Q?l160hGSMcQWP6GdQYck2Q4YlW2DpoE59WDyV6Ykkn7vXb+jKLJxWNKpcZgCZ?=
 =?us-ascii?Q?ek+C+JfuEvYCYoFprnj9wIJokXfgUq5MMsD04A7JdHIe0CqzD0E06lCnAyka?=
 =?us-ascii?Q?ByUJitjQOHU0GxQdmgoZKaBchYV6yZGO1jv2rOxrTEaV6PgFVjUOmoiWph80?=
 =?us-ascii?Q?Fw62nMOvlu5WsqiYfL96t0/dlRPvH4tO5e6PlVHRvAsbTvZFb3IP+Rn+Yjym?=
 =?us-ascii?Q?bm2gh4s7kagT3OFlH3qlFzXa6y6wp156ajqpX1pt/yAQiDaoSmeZwPVjmSyc?=
 =?us-ascii?Q?lJrTVYxyJ2+H6Nu2lVu6sz3AEMRZeAhXpK34VpzYjyzWKiUsUmed8cSfyscw?=
 =?us-ascii?Q?f7UHL7fFDWolisSWQyt4G8nwsO4fE64yg+vvRA1Jm6e75u9jsUAfgSdhgPJI?=
 =?us-ascii?Q?A45JCZzmH8pI6eklwKgAxcq4+aa7tJiY7e+W1Cz8NEvA3lcGjjm8VO9DXj32?=
 =?us-ascii?Q?2GWUFVQ+4N2MGAJk7Jdb4DGAYhCXvmD9OF9NuZLW+f5vSuFry28uuXrBIXLP?=
 =?us-ascii?Q?cikVG0jMNLqgfbQdmR5INgOvzisHg69WcvZRUK6D4GHFm6wCym8lP94gBFhu?=
 =?us-ascii?Q?GC89WE5hIkdTW1FHEn8//eysD3qlUrogFWEIlEivbK5M+RCy6k6T33YMEL/U?=
 =?us-ascii?Q?jPWi0gE3lqbPeUSWW7Gnftvv2xajEMcUM0BWSQ5MzTg0TMEONctqKZ5RnQuf?=
 =?us-ascii?Q?EqkuRf3vXbV81CqN/h8oGV1V8btCB8pDTgDmtDaJ11h4rmJqpFKmdRYH1zgy?=
 =?us-ascii?Q?F0OVWDLyTm9GczS7Qpkj0IKDZyRAbroAzBNdbcayoZMmiNeE4mdfHWo4msVB?=
 =?us-ascii?Q?u+LfW1HiNYAC/IFKwX57dbYfJvznrUu6bKVQtwsq9R6xLKcZ322cCH7+orP/?=
 =?us-ascii?Q?/Imlkc9FSbMhjm68VzK6/rSf4kpXKkWmc6y43f0Eef1kZ2j2Oxl0Bm8PDSPq?=
 =?us-ascii?Q?FPYHuuy4igRAqmnTBVW8kR0NADW+W/+BEYZ5+UQBDMVzCU1+fqjX6Ueb7VUN?=
 =?us-ascii?Q?CaX2zQPr5kBzfFuVCm2RKeK1sSayNmT8CF7En+dNTzeenZ+KPvzblk1PLdEJ?=
 =?us-ascii?Q?cei15i5vpEliky923irs/pqQtKYc3iYnpXn7+k6We5r+gJy4O2l912qGhzHc?=
 =?us-ascii?Q?TQtoqqOqj4hfv+WdlcBTDr5BZ+FUmYs2r6bXGlpsU00lWIzzX7P2VRRgkSnL?=
 =?us-ascii?Q?B28aw+Wo9jt98QgNBeGuYRHklsmRWMimRuPL08BN1ztkWUtOm7Ui4GvOaSoJ?=
 =?us-ascii?Q?/Zj9AL6bc0WB18BNXOmgiRVtlLdmlNnFkIPWEGT06PDc2jnDrACR7+lI9V7T?=
 =?us-ascii?Q?f2KvBvK0EyCl3k7PRRf6hwTJqwEiZ2ItSa+mcObPKyEFvPR8guJt5Q6nu9n8?=
 =?us-ascii?Q?q7b9/GprwGr4c/JDXNDBpcMoXj2kcM8EBAZDaWsu0ffwVx4PdfBDM3Z9/7bJ?=
 =?us-ascii?Q?e6Kn3oQystS3olujx8JezyEpX/2Wvncc/QXTSZciWSMtkwxKrb4KHjbeExWw?=
 =?us-ascii?Q?F3d10EfKj61a4kFJRnH0rBdnnITbchnvBrcpOv2RUJccNpBNJXOTt/4hAyG9?=
 =?us-ascii?Q?AhSxBpQacFeDkdY7FfOFw0nd2px7ji3dhd8USPCLxOaYBkUThPkj7LECoTw0?=
 =?us-ascii?Q?92615GwdA5CuWsCok505Sw64u8D0+S/yZdUDG0LtzkebYZJIKwaj?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f948252-31c8-4cac-5b12-08df291490db
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:21.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8lhtiBKs5/zdEZ3Yixhaz0qll3Fut3dO5kNsiCJA3TG8vcPuubP7cfHkFgkBY2VNTAlsje5KIAN4hnuEYkvsY5tByMhIyc6qjxvb2fTcrxVpwhapw8uRqyIEV4n/Ap9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

jh7110_reset_controller_register() is only tied to the JH7110 system
clock driver by its location. Its logic is generic: hand the CRG
register base to the reset driver through an auxiliary device.

Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
so that the clock drivers of other StarFive SoCs can reuse it, and make
CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.

While at it, replace the open-coded auxiliary device allocation, init,
add and release handling with devm_auxiliary_device_create(), which
already implements all of it. The register base is now passed to the
reset driver as platform data of the auxiliary device, so struct
jh71x0_reset_adev and the embedded auxiliary device go away.

The auxiliary device ID is dropped: every CRG already uses a distinct
auxiliary device name, so the ID is not needed to keep the device names
unique, and it is always 0 now.

Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
device names are prefixed with "clk_starfive_jh71x0" instead of
"clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
JH7110 reset driver in the same patch to keep the tree bisectable.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  2 +-
 .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
 .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
 include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
 11 files changed, 45 insertions(+), 83 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index bd29358ffeec..51716655554f 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -2,6 +2,7 @@
 
 config CLK_STARFIVE_JH71X0
 	bool
+	select AUXILIARY_BUS
 
 config CLK_STARFIVE_JH7100
 	bool "StarFive JH7100 clock support"
@@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL
 config CLK_STARFIVE_JH7110_SYS
 	bool "StarFive JH7110 system clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
-	select AUXILIARY_BUS
 	select CLK_STARFIVE_JH71X0
 	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
 	select CLK_STARFIVE_JH7110_PLL
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-aon.c b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
index 6f67587f4335..66f1c56a7169 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-aon.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
@@ -121,7 +121,7 @@ static int jh7110_aoncrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-aon", 1);
+	return jh71x0_reset_controller_register(priv, "rst-aon");
 }
 
 static const struct of_device_id jh7110_aoncrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index c02c8b29a123..f8222d3c81ee 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -180,7 +180,7 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_exit;
 
-	ret = jh7110_reset_controller_register(priv, "rst-isp", 3);
+	ret = jh71x0_reset_controller_register(priv, "rst-isp");
 	if (ret)
 		goto err_exit;
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
index 2a5ad0e07d1d..5ae63e18aa4f 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-stg.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -139,7 +139,7 @@ static int jh7110_stgcrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-stg", 2);
+	return jh71x0_reset_controller_register(priv, "rst-stg");
 }
 
 static const struct of_device_id jh7110_stgcrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 1d460a03f936..6c5e9c54dfcd 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -6,15 +6,11 @@
  * Copyright (C) 2022 StarFive Technology Co., Ltd.
  */
 
-#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 
@@ -323,59 +319,6 @@ static const struct jh71x0_clk_data jh7110_sysclk_data[] __initconst = {
 		    JH7110_SYSCLK_OSC),
 };
 
-static void jh7110_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void jh7110_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
-
-	kfree(rdev);
-}
-
-int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
-				     const char *adev_name,
-				     u32 adev_id)
-{
-	struct jh71x0_reset_adev *rdev;
-	struct auxiliary_device *adev;
-	int ret;
-
-	rdev = kzalloc_obj(*rdev);
-	if (!rdev)
-		return -ENOMEM;
-
-	rdev->base = priv->base;
-
-	adev = &rdev->adev;
-	adev->name = adev_name;
-	adev->dev.parent = priv->dev;
-	adev->dev.release = jh7110_reset_adev_release;
-	adev->id = adev_id;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(rdev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(priv->dev,
-					jh7110_reset_unregister_adev, adev);
-}
-EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
-
 /*
  * This clock notifier is called when the rate of PLL0 clock is to be changed.
  * The cpu_root clock should save the current parent clock and switch its parent
@@ -525,7 +468,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-sys", 0);
+	return jh71x0_reset_controller_register(priv, "rst-sys");
 }
 
 static const struct of_device_id jh7110_syscrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index aeba42cd3c44..14e5b8286671 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -189,7 +189,7 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_exit;
 
-	ret = jh7110_reset_controller_register(priv, "rst-vo", 4);
+	ret = jh71x0_reset_controller_register(priv, "rst-vo");
 	if (ret)
 		goto err_exit;
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110.h b/drivers/clk/starfive/clk-starfive-jh7110.h
index 0659adae4d76..55374ee24d4d 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110.h
+++ b/drivers/clk/starfive/clk-starfive-jh7110.h
@@ -10,8 +10,4 @@ struct jh7110_top_sysclk {
 	int top_clks_num;
 };
 
-int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
-				     const char *adev_name,
-				     u32 adev_id);
-
 #endif
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index 80e9157347eb..37bab563c5e0 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -5,10 +5,12 @@
  * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include "clk-starfive-jh71x0.h"
 
@@ -337,3 +339,25 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
 	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL_GPL(jh71x0_clk_get);
+
+int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name)
+{
+	struct jh71x0_reset_adev *rdev;
+	struct auxiliary_device *adev;
+
+	rdev = devm_kzalloc(priv->dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = priv->base;
+
+	adev = devm_auxiliary_device_create(priv->dev, adev_name, rdev);
+	if (!adev)
+		return dev_err_probe(priv->dev, -ENODEV,
+				     "failed to create auxiliary device %s\n",
+				     adev_name);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 9d5dec1d5cd1..322a05157faf 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -123,5 +123,7 @@ struct jh71x0_clk_priv {
 
 const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
 struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);
+int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name);
 
 #endif
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..30bf7282a919 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -53,15 +53,14 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
 	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
-	void __iomem *base = rdev->base;
+	struct jh71x0_reset_adev *rdev = dev_get_platdata(&adev->dev);
 
-	if (!info || !base)
+	if (!info || !rdev || !rdev->base)
 		return -ENODEV;
 
 	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
-					      base + info->assert_offset,
-					      base + info->status_offset,
+					      rdev->base + info->assert_offset,
+					      rdev->base + info->status_offset,
 					      NULL,
 					      info->nr_resets,
 					      NULL);
@@ -69,23 +68,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 
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
diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-jh71x0.h
index 47b486ececc5..26a8532493a0 100644
--- a/include/soc/starfive/reset-starfive-jh71x0.h
+++ b/include/soc/starfive/reset-starfive-jh71x0.h
@@ -2,16 +2,14 @@
 #ifndef __SOC_STARFIVE_RESET_JH71X0_H
 #define __SOC_STARFIVE_RESET_JH71X0_H
 
-#include <linux/auxiliary_bus.h>
 #include <linux/compiler_types.h>
-#include <linux/container_of.h>
 
+/*
+ * Platform data handed to the reset auxiliary device created by the
+ * StarFive JH71X0 clock drivers.
+ */
 struct jh71x0_reset_adev {
 	void __iomem *base;
-	struct auxiliary_device adev;
 };
 
-#define to_jh71x0_reset_adev(_adev) \
-	container_of((_adev), struct jh71x0_reset_adev, adev)
-
 #endif
-- 
2.25.1

