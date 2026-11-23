Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795432882;
	b=Nru36jM+c/a0gOPVn1Jn0ri6VqvwP/A2iSqhWHmhzZmuqrnZmqcfH3s25QUf0ChH/xLb
	 KqBcgbVXRkQlJQT3aOBu22t7beJnsByU+4HlaScDd2mHrTGjty334t8zvwmhHafPWUb99
	 TRJM2GjcnTe/GNlfbfjT91jAuuRSxySU/cXcMrShAtwEZdgoJ9BzNlVwj/ntK8n4RRrtP
	 0dZI0AGEkhaou3XGhg+N482h4L+hfsv9nlj0pn3tZX98aAXLIbLapEEi2WkPcHk2np4/w
	 RvoMhizVg/KAsNXgTKpIcCm19Zj+C1QihVVf4ZmJMDSGmahR1H5o3fH04bmCcfxVxQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432882;
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
	bh=8Ylu8ggj3TaQGto05m7Uzw1zSDggn9J9pa+rihDHYUY=;
	b=Ungyztv9kZqcecIkV+sVzZuyfuHIBCc9PELgS6nGrQ74RCt4LMyYJ2aZdClbza/NmeLE
	 1yNIicOQj4rjf7pFTtOcHQZFVk0+Dz5UZ3LaWNWUVarvoi3alFQbJ7y3LtYXs/rvUYJ0a
	 S+Ewnf5wlTYoe996TzrN9V7KuzdVrwFKv7W/JPnf1F2/N6gmaJTm9jvHlKRJHVBmNmyu8
	 dgya158htOEtTIzAD8pitOHk55EgqVdVFdeaQAeT26VlZrdbiPk6YftCRnXTSk0rKA9Da
	 bQwE5TeRK+r/wZKGsgfTnPRS+tI5pIG2gd24ICuxQdlRrf3oI5qpuTLCE0MPKSGQn/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE185606A698;
	Mon, 23 Nov 2026 11:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE185606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnHqHOvunBtqKKQGYk04iKUK1UfeCqDN2hMPttVecZax7RzVEwPvl1cvBmjFNEKEe0uqi0MkGNGcKOmSxbqz0jLvIhH9+yLaUZwQUdgbSBcB02C4nq1ocs4LxxzDRvYXrmAX2XxymWWrjDmH0XX02w0Ucqi7V7XY0XB+EgcJRP1a0iFJ7//G+gmYF0DzzsrmKKJWptLTgRzkxvFj6XGmreMj+K80TXoSAbnQPJCBBMD2jvqv31qKWLfnUpVcBNNYFb62naX4zMLvPpxd2QfjNNwM7lEkfckldGQxVXM2o/k/VViy5rmdrWAOsrtUzFiT4stjicxOG+tN2nhietSGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ylu8ggj3TaQGto05m7Uzw1zSDggn9J9pa+rihDHYUY=;
 b=iYTxUU4bXp2XFjj9lf4UUqfAQu+yHCL5dTwDNPVq1k0BSPFd/bpUsn60cYZq6JsPUNaKcWy+lZdwnWTdHcYFqIHMfgb6o6TZKWqqHKwnfA7oIIlQKF4LmHKtl92gZ1OjzJ4dp8DNUylLnjkWZt9HYNfM6GZV/XhXht+wxkYx9o6SuNgrPH6m2fsg0VSHppVP6zgK1dbbX+RMZ6tdvGWQBYH4/LTKudv+k+ZEBXsazo35ehKeTMyIt3I+55WlOzoW0eC1jmPydjfMgKB9YJHxMPfpHJnyQKMxvkmvOq0C73kmfymi6V8h9U1t5OVDMeXOn+VDtEgCImPtuIe7B5P9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:11 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:11 +0000
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
Subject: [PATCH v3 6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
Date: Mon, 23 Nov 2026 03:20:53 -0800
Message-Id: <20261123112053.20400-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe528070-cd15-4bb7-d43e-08df4953e0c3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261021135927099003|261022113327099003|261028144727099003|261022105027099003|261021133027099003|261022075727099003|261021121427099003|261021130227099003|261021123027099003|261022115727099003|261026130827099003|261026135527099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FqBO2Fzn2ZOoF8C6F0oenFh9hSI/rmzRFjV07Ug+Mo/WmdXtPWMhaWUZthr6/a1G/6FJ5KFIeGlutGsLzczeajMhc4Wtj+FniOrwiMLV7Hiqb6VB4F4ejfRyU4kPX0ceTsTDbr8WqCW2KmHAH0mDRJ9pAMlpXdlhLqOT5TgncWKrD2pU/fB2GbS5FaDxQH6yhId5B+yPITlLeLbXW455dy1pU9utz2ljz21Sdl7eDAgdCETZKneNpJOaHSpIDEd6W8nDaqKpihDdlpAOTgflVztaDHKfFq+HU+eQCGS+UrzZ+Z9lgii6A3JhEpWRRXvHdBY7AKNug93STlDa9RukvvyqcyfLkto0cTwLqIsbp+oeqSz5IWhQL9gzsMfxjDMkD0aK7TJYN1yx2wooS3ZrF0Kq8Zp6YDoBAtC/btcbVYJlm4lk+gxIJSn5C71AbHSrO/9UJs6OhW70sdejqtfYWL7bC6OwTULfJP6VaL6wHSorZL0ipvgfq+kT4IBhNnqAdbUtF7xkZ1SrDn3/Yj6g5c0upEQhr2zvfuJ6vJtTCP8JwetjA1rksRt8OdgMXHuB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261021135927099003)(261022113327099003)(261028144727099003)(261022105027099003)(261021133027099003)(261022075727099003)(261021121427099003)(261021130227099003)(261021123027099003)(261022115727099003)(261026130827099003)(261026135527099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ylqlBTklXsb17/Hwi7UoRdP/OXzw98v2tdrUwCPKxWNDGKLwjMHZFvOCfpqA?=
 =?us-ascii?Q?n04hTNvANLhASMdJ0KGd9RBg0R4hb1p/3lMZpZOvXhYMKeCHdchiTsLxhdAw?=
 =?us-ascii?Q?r+GChq8WZXt4M1Q6y+ZJb9rsqOFNGX3+0SIx6baMsO+ozFXzQ1GjEwjvuK1j?=
 =?us-ascii?Q?j02h50YMjM3Hm4iMrNfqPSWPK2rU4K+kvzJOHcupTw0hHpwKn3vxuWaqkpOF?=
 =?us-ascii?Q?+TQr8we+OscZaIqQVh9cb/H6654CgjhqBlxoCBy4BkQUyKHy7aCmBDLEB6Bn?=
 =?us-ascii?Q?46bXckLtwxelUNURVjM3jvgpChYx5POHMwGUDzyIS90VwKy4jlpioIOYvHIS?=
 =?us-ascii?Q?vLKjsjYoaDY72D9+OlYXN5x4ZMQgfQ520hlfkFBg1+PC0Vc0KIXmh0EBNDkK?=
 =?us-ascii?Q?U/b4FIOFlAzoJER8gf6zEjd3wqWikYZCGCfvtzAgaqXXoLpU3En1qN3n/yq0?=
 =?us-ascii?Q?efVEjTOu5z4s7ahZ0QM4pRu0/iXr8QWxwUKz9I7Ha1gwbBKY6chwiOa9wnni?=
 =?us-ascii?Q?MgtP2e2wqbCXU44wP9y843fibwFzAi+ToPE5x6+yIy3cTm9COgazSkuqfcur?=
 =?us-ascii?Q?bBJvtZkBnUbmxZlx7SYhPhWVl4At14pwIuUOesTPILwyeU+z+0hXZheH0GiG?=
 =?us-ascii?Q?/n8DQWcr3l8oqsVfUGfNdqe6HNn8nPXZvviWHU6VBx/FKstNulxuXLvnKOyT?=
 =?us-ascii?Q?THA746Dru9aGfLPqFGYbhT79zGG9xex3vu8qAuuHL7CstGA3SG2Ld7rSpmae?=
 =?us-ascii?Q?+eHzcBOuU7DqpeXgQsbMFmgZ101+DZx/jhvuNDOKRRCRJs/4SOXASgCwuvsq?=
 =?us-ascii?Q?ghd3AJ7jbpcQjjXgldJ1vMFWIHjcW4dIU7y/br69lVYyTbUJ4+19saB/25ju?=
 =?us-ascii?Q?w8h0qpco+f/VCqRrwQyCe30x0igIU1cNLG7Up6vtsZ9UXhw7MDo38px2wEcL?=
 =?us-ascii?Q?ot/vSWau9JlKsIrk+/hPjL3C7wxYS/qer6/+ikmt3/v5C+jWEm2CiTq29WYi?=
 =?us-ascii?Q?sU1GGv0AyKGKf8wDR0ke3xP04jxdWpgcnEZ1e3I3yCTDv7ircIhJTYNH5BoR?=
 =?us-ascii?Q?wJVWfla2WCRVvmvh99Z8+Sz+GMWRtpwNUmSjGuS62eKpXW4iae+5Vz5/4F+7?=
 =?us-ascii?Q?Jpd6+npifzFkSf/ZmP3t3V9nWJSGcPQbVuJXpnZsPFQmPvSvnmWv0nwEkUkv?=
 =?us-ascii?Q?wnId25fSnxCrbqf3Qtn5X6nIVz+wbRgFmTtnNBWSTAtBMf2ahnoem3gP/VfK?=
 =?us-ascii?Q?mfHUxW1XAWY2hDQUMAe7bgmGapJWtr9+qlmbSy8qmAe57j1+jhax5FcHT3yV?=
 =?us-ascii?Q?27PuJTOwojdN4QPvGkdfhUjaD8xAeKvtomajEge4lWQi8j3ofPdOg5kbztXk?=
 =?us-ascii?Q?svAXcxiGj3uRDOR2PFmsYrg/ngOUnmw8c8eVXS3liAil1j9nrUwWOttUS0Nu?=
 =?us-ascii?Q?Uabq50Zkl8H+QNxkLM3Kcn7gxpwHLHxZlTXHfGBI67HtCHQ2b7xi7l3GTMGy?=
 =?us-ascii?Q?x3wUqlWIuLM95nfGcALqhv8sECQpl8ogib4dolTjgSEPpaQdVhODyoFtH7tu?=
 =?us-ascii?Q?im1CI8HR3Ukw4SJ/Wavzw5yFu0LeDOO0v3m1GaLn6oBDb5BHZhlEb9hxCv3y?=
 =?us-ascii?Q?sjrPaULAaNYx5NxVfmYGWtiZOKg/M4QkiixfzG8DXgLYqx63oTyvcXgbz3o4?=
 =?us-ascii?Q?mQt6c3DM5zjT+j2KdXdAucHo/OTQzEc+P8fIidHatiQoxlNBdXWPX1VBLSDX?=
 =?us-ascii?Q?FHfZVG+xz0rN/O5tYsgRpMyS/OZ/R8/YPJJwniL5wb/Kmhh9+DYw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe528070-cd15-4bb7-d43e-08df4953e0c3
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:11.3289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6N3IOoeQiG99WrutjbDjJEnkH+np2mzC0vJOZ8zZ+aYzPs+Tw8QwaffBqosU5c6TCKeM6WB501WlhUExrkt7IcBphSp9tQorPd7Q5Ji1XmgOu00H1d1TIGNnHJTD0Jym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
the auxiliary devices registered by the JHB100 clock generator drivers
and uses the register base handed over as platform data.

Start with the System-0 clock and reset generator (SYS0CRG). Its reset
IDs do not map one-to-one to the hardware reset bits, so the controller
is registered with a reset ID map.

The other JHB100 reset controllers are added by follow-up patches, each
right after the clock driver of the same CRG.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                                   |  6 ++
 drivers/reset/starfive/Kconfig                |  8 ++
 drivers/reset/starfive/Makefile               |  1 +
 .../reset/starfive/reset-starfive-jhb100.c    | 74 +++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b0cf34c286ad..11f145bf04cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26942,6 +26942,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 
+STARFIVE JHB100 RESET CONTROLLER DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	drivers/reset/starfive/reset-starfive-jhb1*
+F:	include/dt-bindings/reset/starfive,jhb1*.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index d832339f61bc..d1833f1ee719 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -19,3 +19,11 @@ config RESET_STARFIVE_JH7110
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
+
+config RESET_STARFIVE_JHB100
+	bool "StarFive JHB100 Reset Driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_STARFIVE_JH71X0
+	help
+	  This enables the reset controller driver for the StarFive JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 7a44b66fb9d5..d781103355d3 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100.c b/drivers/reset/starfive/reset-starfive-jhb100.c
new file mode 100644
index 000000000000..883f67ff1fa6
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/auxiliary_bus.h>
+#include <soc/starfive/reset-starfive-jh71x0.h>
+
+#include "reset-starfive-jh71x0.h"
+
+static const unsigned int jhb100_sys0_map[] = {
+	[JHB100_SYS0RST_RESOURCE_ARB]			= 0,
+	[JHB100_SYS0RST_SYS0_IOMUX_PRESETN]		= 3,
+	[JHB100_SYS0RST_SYS0H_IOMUX_PRESETN]		= 4,
+	[JHB100_SYS0RST_RST_ADAPTOR_TIMEOUT_RSTN]	= 5,
+	[JHB100_SYS0RST_BMCPCIERP_RSTN_BUS]		= 14,
+	[JHB100_SYS0RST_BMCPCIERP_RSTN_CRG]		= 15,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_BUS_ESPI]		= 16,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_BUS_PCIE]		= 17,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_CRG]		= 18,
+	[JHB100_SYS0RST_BMCPERIPH2_RSTN_CRG]		= 19,
+	[JHB100_SYS0RST_BMCPERIPH2_RSTN_BUS]		= 20,
+	[JHB100_SYS0RST_VCE_RSTN_CRG]			= 21,
+	[JHB100_SYS0RST_VCE_RSTN_BUS]			= 22,
+	[JHB100_SYS0RST_BMCUSB_RSTN_BUS]		= 23,
+	[JHB100_SYS0RST_BMCUSB_RSTN_CRG]		= 24,
+};
+
+static const struct jh71x0_reset_info jhb100_sys0_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys0_map),
+	.assert_offset = 0x12c,
+	.status_offset = 0x130,
+	.map = jhb100_sys0_map,
+};
+
+static int jhb100_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	const struct jh71x0_reset_info *info =
+		(const struct jh71x0_reset_info *)(id->driver_data);
+	struct jh71x0_reset_platform_data *pdata = dev_get_platdata(&adev->dev);
+
+	if (!info || !pdata || !pdata->base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register_with_info(&adev->dev, adev->dev.parent->of_node,
+							pdata->base + info->assert_offset,
+							pdata->base + info->status_offset,
+							NULL, info, NULL);
+}
+
+static const struct auxiliary_device_id jhb100_reset_ids[] = {
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys0",
+		.driver_data = (kernel_ulong_t)&jhb100_sys0_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, jhb100_reset_ids);
+
+static struct auxiliary_driver jhb100_reset_driver = {
+	.probe		= jhb100_reset_probe,
+	.id_table	= jhb100_reset_ids,
+};
+module_auxiliary_driver(jhb100_reset_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

