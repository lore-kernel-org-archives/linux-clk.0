Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17400439F95;
	Fri, 28 Aug 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916634; cv=fail; b=QVPIynmWOBtwMNddN3UfqpT6TgE2wi+KJoipDE39DJpXLuXOLaacfDUJTp71Nd0Q1EClQrQHprHhm/dWUECvkm5YN0lI7AOXDsolYWk2CdHi4CjDRJV8joWGGpwzbEolliSi7vsdmaBBpZNKRPlPnGfEcFGT3j/cTc7nvKNO3HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916634; c=relaxed/simple;
	bh=Fejndg3Z7pEpogs8AAE+KuZ6kQLd1QWm6a37CQKtXUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ej2EmXhw0NQmV1Lv0MS4zqw031K5HKawiwH4T9qTC5uRO338f89+ffa408K/ZVnBw73O83dpLkJm26hIOg7L+0cdwBpk3/bNUNsaByibdD424RcON+ownfJ2Bc62Fe6HR6huANgOktx8s2y/YehQGK1tS99Ih2h5DShdZnqpki0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HotYn20y3zicoNAlJbM41hrbOEP5CHnkSI+/cSePJTQ13ruqK2BLfSaP8LlB2aGi8jDtB5RGSHiG9hjMC1p2ZIDW7FoGjUeeVf1KXGlDHLVHyRM88ZwHvJurm9eD5tsMMCjkQ/UIEVMX3sJAOpTo2OZZtncLGbZb1FktugnWs0VMFgor8bTIj1i//xdi/yN5pod6/sO14F1ITriSCX+y/QdGjojafF1BOd7zw0Vk9yayJCcJs26m0zgSmyg9dJKYmp/tD7dAq+/ayJy1TW4iVQ/RoB+/gf7uVYdHJYUieMSnIHrWn6e0Cc40EZ44LdI7bRWb74VQpOdvmCx2CJPdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ZlzuX+psrUaO5DSvtncFnJbqXbgKjdrX8E6geZKEA=;
 b=P+e/rBl6M4Ul7vUChXey6npt4oGqaiO9a9fj3IMfaumvN/imFr1tWbDdnBQtaZa7f7UmhRjCL/tNkT25JoUcQ6KICPR5Z47R1P5s72s8wg4aJhr6Zu4AYiYN2AlFqvkWQZCYQwCJLHUjW4IhMilPT5goyqw9HXCxVpo+KAsmP8UuARmLng+AM8hZ/UwOjmPGht0vA/heIEnZyvSJAXjaUktZ0NhcEYWIX0kMnZA+KR1hNgYeLOzss/0WotQJMt7tPSMTd0oQeefi5lrPtqZCSEfXAXG/IzUXezPu9Y5hmIOdXiEiLsxJnJX4+fdVOsOLipE7/9Os8ytQFcP8xQ/oqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:29 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:29 +0000
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
Subject: [PATCH v5 6/8] reset: starfive: Add syscon reset driver support
Date: Fri, 28 Aug 2026 02:56:06 -0700
Message-Id: <20260828095608.19955-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: f72891d7-2b8b-4b19-64ad-08df04eaa1ce
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	7xI6rlNkR+LKDVqAzq7KFEWl5Mo3zyw/eSpYHAeeyH9HEQzX/fKH/MiYFwu+R/QRQbaYK3psICDUunaudNoAz4IVGSjghUaBxqi++BtUvLWuthL6gKiNtJN1THYM9q/8ImB+PBD9tHP1RU2i5WIsmYXceE+0+pjF24hxzb+N/Gn7K6qvPR5hSPHVkRCR9nNWI7WLZS6bXKHUzNDas82KpEGmG778HU8THQ9Xo9UqCUmPuobvZ8k1qccRbGrDzah1DVjaDnjHlex5GxlerajiPCHEQwbpvVVIglNedrdq9QxSbW9XyJNz85qsp/5OucqyPJZPu2hTohE36o4t2P6ZG+SPfpkN3FgsxZF3sNnt5VNN9Zh6ctupecsqAWwIaTd+YhTzamMZCJ2+4AjRUV0L9YdRSaaYDEH6tSsf+Ri5iJA2iNj3rEj3trdyPdEHuM6cbmGntcUZ2o4dIn1wb0dh/oDM9+9JrO+n9gMCymid8PtnrSuvtGFP3uExku7CBL1WzY5Ayi+lxtswO6/9SxeEL29vQN8P4E4z9STD1kQNXJQU1BJtOHJoSu0ImxVU/RG7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70eCZMQtGQ7OACQQgHDDn9+Zww3G7B77BT5D7OgmtSfMn1HvxnsdfIWuy6gJ?=
 =?us-ascii?Q?y9j5j2eQplJu7hNWuTTjWII+GEOa827EcBSx/LPXQCC8I3F5r9cUijHkKheU?=
 =?us-ascii?Q?ZfhtV2k1ztZvF4px7t8rIMws6fdNubJAbUAEwxA8DsAZN8ZcRr05Clm941Zh?=
 =?us-ascii?Q?BXD/t7iP9/lnkYz4cSPINktoB0dwzMJHq2soZwKmCfm3SxWxv4mEgdXopGD5?=
 =?us-ascii?Q?a1z0kL4o8qPvUiA5Z2eFsXEzIr/8IDhUZodXlNrXwrFbDT8bQNf16EwqigON?=
 =?us-ascii?Q?GjEAIKr+DaVXZJ4NPfOCFtCob5WmgL17nQmShKBMxgyubykgzjNaZsJVaukG?=
 =?us-ascii?Q?2sYbDGGdD1kU6nmIHS62cp2Syurp6EUDDQfAZBCz6w0tFndYm39V1hAroBMJ?=
 =?us-ascii?Q?8JX75rhEwle3h04bHPx3VmUiHIBXcZ8Jq/hnMYdrn7Rx4fqWR79cJSFhL97p?=
 =?us-ascii?Q?h63aJNY1Zht6IB3CE4aJrgnhu0++AKe0hsDbltZGCO0JU4RiIlJFUVN8H25u?=
 =?us-ascii?Q?RQL5neYrwk/jpZSveqi6UfsfWMDmqMS2kRd35BXqjWZfEeoVXWyE2UwfvWC7?=
 =?us-ascii?Q?xJX40OBSDyibr/e63yP8NtC0ABbYxhYpkR7NFwfCPjyPa5+8i8cNdUN2dGLO?=
 =?us-ascii?Q?o1FFU3dViG70oe7FhvYXlIueadZHjs6AIooGNZ91vUwxJ/o1aE/AN22fE5Uh?=
 =?us-ascii?Q?KzoulbZykVvzltHif3VXtbgeqZbdv62NuWTyQRblUbSoi08E7Bt8pfr43nO5?=
 =?us-ascii?Q?yYiGYw3s6afl+8vtnYAtEDXVS+VqtgaD5L+CKf1kC0yMMl5HS6bqH4XFVEA8?=
 =?us-ascii?Q?hpeV/Ys15Nvykwea/NM0kxlRUtG5fPhD5pSsLfTZsvS9wBXLMXS7WNDgfiJL?=
 =?us-ascii?Q?uts+r0D3Z/QRrG+6VCiUxlaYGtI0S68/cEFeRSQJwQKHQeB9e31UJpsyboyj?=
 =?us-ascii?Q?bE/HNCLR/s1Iyfl/+IUjvEJjJ2gtnK4oRxYQQZCt5/KwEqtkDRfqQDiDOaWZ?=
 =?us-ascii?Q?iO+jgHi4SOoiVjXoSMK6rUXAbIcF6cV20bzPoIbT+JQmPsY24lNQIxQgmct0?=
 =?us-ascii?Q?UxPyCDA+oZuDPCm2gBMEspg0uR9qGOdMxISaKYsOgp9vbePma2mViEPiJYIe?=
 =?us-ascii?Q?Cayq71TnVrV8sIxAl5UlR5gCREdArFZN9u5OekK0Jl/xCzg0KucyYTOuE8dj?=
 =?us-ascii?Q?hJPNXG0e3d4RADmwWuxROhK2z3EsPv7Jkv45F7FzqkI9K0P4+IqJE8YH15mx?=
 =?us-ascii?Q?i/zuRmKE0tt7WtrrOXcPVPXNpgJCjJ2qtvQV/XBMTzUxmGukR9YkUyLEFXCk?=
 =?us-ascii?Q?BqVzWeXRsb+N6Y4qAby+HBXBbT8dnQb73Zr5rEFDBMy1e2HHh03PXwDhibtJ?=
 =?us-ascii?Q?VzqUwfJiuy8+Cxnwtb67kSR0sSh6JTaqxbK77qsEGd9X4gsLNaUJ1CQeNDLE?=
 =?us-ascii?Q?uzVvWvk0SeKwJyl+fnB4KvQONPdHVcP0O/M/Nbcl1g4OHUsEegEajaxwsYxv?=
 =?us-ascii?Q?tGS5O+k5zI0i0hyGV5hpqKCe2AGYC1rUTfOQePwiSIG9pkvIxsn8dvg8vV9T?=
 =?us-ascii?Q?5LDcG1z9yxno0kHI77JGbzddtMYVWmvTMq7s9ENIFl5p7CkSbbISYvuO23yq?=
 =?us-ascii?Q?eKWaDfIT8ASfgph2satiQJVoyMIftBaVXEl97RXjY/sLSRoml+CtvgtiiNFC?=
 =?us-ascii?Q?S7q0xoF4ftcvel6zBz0MMRc84dwq1FZv87E1O+obnGb0TFgi191ZEjBFn+L5?=
 =?us-ascii?Q?IMBDoO81p+rGyndSFIfBE1wcuieqBWiU15P8ajdcr00NOal1CgIc?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72891d7-2b8b-4b19-64ad-08df04eaa1ce
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:29.4866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bZ0s10rC6hKJ6k21kjeJb7M9j1wbhbUnnIwqm2FrqKzf+1+9Amy8i3tlpbtzaAiED+Btj0GU2a742vU7eKUCsB7Cu6B7cxhPvuKqHftlkz7nKvUADuwrDT0PTfWWQLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add syscon reset driver for JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  9 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../starfive/reset-starfive-jhb100-syscon.c   | 62 +++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index ce00495be6ad..d96cfb59f51c 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -28,3 +28,12 @@ config RESET_STARFIVE_JHB100
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JHB100 SoC.
+
+config RESET_STARFIVE_JHB100_SYSCON
+	tristate "StarFive JHB100 SYSCON Reset Driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select RESET_STARFIVE_COMMON
+	default m if ARCH_STARFIVE
+	help
+	  This enables the SYSCON reset controller driver for the StarFive
+	  JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 217002302a9f..d5033d723167 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
 obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100_SYSCON)	+= reset-starfive-jhb100-syscon.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100-syscon.c b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
