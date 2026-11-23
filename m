Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795432880;
	b=AmceDUUf8NyukClIFUJcA7ZnN1xZ+aD939k1eaTfN8TfnZvEYUpEwttt2bGRrQThWpf2
	 hbd5WpfOgjFgCXX4fmetnkphIJsKZ1y6ggOC9uaqcZKH+P1Xte74gzzqvcNue6yIKHcNr
	 s7QyYRuzm7IIG2in4xte/B2DnFusKpj0VDgjbyWysmF7pmk0kvKk/+XSVJkVG3aen5szt
	 OCukouAqKF1X5nLLJOcrIKJ11wAe7Vp8DhDyOl/FM1yhm3NFaiQvpy/8Qv0CWfzzM9Frq
	 g1gNYxQXN/dNtMejMRUkOFxF2kJ2+ag93AIUVGTgLULL67opR14Ouvnx3ltzZI9M1gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432880;
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
	bh=Sf1SKQawi1J1diO7szYcn90Mb4zqDB05r6+NlBor8A4=;
	b=33sX9zv9h2GglxZhJZPxE0FUXYPmOmT3VJqEEKjqKW+vWAc4RHPgUFu6RdFIGL8mWgT0
	 IECrRgM8EvpZuUcJx3oug60ZdMYKT/223naO4XXmK7Fxt8bKPFWEKZzQBjIaf8wzl+bGK
	 GmKZNIj0XYWnLWLMi9nMTi7a6beHePKo4aDpmf8IeRy/SuWJVmBD01jHJe+KZD5hv0OfV
	 kMgRP545Ywl+0gSAzTR9vduLix4IW24RMfT4uob6C5DJRXx7XZjonKX6aRHb4Lxn3l5R+
	 J+TO+ZLEreoC9Xi4VvKjbakEGzf9zfq5KrMbssTCiBSWzKukasmUV0P4aLgfEg7iwRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCE606A689;
	Mon, 23 Nov 2026 11:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FCE606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faU9XoTGOx5wT4gP9+qDdH3F+TMnXSIK41QsqJ1XaSXCmgGYPju9f/ASpgnZ1JciJcyy6hMbsmlkvx6l3tDtidc3L2+GWv63T8p8MukXEJCfDBIh3vKMyzOiAdOR5t/Vqgn6IvTp/2G2vMv09aGFNfpYBjVyttMIOvMDztkJcvds97wHKKx9Hv/AovETgxpC3qmYCVYhbOpH/nGumoBBiEmNlnZXohhYQrHIum9HRfq5PiqKvlXxeJUyHgCAV3Gq76cG6Wumq7QAXsbDdPIzGvlK85BpmdzNyu+xsxOwBFtE6swOrpLQe3bddUUnulJoz7YUzcwFrCMQyjVnHEZIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf1SKQawi1J1diO7szYcn90Mb4zqDB05r6+NlBor8A4=;
 b=lFsqOCatd4uuKnQokng+dE+oQ2z5HPtwAVT8KNeZ6t21lSKGeyaHRD8SWpftBdmBZs3MWIwYy8OQ6SzzIqKUEfzIqCBOF1uxf6+pZQJ9hrqu2C1Olu83j8k/kjHJa/AgJlr0XuB2kAO939fGEHrvROIDb6tVcfqWj/g8baMOQy++jIej5J5S+a1vbjOOZzRSsvRwz5POXTe6JJFA049TqfgQarzQ2WnZHfwCSGeAN2hGluBQQTaIwS9I57EyXPhNG7pGl6QK55ldfWZ/TbViF2B0t2EJFFinm1XgKH6fEio6bYaaQqFSvdAoSo29UPjAzKxHOVZahaR4KarvB3n48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:09 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:09 +0000
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
Subject: [PATCH v3 4/6] clk: starfive: Add JHB100 System-0 clock generator driver
Date: Mon, 23 Nov 2026 03:20:51 -0800
Message-Id: <20261123112053.20400-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 751c55bf-50c5-4599-6c3b-08df4953df60
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261021135927099003|261022113327099003|261028144727099003|261022105027099003|261021133027099003|261022075727099003|261021121427099003|261021130227099003|261021123027099003|261022115727099003|261026130827099003|261026135527099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	8/RfCbKE3N+JUNQDwvLosGz4lDBFNJpFu6re9qhQuB8Ne281fR34mPFshZnCZlHCJqqc6IVfpZvq1Fw7GoSvK5EZCLumtIK6DwNiAH0UVz1OuzuF7l6YV/SYCfvWJCPpizWd+VkLLi3IKjm11T6IdKcTe7XrMrR41o4HGKziXJjOO4RjfF/0kNNpKumUm5eRkAjaDmUIsY2Jl7Y+84AJxR1y/3zhdYNRwoBaUNeBvilFclxowrqlvvCErKrKqmqeKRVB3V751Epob+Ar0Oy19InNWkT/sqS5VGcaYpzi/8da2MuWe9xKB4oVRmWXlvIQ/BvVUgGvEtroYN2pKJ14w6eusug6Nen2GVVHqQmizmax3PAfdO4YOKb6nntun4eVYeXaOOPQ/RsCzdY64hLimRBxFTzGZ2+EyxJn3C//1+I1MJ2BlbibX/OerO3aHZh2bKqsmSgi+Swo0StkpzAFhTazLqTIknfMMKy1P3DADlOwLu0dfnHzJ/Dzg9HTnkMRFq1GBF7+gI3wkkVi7oysuPCmUUpgm1GKX731vSCGWTU0W/t1pAX+JbAyeI6baTER
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261021135927099003)(261022113327099003)(261028144727099003)(261022105027099003)(261021133027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022115727099003)(261026130827099003)(261026135527099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g1707D+9SxjTZnZNibkowdgidbHMAclnsjp0NjS1VpIGgzHc3If+T5HZ/bK+?=
 =?us-ascii?Q?xUEDUpoJbyheMT5h8YpVaVeApUB0mR2qCtVY2GI/0dsp20DJC1yHnZgPDBfr?=
 =?us-ascii?Q?Jglh0nibOhAXKfSp6X3nKWWkX3LB2X1gK3zKE6LReVBUW6o/GfzwRkXsUKMf?=
 =?us-ascii?Q?1W2dHunW9+U+UFHxcJ3E2zayp1vokC5BpEueckH8tksNiIjeRFfy+AbHsFUf?=
 =?us-ascii?Q?jLPBCjLRAaX3BWDo9Agn0kstSO77KO5UskysDlvx8n9hP2i5RTc13qzFupwX?=
 =?us-ascii?Q?3C9x2zaQf/YfvCah6iPqt+uPobq3QhF2T5K0t3II557M4yt+frS8fcVRWjmn?=
 =?us-ascii?Q?xzKaD2L0j3JlcoUSqzXbJRGLDurIr2M/5MET9wqremlYQkF7t9XsipIG6OHl?=
 =?us-ascii?Q?SlO4yNHQxTSAcf5uVjbUBK8aJaBRb1tsea0crUM+GoNBNL1jScA6SeglHxVo?=
 =?us-ascii?Q?apuyu6rmS1o7w/iJehWzfD5SKNycMGekdATgFp4cYUmw0pFj1zZiGbJ19C1M?=
 =?us-ascii?Q?GefcUynDDTvFjEvAX0y1fLFZkS4wbAwagPCZLLioROsHvzHtcd21PmmzixII?=
 =?us-ascii?Q?v3OPtsr/YqLA6IIudhU655f0vIsCWAWeyilocSDfPXYg4r8BnmIyqx15lsW/?=
 =?us-ascii?Q?Air11rrktZJwbnXhZMoTIuBsHbL7FVKCdNM4PK7kawYfpignNUe/GOjXs83D?=
 =?us-ascii?Q?oX0JLHvBJ18+EcqVZ5kbyymhThKSo1lDYb1JP1HC2Aia/51a56Nb2ejw61Wr?=
 =?us-ascii?Q?5F1SFeAP1GWDoPCJZ5Ubt5foHDTHJ9L/sb61T7q8drcRXyJwB/fuf/XAvYoW?=
 =?us-ascii?Q?nBcvQ2nxwLA2YE+NW/7sUZEzZFNFIreZgtLmQwV0owCh44wkm2aprPYxTHVw?=
 =?us-ascii?Q?Ltf0rt9+lMMVzrlDtgSLBKu4BnVUvz3KIZEbKo0vjo3v/SnHdPu77bM2c+SR?=
 =?us-ascii?Q?sYWxCunYJXPJbVqslTsyiSJJbAR5tqxKaOFInv1d2tVDE9GtMuSDIwXgAPWh?=
 =?us-ascii?Q?jPAa9ewjWzqjO/Vp0t+OGSCU/4HpJQDB1FX2c0iRIjngWIowUfIX0oe5bPcU?=
 =?us-ascii?Q?vHQGxGOifLiLKVuAGNyQGw5jJZjwFAqoTpgdfM0d0HRnScGGzsbcBTlt3AOX?=
 =?us-ascii?Q?RuYKmLmCzUifG37MXqwQFqDDlUdLKNMhKBsVBIfQ3wk9nVIYOwkvjggH3Pzc?=
 =?us-ascii?Q?yOJjUgWfQa3EkDSi5lFhT/7Ocnn1BXAmXqpnaUet/XQBu9q5Eg3tZWRKcv58?=
 =?us-ascii?Q?LvkGxS4xo0/lOxi3+cJ5N3tochPin2DhUoUmgz+I69XB5zj9PYaX2GxX7und?=
 =?us-ascii?Q?vKcRLC9XVynsgo/Q2Co+fb18qjJDEaiTjlfkds6fCIKe4ufgP4iNHNcFp/PQ?=
 =?us-ascii?Q?WEOvydlBXzRlTwXTFV1MLma1A45wQUs3JcXpOUhSFeP6MpxMPZxvqS/V265Z?=
 =?us-ascii?Q?RIWxUDJns/um3p9Db5aoobKofekQlKmbqAxlRSdHqvUM3MQ18RiJBxS8k+I1?=
 =?us-ascii?Q?VL+5t2zlJU2cttPRVOKviDLqMVLIgFgUbvUhKKP0NbEJn+zFx07sTYjU/m12?=
 =?us-ascii?Q?qD0esb7Jttshq2pz5flFvrFVKdWdb8HxLu9XHGTqP11GUAFk2ip0At/SEiYh?=
 =?us-ascii?Q?b5n4ifN520Rf7lZavCrDse0Cka0PYNh/D1bYplYx11oh9hy61NB8Xc4kiDCC?=
 =?us-ascii?Q?CvKIUpEPvSNBQ+iR0GK23XAqi/mJvWkWkcM0hQhktqxLhUrGeIMlL/u6CIyX?=
 =?us-ascii?Q?+VYPrzx68Vz9T9KtKeWtYHD19gnBkpEQGmkd49etg+yb3fPY72t3?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751c55bf-50c5-4599-6c3b-08df4953df60
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:08.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xb02Zr8MMYfx4ydPuMg8UQJqrbl+3qORienM1TX9e6/FiUS63gzRhgFNTLvvQ0NK/qDM5yz+uckDYw420I66YV23IvwvxwPJHgIHjuLjxJo6ukmHXc1uJugL72LMQRGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

Add support for JHB100 System-0 clock generator (SYS0CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                                   |   7 +
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 137 ++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a737581bb8cd..b0cf34c286ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26921,6 +26921,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
+STARFIVE JHB100 CLOCK DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
+F:	drivers/clk/starfive/clk-starfive-jhb1*
+F:	include/dt-bindings/clock/starfive,jhb1*.h
+
 STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 51716655554f..cb246ae12c08 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
 	help
 	  Say yes here to support the Video-Output clock controller
 	  on the StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JHB100_SYS0
+	bool "StarFive JHB100 system-0 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	imply RESET_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-0 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 199ac0f37a2f..d2ba83d7d02c 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
+
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..74bcc6ffb177
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-0 Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include "clk-starfive-jh71x0.h"
+
+/* external clocks */
+#define JHB100_SYS0CLK_OSC			JH71X0_EXT_PARENT("osc")
+#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_PARENT("pll0")
+#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_PARENT("pll1")
+#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_PARENT("pll2")
+
+static const struct jh71x0_crg_clk_data jhb100_sys0crg_clk_data[] = {
+	/* bmcpcierp */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN)),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu", 0, JHB100_SYS0CLK_OSC),
+	/* hostss0 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_CFG, "hostss0_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_DATA, "hostss0_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_PHY_SCAN_400, "hostss0_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_GPIO_ESPI0_EXT, "gpio_espi0_ext", 14,
+		    JHB100_SYS0CLK_PLL2),
+	/* bmcusb */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_INIT, "bmcusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_TARG, "bmcusb_ncnoc_targ", 6,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_SCANCLK, "bmcusb_scanclk", 5,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCUSB_480M_SCANCLK, "bmcusb_480m_scanclk",
+		    0, JH71X0_INT_PARENT(JHB100_SYS0CLK_BMCUSB_SCANCLK)),
+	/* vce */
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_INIT, "vce_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_TARG, "vce_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	/* bmcperiph2 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_INIT, "bmcper2_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_TARG, "bmcper2_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_400, "bmcper2_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_125, "bmcper2_cfg_125", 10,
+		    JHB100_SYS0CLK_PLL1),
+	/* hostss1 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_NCNOC_DATA, "hostss1_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400, "hostss1_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400_ICG_BUF,
+		    "hostss1_phy_scan_400_icg_buf", 0,
+		    JH71X0_INT_PARENT(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400)),
+	/* npu */
+	JH71X0__DIV(JHB100_SYS0CLK_NPU_NCNOC_INIT, "npu_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* vout */
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_NCNOC_INIT, "vout_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_AUX, "vout_aux", 150,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph3 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER3_NCNOC_INIT, "bmcper3_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusb */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSB_NCNOC_INIT, "hostusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusbcmn */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSBCMN_CFG_480, "hostusbcmn_cfg_480", 5,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph1 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_NCNOC_INIT, "bmcper1_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_CFG_800, "bmcper1_cfg_800", 4,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph0 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_NCNOC_INIT, "bmcper0_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_400, "bmcper0_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_800, "bmcper0_cfg_800", 8,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu0 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU0_NCNOC_INIT, "gpu0_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu1 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT, "gpu1_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys0crg_info = {
+	.clk_data	= jhb100_sys0crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys0crg_clk_data),
+	.rst_name	= "jhb100-r-sys0",
+};
+
+static const struct of_device_id jhb100_sys0crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0crg",
+		.data = &jhb100_sys0crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys0crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys0",
+		.of_match_table = jhb100_sys0crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys0crg_driver);
-- 
2.25.1

