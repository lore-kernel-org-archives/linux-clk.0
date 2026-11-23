Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795398076;
	b=NOg9IgyzdgUHx23co9JzztF0dr1iGGq6/mrA6N/6OyqllErUTjaK852d8yUaq/iaXzfq
	 onAOFeUrpWruOCMy/bjRiIwOCKFyhIaFfrIlgeqlLP3Qoc0jVZh6yW+1WfYZeBxuiO9c2
	 TbHKTD67YMIBCCZhCvhr5Zmu3T/Ws8jPXTr26jATVtRq/S4M/mgd3ADyr/jmC1qRUcZ2e
	 NBLucBMqxthVPwOn43Xh+FmeIGdlDrplELn+82ZaLpdx6xaaADGwJQ/Xh98YYROGjSluR
	 mbbzOOzP1nlOu5JhiTag6/e4CNzwS8rOLFK794Q10+sFnjTlBeJhv6wRBYR0FwqYYnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398076;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=zyk0lkblMaWnMFaLlPoBo8LEiluXXuEU5ZulFYwpvk4=;
	b=CEpdC90//w8e06GJq+YAP4O7CpwEJu/vC+Iwv2bGmOIv7Hg0YdByLFWzyxteHxbIhnMq
	 4yDvdRFkSwREfYP26KX+3oeJryZTZtXMTA26JtqgMXMCDHxF+dyaPDW4VTXmteHcIvwtE
	 2Uf6B8lag8ljmpyFHnr3P0dvTKyR+1wHpbE6oYf8g0vtTaTCwsiaRh1okw//ayAc0h2jT
	 e8jdLDr/EvQKEM5eql7ZbAkiaAfwVl4bGVMfcDi6pLs7IXQNQ5kYfBJw5fROe23AQKf8z
	 J2z3kw36A/98nlHwB2o6OAC4CjN8mcpzT48fjIJ/o3eTkXLQURwpJaAENxn8/sdl0fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7vBrGiq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECCD606A31D;
	Mon, 23 Nov 2026 01:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7vBrGiq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795398075;
	b=jlB/ayKdfrdSgbC3+Hyb3GWBH+aXEVbXeukkV7OEjrmeQxg0ET5301k6Zw9HC/Gf5Xcm
	 P3TvxFO5r8iYGm4wa4EXB6v8IKZomQiGIgKm2wqivfUMayTeCWugytowUt4qOsfOka+DL
	 LK87MGOztJ45nx6unJm9Fi0jETB8SRd/7mKY2ScxteSQicbZZpBHeASDukBIrUkQbUEXi
	 RY3m8etzH0HqX3MYfWy0o4rpLOaYFieOVHyfR8VZTIbFNA/bvK/cZbbCJZYof77ohYhpW
	 SKfJwNoHROuIgWlqDOX16n4DfAG9j8d1+drEDqp7k1BV44FEw8xllVff04NYPD9ZA/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795398075;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zyk0lkblMaWnMFaLlPoBo8LEiluXXuEU5ZulFYwpvk4=;
	b=pmkvSS3iAE3qvYgnGVFh6DHfvLE37NhxD24W3uO1SmY9AYVs4obLyhQPcL5wIHerUu84
	 aWPAqDsosGMp68oLT+Ll+j3y/FzXoVbJ1vMlhVzBU0GbhN2IUEOEyQMjqmzHuSEDHOjJ9
	 +quNiZ8cqhknmOD/ToHLLv2LXlGj9AWXfows7X+plSBD5bC4iPA9ToFRQlJ6EFpbaQXa5
	 U60gKxejrFTM81dRSLc2GZ+BTeQFE9r7jELqwmFil1Nj2eGgAepLLSh/wIzbuwpijnNGD
	 dHm98dAGs0Qz1EbL5kwHPW480avvuBNaayBqAdQ1hMLSFbR2gXUxZJerjNVrWj40fFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10B621F000D3;
	Mon, 23 Nov 2026 01:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795398075;
	bh=zyk0lkblMaWnMFaLlPoBo8LEiluXXuEU5ZulFYwpvk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=i7vBrGiqymK9yC08R25SwZisoZBfruEky4gZHQ/VXkZlo6RBOrQM9aCTUD0BgoazE
	 /ay/NJ5xuod+uDP4GKHo73iNomnQyuUhuM3P2TZ049H9+LdmZn+m/Od+wVmAHQyqpD
	 HoBG6Lz/RVfTSM3+dI/NhMLrs8yf4SEgPyQFM3+JzvsB4jOQtGTE6C3x9Rmiy0k4kF
	 d872MBKdURPgDbMMB1LQ52qRnQGMLEaazQmWn8ilV86PIO3UvTAk9YW8zCiggLaj6P
	 SxWA/fViay4MGqfqh61ro8KVNF7gUO+Vl+HMXlk+Pea/d1Xrt/9+dgQz+40zbcVtua
	 nmOyZHWNlgGPw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91E2E4C2D8;
	Mon, 23 Nov 2026 01:41:03 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 22 Nov 2026 20:40:59 -0500