new file mode 100644
index 000000000000..55d84e6ad2a8
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SYSCON Reset driver for the StarFive JHB100 SoC
+ *
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <soc/starfive/reset-starfive-common.h>
+
+#include "reset-starfive-common.h"
+
+static const struct starfive_reset_info jhb100_pcierp_info = {
+	.nr_resets = (JHB100_PCIERP_SYSCONRST_PE2RST_OUT + 1),
+	.assert_offset = 0x14c,
+	.status_offset = 0x14c,
+	.discontiguous = false,
+	.active_low = true,
+};
+
+static int jhb100_syscon_reset_probe(struct platform_device *pdev)
+{
+	struct starfive_reset_info *info;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	info = (struct starfive_reset_info *)of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	return reset_starfive_register_with_info(&pdev->dev, pdev->dev.of_node,
+						 base + info->assert_offset,
+						 base + info->status_offset,
+						 NULL, info, THIS_MODULE);
+}
+
+static const struct of_device_id jhb100_syscon_reset_dt_ids[] = {
+	{
+		.compatible = "starfive,jhb100-pcierp-syscon",
+		.data = &jhb100_pcierp_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_syscon_reset_dt_ids);
+
+static struct platform_driver jhb100_syscon_reset_driver = {
+	.probe = jhb100_syscon_reset_probe,
+	.driver = {
+		.name = "jhb100-syscon-reset",
+		.of_match_table = jhb100_syscon_reset_dt_ids,
+	},
+};
+module_platform_driver(jhb100_syscon_reset_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 SYSCON reset driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

