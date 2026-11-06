Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928929;
	b=rh8w/bHV3IN0dnXxIDJin9SQbwtpNB/Az2APFv0zM8fPo4YDbEqxWdfVd2gfpRETrU/E
	 WRiGRKhQ/pr7O/9hJoiU1EIQMUsrnPw/oiOWF6Ygqmg9/49XzbpVLWDdbJhhzSQe9U/+p
	 FnWDCgrdfJ4UpQSFmvAMQwQNZu8mJtkwy1q24p5Qki2Yw+A9OdH/A1+NleW/rh2RjMx8X
	 fvQK8Mkec4OR1CmKb29WVTaXq8RM/d1bmNi3pQ1o4RfQZfmPlto5d0CuAmWmE0xjGfBb6
	 APfIZB2qiOJAKWeATFaY0bMGNvv15Szz646M4m6N09MQNtqNEjCtKlsjMInH4tWaCxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928929;
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
	bh=cA1bvQrdLE6ZDcNkqNiWAdXdg103OEauWYsUNrJUNDk=;
	b=dK9ctPjU6YR2dNe7pYqMJNgw/MxWlIMAVmz8gqPqILcWaw7UnCMi49RzycjicdZOODNU
	 p4IMksMSnoTcfcEKy1yjjbv7WoPB6Hfhn5jHhWUIwKokr+QrfG4KO4pKcJP8gxpWImk8d
	 uXQOiKmCDCujqhGOqdGyNyXYkQGC7FdAxwfSnG5FvsxLMS5JDwiRgUd346nqugnuNk9Xa
	 ++i7N9/VOXnXlCGXhsW6rnn3FaiusBPR6TCdfR1882+Edla8GmhRnyb3KZbAljpkbhegj
	 PyIeJ1krigfqby/rr0gWIYIeXzy4I974ignK5FlpEVj5BIlezIBPonjJQ45g611J0IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.104
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022104.outbound.protection.outlook.com [52.101.126.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF7F606D802;
	Fri,  6 Nov 2026 01:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF7F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voRotafQrE1ZizLmPFhT54PxoQjuecPi0ZFNG/vv+esKBUH3INbQj9T6JUmHCTmhaF8A1pbnZMapY+IXefY8Qfj+NzEgtlMz4moZODNJhDvAPhU+Pq+V051xezKy/L3SiOrtHJ7UpXtmSYUKlaQLsiwGmxPYsB0RLT+tqWWyiLfnCmHHmSyMOKk+lZAMskYE7iokapltzJSk90sI4nKJkHqjRisIQhpE3PUOcd2BDE/WinhFLIuV5h5VE7CxF0gmRDtiIB4cP6t17O0sOX7lTjlTSopdAU+1xI2qLRtm9HYZgNj9qEkSGGKu4Yr9LIDgBHJ5ALv06D5JAz5Wps/ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA1bvQrdLE6ZDcNkqNiWAdXdg103OEauWYsUNrJUNDk=;
 b=mohCrznAbxGeDxzU6IZmgQAHhVO7+f/LIGFnXPK6J9ViTF6jofHDXGshZqtZnTDWTYLfkLBp/7R25P/W7+V3FgzN1VCS7EcsTlpIBBrT+EYy5DMznXaxFL/uYdwleuAbdMLgQsDFV04P4/15Ep0mIqcf1PBgnhZZ5p+reRtyRHw5jZrhuAZjn7KJk7qu8+UuI9L2/VE2bA7ZVlsonrrX/zPUOif++nho+tfii6t+Rz0PWXlL0k9MWIIDxu+/L9YrdwGiRMVt1E1RAC3tJ8GXo7lhXPHGp2+9nwpOsAkiaYdsTVKV5kY5yedNJOauDTJHdM/S0x9OSw2TvmxBZYL1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0009.apcprd02.prod.outlook.com (2603:1096:4:194::11)
 by TYSPR06MB6969.apcprd06.prod.outlook.com (2603:1096:405:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 01:35:25 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:194:cafe::1) by SI2PR02CA0009.outlook.office365.com
 (2603:1096:4:194::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:23 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8DC8940920E1;
	Fri,  6 Nov 2026 09:35:21 +0800 (CST)
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
Subject: [PATCH v3 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
Date: Fri,  6 Nov 2026 09:35:17 +0800
Message-ID: <20261106013520.1134450-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TYSPR06MB6969:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8057fde4-c88f-409c-2bfd-08df3ba639ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|82310400026|36860700016|261021123027099003|261102123227099003|261009223027099003|261028144727099003|261022105027099003|261026140227099003|261021121427099003|56012099006|261022075727099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	RGcGZKX+RJfkDWbeBiqIjNmz4ojsXKak1E/SUa2136NOp9CvC3bQ9qNEgffHvRMWNlAQXPDc+gXt+kpV6eqtsojEkUx73EGQnVVDjAgCnov3cdyopr3SxvwblP110q2Fh6JkTsW8574QqRj9MdNkZfHQ5SzdWHOlkd2dHAPiIBqHUbu59JNfyIEhos+I69uTJON6jrQZGbsPGS0eQUnefJT+gqnn598vXlmagovGPatF28su31MxMvpyni61ny7EWWbSCsVpg22F+50lLogXK+ruVlCcFC0xJ33+XEjWtHjD7hqwowTxwthDwS6X8lwPTkktbLwB6V95/3dFGIQrgXWtQRy8QG06JOVrfNqzID8BZ0VxREwBGaB+G0rvi79MWfPeQuGT/6d56xxT1g5NtvbnBeQYgQzT/g0EJRHtMVlS2hlcFnmG6F1WlD9xQVg/3xZP+FefqLOe4Lw1ddt73vFAq/G/bkaQinXvePjxg1aWx1hJoAhGEa97XI1TWyftfIurMfZJPwXuwEKsZLzbn4h8+3/pv/hmPn0d8j9STKdIIAg5Ap10cQboqZqg9ocdk+GSnoCanCPOyTsFsZRVFQYJ1PrNcl127afESYBxyUAkR850IqBtU3utj+3S2L/TcgRLDbzajKNCr4YmpxU32V3YWNJJxV8nJDbkbwgEMzuKgaEm+ib0zv2tUnhvTGsvGbOMcHHgkg0F+RoF+9Fnzg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(82310400026)(36860700016)(261021123027099003)(261102123227099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(56012099006)(261022075727099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KYN4EZtG83KxWay4u+OH/hl4585xzPEWicbY5cWpQEw+RXrmScIalAQhPbJyxEPc4QuSBwQ+iNTSnjFX/8gE86sl6hK0l22QWJHMRiGiO7Nlxz4044M2h9dkD1T5SRBnqNUVpUxGxSPLlJtuGJ+0MicwRJ5wagtJ97UfumF8sC9tg2xY8EI8zmFNkBy9yTcUQvrneL8xo7tBz/88XbiIPn85w1eqaniBn06MqtbDLoxboXmcWKdXZs9aFxCBe3pVxmeoUTQyAB+fHR3I4T0wanAfHFgGrTh8BFk7GyqUlLBNTmb3oJMaaSTTsFBUkTsi1eWQQ2V0FUIrzYofR+9jphznHwcu/0AG6MDPV3m+/xlnu7ChNHsCXh8y/UbWSZS1rE/etTuOj4uOTOKqlpmppb8j0nlLAC6/ifsgBwFMay9pqd9sxz4OmgsFen5dqHco
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:23.1166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057fde4-c88f-409c-2bfd-08df3ba639ff
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6969

The AUDSS CRU INFO_AP_IRQC register gates each DMA-350 channel interrupt
onto the shared AP GIC line. Manage these gates with an irqchip in the
CRU driver, keeping access to CRU registers out of the DMA driver. Mask
and unmask the corresponding AP gate through the IRQ core; this controls
interrupt delivery, not AP/DSP channel ownership.

The register exposes gate state but no per-channel pending status. Poll
each enabled child's DMA handler to check its channel-local status. Use
level flow handling so disabled and oneshot-threaded interrupts remain
masked, and mark the children as polled because IRQ_NONE is expected
when a different channel caused the parent interrupt.

Use a raw regmap lock for the hard-IRQ callbacks and keep the CRU powered
while its IRQ resources are in use or being torn down. Quiesce the parent
IRQ before runtime suspend and move system sleep handling to noirq.
Save and restore the interrupt gates and software reset state with the
other CRU context. Dispose of child mappings before removing the domain.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/Kconfig          |   1 +
 drivers/clk/cix/clk-sky1-audss.c | 181 ++++++++++++++++++++++++++++++-
 2 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
index b057ef85fab6..de463ae63cb4 100644
--- a/drivers/clk/cix/Kconfig
+++ b/drivers/clk/cix/Kconfig
@@ -6,6 +6,7 @@ config CLK_SKY1_AUDSS
 	tristate "Cixtech Sky1 Audio Subsystem Clock Driver"
 	depends on ARCH_CIX || COMPILE_TEST
 	select AUXILIARY_BUS
+	select IRQ_DOMAIN
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 	help
diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..9c8457334e17 100644
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
@@ -18,7 +23,11 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
+#define INFO_AP_IRQC_DMAC_MASK			GENMASK(7, 0)
+#define SKY1_AUDSS_DMAC_IRQS			8
 #define INFO_MCLK				0x70
+#define INFO_SW_RESETN				0x78
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
 #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
@@ -28,7 +37,9 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
+	{ INFO_SW_RESETN, 0 },
 };
 
 static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
@@ -519,6 +530,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.use_raw_spinlock = true,
 };
 
 struct sky1_audss_clks_priv {
@@ -529,6 +541,8 @@ struct sky1_audss_clks_priv {
 	const struct sky1_audss_clks_devtype_data *devtype_data;
 	spinlock_t lock;
 	struct clk_hw_onecell_data *clk_data;
+	struct irq_domain *irq_domain;
+	int parent_irq;
 };
 
 #if IS_ENABLED(CONFIG_RESET_SKY1_AUDSS)
@@ -928,6 +942,147 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
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
+	.irq_disable	= sky1_audss_irq_mask,
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
+				 handle_level_irq);
+	/*
+	 * The CRU exposes gates, not per-channel pending status. The parent
+	 * handler polls every enabled channel, so IRQ_NONE is expected and
+	 * must not trigger spurious interrupt detection. Keep level flow
+	 * control so oneshot IRQ threads run with their channel gate masked.
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
+	unsigned int hwirq;
+	unsigned int virq;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
+		dev_warn(priv->dev, "failed to resume CRU for IRQ teardown: %d\n", ret);
+
+	disable_irq(priv->parent_irq);
+	if (ret >= 0)
+		regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+				   INFO_AP_IRQC_DMAC_MASK, 0);
+	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
+	synchronize_irq(priv->parent_irq);
+	irq_clear_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+	priv->parent_irq = 0;
+
+	for (hwirq = 0; hwirq < SKY1_AUDSS_DMAC_IRQS; hwirq++) {
+		virq = irq_find_mapping(priv->irq_domain, hwirq);
+		if (!virq)
+			continue;
+
+		/* Disassociation must not access an unpowered CRU either. */
+		if (ret < 0)
+			irq_set_chip(virq, NULL);
+		irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(priv->irq_domain);
+	priv->irq_domain = NULL;
+	if (ret >= 0)
+		pm_runtime_put_sync(priv->dev);
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
+	ret = regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+				 INFO_AP_IRQC_DMAC_MASK, 0);
+	if (ret)
+		return ret;
+
+	priv->irq_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
+						    SKY1_AUDSS_DMAC_IRQS,
+						    &sky1_audss_irq_ops, priv);
+	if (!priv->irq_domain)
+		return -ENOMEM;
+
+	irq_domain_set_pm_device(priv->irq_domain, dev);
+
+	priv->parent_irq = irq;
+	/* The chained handler cannot implement lazy-disable masking. */
+	irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY);
+	irq_set_chained_handler_and_data(irq, sky1_audss_irq_handler, priv);
+
+	return devm_add_action_or_reset(dev, sky1_audss_irq_teardown, priv);
+}
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1110,6 +1265,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
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
@@ -1125,6 +1287,11 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
 	unsigned long flags;
 	int i;
+	int ret;
+
+	/* Quiesce the chained handler before registers become inaccessible. */
+	if (priv->parent_irq)
+		disable_irq(priv->parent_irq);
 
 	spin_lock_irqsave(&priv->lock, flags);
 	for (i = 0; i < devtype_data->reg_save_size; i++)
@@ -1132,7 +1299,12 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	reset_control_assert(priv->rst_noc);
+	ret = reset_control_assert(priv->rst_noc);
+	if (ret) {
+		if (priv->parent_irq)
+			enable_irq(priv->parent_irq);
+		return ret;
+	}
 
 	sky1_audss_clks_disable(priv);
 
@@ -1164,14 +1336,17 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
 			     devtype_data->reg_save[i][0], devtype_data->reg_save[i][1]);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	if (priv->parent_irq)
+		enable_irq(priv->parent_irq);
+
 	return 0;
 }
 
 static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
 	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
 			   sky1_audss_clk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
 static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
-- 
2.54.0

