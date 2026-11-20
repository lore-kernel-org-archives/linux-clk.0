Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152937;
	b=RWIXM7X/l/fA3YN4LB1rhyPSLjI+q/ZfdbxpXYBItXZ7MjJmThEkMY6+JgvSjo7dACo3
	 2rj+p39kHd3wvlrNhWgX6CHw9D5nQKcZfmj/ftLXvMotbWpatezFkCm9BcCYu5tzeHQxn
	 DwxQ3NmE9Wq/eGsg4KgtWdkIOVFNzDRywDvw6IP2BhhQP3k1doKVjSXC+IUACQTSTtTWC
	 s+OyVRPGsvDq/RlTlx8w3kmDBygFwF37Gl/22AEkj35bgu7P30g5VBbnvzhArqmhmRzEI
	 g8o+OL0BshgXbIp6YmQpmdsl+c9ht9k8vVzMfnO993JwfwFqccRjoudXkmhyT7VZcOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152937;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TGSlRAR+Zm4NZmfK0vP+zv8nj5qbBIRZNsmYsMV1EOs=;
	b=RJUVBUJWBbIC6LAiVLd8Z2srh+3PhB1Z/+DfYaL31kn/0WamBaUsNjgF0iAIldSSVqOe
	 u7AdL9T9qWsanUSyS01WtNg9LL2Gc5ehYc1b+8qbRdqYMdtalzTsr5Dl3n1dnJRBuAXN3
	 AE7bmC9QNoeee6wyYSuXP3rtzIX9bw8GTAU+ZNZpz7ONg2gC5Oql2RhuPdXEjOF2de95R
	 t7W5vbFlVCkPFZMqTpn5CoaAy+xnIvA/OV5tYm+qx45n8aJZQUsFoXcQfQmoRo3fDPZTJ
	 oZlWjqK/5Y8XbKXDoyji9F1b+MjZok633/tZBAvUp4tzodiAjVw0ub1QhuH1Nhg4qpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.107
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022107.outbound.protection.outlook.com [40.107.75.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24834606A325;
	Fri, 20 Nov 2026 05:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24834606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjsVOOTXPZ2YnOMWD8civ6DgDypirfIEDb/3i3fVT1ecoR1Z6V4AvQfJZEafC7Y3xVu+F0W2dA3V8NncX8VnubcCRWRxlzRkW90e/9UfzvarRxcAZ4OSyUyEs/hrnGtCiDPrDHwxDkSUkJCuAE0fj/Z1vz2d5j2QM2LM1gOFf1mqIRx1tZdTK5UyB07Q+q3OoFKio+3476gtkF1GhpwVNgtyILHqQ3e0Yauhiav8MIzX5yKrUXMC+7mj+e7G9Z30SIRacsO1UkPYt7+OJzghMsWHj3hdMpaSX0fginBGjDxS/CFxXojMPQf26d8LnqqPmado8ZFKMd8NHwFCVyX5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGSlRAR+Zm4NZmfK0vP+zv8nj5qbBIRZNsmYsMV1EOs=;
 b=WdgluTObn5tS+cyHBn4Lu5isyBRGtxpBQb057HWI7sb0g+q8gJmIpk/yXrqrRU6ETbI5auDkeWtz//cGCaHf0vVsC+oNgjuyKIqd04ijRzdqzZxlJ1e1vHYtmL4dQZCfJFqBlxbuqMKe8P4bDM43An9fSsPaQlVpZdOxKPRZRIPk/G7D1vbgdXwW4eSLyntrjCJNoca3cHh72oQ5eYZ4gfjgEXw0R5fpENqBrT7IFgMNCIWPcfYf/55SwQE8mkAHkQAgjYThNZk2Q+7svqVvDO+PE/OvfAVJLJumSngD2vOERB2NdjW+2xOx7ithlSj7un1YyJXkgqQBDhocSt3y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0036.KORP216.PROD.OUTLOOK.COM (2603:1096:301:20f::18)
 by PUZPR06MB5434.apcprd06.prod.outlook.com (2603:1096:301:dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:32 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:20f:cafe::77) by PUVP216CA0036.outlook.office365.com
 (2603:1096:301:20f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:31 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7EF5640920E2;
	Fri, 20 Nov 2026 13:35:30 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v5 2/6] irqchip: Add the Sky1 AUDSS auxiliary interrupt controller
Date: Fri, 20 Nov 2026 13:35:25 +0800
Message-ID: <20261120053529.371923-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|PUZPR06MB5434:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8cd32b54-acaf-4eda-6d3c-08df46c81822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|921020|10067099003|56012099006|260925022911599003|260925021311599003|260925021911599003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261102123227099003|261009220027099003|261009221727099003|261009223027099003|22082099003|18002099003|261009221227099003|261009223327099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+OL5jbX7J6D2pxAhLlqWqFhV3X1/qu1TeQqEEwEsiRoRaarLMAktPiyx5cY+C/O2nVeKp+YfnFOSx8Vqq3STH9jK//xe4ONgsi3WH5q45vXdfSnMrTqzcqqpkYKBXWNlfwtRyTBeIy4VOKXz1kz/pYSsxgSfjaGO+dTLFK3/mnkRlQZg7ZACpDEnJCbccWbvkq3d/4QNcMQKggXCnlAnq0b50ZIrLJVO6yYbe+RpIN1w7TvD7sfny6rkvb2bb2xwF9ppDJInXSFql5liR2eXurthQqbqHZhmmsesFM02c1UBttmmFIaRSiv4uNBl5shmXm7VxgtOURqsQY24grukvRIfdpLSbp+BBX07jXYAlk3dQaCaQrHUb/KSTyiT9bsu6zwOM6cdCMmANz9VvQ0GWZimqqp3KGZWbfLKmgGVmuDXz3a0lEnqbaEYrydZB2KqFXGEGBYN1YbnY8fQMKrUfgMM32gJnANr4GFRjGNzhfDqnaKpKaOzukgCu4HRx9nIn50u4RbBvjgCiRnOwy9qeWb6/083As5JdZFJRJcPSPWXuSCi/d3nP4Q12lrfy1zKqaBzonJbMj32bgo6KenDAxtYR50PnPxuWkIDMZ5snqJLi1lMyELQ5eW0mfdx3eIAcBcD5UYrR490cofXdqvYmxyCWDgWPdTUUAevyKpwr07Pfyr+CSodYcl3xLjke5Q59LLMZolaifqIltIQ8gZYmkkcLGuw+w/meJcfiq5d/pvZmYM6WDVNfsGAGrC7QvtH
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(921020)(10067099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009220027099003)(261009221727099003)(261009223027099003)(22082099003)(18002099003)(261009221227099003)(261009223327099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZeVapQbTFI1xpYW6WerTij4ImYZZoHbPaRV1vto3yE3ej3mR1wGepS7s3+O7V4IuFLhaHnyuzS/sK5L94KWMfB01P1w/YSJYg857vK+d4AqRFHNjTp0aF+QRHWYcOvZNNfQ4W6Vc440vW+l2pNsuwrGl+NhGXHLDR20XDyFbwDrKaXHqgG2ABKx8WJaL5V5+5ZNex48ZIViGZkmwPgVIr1rlZkGdZ2SH2SfGoLaJmUXI1/J/lMzSu5jVKAdsbW0fcwEPIxaDTGzZIn5b5AmoB4SLKAwDgUKVUQoJaBr/LmPsZ4fXQpJxstnQRR4NdvCL6ZV+4bd7rywKce9o4LE52ETCPy8JZXOiTQnQ6duDihHFv++NJYo8v1x44EOVqPa5E0NIZimtK+YKxXMCdeVzsUQf53CJSMeu8o+eAjV9bocB56IOfo6CpXYtagu7FLdZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:31.9544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd32b54-acaf-4eda-6d3c-08df46c81822
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5434

The AUDSS CRU gates eight DMA channel interrupts onto a shared parent line.
Implement its irqchip, domain and chained handler in an auxiliary driver
under drivers/irqchip rather than the clock subsystem.

Reuse the parent CRU regmap and firmware node. Retain level/polled child
flow, explicit disable masking, mapping disposal and powered teardown. Keep
clock/reset control in the parent. Coordinate the parent IRQ's quiescing
with runtime PM and noirq system sleep, keeping sleepable power management
out of hard IRQ callbacks.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 MAINTAINERS                      |   1 +
 drivers/irqchip/Kconfig          |  16 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-sky1-audss.c | 255 +++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/irqchip/irq-sky1-audss.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..bd966600deb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2904,6 +2904,7 @@ T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
+F:	drivers/irqchip/irq-sky1-audss.c
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..1275622851c1 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -233,6 +233,22 @@ config LAN966X_OIC
 config MADERA_IRQ
 	tristate
 
+config IRQ_SKY1_AUDSS
+	tristate "CIX Sky1 AUDSS DMA interrupt controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	depends on OF
+	select AUXILIARY_BUS
+	select IRQ_DOMAIN
+	select REGMAP
+	default CLK_SKY1_AUDSS
+	help
+	  Support the DMA channel interrupt gates in the CIX Sky1 audio
+	  subsystem CRU. This auxiliary driver shares the clock controller's
+	  register map and combines the channel interrupts onto a parent IRQ.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called irq-sky1-audss.
+
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..2862a0335082 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IRQCHIP)			+= irqchip.o
+obj-$(CONFIG_IRQ_SKY1_AUDSS)		+= irq-sky1-audss.o
 
 obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
diff --git a/drivers/irqchip/irq-sky1-audss.c b/drivers/irqchip/irq-sky1-audss.c
new file mode 100644
index 000000000000..df2063f0d771
--- /dev/null
+++ b/drivers/irqchip/irq-sky1-audss.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Cix Technology Group Co., Ltd. */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define INFO_AP_IRQC		0x54
+#define INFO_AP_IRQC_DMAC_MASK	GENMASK(7, 0)
+#define SKY1_AUDSS_DMAC_IRQS	8
+
+struct sky1_audss_irq {
+	struct regmap *regmap;
+	struct irq_domain *domain;
+	int parent_irq;
+};
+
+static void sky1_audss_irq_mask(struct irq_data *d)
+{
+	struct sky1_audss_irq *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap, INFO_AP_IRQC, BIT(d->hwirq), 0);
+}
+
+static void sky1_audss_irq_unmask(struct irq_data *d)
+{
+	struct sky1_audss_irq *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+			   BIT(d->hwirq), BIT(d->hwirq));
+}
+
+static int sky1_audss_irq_request_resources(struct irq_data *d)
+{
+	return try_module_get(THIS_MODULE) ? 0 : -ENODEV;
+}
+
+static void sky1_audss_irq_release_resources(struct irq_data *d)
+{
+	module_put(THIS_MODULE);
+}
+
+static struct irq_chip sky1_audss_irq_chip = {
+	.name			= "sky1-audss-dmac",
+	.irq_mask		= sky1_audss_irq_mask,
+	.irq_unmask		= sky1_audss_irq_unmask,
+	.irq_disable		= sky1_audss_irq_mask,
+	.irq_request_resources	= sky1_audss_irq_request_resources,
+	.irq_release_resources	= sky1_audss_irq_release_resources,
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	if (hwirq >= SKY1_AUDSS_DMAC_IRQS)
+		return -EINVAL;
+
+	irq_set_chip_data(irq, d->host_data);
+	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip, handle_level_irq);
+	/*
+	 * There is no per-channel pending status in the CRU. Poll enabled
+	 * children without spurious-IRQ accounting, but retain level flow
+	 * control so disabled and oneshot-threaded children stay masked.
+	 */
+	irq_set_status_flags(irq, IRQ_LEVEL | IRQ_IS_POLLED);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sky1_audss_irq_ops = {
+	.map	= sky1_audss_irq_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void sky1_audss_irq_handler(struct irq_desc *desc)
+{
+	struct sky1_audss_irq *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long enabled;
+	unsigned int hwirq;
+	u32 val;
+
+	chained_irq_enter(chip, desc);
+
+	if (!regmap_read(priv->regmap, INFO_AP_IRQC, &val)) {
+		enabled = val & INFO_AP_IRQC_DMAC_MASK;
+		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
+			generic_handle_domain_irq(priv->domain, hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int sky1_audss_irq_runtime_suspend(struct device *dev)
+{
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+
+	/* The parent CRU may turn its clocks off after the child suspends. */
+	disable_irq(priv->parent_irq);
+
+	return 0;
+}
+
+static int sky1_audss_irq_runtime_resume(struct device *dev)
+{
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+
+	/* Parent resume has already restored the CRU registers. */
+	enable_irq(priv->parent_irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sky1_audss_irq_pm_ops = {
+	RUNTIME_PM_OPS(sky1_audss_irq_runtime_suspend,
+		       sky1_audss_irq_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
+};
+
+static int sky1_audss_irq_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct sky1_audss_irq *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get CRU regmap\n");
+
+	priv->parent_irq = of_irq_get(dev->of_node, 0);
+	if (priv->parent_irq < 0)
+		return dev_err_probe(dev, priv->parent_irq,
+				     "failed to get parent IRQ\n");
+	if (!priv->parent_irq)
+		return -EINVAL;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to resume CRU\n");
+
+	ret = regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+				 INFO_AP_IRQC_DMAC_MASK, 0);
+	if (ret)
+		goto out_put_parent;
+
+	dev_set_drvdata(dev, priv);
+	pm_runtime_get_noresume(dev);
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		goto out_put_child;
+	pm_runtime_enable(dev);
+
+	priv->domain = irq_domain_create_linear(dev_fwnode(dev),
+						SKY1_AUDSS_DMAC_IRQS,
+						&sky1_audss_irq_ops, priv);
+	if (!priv->domain) {
+		ret = -ENOMEM;
+		goto out_disable_pm;
+	}
+	irq_domain_set_pm_device(priv->domain, dev);
+
+	/* A chained handler cannot implement lazy-disable masking. */
+	irq_set_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+	irq_set_chained_handler_and_data(priv->parent_irq,
+					 sky1_audss_irq_handler, priv);
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_put_sync(dev->parent);
+
+	return 0;
+
+out_disable_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+out_put_child:
+	pm_runtime_put_noidle(dev);
+out_put_parent:
+	pm_runtime_put_sync(dev->parent);
+	return ret;
+}
+
+static void sky1_audss_irq_remove(struct auxiliary_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+	unsigned int hwirq;
+	unsigned int virq;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_warn(dev, "failed to resume CRU for IRQ teardown: %d\n", ret);
+
+	disable_irq(priv->parent_irq);
+	if (ret >= 0)
+		regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+				   INFO_AP_IRQC_DMAC_MASK, 0);
+	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
+	synchronize_irq(priv->parent_irq);
+	irq_clear_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+
+	for (hwirq = 0; hwirq < SKY1_AUDSS_DMAC_IRQS; hwirq++) {
+		virq = irq_find_mapping(priv->domain, hwirq);
+		if (!virq)
+			continue;
+
+		/* Disassociation must not access an unpowered CRU either. */
+		if (ret < 0)
+			irq_set_chip(virq, NULL);
+		irq_dispose_mapping(virq);
+	}
+	irq_domain_remove(priv->domain);
+
+	pm_runtime_disable(dev);
+	if (ret >= 0)
+		pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+}
+
+static const struct auxiliary_device_id sky1_audss_irq_ids[] = {
+	{ .name = "clk_sky1_audss.irq" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sky1_audss_irq_ids);
+
+static struct auxiliary_driver sky1_audss_irq_driver = {
+	.probe = sky1_audss_irq_probe,
+	.remove = sky1_audss_irq_remove,
+	.id_table = sky1_audss_irq_ids,
+	.driver = {
+		.pm = pm_ptr(&sky1_audss_irq_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+};
+module_auxiliary_driver(sky1_audss_irq_driver);
+
+MODULE_AUTHOR("Jelly Jia <Jelly.Jia@cixtech.com>");
+MODULE_DESCRIPTION("CIX Sky1 AUDSS DMA interrupt controller");
+MODULE_LICENSE("GPL");
-- 
2.54.0

