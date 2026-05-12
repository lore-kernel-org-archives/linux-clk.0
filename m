Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2134.outbound.protection.partner.outlook.cn [139.219.17.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB3137DE97;
	Tue, 12 May 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576966; cv=fail; b=nud5tCBEVEOwLRMM8rb0J+m7Ldx88IzIVIWG8UrhitYgPDQDHYk21zD4+z4I5fle2f/pggTRKeVcFg9AtHhT12W2yLzbQ+f55Hy+juFJF45JIxrUMaPbxMA3SLrtlDYNiUSFROJVdLjfcR88QkER1g8nvs/raMW/8AzKVyaH8hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576966; c=relaxed/simple;
	bh=r/tCbZPAUX8w/gdY5yXcu8Qtk7uTC7P/YDriCqBUtvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DX6bEjViADKNU03BThxiVwp23QNNeIaWwVyy45ogXG2Fbqw1etOh4JAYeUM3juK/kacoozw6SbpjbztY6U3dfk+1ExdcGqELvJJPpPm0PxBtjzqHKLJRPQY5JZqtm4D8phr5yxz/ipw7xYYeMOcJfGKPB0kgv5oRl9fZZ52C610=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeKbk1UTzmQV8t86AohCjMx0QgAguBsqCws7JwYAHjIgjcAKYj8Oj00AcxMsM27XQtGY9qEdpyD/IEheGVUVu6PXbqI+1G5h16QwQTVT++/eeZ9IZU1mrPqG/EqQlYiqMXfYMh3Z5uUsT/jDhshrUaGiJ5I9Ukey5DeEGR1SB1l5V2shY8d75dhhIuzLvA02cQOj8UxaGYW8PsIeCnEB9006X9Er9imVkFur5rIYIHr0O88jcyhtMLbbMjZyn6kkTgyHgEtCazWeIZ4L3zUFD5hMO51KwpT1cZ7YMEOrDtZvQjmf7EGuE69aQ/qm4Fw5L9OUnw51l33EcCagCmpkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXgR+ROj6esv0ZUrqOh2ygbi9yBhpLyISbARGjBq0ig=;
 b=F+ryNnT5DZg1EMG+FZ6w4n67sYxz8ktilw/aSX0P3X7P2Wc6GPzzv77iIs5PTCjdOq3hV967tyB/pZP8p9YB77NRi1v6m0HSVMb27wWYXlBOsJFJa/83B7yXtJlZtmO+D4J7MgNtmgo64UA3eE6NIVngJTqVLAwavLXaoiQ19KvuXqScfNlfUh0bo8Zb6UT1d5PAyFUxyUI5DRt4xqcPNlqCos/703Fmwiai+dgkRDaMIAnfiqMDb3d0Z2ULjZX56RIwqeye6nSG5GC1KE0fUZCspoxLMDcWn01AH+eaegfvVvMSlykhWa63Xle7s3wXrvJBRXUZuBxskjAmYzJxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:49 +0000
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
Subject: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100 SoC
Date: Tue, 12 May 2026 01:35:20 -0700
Message-Id: <20260512083521.3448-12-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd2b04c-f9b1-41ba-5f06-08deb0017884
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|22082099003|18002099003|38350700014|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	OVd7jrgDXsBfBwIEAjCmRWadR0Arxw14OUBZwd6BRJ41YgdLOwFUMBl7jQsIDGT+6dCzsmRW9LHFT/N9+peOOR6xG+IAprI0SR1q9b3iwCPo82XUs9aKGN6asv0Murmz2pfqJauM1ZF61ehgubaSVUsb82VveBJYscCwquNuVCsXf84a4OWWDIhO4QvD8xUxtDx8AxePHs8GWHQu6Y5XtsiBCYc8ALutHdumG1/HWCPQwG5432ZQr7y7kV8y5wnE3SX9s0V4mk981Ktw4u1E70cIBVXyC8buvl3xhMIrv7fjTZ/wPy/irCCOelrz9Ao2mpSfitl9GkCAjEdrn56mi34EZXwxMPz4LIDo0zZcfFjVYHFLgMq4nurdEUxPz6m/DVEspkMqi2LwqO19vKDsPj+ZjgDOiKRWWain9Fv/MaqRrR54tyqBUudTpR16THOhejgMiunSn+p9svx2kNtu/BO4lMwyyn7RfvNqagwAiCJiJejWwCVbVj7QHHOafvk9qb93KSSsRO00W9SieWAlUOAtGOuNJLibfqdjKTlrGUhwjP8i41cv+Nq4czzMAOIyy/WzC1LDSnrD0NLYi7/SXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/9nLcqOk2koliM2k4IzfRfPKIgmmLzUvKngmNDGs2lQvIi1LWgFrvx/CY4O?=
 =?us-ascii?Q?IOVnHRVsdFBrkSiudEJ6ngpU5yGQcZeVsZyPS6Lz6aKiPVak8TL+ZCh/57I7?=
 =?us-ascii?Q?TVw5iLErvXV2XvMTUvsJN6k4BEajfy9kRZjRx3uPC+uEMpBIpAC8zUyFHk3B?=
 =?us-ascii?Q?RcbTy/gUj7ELH1VZV3WXY5QntdfuEmQAjH6zy2OwX5qSqDYaL9ua0WoTOWs9?=
 =?us-ascii?Q?4LpZeniFwHDv5n41GSFvMGDA8K1C6eGNivfj+3TugZ6v9zEfwUE7dHuF2yLH?=
 =?us-ascii?Q?Jg4hUEbcFPRzCJ/mATPiFuIYVdx9z1BOtusmNcCRqhZb9GMAMJ0XzBnq+nJn?=
 =?us-ascii?Q?f9M4WXGlypZ03TIQ97k/oSrh6B586FYfGFrDWPqAb4LXa/hnrTX0RdrUiB92?=
 =?us-ascii?Q?hDUNPqSuu4eY59MybG8NzSvan99nfsuR3sdN+TKLncZzSXa9fx5yZ/0mXI9t?=
 =?us-ascii?Q?64a1DMaWdelAW1efYHAw+cNNlyobNFl9IgyN1fp92aB+zaCTWqJmpS8JflJT?=
 =?us-ascii?Q?4UCISfp55fvdGIChJB6SXmRhMXwOH6DbClLRyjOchZawZTFXKxGIE7pQATkw?=
 =?us-ascii?Q?d5MbZji/hU2lMfcWumtHs5eJc99tR1QZTxfs3oNZ792MIRErZy3JFF3otafp?=
 =?us-ascii?Q?N1Z3WnRfrSNDNQTDkZi+DGDKBGCNIVR2Zn3D0HZzHW7qUsewjvf8rba6RyjM?=
 =?us-ascii?Q?xnD2gJSBEXeojqOAgDtSDnyHq20YEQL+W1UyOKz9LfIWW1WJH1+P8jnsmFFO?=
 =?us-ascii?Q?afliA05WkQ6kDGSgQCkE2CMfzUr+nKCT5qAGKxgKAqS28QPp+DI5e2FCKo/G?=
 =?us-ascii?Q?wZtdfIwMGGwZH/1AGIYILjTuUukALjHvm4Tv4qSrhNn/8GRM2w29lgGMusQ1?=
 =?us-ascii?Q?LNua4hUm/PRlcVrz1xkyfSaQMA7Ah9MY3btXcKS37oE9PpVKdO7OMgi9lGrU?=
 =?us-ascii?Q?xK6uvv6QKZFF5rGuaaGzfBetscN0XfkPFmog7swmfUQnyNfec0Dxh2FA92Gj?=
 =?us-ascii?Q?KsXt2o/7NfThPwyNPbIWHGDOASiCGiuF3LVGe64WKgBQZbjpV0GqIh5GpFvy?=
 =?us-ascii?Q?PVyqO8hinWu+woC3VT05ke4GjihserSW9SYnoLxp+rzauXUt7Fbdm9jnsqyi?=
 =?us-ascii?Q?mnrpzXkW3gR7eDUxgIBw3AUhV1WLa1mQkfledWAXlJtwZAEC+NKI9D545LMp?=
 =?us-ascii?Q?kzB+6MpXBMpD2i5+krmoYFezaTY8+QcFUTwIzFs8zP/QwhKSAKRMInkA6/k0?=
 =?us-ascii?Q?0zVl8+W+hAygy81/zurzd010zCA6dhSnbV4eoOJwknJsVDTagR6XNd7jpnM/?=
 =?us-ascii?Q?3ZLJ0q5qNbWRwzfEfjKcYCOYuxIBHNmXrcLun8NnhM2lqWXshPq75d+xgyX7?=
 =?us-ascii?Q?0mbBs/cjZL+efyqLByiHF05YC6S+I5Dr0Iz6ftuHp/OkAZR7FuGbH/DwGvUA?=
 =?us-ascii?Q?GGd+VdGr3ft0u39qAdqtk/Bqz33p1EpB2k72IkMpwkyI5u/EioTExzoV+B2G?=
 =?us-ascii?Q?JaXdSjWinkEOUaB3t/cfxM70w12SJtr0A3xeLkTom6vDz9wByI+SalWUD6MO?=
 =?us-ascii?Q?y8BfzIDw5NyKLSiK2xYY+Gwni3QsCGjYjMOiDF7JzI5Chl+hE8JZoUNt29xZ?=
 =?us-ascii?Q?KJwo2MEs4dwPFMpTjLsXfQiu4Vx0/dew9erb3BrPKdF3S+RaUvna46ok4Ka5?=
 =?us-ascii?Q?fCehfPVjGpu5EmbDo6ic8MC4k8zq3aadjXXywrLan5nKCCzDCbZ4pLve4Ulk?=
 =?us-ascii?Q?Uc0SABUD375kyOtWP/mVoELDRoJ86UdCcjSQdSxfzfmZf4F71Rph?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd2b04c-f9b1-41ba-5f06-08deb0017884
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:49.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yn6gBwJOwsAcefg4JHp6yXQQS1N4rUuZjq1uFdF6k3jOysfMNqKfkeJ63bnXtH2KPnEMV7H4ulenmeqWwlb/MRBm99sWhnXqwYluvg7yPgNYNeEc1Q+0FrDhFDgioNSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add socinfo driver for JHB100 SoC. Currently available for distinguishing
between the two reversions, A0 and A1.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |  5 ++
 drivers/soc/Kconfig                           |  1 +
 drivers/soc/Makefile                          |  1 +
 drivers/soc/starfive/Kconfig                  |  6 ++
 drivers/soc/starfive/Makefile                 |  2 +
 drivers/soc/starfive/socinfo/Kconfig          | 11 +++
 drivers/soc/starfive/socinfo/Makefile         |  2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c | 80 +++++++++++++++++++
 8 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f6aac7cea95..66175f453d20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25613,6 +25613,11 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SOCINFO DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	drivers/soc/starfive/
+
 STARFIVE JHB100 SYSCON
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..b3b01fc38139 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..009f85ff891a 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
new file mode 100644
index 000000000000..04b020083d3e
--- /dev/null
+++ b/drivers/soc/starfive/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "StarFive SoC (System On Chip) specific Drivers"
+
+source "drivers/soc/starfive/socinfo/Kconfig"
+
+endmenu
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
new file mode 100644
index 000000000000..ca1e609b8104
--- /dev/null
+++ b/drivers/soc/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += socinfo/
diff --git a/drivers/soc/starfive/socinfo/Kconfig b/drivers/soc/starfive/socinfo/Kconfig
new file mode 100644
index 000000000000..92bbab62895b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_SOCINFO
+	bool "StarFive JHB100 SoC Information"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select SOC_BUS
+	default y
+	help
+	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
+	  platforms to provide information about the SoC family and variant
+	  to user space.
diff --git a/drivers/soc/starfive/socinfo/Makefile b/drivers/soc/starfive/socinfo/Makefile
new file mode 100644
index 000000000000..26c2bdf1de3b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_STARFIVE_JHB100_SOCINFO)	+= jhb100-socinfo.o
diff --git a/drivers/soc/starfive/socinfo/jhb100-socinfo.c b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
new file mode 100644
index 000000000000..9c5826d7c253
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+
+#define JHB100_REV_ID			0x38
+#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
+#define JHB100_REV_ID_NUM		GENMASK(1, 0)
+
+static int __init starfive_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	const char *machine = NULL;
+	struct device_node *np;
+	struct regmap *regmap;
+	char rev_char;
+	u32 rev_id;
+	int ret;
+
+	np = of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(regmap)) {
+		of_node_put(np);
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, JHB100_REV_ID, &rev_id);
+	if (ret) {
+		of_node_put(np);
+		return ret;
+	}
+
+	of_node_put(np);
+
+	rev_char = (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
+	rev_id = (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
+
+	attrs = kzalloc_obj(*attrs);
+	if (!attrs)
+		return -ENOMEM;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->revision = kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
+	attrs->family = "JH";
+	attrs->soc_id = "JHB100";
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->revision);
+		kfree(attrs->machine);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
+
+	return 0;
+}
+
+early_initcall(starfive_socinfo_init);
-- 
2.25.1

