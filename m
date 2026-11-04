Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793776870;
	b=CsE/K2v8FzoOvdTa9liFSkC6zeYkuryvDpZXghG6WgPfBdDXTgKED0enmyNyn2+ksKls
	 arNv+XIFzPl7Dh1KrIPQraHOyMH3UzgOWV432uwAILJt2J33+9BbYW2Cv5yV4oQ1i8LM0
	 m1LACrTZI0VhPO5uUSQFgHkJs+ulT/0rRrev/SrFTsPW4CQytMVeYMc3VuALOtvNHxTK1
	 NUJJIxmJhWcJPbVt8lH6ro6MLmn3xNQD/8t0wB9O5+2ho+IRO/sQlWUEBISmYVg6eap2B
	 ITu4tHAOFbnu/60JuLmZJK2DXpzsVgyT2qMYk3ipbfzcdTgU9YblFv/Pe/cGD920Qeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776870;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=VeA8VGr4S3MiUIia7FaBQDIkrcljZVgIELFPG8cyDpA=;
	b=E1TSRfpk3gvKoQtxGYcE7hTxhwTZ+1imNikYtkxOfoS5UY9jIQ0Z5/v9kln/654t68dc
	 KYZDnAkorQ7wji2zW2TaCfbMdpu8GcoCYzAPdQT7uNqrXqqyoknRhCSbBdeuKmGBJgOur
	 xZA5g3tpZexCgY+2dWvxf7I39rDPkW5YeI4+UJkWRedn64rBmqZmvoVDr1jwR/jJHbVWo
	 N2decbt08OjsjgJnjOIRI1q2BPQNctRZBgdLyHL/uqW7StVsGevomCwaHqfIlwSF4XiJ5
	 kaGxzzcimR3yEv1qPCcZj8l21n78ikq0E+4Bf2a5wvUqwiKFvJnvSLn40c24degvOAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJJmcaMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C5606D803;
	Wed,  4 Nov 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJJmcaMg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793776869;
	b=A0n0+v7a3zgK+kDFzvh9uiG6ImF4SG37k66oCY6IqAcYVMb6w9RQYiBoIttTAFCXIkwP
	 cFKY+pMCnAak7qpHQd/WFUujaOMHf8tsTcBa6G5WhJGQNpfcgjXAeoQAPIUFbLg1BgPoD
	 cokzlqqU33eyi5svNx/G6aQumYHZM8QjMTqhVci2RDFuqOJTyv0sHRDyqkaPDf3bJUPK0
	 Xdgzv20LlIIq/AdNYBKZHrkxXxx3+Ku2xn+bJiHMKJ8Na1MJ/dij/Tuq1JoLFDCG+2zRR
	 kbyCZnfSTk8TSJmvaTpgX4o5YHpgc/pe63kHHh41OAPMkPylLZjCeebZcnpjrrxr/+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793776869;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VeA8VGr4S3MiUIia7FaBQDIkrcljZVgIELFPG8cyDpA=;
	b=yJa8YleS+OacqjC0XToqpWM7BTXLAKB4/4Mb42oZiuHxBXkbF5n9ZQeMQmGmjFFUUDN/
	 k0lkywbhU4w4Vo67pbftQG7yjweJ1Dx38cgAvqtwLlQiM75CoaYfN3osu5QKlnz8UauDt
	 MZubNuaAphkk9656lbEUNkG/kyBjIVZ9EzWTfklRnzOSwsS6w2RjOVPYFaa+p7q8Awt7z
	 uRvrE7K0ucfLSYLfgxs69HmJPLQbzK82cbJtn1EJK0C620TPIRKBzD5y+/bkIE87/wceD
	 bHiWAy0n4+ru0kEHRhTOxALzxHDHZk0vUCavpa1u0R4NF4gNwXVRWA1bIq4NfdVvfdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CE6C1F00A15;
	Wed,  4 Nov 2026 07:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776869;
	bh=VeA8VGr4S3MiUIia7FaBQDIkrcljZVgIELFPG8cyDpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FJJmcaMgDCLt9/+etFjYI8PoOkHTC5FgK3bA+HtFI8P2COZ8/rsTI1e3JfzP+WsL4
	 bbuAimAzcovsL41zMPl7Y3+vuabM5A0yPB32gSRonJKHhLjR84NNTelHvpDb0mb1LU
	 7V11+ZEMryvnAObnk8F3jabmRQ9cBQXEtrig/G2POulVkjqjnPgkLfY4RcM7CDVOlq
	 pRybfmKXGxnhDRucWZxFhIyJ7a3PT4c3UeWX2fjr7VVQCpIAx8xRifkS+14+0s+PPR
	 yqPq61EVqlqNElvBIlIv9hG8PshXSjoFU72MnK7vmBxiqboAzz75hMCiVhdUsaOoIm
	 47ERKY2T80dlw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D0CDF46D00;
	Wed,  4 Nov 2026 07:21:06 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 04 Nov 2026 02:21:01 -0500