Subject: [PATCH v4 4/4] clk: siflower: Add SF19A2890 peripheral clock and
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
Message-Id: <20261122-sf19a2890-sysm-v4-4-bbfe1c495e2e@telaak.dev>
References: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
In-Reply-To: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795398062; l=16040;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=UF6fltw951e726/kEe6ZxPIqFxMRB2dONJ1MhwuIKrI=;
 b=dg50aSw18HN4QaRxMrrMdBMlvLFO/vyeEpsTy6OguM6XCam/svavz0YlsybPOGZ4i290aoLXM
 Kw0LrWSJXp7DXNherDEOQ3+JshKSCS+Nm+6APbA1ZzHtgLXfwQW9YMV
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

Some peripherals have more than one reset line, one for each clock
domain of the same IP. The driver exposes each such group as one reset,
because the lines have to be asserted together:

  - GMAC: bits 0-1 are the two sides of an asynchronous AXI bridge, and
    asserting one alone locks up the bus.
  - SPI: bits 4-5 are the PL022's PRESETn and nSSPRST, and its TRM
    requires nSSPRST to be asserted with PRESETn.
  - UART: bits 0-2 are the PL011s' PRESETn and bits 4-6 their nUARTRST,
    with the same requirement in the PL011 TRM.
  - USB: bits 0-2 are the DWC2 controller's clock domains, its AXI
    master among them.
  - WLAN: bits 0-2 are the AXI slave, AXI master and platform domains.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[Joseph Telaak:
  - take it from Chuanhong's siflower-7.1 branch
  - one compatible per block, with its gate bits, critical gates and
    reset masks in tables in the driver instead of the
    siflower,valid-gates, siflower,critical-gates,
    siflower,reset-masks and siflower,num-resets properties
  - parent gate N to input clock N by index, not by global name
  - update the gates under the spinlock too, taken with guard()
  - drop the separator comments
  - Kconfig dependencies and help, subject]
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Co-developed-by: Joseph Telaak <joseph@telaak.dev>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                                    |   1 +
 drivers/clk/siflower/Kconfig                   |  11 +
 drivers/clk/siflower/Makefile                  |   1 +
 drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 362 +++++++++++++++++++++++++
 4 files changed, 375 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 47a3a72a5d08..34ff7ec0b60e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25704,6 +25704,7 @@ L:	linux-clk@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
 F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
+F:	drivers/clk/siflower/clk-sf19a2890-periphcrm.c
 F:	drivers/clk/siflower/clk-sf19a2890.c
 F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
 F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
