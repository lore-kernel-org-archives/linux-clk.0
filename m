Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795432879;
	b=Wy/PyUkIZopy4UegpU485G9Yo/KK1Qmc6MzESeEaLpvXWAo8sPlg6E93jRtta5Im+F2+
	 cRG+BRJTHaqKWv5yMYtmwWOm6Mox95LUoOA2jb6F9ma7pVxI+xl8CcGMW6I/4GfKponQT
	 XUvBzGKQEOYBksLPt7njRcVFs0XMkj7BcmzQAY2wfAQlnYhIx0j3FztJhwIWrg/IS5EKV
	 /aDA8BsV9eoLev2QOcWvBGKrWvfNfUzqUj4w7TzqryB1jhltnBSvZh6hm6KM3VYBSruUl
	 OGzEYW64MNTssYByU8r8HtcM9qvEulWzVvmt0UGomew5AuSzZapC1s8chpF0C+WUwUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432879;
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
	bh=TI8SYwzwDs91amnYlhTwJUO6Xv4p2a+uRYOObouomBI=;
	b=hu0d2T8zCSylZRYA6pUB+7w2+y9qRW4/jEgHaLVqZByrOuLTvVSgafegCr8e0uxIU0gS
	 oDkSwtVlZwbo7joML8Uf/Zra7xnh5vO4WW9uo4lAt1EIHutshgnhGYNk/K4EgSJBZ59JX
	 20eVOU+i/NpSFSIXCsXpJ2iHpYda/NH0BYO7O6JTGwUB5g1f3I0xFG16V8kdBNEkUGe7Q
	 S82vXWS3jh5mVJwqBHyrZHm4BN562QmR5AKlWv03nYbZl9ZYeF5U3LQmOUfd4/EvoByqP
	 wzn3ddVg0nk45hIh1OZOKcE4YYG3quesMq03xISjgElxtI2o1CPukcuDH8ogyPIKpQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E702606A32A;
	Mon, 23 Nov 2026 11:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E702606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMipxSNz4fZujxvd/uTguz0GQFJvbYH8wEDlU3GOrnrE4yy8dqWBdDauXMY3KALMpQNapTlquR0rwG719mtvAs+PexmC3Ov1t0m7oe6L3m2jBZO+fvoRf0Nk83NTtt09fDrxV0B/JZIbV2E4tLvrVodkz9RkSH/PnQOIBrgPNvdvsz3LIOXMWUEHX7Dko1OloNt9OFOVveDt0emBlQtMBgtlWidS3KvR9Vb5wJxDa/kBbMLgJM8/1QNKplIc8IYWytsJDUTsTFn3wMyU/xvzXnG2Xi6BIOWoJ1WiZ7fVDDPF0WpiqmZKj0m+YwhKn1z1kcE87O3i7UK2LfJKTjO2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TI8SYwzwDs91amnYlhTwJUO6Xv4p2a+uRYOObouomBI=;
 b=ofVASPtM5Q4mOjpud04hJq8pYYW9fV8h+qYSLQ25EhO8L62Jjhi96/hjBtmaIkcogKsgpYDK1LQ4KzwR01XTtzDVe0N+8DhWl79rO9scLtSyUR1YfoLf+FcbA7eOwmzsFwCeQDET6JJ54w+Wl9Td8AFlcVvrMbJWwxzkcRjZ+SbJ9nmfdvjGgDj+3NPqQXNsS/mrKLLKLhTEnwRqAUOAnpBydF97JfHWVBfXp62hvTx2cU/lqLxZrpj2kxCEut0SVlDnnfZdOYeVKDa0S/SvClXoo8f1y2U87iRZaeYKJkGTcVzbgHXS4fNGcYoLY4SGNvhnrOQKTVLU26e2im25ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:06 +0000
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
Subject: [PATCH v3 2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
Date: Mon, 23 Nov 2026 03:20:49 -0800
Message-Id: <20261123112053.20400-3-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92cba785-0ef5-498e-d7bf-08df4953de15
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|260925021311599003|260925022911599003|260925021911599003|261102130727099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SXsexBGt6rbUoFQDtQ3NFJ6o8gGmCtJA6+0C8ik8glvlsuGm5vC8PeCD5wrcriNqOtlNsFBFXrgfKcrEnXVSxwI7e6B0/q380ezZbLib+R2MdDmBEql6W35WDFTY6+qEoDX3fOmi0AaQWkHOJhm2Wj9SJMQg+61yaTCvlSeIDItzUxPG0BU/fuKuhW59uu/axJcFxiPd3Yv03ttkyND3c1NepeVFbs4Bh5B/LoXJlCHuloroTB9WjrEvKAypUNsMkP3FVa88MF6YWDDteXlOa3MjKtYJi+Ix0hbH4SXT1C2MQgqDDkBTI73rKtJRRysRw5p0ZZfQEh4aOP1HBjcROmK9wNmnBdT97fwgfz6XYrYyzxIuYuNGbXJuSiyAz0AaHc1xeCPM2IfhuAFQFgGbtrR3lq9Bf8b6gm9xwRetDQnKuNncHnM4dsGv1xjKY+GiAnT6ooW/edsyHRSVYZ2vne4qU1gP1QaKzQM6b5Xn4uXwkzIjGrYdsbEejETLvbw/FU1PPg3LDuOvALkX1mSImYaOBtS+rypd8vWFw4H/YX/t0r180MQCL4BmXW9jpxkx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(261102130727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YmRldmSHZMNbuOCRwpYamWg/VqbRCTd2bcroSwR49GsZPQ353V3r7BvaQxd6?=
 =?us-ascii?Q?BuORJpj+XNTncalVFo9KSFRYnAPN0BQ2ncGqWm8gqdu27YL0hhsDIEdfWN1G?=
 =?us-ascii?Q?kiJpa4MLAyuDTn9eU7w466POj70g6+9dru7lBfufMKzoVZ9NikyIaJQDQuHg?=
 =?us-ascii?Q?FhGKh/iLyF4Bwy3XgRC/k59hxZqZeOAzkWL5casYjBmHSc6fS51H0zdFyJGf?=
 =?us-ascii?Q?9lnZgpPAKuNB+XmJzGqXs3bYciVcLzab3mQmzDfGKbAZdVvtUKzjMdSN3PXZ?=
 =?us-ascii?Q?9qSbdNQQsJxs72zz1X+Df1z23Sfkz2FH4hXyVw9oNbqZrJ0FHMQW+Jup2LpK?=
 =?us-ascii?Q?NqSKody+3mkxxnhhOJiM8yJ7Zryy5d6W0UbLkjG1+8Z2iGpWZqjfcO3fKUFE?=
 =?us-ascii?Q?RMFlKkVbCTEMkp7mRylRlgE3ZpZqQKHAHaR8ioIGNt50MIsFttrWnpzokNP1?=
 =?us-ascii?Q?l/EP98vAPVl1rCxBob3JajI6S9TMohJC3ChMYhj6phfw7beQwHwRn9r1xylu?=
 =?us-ascii?Q?yR4TneIfxuS9UjoSl6UpX+6Hj0eLK8JrZ6QyGnlntrdZbiGPh4BBfs77fzeB?=
 =?us-ascii?Q?eDak2V/dD7DBHnBK3cW+IHd+/n35EJSYG222N1+NEyPInQVs29LNT2Rm342Q?=
 =?us-ascii?Q?S0LI7RBvIkFc9AAlc6voPmnvnHq03+48P1buWxN+YnMJvQPDwXKt/C1QzEak?=
 =?us-ascii?Q?AWyBqQfFTr5rDnszCrgFIb4pccGd9nOhLZozyafykzbnM7U9SpZk/RgnSxO8?=
 =?us-ascii?Q?hFzbJfkkPcC40D22vilkp8fN+QgPWxv+CC/ldM/lLgQY9N9qIBIn3D/MSkbc?=
 =?us-ascii?Q?duoYzvc9uP4CBLUL3hfDJA0UncLXkO7vtBdmuhno0z28GY3bDmKGaSJu/Yy5?=
 =?us-ascii?Q?e2bU3Zz53Z3yMSYvtAGrJxF32QazzAdo5YBX6n+7UGlPVj8ePFtqfyFqpJi2?=
 =?us-ascii?Q?Xskstz9ZNjaiovQ8K5d54mK+1Fvx2rs+Z4tWYFRcQdiu26JikGSQ/viQvWHG?=
 =?us-ascii?Q?U0EwO/ALva9pXw7Wwk9eYnI6Gu2RyXpMv4bFYBw8EaULZBKTj7U8IjNrv3SF?=
 =?us-ascii?Q?bnYhZ83ckcVRSKapDkteg4FPOFE3BMBuvaKbQk+dhqgZAKVG8qc547nlSsf3?=
 =?us-ascii?Q?1soSMz2YqOg0W/zYrv6N9g7AFU5P82ncTkXEeAIIMft9owAeTgxc7X/FY8c0?=
 =?us-ascii?Q?y3sR/PSUyeLK+THzJgLtowdydxgUmnH95nCuyD2WQyEyXakQXNGNIAGHZqWX?=
 =?us-ascii?Q?tcoXGtkt4FFU+fxJmfND/Ak9/vRbqbvajMmuRqFqGRij8sC2upuabXP+oSLH?=
 =?us-ascii?Q?49DbQs3sgoyRpkAtbhsR5tO9IHU6YTVVZgoMZBFKUNk3oBrFctYKz1DVH/kO?=
 =?us-ascii?Q?myrbsD8l5qq9laargg2zg426s6YBIUnEDc5CEwb6dIoJc6hHrnbtjvRu3NFK?=
 =?us-ascii?Q?bUKjud3k59P/rPYqm7obLd2eViSjxUfI/QngZBSbAPGc9pjcTik5XniFtxUF?=
 =?us-ascii?Q?anYyBXb98teo+tHFOjtiWBwjP3Di4m5ESzcJz0DAj1O0iboz/kl5NHFroT8w?=
 =?us-ascii?Q?Nw1koubz66pBdge/qenMnkzTk7uWDOOfEMNgjxeNRvJ/j+jhQK3W/Pc5rX89?=
 =?us-ascii?Q?LPf3Fkc/orvRW6NTgwH3R11Kkv1TVXOtQ5cHQYXGAMS7bc/cX/ys29IQRpJS?=
 =?us-ascii?Q?YvIx+jPqMC4cBIjx11ET+yPfSxi7IbgDTeLGh2pTxQZpDrn5BJ67wCSIaTz1?=
 =?us-ascii?Q?5aj+r4PZhPDc+nPpkE7kdiV09/cVcI3OdLSIfLR9ybcPrfkYyvui?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cba785-0ef5-498e-d7bf-08df4953de15
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:06.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmMINYWKWB9c8B/o3GmNqO5V2wzSFVwtPh95qZvjyM1P+5muqSq56jYkYYRyPcdlgsjY03/NHF07IRoEJZxjJmwcoFUPQZ9TSBgArSY4dglWZfcyAa3y/kpjaIbZeEpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

jh7110_reset_controller_register() is only tied to the JH7110 system
clock driver by its location. Its logic is generic: hand the CRG
register base to the reset driver through an auxiliary device.

Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
so that the clock drivers of other StarFive SoCs can reuse it, and make
CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.

While at it, replace the open-coded auxiliary device allocation, init,
add and release handling with devm_auxiliary_device_create(), which
already implements all of it. The register base is now passed to the
reset driver as platform data of the auxiliary device, so the embedded
auxiliary device and to_jh71x0_reset_adev() go away. As the structure
no longer contains an auxiliary device, rename struct jh71x0_reset_adev
to struct jh71x0_reset_platform_data.

The auxiliary device ID is dropped: every CRG already uses a distinct
auxiliary device name, so the ID is not needed to keep the device names
unique, and it is always 0 now.

Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
device names are prefixed with "clk_starfive_jh71x0" instead of
"clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
JH7110 reset driver in the same patch to keep the tree bisectable.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
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
 include/soc/starfive/reset-starfive-jh71x0.h  | 12 ++--
 11 files changed, 46 insertions(+), 84 deletions(-)

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
index fc8a4e78d5d9..107a81f602a5 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-aon.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
@@ -119,7 +119,7 @@ static int jh7110_aoncrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-aon", 1);
+	return jh71x0_reset_controller_register(priv, "rst-aon");
 }
 
 static const struct of_device_id jh7110_aoncrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index d39ce4a2a8e9..ffc28c466d9b 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -178,7 +178,7 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_exit;
 
-	ret = jh7110_reset_controller_register(priv, "rst-isp", 3);
+	ret = jh71x0_reset_controller_register(priv, "rst-isp");
 	if (ret)
 		goto err_exit;
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
index 1c11966203ad..5c2638833242 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-stg.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -138,7 +138,7 @@ static int jh7110_stgcrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-stg", 2);
+	return jh71x0_reset_controller_register(priv, "rst-stg");
 }
 
 static const struct of_device_id jh7110_stgcrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index c938c62a863a..611d58cb6d88 100644
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
@@ -523,7 +466,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-sys", 0);
+	return jh71x0_reset_controller_register(priv, "rst-sys");
 }
 
 static const struct of_device_id jh7110_syscrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index d4181cce9c15..c3acf3f4cb46 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -187,7 +187,7 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
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
index 2d1713c1693b..db8c3571ea5e 100644
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
+	struct jh71x0_reset_platform_data *pdata;
+	struct auxiliary_device *adev;
+
+	pdata = devm_kzalloc_obj(priv->dev, *pdata);
+	if (!pdata)
+		return -ENOMEM;
+
+	pdata->base = priv->base;
+
+	adev = devm_auxiliary_device_create(priv->dev, adev_name, pdata);
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
index 29a43f0f2ad6..a4e733432766 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -53,15 +53,14 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
 	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