Subject: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793776865; l=14057;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=sVPVXOqyA/tYiYCCrLFSYXv7lkZJj5QWITddViV0Tbs=;
 b=HTq+o/1JWH2GNBP5VWnHTM4/ZCq3SehFww8RP4ntXdA+bUbLnFZKG/+5TckzG2g+19HUOiFvT
 FCFA00vFzLhDZBUHCaGLjPXQcs/wcYOMEJhh9SbqhnuQp7xcQeIyP+b
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev

From: Chuanhong Guo <gch981213@gmail.com>

Add a platform driver for the peripheral clock and reset manager (CRM)
block found on Siflower SF19A2890 and compatible SoCs.

Each CRM block manages a group of APB peripherals through three registers:
a reset register, a clock gate register, and a shared Bus Output Enable
(BOE) register that must be asserted for any peripheral in the block to
respond to bus transactions.

The driver registers a clock gate controller and a reset controller from
a single DT node. A shared spinlock protects all read-modify-write
accesses across both. BOE is managed automatically: asserted when the
first clock gate is enabled and deasserted when the last one is disabled.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
 its gate bits, critical gates and reset masks in tables here instead of
 the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
 and siflower,num-resets properties, gate N parented to input clock N by
 index instead of by global name, the gate updates under the spinlock too,
 no separator comments, Kconfig dependencies and help, subject]
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/clk/siflower/Kconfig                   |  11 +
 drivers/clk/siflower/Makefile                  |   1 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 360 +++++++++++++++++++++++++
 3 files changed, 372 insertions(+)

diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
index a8812fab2..f7c8a5a34 100644
--- a/drivers/clk/siflower/Kconfig
+++ b/drivers/clk/siflower/Kconfig
@@ -9,3 +9,14 @@ config CLK_SF19A2890
 	  and the muxes and dividers that feed the CPU, the buses and the
 	  peripherals. The GIC timer runs from the CPU clock, so a kernel
 	  for this SoC needs it built in.