index ad1b04b4bb9b..4fa6dd156b8a 100644
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
index 3f4d689f7d9b..c4f4e0b8820d 100644
--- a/drivers/clk/siflower/Makefile
+++ b/drivers/clk/siflower/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CLK_SF19A2890) += clk-sf19a2890.o
+obj-$(CONFIG_CLK_SF19A2890_PERIPHCRM) += clk-sf19a2890-periphcrm.o
diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
new file mode 100644
index 000000000000..c3642fb743b4
--- /dev/null
+++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+#include <linux/device-id/of.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/siflower,sf19a2890-periph-crm.h>
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
+	u32 reg;
+
+	guard(spinlock_irqsave)(&crm->lock);
+	reg = readl(crm->base + REG_CLK_GATE);
+	writel(reg | BIT(gate->idx), crm->base + REG_CLK_GATE);
+	writel(BOE_EN, crm->base + REG_BOE);
+	return 0;
+}
+
+static void sf19a2890_periphclk_disable(struct clk_hw *hw)
+{
+	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
+	struct sf19a2890_periphcrm *crm = gate->crm;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&crm->lock);
+	reg = readl(crm->base + REG_CLK_GATE);
+	reg &= ~BIT(gate->idx);
+	writel(reg, crm->base + REG_CLK_GATE);
+	if (reg == 0)
+		writel(0, crm->base + REG_BOE);
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
+	u32 reg;
+
+	guard(spinlock_irqsave)(&crm->lock);
+	reg = readl(crm->base + REG_RESET);
+	if (assert)
+		reg |= crm->reset_masks[id];
+	else
+		reg &= ~crm->reset_masks[id];
+	writel(reg, crm->base + REG_RESET);
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
+	[CLK_GMAC_BUS] = GATE("gmac", 0, 0),
+	[CLK_GMAC_REG] = GATE("gmac_pclk", 1, 0),
+	[CLK_GMAC_TX_REF] = GATE("gmac_byp_ref", 2, 0),
+	[CLK_GMAC_TSU] = GATE("ethtsu", 3, 0),
+};
+
+static const u32 sf19a2890_gmac_resets[] = { [RST_GMAC] = GENMASK(1, 0) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_gmac_crm =
+	CRM_DATA(gmac, gmac);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan24_gates[] = {
+	[CLK_WLAN24_AXIS] = GATE("wlan24_axis", 0, 0),
+	[CLK_WLAN24_AXIM] = GATE("wlan24_axim", 1, 0),
+	[CLK_WLAN24_PLF] = GATE("wlan24_plf", 2, 0),
+};
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_wlan5_gates[] = {
+	[CLK_WLAN5_AXIS] = GATE("wlan5_axis", 0, 0),
+	[CLK_WLAN5_AXIM] = GATE("wlan5_axim", 1, 0),
+	[CLK_WLAN5_PLF] = GATE("wlan5_plf", 2, 0),
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
+	[CLK_RF_TEST] = GATE("rf_dft", 0, 0),
+	[CLK_RF_AXIS] = GATE("rf_axis", 1, 0),
+	[CLK_RF_BOOT] = GATE("rf_boot", 2, 0),
+	[CLK_RF_LP] = GATE("rf_lp", 3, 0),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_rf_crm =
+	CRM_DATA(rf, wlan);
+
+/* Nothing describes a consumer of usb_axim, and gating it is not safe */
+static const struct sf19a2890_periphcrm_gate sf19a2890_usb_gates[] = {
+	[CLK_USB] = GATE("usb", 0, 0),
+	[CLK_USB_AXIM] = GATE("usb_axim", 2, CLK_IS_CRITICAL),
+	[CLK_USB_PHY_REF] = GATE("usbphy_ref", 3, 0),
+};
+
+static const u32 sf19a2890_usb_resets[] = {
+	[RST_USB] = GENMASK(2, 0),
+	[RST_USB_PHY_POR] = BIT(3),
+	[RST_USB_PHY] = BIT(4),
+};
+
+static const struct sf19a2890_periphcrm_data sf19a2890_usb_crm =
+	CRM_DATA(usb, usb);
+
+static const struct sf19a2890_periphcrm_gate sf19a2890_spi_gates[] = {
+	[CLK_SPI_APB] = GATE("spi_apb", 4, 0),
+	[CLK_SPI_SSP] = GATE("spi_ssp", 5, 0),
+};
+
+static const u32 sf19a2890_spi_resets[] = { [RST_SPI] = GENMASK(5, 4) };
+
+static const struct sf19a2890_periphcrm_data sf19a2890_spi_crm =
+	CRM_DATA(spi, spi);
+
+/* UART0 carries the console from the bootloader on */
+static const struct sf19a2890_periphcrm_gate sf19a2890_uart_gates[] = {
+	[CLK_UART0_APB] = GATE("uart0_apb", 0, CLK_IS_CRITICAL),
+	[CLK_UART1_APB] = GATE("uart1_apb", 1, 0),
+	[CLK_UART2_APB] = GATE("uart2_apb", 2, 0),
+	[CLK_UART0] = GATE("uart0", 4, CLK_IS_CRITICAL),
+	[CLK_UART1] = GATE("uart1", 5, 0),
+	[CLK_UART2] = GATE("uart2", 6, 0),
+};
+
+static const u32 sf19a2890_uart_resets[] = {
+	[RST_UART0] = BIT(0) | BIT(4),
+	[RST_UART1] = BIT(1) | BIT(5),
+	[RST_UART2] = BIT(2) | BIT(6),
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
+	{ /* sentinel */ }
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