-	void __iomem *base = rdev->base;
+	struct jh71x0_reset_platform_data *pdata = dev_get_platdata(&adev->dev);
 
-	if (!info || !base)
+	if (!info || !pdata || !pdata->base)
 		return -ENODEV;
 
 	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
-					      base + info->assert_offset,
-					      base + info->status_offset,
+					      pdata->base + info->assert_offset,
+					      pdata->base + info->status_offset,
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
index 47b486ececc5..59ebe57eb5e8 100644
--- a/include/soc/starfive/reset-starfive-jh71x0.h
+++ b/include/soc/starfive/reset-starfive-jh71x0.h
@@ -2,16 +2,14 @@
 #ifndef __SOC_STARFIVE_RESET_JH71X0_H
 #define __SOC_STARFIVE_RESET_JH71X0_H
 
-#include <linux/auxiliary_bus.h>
 #include <linux/compiler_types.h>
-#include <linux/container_of.h>
 
-struct jh71x0_reset_adev {
+/*
+ * Platform data handed to the reset auxiliary device created by the
+ * StarFive JH71X0 clock drivers.
+ */
+struct jh71x0_reset_platform_data {
 	void __iomem *base;
-	struct auxiliary_device adev;
 };
 
-#define to_jh71x0_reset_adev(_adev) \
-	container_of((_adev), struct jh71x0_reset_adev, adev)
-
 #endif
-- 
2.25.1

