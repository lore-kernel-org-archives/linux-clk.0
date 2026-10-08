Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9B49BD6F;
	Thu,  8 Oct 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462931; cv=fail; b=UvvIjm3BU/ZGEOTUjd3j/nADSdf11G34rOqCoagxyOu0KOJCRIMkioqV6+v2lxOP27XtNuV0qA3fJEmyQlSfKR2MDzdleGZT05FS2WKmXMY9M9MmweeAQ2XDMkVReOQB60z+VgTnuzqimucw2h2jJDHxFt/kl51/pt4vTgoPBJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462931; c=relaxed/simple;
	bh=MTgJo0OkpDbfoVluPbULCZ2l84mkFBXpwGw7chuCna4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJg4hV5cCu3un6jUoPdcJ4Qp3BrnX28t/jr4DPN7lhPOrmlc4wzw2jpIyNtYW2O0KaxpTP0z/8CMrSY5mS7TGIyy1dEKlxf8jKMlI3rXepIq4Ec2vmZhL4Q8ibv8iFhbf7Bwsgr4NSyGWoVhRu35wirQv3yqxXU7D/FYBw/cmC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJAevzi26YcisgLeXZZ7LbS7HqndLigLQrEdY42ezor6itiEXVLo/RmYoAaDJHmd384VmQmgYjCUwt/mw6aDvPuTTV6bxgYvORNsNn63G1NLlZXz5Gdn6Z8bG+x8VqPcGPiezbNhQxjG/am65mUuL8o5IYT9ObqWYsP6tGAd2GECmbjBZatsi08S8gy3e5193dFyD03NMO8PeS50XRZ7zq7RcItKLZ+vmCzRqt1t10Q+10mU3l+k521KeicyepIGGOGVt9PaykDNy9/GMj2FKTdyJ9fMM5Bi+IcyjnzF74ayaxun7M8VD39jUOV4CK9kzn3gJv9VlaLP7g3bPv/dZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHzHaOxXLb6E4+UxuLonPRgL1kjpE91XnRpc1acxX+Q=;
 b=fVC7PyFlnASfrotSaTNfzVWLNcYzvG2ISi9WZMunaXAEgNMhZza6LxlEjtnzkMKd+UGArx8HbT5vkWmPTay1vdDShNt2C6PpD4Bntd2zoWhPAHjq3q08ohqaBTD6DkQtcgcQSqoLf5TAwwL4PYidM1lmmJQy8DbK2aTdLk66Jry0icSR4g9AQA6qbD98q+iQEHvTeoUkni572b+BaD8IR8ckpuBp3OAFzdtFnyqnE93BRhNtBpG2GIEvSvDPmzpGwWhE07Vj6tQfxgwvtmlXwbJrM1RSS1oAdNJju4XP/N1edZEPIZzA1IrnCp/F6fjsflOCR77bkyFKyTO5BVAbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:34:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:34:06 +0000
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
Subject: [PATCH v6 15/15] reset: starfive: Add StarFive JHB100 reset driver
Date: Thu,  8 Oct 2026 05:33:38 -0700
Message-Id: <20261008123338.11081-16-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 527ab74f-5609-4a3d-d9fe-08df2538713b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	vR72+TSig+Q88L2IM0I6nzhNToFAI6trc/+Cvo9nTvQ4SGGuKXhlOAsxM5+IRvRYnkLViJ1LHj3HCOIOwAp6zB6m+bgIFg5B0a0mJXZ/vHvC48QRZKNjNeNqZwYLndash8xCKIAvMjCwTYymNq9Y9ZyEt7O9kXqnzgVPZG/F8qJ62DtiCJN6I5CVDGKKBBoLJHwQBZpNrRzbj4ZXf+6CzUtkaFqKfOPzFPeXOpK2TC4TiGGhioSF2/v9z68Z7BY2MduVX6dr91hWthxjE5aFteFcj/jKSv9RBQ9ZjVGKC3jFFkRamJSjm0TfboXW1zzTngHu+svonbPDSMysgRqiWXCYg+2ck8w/IGsfQOGGN1V9fMJpsFVmO2uF2P/v4Jw6RMnIeHn9fEi1Mxb3HU91OMbcd/3YFYzFtaUjYGDEPaaLrSwVs/qkMZzmdufbDKZ+l4CILJv0QkSvBRMS3ouDHrcDauQdVUE1yxa4gAWaWREzjjlBEMCX7MXGZ7w4Px0JPDa9FyACeoODkhtahwsoeWDT1MyuT0wXL4tM5LBjAibXqoN2ry5Xch2/5R+IBClv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UyqoPueumvjVh7JdImpmpC0qn363nq0W84yKVQdZueVViP1sG14OH02IEvFm?=
 =?us-ascii?Q?xrDOM1mexBUzPjTuBYEacygwUWcfAxE4m3CC5AU18iN/CyG6DpbmkBvmqSGn?=
 =?us-ascii?Q?yJT641aLOGm2AMNvhAsnFYJKAOwTkmkAhz7AcQvUvJN6T+X4yBFFd0bnpy/p?=
 =?us-ascii?Q?HikmE1mzx6e7YNzd3Cc/Ei73pjzI058HDvuzdr0eBfWy68HdCa757EhvuprS?=
 =?us-ascii?Q?43+0M1EpLZpCAgQxu8Lb2yfYZvCjj4Uum4tuBfa/ak6J3Ym7VBKs9dD2wFTx?=
 =?us-ascii?Q?OMPjjC3m8IW/VS2M9MVMssUSK0C+EntIWgWlPfybBs+Sv8u313xZ9sfN2glM?=
 =?us-ascii?Q?LQk2FcvFli5/nnqE7KrdTMHSumQ7WyyGCXUXoojTK63Q9fvSKrTcIPSIenKf?=
 =?us-ascii?Q?PLvQjQ7NptyrIApi0DXqUscEPg6Zh5tJFJw/D33s2mr2xaJE09RbP9YKZWdL?=
 =?us-ascii?Q?glC6nT+JsZ4+1UEQ0ldjul1BOtX/++CA0PabPBid2LFJvObCpht4gc1Gz8I5?=
 =?us-ascii?Q?eW42WdDxFUA0YZuXTkv+CuUem6AkPEaAL2soBKmTzVKm5QPEgxgSi+5xN3sr?=
 =?us-ascii?Q?I8sE8pIKcLNt5jN8UAtTdFwsZWzjUeDsr7Ir+JRdHddOVcgEXWsSBo2IZoHd?=
 =?us-ascii?Q?Txj2RfOYpqA3MDXVGGvTw+zYjc0Qvw/56Yf4Hi7Pgb2u3+sEreCNUHGnTkfZ?=
 =?us-ascii?Q?f0jM+Cxmnrrve/IMFktwqeSd9jLwJKYr6J04uOziIFF9WDRS668giCYIzQxc?=
 =?us-ascii?Q?ROXR8INkm2/+Av8TuQ9KVoQEqhmLudETDi2ZLoil3HpPyvXJXdvty7LGgLGF?=
 =?us-ascii?Q?OjoNFClcMcM7OqTgxbirZBzpcgyVkhmJ9Q6ghDOqtEpT9ft9nyo2EwHbjxKF?=
 =?us-ascii?Q?IV+8E1N9f5EmhseS+uKs8TcVD/fXEkWGxR81lFBHV6CZEbgWR8wzPhe2/JAH?=
 =?us-ascii?Q?Z9CgNzjze5+8tZdpJOyWf3hYcfn0v765f97MUNwwxoTXMF/fdI1Msr7qBpPs?=
 =?us-ascii?Q?m0+uuqxs3V/TmT3pn9aIybwxEkua8+ynMUuamlmGOt+0cd5QTEP4Xdix7mRN?=
 =?us-ascii?Q?4fxHilGC8VluJIi0KaYirvNtQ9CDgkJc7t2EX439knPCWVyAcZNP8Bnyh4IZ?=
 =?us-ascii?Q?mHUhTUWQ6OVpW243wc+kZz0bZxpIwCXODzCTCo/1HQST9utTfi0TXPQczK+w?=
 =?us-ascii?Q?+P54fDkFbGkQaVADAvvvyf8l3R9fsrPZx3ZYoHIO21IqoSWi0QseTpLKoc46?=
 =?us-ascii?Q?9zh99xADjsuikyOew8Emw9gjwKWGFSWbIpMrEMFFdwc37hk7NhvK4ryV4i4Y?=
 =?us-ascii?Q?Rq3vyPQQD5rRbxZ64yO8tWL1ttLFhbBIlRxD+92IbX9+Z7eBxlcp9ucrN/aI?=
 =?us-ascii?Q?ultA5aziByf2V7+iUvTglz4SPr95AWqTIrjvl0P638ZbDPDsu+/97bQJziw7?=
 =?us-ascii?Q?Xjse87AXjY3FIG8tfu0n1vlCgI30TrHi8A/B99xvvWbMEnxN3Roez/p/4Hj+?=
 =?us-ascii?Q?gDfFBRDzZrxZC3XdnlVNtXuPiK1VMCUXwmbD8DhDwUNQE+jHtf0xsN0zEAjv?=
 =?us-ascii?Q?VH4YG/lNZjVHUJnsjNVUiigueSQhACGrYJJTnuefUS+lB9VrUIDYiHZ6+Hm+?=
 =?us-ascii?Q?LcwTHdbmad84/1zqbICycszyiqUFZ/QrxBZZt4pHcMOCpnKaR9p7Bi8hGPtp?=
 =?us-ascii?Q?OrwOuXzGa73oVM05y948jcy8vdLhdbJmsRhfMAgnIYG7c3D2zdhoBHlDNKSM?=
 =?us-ascii?Q?7SSwhm6LFeXWjwgUSOURkv2VNw18OFz2b2TKLymSgityZhVm4ZWv?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527ab74f-5609-4a3d-d9fe-08df2538713b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:34:05.9305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HyVXk4iyN8JvWqLZINmxTxEIv8n/dwd0G+LCeJrrW0PZcnQUf3FRsaAl+Nm5rhmHlS5l1CN6qlUg3PLw4rHX6kuogtZDhIwk4Xkrw7o7GwaNS+LbxJokMRFWJF8rgWp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add auxiliary reset driver to support StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   6 +
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jhb100.c    | 303 ++++++++++++++++++
 4 files changed, 319 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fcba280781b4..d6039e440efb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26660,6 +26660,12 @@ S:	Maintained
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
index d832339f61bc..84baefbaee14 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
+
+config RESET_STARFIVE_JHB100
+	bool "StarFive JHB100 Reset Driver"
+	depends on CLK_STARFIVE_JH71X0 || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_STARFIVE_JH71X0
+	default ARCH_STARFIVE
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
index 000000000000..f1fd22179a88
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -0,0 +1,303 @@
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
+#define NUM_RESETS(x)		((x) + 1)
+
+static const struct jh71x0_reset_map jhb100_sys0_map[] = {
+	{ JHB100_SYS0RST_RESOURCE_ARB,					0 },
+	{ JHB100_SYS0RST_SYS0_IOMUX_PRESETN,				3 },
+	{ JHB100_SYS0RST_SYS0H_IOMUX_PRESETN,				4 },
+	{ JHB100_SYS0RST_RST_ADAPTOR_TIMEOUT_RSTN,			5 },
+	{ JHB100_SYS0RST_BMCPCIERP_RSTN_BUS,				14 },
+	{ JHB100_SYS0RST_BMCPCIERP_RSTN_CRG,				15 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_BUS_ESPI,				16 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_BUS_PCIE,				17 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_CRG,				18 },
+	{ JHB100_SYS0RST_BMCPERIPH2_RSTN_CRG,				19 },
+	{ JHB100_SYS0RST_BMCPERIPH2_RSTN_BUS,				20 },
+	{ JHB100_SYS0RST_VCE_RSTN_CRG,					21 },
+	{ JHB100_SYS0RST_VCE_RSTN_BUS,					22 },
+	{ JHB100_SYS0RST_BMCUSB_RSTN_BUS,				23 },
+	{ JHB100_SYS0RST_BMCUSB_RSTN_CRG,				24 },
+};
+
+static const struct jh71x0_reset_info jhb100_sys0_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys0_map),
+	.assert_offset = 0x12c,
+	.status_offset = 0x130,
+	.discontiguous = true,
+	.map = jhb100_sys0_map,
+};
+
+static const struct jh71x0_reset_map jhb100_sys1_map[] = {
+	{ JHB100_SYS1RST_SYS1_IOMUX_PRESETN,				1 },
+	{ JHB100_SYS1RST_MAIN_RSTN_CHIPTOP_SENSOR,			5 },
+	{ JHB100_SYS1RST_VOUT_RSTN_HOST0,				8 },
+	{ JHB100_SYS1RST_VOUT_RSTN_HOST1,				9 },
+	{ JHB100_SYS1RST_HOSTSS1_RSTN_BUS_ESPI,				10 },
+	{ JHB100_SYS1RST_HOSTSS1_RSTN_BUS_PCIE,				11 },
+	{ JHB100_SYS1RST_HOSTSS1_RSTN_CRG,				12 },
+	{ JHB100_SYS1RST_BMCPERIPH3_RSTN_CRG,				13 },
+	{ JHB100_SYS1RST_BMCPERIPH3_RSTN_BUS,				14 },
+};
+
+static const struct jh71x0_reset_info jhb100_sys1_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys1_map),
+	.assert_offset = 0x54,
+	.status_offset = 0x58,
+	.discontiguous = true,
+	.map = jhb100_sys1_map,
+};
+
+static const struct jh71x0_reset_map jhb100_sys2_map[] = {
+	{ JHB100_SYS2RST_JTAG0_MST_WRAP_HRESETN,			2 },
+	{ JHB100_SYS2RST_JTAG0_MST_WRAP_APB_PRESETN,			3 },
+	{ JHB100_SYS2RST_JTAG1_MST_WRAP_HRESETN,			4 },
+	{ JHB100_SYS2RST_JTAG1_MST_WRAP_APB_PRESETN,			5 },
+	{ JHB100_SYS2RST_HUSBCMN_HOSTCMN_RSTN_BUS_NCNOC_INIT,		8 },
+	{ JHB100_SYS2RST_HUSBCMN_RSTN_HOSTCMN_CRG,			9 },
+	{ JHB100_SYS2RST_HUSBCMN_HOSTUSB0_RSTN_BUS_NCNOC_BMC_TARG,	10 },
+	{ JHB100_SYS2RST_HUSBCMN_HOSTUSB0_RSTN_BUS_NCNOC_HOST_TARG,	11 },
+	{ JHB100_SYS2RST_HUSBCMN_RSTN_BMC_CRG,				12 },
+	{ JHB100_SYS2RST_HUSBCMN_RSTN_HOSTUSB0_CRG,			13 },
+	{ JHB100_SYS2RST_HUSBCMN_HOSTUSB1_RSTN_BUS_NCNOC_BMC_TARG,	14 },
+	{ JHB100_SYS2RST_HUSBCMN_HOSTUSB1_RSTN_BUS_NCNOC_HOST_TARG,	15 },
+	{ JHB100_SYS2RST_HUSBCMN_RSTN_HOSTUSB1_CRG,			16 },
+	{ JHB100_SYS2RST_BMCPERIPH1_RSTN_CRG,				17 },
+	{ JHB100_SYS2RST_BMCPERIPH1_RSTN_BUS,				18 },
+	{ JHB100_SYS2RST_BMCPERIPH0_RSTN_CRG,				19 },
+	{ JHB100_SYS2RST_BMCPERIPH0_RSTN_BUS,				20 },
+	{ JHB100_SYS2RST_GPU0_RSTN_CRG,					21 },
+	{ JHB100_SYS2RST_GPU0_RSTN_BUS,					22 },
+	{ JHB100_SYS2RST_GPU0_HOST_PCIE_RST_N,				23 },
+	{ JHB100_SYS2RST_GPU1_RSTN_CRG,					24 },
+	{ JHB100_SYS2RST_GPU1_RSTN_BUS,					25 },
+	{ JHB100_SYS2RST_GPU1_HOST_PCIE_RST_N,				26 },
+};
+
+static const struct jh71x0_reset_info jhb100_sys2_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys2_map),
+	.assert_offset = 0x88,
+	.status_offset = 0x8c,
+	.discontiguous = true,
+	.map = jhb100_sys2_map,
+};
+
+static const struct jh71x0_reset_map jhb100_per0_map[] = {
+	{ JHB100_PER0RST_MAIN_RSTN_UART4,				1 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART5,				2 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART6,				3 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART7,				4 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART8,				5 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART9,				6 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART10,				7 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART11,				8 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART12,				9 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART13,				10 },
+	{ JHB100_PER0RST_MAIN_RSTN_UART14,				11 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C0,				12 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C1,				13 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C2,				14 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C3,				15 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C4,				16 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C5,				17 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C6,				18 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C7,				19 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C8,				20 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C9,				21 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C10,				22 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C11,				23 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C12,				24 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C13,				25 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C14,				26 },
+	{ JHB100_PER0RST_MAIN_RSTN_I2C15,				27 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C0,				28 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C1,				29 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C2,				30 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C3,				31 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C4,				32 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C5,				33 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C6,				34 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C7,				35 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C8,				36 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C9,				37 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C10,				38 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C11,				39 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C12,				40 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C13,				41 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C14,				42 },
+	{ JHB100_PER0RST_MAIN_RSTN_I3C15,				43 },
+	{ JHB100_PER0RST_MAIN_RSTN_WDT0,				44 },
+	{ JHB100_PER0RST_MAIN_RSTN_WDT1,				45 },
+	{ JHB100_PER0RST_MAIN_RSTN_WDT2,				46 },
+	{ JHB100_PER0RST_MAIN_RSTN_WDT3,				47 },
+	{ JHB100_PER0RST_MAIN_RSTN_WDT4,				48 },
+	{ JHB100_PER0RST_MAIN_RSTN_DUALTIMER0,				49 },
+	{ JHB100_PER0RST_MAIN_RSTN_DUALTIMER1,				50 },
+	{ JHB100_PER0RST_MAIN_RSTN_DUALTIMER2,				51 },
+	{ JHB100_PER0RST_MAIN_RSTN_TRNG,				52 },
+	{ JHB100_PER0RST_MAIN_RSTN_DMAC0,				53 },
+	{ JHB100_PER0RST_MAIN_RSTN_DMAC1,				54 },
+	{ JHB100_PER0RST_MAIN_RSTN_DMAC2,				55 },
+	{ JHB100_PER0RST_MAIN_RSTN_LTPI0,				56 },
+	{ JHB100_PER0RST_MAIN_RSTN_LTPI1,				57 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL4,				58 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL5,				59 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL6,				60 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL7,				61 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL8,				62 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL9,				63 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL10,				64 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL11,				65 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL12,				66 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL13,				67 },
+	{ JHB100_PER0RST_MAIN_RSTN_SOL14,				68 },
+	{ JHB100_PER0RST_MAIN_RSTN_LDO0,				69 },
+	{ JHB100_PER0RST_MAIN_RSTN_LDO1,				70 },
+	{ JHB100_PER0RST_MAIN_RSTN_PERIPH0_SENSORS,			71 },
+	{ JHB100_PER0RST_MAIN_RSTN_DMAC0_SENSORS,			72 },
+	{ JHB100_PER0RST_SYSCON_PRESETN,				73 },
+	{ JHB100_PER0RST_GPIO_IOMUX_PRESETN,				74 },
+	{ JHB100_PER0RST_UART_MUX_REG_WRAP,				75 },
+};
+
+static const struct jh71x0_reset_info jhb100_per0_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_per0_map),
+	.assert_offset = 0x554,
+	.status_offset = 0x560,
+	.discontiguous = true,
+	.map = jhb100_per0_map,
+};
+
+static const struct jh71x0_reset_map jhb100_per1_map[] = {
+	{ JHB100_PER1RST_IOMUX_PRESETN,					0 },
+	{ JHB100_PER1RST_SYSCON_PRESETN,				1 },
+	{ JHB100_PER1RST_MAIN_RSTN_SFC0,				2 },
+	{ JHB100_PER1RST_MAIN_RSTN_SFC1,				3 },
+	{ JHB100_PER1RST_MAIN_RSTN_SFC2,				4 },
+	{ JHB100_PER1RST_MAIN_RSTN_SPI0,				5 },
+	{ JHB100_PER1RST_MAIN_RSTN_PERIPH1_SENSORS,			6 },
+	{ JHB100_PER1RST_MAIN_RSTN_SGPIO0,				7 },
+	{ JHB100_PER1RST_MAIN_RSTN_SGPIO1,				8 },
+	{ JHB100_PER1RST_MAIN_RSTN_EMMC0,				9 },
+	{ JHB100_PER1RST_MAIN_RSTN_UFS,					11 },
+	{ JHB100_PER1RST_MAIN_RSTN_UFS_PHY,				12 },
+	{ JHB100_PER1RST_MAIN_RSTN_DMAC_SFC0,				13 },
+	{ JHB100_PER1RST_MAIN_RSTN_DMAC_SFC1,				14 },
+	{ JHB100_PER1RST_MAIN_RSTN_DMAC_SFC2,				15 },
+	{ JHB100_PER1RST_MAIN_RSTN_DMAC_SPI0,				16 },
+	{ JHB100_PER1RST_MAIN_RSTN_PERIPH1_RAS,				17 },
+};
+
+static const struct jh71x0_reset_info jhb100_per1_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_per1_map),
+	.assert_offset = 0x134,
+	.status_offset = 0x138,
+	.discontiguous = true,
+	.map = jhb100_per1_map,
+};
+
+static const struct jh71x0_reset_map jhb100_per2_map[] = {
+	{ JHB100_PER2RST_IOMUX_PRESETN,					0 },
+	{ JHB100_PER2RST_POK_IOMUX_PRESETN,				1 },
+	{ JHB100_PER2RST_SYSREG_RSTN,					2 },
+	{ JHB100_PER2RST_MAIN_RSTN_CAN0,				3 },
+	{ JHB100_PER2RST_MAIN_RSTN_CAN1,				4 },
+	{ JHB100_PER2RST_FAN_TACH_PRESETN,				5 },
+	{ JHB100_PER2RST_MAIN_RSTN_GMAC2,				7 },
+	{ JHB100_PER2RST_MAIN_RSTN_GMAC3,				8 },
+	{ JHB100_PER2RST_MAIN_RSTN_DMAC_8CH,				9 },
+	{ JHB100_PER2RST_MAIN_RSTN_RTC,					10 },
+	{ JHB100_PER2RST_ADC0_PRESETN,					11 },
+	{ JHB100_PER2RST_ADC0_IOMUX_PRESETN,				12 },
+	{ JHB100_PER2RST_ADC1_PRESETN,					13 },
+	{ JHB100_PER2RST_ADC1_IOMUX_PRESETN,				14 },
+	{ JHB100_PER2RST_MAIN_RSTN_PERIPH2_SENSORS,			15 },
+};
+
+static const struct jh71x0_reset_info jhb100_per2_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_per2_map),
+	.assert_offset = 0x11c,
+	.status_offset = 0x120,
+	.discontiguous = true,
+	.map = jhb100_per2_map,
+};
+
+static const struct jh71x0_reset_info jhb100_per3_info = {
+	.nr_resets = NUM_RESETS(JHB100_PER3RST_IOMUX_PRESETN),
+	.assert_offset = 0x98,
+	.status_offset = 0x9c,
+	.discontiguous = false,
+};
+
+static int jhb100_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	const struct jh71x0_reset_info *info =
+		(const struct jh71x0_reset_info *)(id->driver_data);
+	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
+	void __iomem *base = rdev->base;
+
+	if (!info || !base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register_with_info(&adev->dev, adev->dev.parent->of_node,
+							base + info->assert_offset,
+							base + info->status_offset,
+							NULL, info, NULL);
+}
+
+static const struct auxiliary_device_id jhb100_reset_ids[] = {
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys0",
+		.driver_data = (kernel_ulong_t)&jhb100_sys0_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys1",
+		.driver_data = (kernel_ulong_t)&jhb100_sys1_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys2",
+		.driver_data = (kernel_ulong_t)&jhb100_sys2_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-per0",
+		.driver_data = (kernel_ulong_t)&jhb100_per0_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-per1",
+		.driver_data = (kernel_ulong_t)&jhb100_per1_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-per2",
+		.driver_data = (kernel_ulong_t)&jhb100_per2_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-per3",
+		.driver_data = (kernel_ulong_t)&jhb100_per3_info,
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

