Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792747852;
	b=l0WrFw1srTiwLwjKgZpuz4916t4oN6z7OZS77syF5s2hWA7YzrgdSUK2beHqRqRuM8Ru
	 nXD5AGLUq0cvLu+ajxdlCsrYnW8w2OG7Y4K411U3syBLtzcNQPGE5DN9BDx49MZZNIQb2
	 8ksrIn7EJTRw8OhGZ0uHWeu+3D56rJPThLS07zVlci3nGOFRS/mE4xLoy27XXYsFpU7x+
	 zW56s26EjWV1jAAkDjcTm+p2hGKDrGL0uAxPNsnx+ZfxlwZQlLVhzkFQra3lYKwCVDJxd
	 7zyePJ5C4Qmsxtmf8SriQHCYyx/KyzLxifGPEG+zKd+wH1aAeXAEe7vwH1H3fTPgq2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747852;
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
	bh=xnPKxsE9D3RBBhjnz2QGyR7cKA+UC9y4MQ17r63/fw8=;
	b=jExTCDBzNderLk/XSua129XEMY6hBewMGS6PJuqDNqipvSCxOBnghjqTokzrvhtPXiiS
	 0ofpFtHO8BD6Yc8T+YlVJ5dhEiTdXXFVqDBxu271jgxNcOZz8xi5fH7H/vtqZN9+948ct
	 QA9tP1Y4Q4l0Wf67F6KsDejF3tj/yr6nk9OirYLIlkCkmY/as6kvH0R8CnBCSK6jH0vQZ
	 cqGYbkzxM749bYEAw377SPKujmQzB7wTqJf9zTC0UBxGi9SQFmsIyu39U2W/zxSlSXFD/
	 YzpQAB0pvEtWPhLfEa0z7ViXK/aMrYiR4vqatOLpe69v8VWzAXwyICNW4bLpZKiss4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.107
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022107.outbound.protection.outlook.com [40.107.75.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DB60A3814;
	Fri, 23 Oct 2026 09:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38DB60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUqs4LQO/mvZigBSd7D1cczHxWOtQr8XfEPZVKncSsAP86NOUebQ3HSDVYg/rzRN/2M8bNfCJQwnHfQfKHuIJEQfiUr+RhBkowRD6khGdCCRo8ZoMwm7MirXx5BhaskWRbGXZi11EbhXDC7lKYXlblzQG2++IoJIUwa/OioBZJS0Hb0ELue4YZlfVcnk5FrQP2IXp6ZqFNh+BoEgNDI2JLu6NXq8E+pAM55SGjNwFJwV35ojOyiEqyekYqls3Dy2fVysbWSmctruTM2218JPoqUAl0//UEyxgvfECDuziK2TH+6R+I2SXQbUcDYBzEgXUZFr1yNMg6LNockQB/cSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnPKxsE9D3RBBhjnz2QGyR7cKA+UC9y4MQ17r63/fw8=;
 b=vUwNKpF2OvQxcA+KQEvjIlE/0g70ezLz07B6j0g59UYakI5+U4wXhpjCiPuv62aZ3lgvlLeqew/WaoFo0G68I+dLum0X/tl28HW76SwjXmRpQztoDXhMUyfYFXlaRGeaagmwIH19bhdS/G6YBkLzjfCfKsKGTTGJsn7OhY0IUEpeLkgrMXFyo43nfgTeNn+P9bBLFLLFMmA+OSHfDasY5je1cLyQLQ/zU/dntcJVCkjEi1/PnzPwMlPkIL2dpqHdHivXn8HNxvtzk92vrCuTIrOaZty9Z+k78l8so3/U/kSbkhxEnmWTPTGuPCxT5/5c7E1mlcFAAk9ZGw4oYJu6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) by SE3PR06MB8106.apcprd06.prod.outlook.com
 (2603:1096:101:2e7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:48 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::a) by SI2PR01CA0049.outlook.office365.com
 (2603:1096:4:193::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 23 Oct 2026 09:30:47 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 85DFE40920E1;
	Fri, 23 Oct 2026 17:30:46 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v1 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
Date: Fri, 23 Oct 2026 17:30:42 +0800
Message-ID: <20261023093045.3248630-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SE3PR06MB8106:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eca34511-04ae-4442-d7fa-08df30e85216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|6133799003|18002099003|10067099003|261022105027099003|22082099003|261022075727099003|261021121427099003|261009223027099003|261021123027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pvDZxIVMangMC9+kWCh91pCupTcaMMZ3/9EbAtjN1b+CzeH5JPzQgNNMNeprJsAuVkcaTTgjs52De95Kiiulm1NGgOt4ona47QD64nZ2GjeZuE7iG/85LIqTuWWPraRgjH2A7idG4tYXB7f6Z37a5s3JMfZvxVfWg+PxDsYy8wnyF+ETqRDMavcfCyTwU9jnD96eYxIMrdv7Ga5UEugFs3S21dKxDE47XgPP5JbHH5vprYtuWk5kony8jCq2fs5/ExO24qpHr2IR1bSS+4fCDUgcgSu1NtJc1cdLFyZ/qZzONqfypymNZPCeQDOeAVwYWVwH/ElPhbjCJWZo9dqjWd340lkInEzcF7exukYHNv89qwMEx6CRvRidgOYYzVjPeoohwbtI8Top0pFy8TcYQ6GrWYgbiAqfSNCUgGyOcpPpvK9OZljgO3FxG9u2ToIcMETI0YnBxA/M0ppdEB1ufERjYSEz6NUIMYn2uwNMCCfsRMMyuEFCtKczP4D9weSYLQ7gZaiGRysOcnJMCiE0edPgyBdq+ldt2j7oOlqCmP/2HCZlec97V3LpFoosezv42sr4BJRc5+mXVPtOjF3TAoTFWId2AggONIdnTlCAihIs1mR70AKsh/ZxlfPtYlMtcNE2HGkW+CjTiWdVfgHf8qmtPNPhvzdmzDjQmetI3GoykgztlCJE6Y1HzAY0ozKNhGmoX8s8TpzXRUf3fg6n9w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(261022105027099003)(22082099003)(261022075727099003)(261021121427099003)(261009223027099003)(261021123027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	so8TuhjKvTAZemXS1d8gl3bwWnlMOy9Ewbg73rgIU4J1jiDhgGBUOcsJ+0wWJ0e077wIVbU+2CFsvX9PmKQPRUbgmhvZI6ZFkUnXS++Ynjt4n6LjDDJ64OHFLSQhxsL0GPQsJPpczAmliOwO12jd96bH2UrPYIEqL4sUP7G0Ea/tt2YtATmp5Z2Dgr/RDk4VagwpE9TZtVa0N9ADb0+ZFkP55VThVoHtRjyvKnonvvdyehDnCdW7M275znI5WXKLiOy+pg0Rid6b28QB8SJ+s1//KLP9o0kLPQe5DBPxModofSjKBZ8OGDO6g5QBfQi0hCC7sbArv6vSKMlu83eN4uqCpEgCe+EoE5AeM4g6s/1FF6N8u/yjFJmSYdtGC7L2fHQvA5yptNJDVAJwtbd4IH5leFqmIH63QcQkdoaXxW+UM/Jdi34vyjxWHZCPlKCv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:47.4697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca34511-04ae-4442-d7fa-08df30e85216
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8106

The AUDSS CRU INFO_AP_IRQC register gates each DMA-350 channel interrupt
onto the shared AP GIC line. Manage these gates with an irqchip in the
CRU driver, keeping access to CRU registers out of the DMA driver. Mask
and unmask the corresponding AP gate through the IRQ core; this controls
interrupt delivery, not AP/DSP channel ownership.

The register exposes gate state but no per-channel pending status. Call
each enabled child's DMA handler to check its channel-local status. Use
the untracked flow handler so inactive children returning IRQ_NONE do not
accumulate spurious-IRQ counts.

Clear the AP gates before installing the chained handler, then enable
them only as Linux requests channel interrupts. Clear them again during
teardown and include the register in the runtime and system sleep save
list. Register irqchip cleanup after runtime-PM cleanup so devres removes
the irqchip while the CRU register block is still clocked.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/clk-sky1-audss.c | 122 +++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..789cbba631d1 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -2,9 +2,14 @@
 // Copyright 2026 Cix Technology Group Co., Ltd.
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -18,6 +23,9 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
+#define INFO_AP_IRQC_DMAC_MASK			GENMASK(7, 0)
+#define SKY1_AUDSS_DMAC_IRQS			8
 #define INFO_MCLK				0x70
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
@@ -28,6 +36,7 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
 };
 
@@ -529,6 +538,8 @@ struct sky1_audss_clks_priv {
 	const struct sky1_audss_clks_devtype_data *devtype_data;
 	spinlock_t lock;
 	struct clk_hw_onecell_data *clk_data;
+	struct irq_domain *irq_domain;
+	int parent_irq;
 };
 
 #if IS_ENABLED(CONFIG_RESET_SKY1_AUDSS)
@@ -928,6 +939,110 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
 	return err;
 }
 