+
+config CLK_SF19A2890_PERIPHCRM
+	bool "Clock and reset driver for Siflower SF19A2890 peripherals"
+	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
+	default MACH_SIFLOWER_MIPS
+	select RESET_CONTROLLER
+	help
+	  Supports the peripheral clock and reset managers of the Siflower
+	  SF19A2890. Each peripheral block has one, with its clock gates,
+	  its resets and the bus output enable it needs to answer bus
+	  requests.
diff --git a/drivers/clk/siflower/Makefile b/drivers/clk/siflower/Makefile
index 9f3df2e1e..a328317c4 100644
--- a/drivers/clk/siflower/Makefile
+++ b/drivers/clk/siflower/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_CLK_SF19A2890) += clk-sf19a2890.o
+obj-$(CONFIG_CLK_SF19A2890_PERIPHCRM) += clk-sf19a2890-periphcrm.o
diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
new file mode 100644
index 000000000..95d4dd449
--- /dev/null
+++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Siflower SF19A2890 peripheral clock and reset manager driver.
+ *
+ * Each managed block has three registers:
+ *   RESET    at base + 0x0  - per-peripheral reset bitmasks
+ *   CLK_GATE at base + 0x4  - one bit per clock gate
+ *   BOE      at base + 0xc  - shared Bus Output Enable; bits [1:0] must be set
+ *                             for any APB peripheral in the block to respond
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define REG_RESET	0x0
+#define REG_CLK_GATE	0x4
+#define REG_BOE		0xc
+#define BOE_EN		GENMASK(1, 0)
+
+struct sf19a2890_periphcrm_gate {
+	const char *name;
+	u8 bit;
+	unsigned long flags;
+};
+
+struct sf19a2890_periphcrm_data {
+	const struct sf19a2890_periphcrm_gate *gates;
+	unsigned int num_gates;
+	const u32 *reset_masks;
+	unsigned int num_resets;
+};
+
+struct sf19a2890_periphcrm {
+	void __iomem *base;
+	spinlock_t lock;	/* serializes all register updates */
+	struct reset_controller_dev rcdev;
+	const u32 *reset_masks;
+	struct clk_hw_onecell_data clk_data;
+};
+
+struct sf19a2890_periphclk {
+	struct sf19a2890_periphcrm *crm;
+	struct clk_hw hw;
+	u32 idx;
+};
+
+static inline struct sf19a2890_periphclk *hw_to_periphclk(struct clk_hw *hw)
+{
+	return container_of(hw, struct sf19a2890_periphclk, hw);
+}
+
+static int sf19a2890_periphclk_enable(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&crm->lock, flags);
+	reg = readl(crm->base + REG_CLK_GATE);
+	writel(reg | BIT(gate->idx), crm->base + REG_CLK_GATE);
+	writel(BOE_EN, crm->base + REG_BOE);
+	spin_unlock_irqrestore(&crm->lock, flags);
+	return 0;
+}
+
+static void sf19a2890_periphclk_disable(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&crm->lock, flags);
+	reg = readl(crm->base + REG_CLK_GATE);
+	reg &= ~BIT(gate->idx);
+	writel(reg, crm->base + REG_CLK_GATE);
+	if (reg == 0)
+		writel(0, crm->base + REG_BOE);
+	spin_unlock_irqrestore(&crm->lock, flags);
+}
+
+static int sf19a2890_periphclk_is_enabled(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+
+	return !!(readl(crm->base + REG_CLK_GATE) & BIT(gate->idx));
+}
+
+static const struct clk_ops sf19a2890_periphclk_ops = {
+	.enable = sf19a2890_periphclk_enable,
+	.disable = sf19a2890_periphclk_disable,
+	.is_enabled = sf19a2890_periphclk_is_enabled,
+};
+
+static inline struct sf19a2890_periphcrm *
+rcdev_to_periphcrm(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct sf19a2890_periphcrm, rcdev);
+}
+
+static int sf19a2890_periphcrm_reset_update(struct reset_controller_dev *rcdev,
+					    unsigned long id, bool assert)
+{
+	struct sf19a2890_periphcrm *crm = rcdev_to_periphcrm(rcdev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&crm->lock, flags);
+	reg = readl(crm->base + REG_RESET);
+	if (assert)
+		reg |= crm->reset_masks[id];
+	else
+		reg &= ~crm->reset_masks[id];
+	writel(reg, crm->base + REG_RESET);
+	spin_unlock_irqrestore(&crm->lock, flags);
+	return 0;
+}
+
+static int sf19a2890_periphcrm_reset_assert(struct reset_controller_dev *rcdev,
+					    unsigned long id)
+{
+	return sf19a2890_periphcrm_reset_update(rcdev, id, true);
+}
+
+static int
+sf19a2890_periphcrm_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return sf19a2890_periphcrm_reset_update(rcdev, id, false);
+}
+
+static int sf19a2890_periphcrm_reset_status(struct reset_controller_dev *rcdev,
+					    unsigned long id)
+{
+	struct sf19a2890_periphcrm *crm = rcdev_to_periphcrm(rcdev);
+
+	return !!(readl(crm->base + REG_RESET) & crm->reset_masks[id]);
+}
+
+static const struct reset_control_ops sf19a2890_periphcrm_reset_ops = {
+	.assert = sf19a2890_periphcrm_reset_assert,
+	.deassert = sf19a2890_periphcrm_reset_deassert,
+	.status = sf19a2890_periphcrm_reset_status,
+};
+
+#define GATE(_name, _bit, _flags) { .name = _name, .bit = _bit, .flags = _flags }
+
+#define CRM_DATA(_g, _r)						\
+	{								\
+		.gates = sf19a2890_##_g##_gates,			\
+		.num_gates = ARRAY_SIZE(sf19a2890_##_g##_gates),	\
+		.reset_masks = sf19a2890_##_r##_resets,			\
+		.num_resets = ARRAY_SIZE(sf19a2890_##_r##_resets),	\
+	}
+
+static const u32 sf19a2890_single_resets[] = { BIT(0) };
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_gmac_gates[] = {
+	GATE("gmac", 0, 0),
+	GATE("gmac_pclk", 1, 0),
+	GATE("gmac_byp_ref", 2, 0),
+	GATE("ethtsu", 3, 0),
+};
+
+static const u32 sf19a2890_gmac_resets[] = { GENMASK(1, 0) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_gmac_crm =
+	CRM_DATA(gmac, gmac);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan24_gates[] = {
+	GATE("wlan24_axis", 0, 0),
+	GATE("wlan24_axim", 1, 0),
+	GATE("wlan24_plf", 2, 0),
+};
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan5_gates[] = {
+	GATE("wlan5_axis", 0, 0),
+	GATE("wlan5_axim", 1, 0),
+	GATE("wlan5_plf", 2, 0),
+};
+
+static const u32 sf19a2890_wlan_resets[] = { GENMASK(2, 0) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_wlan24_crm =
+	CRM_DATA(wlan24, wlan);
+
+static const struct sf19a2890_periphcrm_data sf19a2890_wlan5_crm =
+	CRM_DATA(wlan5, wlan);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_rf_gates[] = {
+	GATE("rf_dft", 0, 0),
+	GATE("rf_axis", 1, 0),
+	GATE("rf_boot", 2, 0),
+	GATE("rf_lp", 3, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_rf_crm =
+	CRM_DATA(rf, wlan);
+
+/* Nothing describes a consumer of usb_axim, and gating it is not safe */
+static const struct sf19a2890_periphcrm_gate sf19a2890_usb_gates[] = {
+	GATE("usb", 0, 0),
+	GATE("usb_axim", 2, CLK_IS_CRITICAL),
+	GATE("usbphy_ref", 3, 0),
+};
+
+static const u32 sf19a2890_usb_resets[] = { GENMASK(2, 0), BIT(3), BIT(4) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_usb_crm =
+	CRM_DATA(usb, usb);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_spi_gates[] = {
+	GATE("spi_apb", 4, 0),
+	GATE("spi_ssp", 5, 0),
+};
+
+static const u32 sf19a2890_spi_resets[] = { GENMASK(5, 4) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_spi_crm =
+	CRM_DATA(spi, spi);
+
+/* UART0 carries the console from the bootloader on */
+static const struct sf19a2890_periphcrm_gate sf19a2890_uart_gates[] = {
+	GATE("uart0_apb", 0, CLK_IS_CRITICAL),
+	GATE("uart1_apb", 1, 0),
+	GATE("uart2_apb", 2, 0),
+	GATE("uart0", 4, CLK_IS_CRITICAL),
+	GATE("uart1", 5, 0),
+	GATE("uart2", 6, 0),
+};
+
+static const u32 sf19a2890_uart_resets[] = {
+	BIT(0) | BIT(4), BIT(1) | BIT(5), BIT(2) | BIT(6),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_uart_crm =
+	CRM_DATA(uart, uart);
+
+#define SINGLE_CRM(_name)						\
+	static const struct sf19a2890_periphcrm_gate sf19a2890_##_name##_gates[] = { \
+		GATE(#_name, 0, 0),					\
+	};								\
+	static const struct sf19a2890_periphcrm_data sf19a2890_##_name##_crm = \
+		CRM_DATA(_name, single)
+
+SINGLE_CRM(i2c0);
+SINGLE_CRM(pwm);
+SINGLE_CRM(timer);
+SINGLE_CRM(wdt);
+SINGLE_CRM(gpio);
+
+static int sf19a2890_periphcrm_probe(struct platform_device *pdev)
+{
+	const struct sf19a2890_periphcrm_data *data;
+	struct device *dev = &pdev->dev;
+	struct sf19a2890_periphclk *gates;
+	struct sf19a2890_periphcrm *crm;
+	u32 valid_gates = 0;
+	unsigned int i;
+	int ret;
+	u32 reg;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	crm = devm_kzalloc(dev, struct_size(crm, clk_data.hws, data->num_gates),
+			   GFP_KERNEL);
+	if (!crm)
+		return -ENOMEM;
+
+	crm->clk_data.num = data->num_gates;
+
+	gates = devm_kcalloc(dev, data->num_gates, sizeof(*gates), GFP_KERNEL);
+	if (!gates)
+		return -ENOMEM;
+
+	crm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crm->base))
+		return PTR_ERR(crm->base);
+
+	spin_lock_init(&crm->lock);
+
+	crm->reset_masks = data->reset_masks;
+	crm->rcdev.owner = THIS_MODULE;
+	crm->rcdev.nr_resets = data->num_resets;
+	crm->rcdev.ops = &sf19a2890_periphcrm_reset_ops;
+	crm->rcdev.of_node = dev->of_node;
+
+	ret = devm_reset_controller_register(dev, &crm->rcdev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Clear any stale bits outside the block's gates so the BOE-disable
+	 * check in periphclk_disable() works correctly.
+	 */
+	for (i = 0; i < data->num_gates; i++)
+		valid_gates |= BIT(data->gates[i].bit);
+	reg = readl(crm->base + REG_CLK_GATE) & valid_gates;
+	writel(reg, crm->base + REG_CLK_GATE);
+
+	for (i = 0; i < data->num_gates; i++) {
+		const struct clk_parent_data parent = { .index = i };
+		struct clk_init_data init = {
+			.name = data->gates[i].name,
+			.ops = &sf19a2890_periphclk_ops,
+			.parent_data = &parent,
+			.num_parents = 1,
+			.flags = data->gates[i].flags,
+		};
+
+		gates[i].crm = crm;
+		gates[i].idx = data->gates[i].bit;
+		gates[i].hw.init = &init;
+
+		ret = devm_clk_hw_register(dev, &gates[i].hw);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register gate %u\n", i);
+
+		crm->clk_data.hws[i] = &gates[i].hw;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					   &crm->clk_data);
+}
+
+static const struct of_device_id sf19a2890_periphcrm_dt_ids[] = {
+	{ .compatible = "siflower,sf19a2890-gmac-crm", .data = &sf19a2890_gmac_crm },
+	{ .compatible = "siflower,sf19a2890-gpio-crm", .data = &sf19a2890_gpio_crm },
+	{ .compatible = "siflower,sf19a2890-i2c-crm", .data = &sf19a2890_i2c0_crm },
+	{ .compatible = "siflower,sf19a2890-pwm-crm", .data = &sf19a2890_pwm_crm },
+	{ .compatible = "siflower,sf19a2890-rf-crm", .data = &sf19a2890_rf_crm },
+	{ .compatible = "siflower,sf19a2890-spi-crm", .data = &sf19a2890_spi_crm },
+	{ .compatible = "siflower,sf19a2890-timer-crm", .data = &sf19a2890_timer_crm },
+	{ .compatible = "siflower,sf19a2890-uart-crm", .data = &sf19a2890_uart_crm },
+	{ .compatible = "siflower,sf19a2890-usb-crm", .data = &sf19a2890_usb_crm },
+	{ .compatible = "siflower,sf19a2890-wdt-crm", .data = &sf19a2890_wdt_crm },
+	{ .compatible = "siflower,sf19a2890-wlan24-crm", .data = &sf19a2890_wlan24_crm },
+	{ .compatible = "siflower,sf19a2890-wlan5-crm", .data = &sf19a2890_wlan5_crm },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver sf19a2890_periphcrm_driver = {
+	.probe	= sf19a2890_periphcrm_probe,
+	.driver = {
+		.name		= "sf19a2890-periph-crm",
+		.of_match_table	= sf19a2890_periphcrm_dt_ids,
+	},
+};
+builtin_platform_driver(sf19a2890_periphcrm_driver);

-- 
Git-155)


