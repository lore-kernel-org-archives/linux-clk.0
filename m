Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2137.outbound.protection.partner.outlook.cn [139.219.146.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E839E9D6;
	Thu,  8 Oct 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472014; cv=fail; b=U60j7fAjFZ6RgAGqwQm5MIAE8tBFNl2O21/JL7uHMjATDoYzdnHPj0OJ6dhqkl3/OxmQ6GpM2k5gWiP5PxVKH0A91YI3G8wUveu50twGrMedM06gSJ1wfDLhH8g7p0Ld768a9W5AnJJ5GDFXhc+CcMOi4Ep3XS7TuUvesNfaN3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472014; c=relaxed/simple;
	bh=wjMsCJVW98TN4PBUv6MiH3veqXqkOcyObH8bVCHFZqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sn8Wy6lVJYrBGwlpVq0UD+Q9UI4KtoPDTUqGAzhVU12hMD9Xcjon/G4dUeRBhyA6OHImsXltB+kUKDcBo5i5SK9cQe1Ukb0q5FBRPBSVIAeHu8HUjsU/DGmTmCdMpr05/d5gfKSWnTc08EIs9l69cekg0Gq2zifqLHHzhT5dH3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdyhnAbuTXJ/NkAQAoba74YS19gnRvUVxctWB222FeZWBqoIa8+U4mdqz7GH3cmvQF1vz3StDjVlemUboAjusC+a5hBgqyAsOeiQjNDQOaUnkC0W/BjOInjsdjcEjuwocRSTqEmdvSL08tWAZLMQzFVfPgUFDvz8+DrHRctxAfzGxNFmftQGepB7SyLCu5g+4CvuFV/SGcmOQXynqzt0Yo2eZS1/pwpSKkZJSm3C6crtRw6K6XapP50ZVANPcapfsF+uh5SwtGvPmI0JCSQW8xG3AhiUJr0RcEKIh/H+jv+dK61BkxO+n5UtYZ09pF6E0ESCE0BTZakVy6Kyeidiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxN378Fl91XwyIRxcPY3l9M7RWfQNVX8cDr5JYi4Mp8=;
 b=bNhMoFgMQ45Ru/iDRBCl0otITb8A00OslZz8ty2S0YlvN0AYOSeRRSvocrwA9qv5bx2/lg6L3bMkxduSjh+2p2DUMMEsEhlf3Zeqzn7QxGd1Mk8o4NPd4Avvl3CbUV2DoL08OV54J1swY68kYIZxBmr7KW8asVx5sgcKcrZ4AvVduHwngnMMWPj9Cfdg+hEAim2sG3mxM7iCn60559fWjteKE/RFFpPP5iClcqmfDm7DyHrBiQpSiws0Mywi3fy3xFyWufLPoLNXGR+YOYde4X8tbq0oBa7BGIht7U1D+kbtel2HI+c1wHVKYBH10eMEpWQGuWKurdxQdiFqFiCgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:51 +0000
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
Subject: [PATCH v6 02/15] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
Date: Thu,  8 Oct 2026 05:33:25 -0700
Message-Id: <20261008123338.11081-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 22e2b916-7ca9-4aa5-6a5c-08df25386865
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	iB5VlQaht3PNBXYZl+eh3gKCqogOPm22w28x5mBhfniKkOyfj64pfytGtd+2MyGPtOOzrzh+ANw9wRb1WC9pTsj6jYHNJChxKDLwW70JsA7K2QQmq61ixZOrZ9Nm4yNKgBwaguOqlk1+CfUdZSCbstbKHeCxL3w4Bkm4egMDa8MHDTXQWMsOHNGQcuZWmxYIF0w7V96yb0Tz+PdmW7f3i6imuB8+MYhKkc6rImAbEWVQ/d9INMc41LSa90Bf+iQhM/zu1lkxz0cvpjSWl5K6WtE2b7eJ6K76Qwt4+iZmveczaqz/Rv8nQcrKNF4WClADwV5jt1LERnfqd3cuOWNgrk7ZnidtQ5RxktW58Gg6K+RBZFWxMHFqUkt21Yk2gla0HuZEet82advOK2PZcUcxqtdPeLbZ7VIDqLbpES3YP2+jVzMyzz/4Gees7ZmPfqm1lyTQdONeH7d95BDxD4VY1p7KtxpsVbaE2wUWf193mlbIAYrT5H2tKrSPGL6wfOugUAjE2SPnz8qIWdI4by8QTBrW+ImSrsj4Cw5cuYMT8ohGwsd70aJso3cqgyTaxhYd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WSw53dZPzu5yb6XGNwafx6jmvdIAi7N7cv0m3oeKsiMTBZuQfW9JJzDo0tul?=
 =?us-ascii?Q?a3A1P4R7bgjENuobo2vZzL4f2yVLolCLe4kcBEmYLjnVoFAChwxjPqYp6XiH?=
 =?us-ascii?Q?jb8Eet/0v9CPcZRSnZ7Il0602Jli4EFig2CnQ2kXp4H7YhaaxpGm4sI5hs43?=
 =?us-ascii?Q?orpiJVbSBkQwmvF7EpKKWaT5qld/Wc657ABfQjf+sxXO1Qv8gWpPcNuHDsbM?=
 =?us-ascii?Q?hQuLKAh/D6Z1+35/kJwx6K7XMhJwpzV3w0xwsqiIKle2q3w+/VP3dSisfftd?=
 =?us-ascii?Q?xSnuniyJ5cIxKQH/osx/GYx0ZshlSnLiLlU9+mzyZH2dgl2oNDqkVndPyxmp?=
 =?us-ascii?Q?2p7HxjOFu+E05F0VdWIchczujJsj5GT1jVk439/9R8EDb6AqlBecNclff2C+?=
 =?us-ascii?Q?C4cJjR8k7s1b+IoU0F5KYRpBOmNbu4GWiSyyidnuEVaekscCUDe2es7tokvX?=
 =?us-ascii?Q?tnw0v51E/xVA0kAj1HQ0U0nezJsiWFlFZ/2o65RI+uo7fNlCzsjNlGE/pgeI?=
 =?us-ascii?Q?M3ibeRGTIHlrfSF+fx+aAdwPX4suSgkn0StVT2WZmnE8Mlv9MYEebUvR473T?=
 =?us-ascii?Q?atboOkIueTSeBvGLloj6aoSXRTIglwQ9YPIgPK/K85dfJIaD7eH5TunXx7u0?=
 =?us-ascii?Q?gSuIJU3T04j/ntedA9DVYPmmEBZQID6BYQlcl9fbQAy+FhO00oHfkWNClPxA?=
 =?us-ascii?Q?F/0yTJjmk8YFKSkXYampT8DO4RnpSIGvpX2L9XHf0Z+HXbrmgFuri/m5C4Hs?=
 =?us-ascii?Q?m6ETBvwzxGGf64ea9iCkoxejoYDpUsMuP6GYWsJHRBsDqBSmguIIgzZWVQwe?=
 =?us-ascii?Q?zZDHv8s1ziUyTTkF0Ef/qlqqND6kEhV8qIn/6hYupYgUhQoTy/YZclgcwzYI?=
 =?us-ascii?Q?eGtQHha97G/MJTMi579RSO4f3roQltufZvgwWplQMlJaXaQQDwDqML5wz3mb?=
 =?us-ascii?Q?nx4LYG6wdwwHwQ41+0xt3VjnFJ0amiv2GjjUnmMlhAXI2QY35v80RuTf6+Yg?=
 =?us-ascii?Q?l08fnd7zrcnjPwsNrxLVztQ775DMsqmEOd6nmvyGgVYJVBLc1SdFyBQjmF5u?=
 =?us-ascii?Q?Agqkc7rxYwtx5QhmzkgtyycB5yTTe/iyW0gZCnGsZSfvcYoSXs7duxLhw8O8?=
 =?us-ascii?Q?l4NpthZ890q4LV+lR1yR0v6ylnju5sWyClK5l0kzWUuo1lJC/tUEB/5NGq/q?=
 =?us-ascii?Q?QbFyMjLxhmkxUF+A75SDHsEjro3PHs7qrr+y+BSNHn9Rb0aWaodKoMeCL2kW?=
 =?us-ascii?Q?pY4OmK2ZPWjLFrmpHrF7UUltHAFWS3UjKTi8caC1HKjwDkXjGVgW0fHop3zv?=
 =?us-ascii?Q?szihIP5a84F0CPFhZJ81oESnhjYEzdDVRYCWJoHcXQKohU2AnD4cxLZRqV9G?=
 =?us-ascii?Q?ReeYO6cxjDXf0yauw7WxFtFtHbSOmBstm5VwrW65BPJiN0fN2O9ciJCDuJ7Z?=
 =?us-ascii?Q?5AvmT8QvxolgJIBFd7rmcFlzRrRdtkBdRri5fmwNIcRhGhKFK3dF1S0aQWlE?=
 =?us-ascii?Q?/1pSxKjMsJcAOYc7SYhHTgpvGopU/iriGJ2OEpCc5cZtQOfnttcn1C/usiv4?=
 =?us-ascii?Q?x2KlsIcoB+T7T3w8hBfhKSPUSOSBgaKwnIt3DZXNqZx1PjHNcRHpQ0Kv9RJB?=
 =?us-ascii?Q?GYP/zAMiwFy4X4uUWZ3RdiMxPGuyQH50okSRQwO+h4fCGcjM6akCxV7LK4ct?=
 =?us-ascii?Q?ISsGkF48+1DgcvmEqsu7fuWsTFobUk/OTiWh6VHh0+jLnRQDBrZi5o7wTB/a?=
 =?us-ascii?Q?JGsdZkXKgIHOx0hu6ccvV2WmIYxDXsd4OHmBXFvJ6fDF3MVA5fTy?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e2b916-7ca9-4aa5-6a5c-08df25386865
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:51.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRSEEpkyR7hwfi1d7e92sQ3ziXVeZm/w+56MNRDu+K9o2V+UVnhSdyz0MNM6W/u3XAScBZuSs4lqqnZ/w+jDN4zhHExUmICWTaoLJB7Fey4pLUd32Vt6D1SVCMk1N/y7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

jh7110_reset_controller_register() is only tied to the JH7110 system
clock driver by its location. Its logic is generic: allocate a
struct jh71x0_reset_adev, point it at the CRG register base and add it
as an auxiliary device for the reset driver to bind to.

Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
so that the clock drivers of other StarFive SoCs can reuse it, and make
CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.

The auxiliary device ID is dropped: every CRG already uses a distinct
auxiliary device name, so the ID is not needed to keep the device names
unique, and it is always 0 now.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  2 +-
 .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 54 +++++++++++++++++
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
 9 files changed, 62 insertions(+), 67 deletions(-)

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
index 80e9157347eb..2cc71f49ddee 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -5,10 +5,13 @@
  * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/slab.h>
+#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include "clk-starfive-jh71x0.h"
 
@@ -337,3 +340,54 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
 	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL_GPL(jh71x0_clk_get);
+
+static void jh71x0_reset_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static void jh71x0_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
+
+	kfree(rdev);
+}
+
+int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name)
+{
+	struct jh71x0_reset_adev *rdev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	rdev = kzalloc_obj(*rdev);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = priv->base;
+
+	adev = &rdev->adev;
+	adev->name = adev_name;
+	adev->dev.parent = priv->dev;
+	adev->dev.release = jh71x0_reset_adev_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(rdev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(priv->dev,
+					jh71x0_reset_unregister_adev, adev);
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
-- 
2.25.1