+static void sky1_audss_irq_mask(struct irq_data *d)
+{
+	struct sky1_audss_clks_priv *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+			   BIT(d->hwirq), 0);
+}
+
+static void sky1_audss_irq_unmask(struct irq_data *d)
+{
+	struct sky1_audss_clks_priv *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+			   BIT(d->hwirq), BIT(d->hwirq));
+}
+
+static struct irq_chip sky1_audss_irq_chip = {
+	.name		= "sky1-audss-dmac",
+	.irq_mask	= sky1_audss_irq_mask,
+	.irq_unmask	= sky1_audss_irq_unmask,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	if (hwirq >= SKY1_AUDSS_DMAC_IRQS)
+		return -EINVAL;
+
+	irq_set_chip_data(irq, d->host_data);
+	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip,
+				 handle_untracked_irq);
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
+	struct sky1_audss_clks_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long enabled;
+	unsigned int hwirq;
+	u32 val;
+
+	chained_irq_enter(chip, desc);
+
+	if (!regmap_read(priv->regmap_cru, INFO_AP_IRQC, &val)) {
+		enabled = val & INFO_AP_IRQC_DMAC_MASK;
+		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
+			generic_handle_domain_irq(priv->irq_domain, hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void sky1_audss_irq_teardown(void *data)
+{
+	struct sky1_audss_clks_priv *priv = data;
+
+	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+			   INFO_AP_IRQC_DMAC_MASK, 0);
+	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
+	irq_domain_remove(priv->irq_domain);
+}
+
+static int sky1_audss_irq_init(struct platform_device *pdev,
+			       struct sky1_audss_clks_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+	int irq;
+
+	if (!of_property_read_bool(dev->of_node, "interrupt-controller"))
+		return 0;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	priv->irq_domain = irq_domain_add_linear(dev->of_node,
+						 SKY1_AUDSS_DMAC_IRQS,
+						 &sky1_audss_irq_ops, priv);
+	if (!priv->irq_domain)
+		return -ENOMEM;
+
+	ret = regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+				 INFO_AP_IRQC_DMAC_MASK, 0);
+	if (ret) {
+		irq_domain_remove(priv->irq_domain);
+		return ret;
+	}
+
+	priv->parent_irq = irq;
+	irq_set_chained_handler_and_data(irq, sky1_audss_irq_handler, priv);
+
+	return devm_add_action_or_reset(dev, sky1_audss_irq_teardown, priv);
+}
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1110,6 +1225,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 		goto fail_pm;
 	}
 
+	/* Tear the irqchip down before the runtime-PM cleanup disables clocks. */
+	ret = sky1_audss_irq_init(pdev, priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
+		goto fail_pm;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
-- 
2.54.0

