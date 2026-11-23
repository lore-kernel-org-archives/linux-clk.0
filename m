Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452008;
	b=oCRgdd2sbzqfs2jMJDlyAnYQ5Pq9QhNPFUuhyK3lDpGj1qkXTdKPpgClrK44dP9Ef78O
	 sNkp3uA5ig7UAt3QOV5ErMVNSpWzbKhuaQzDzNTLzps2Y2YFZCD10FkLrqYA83WlupPJg
	 JG4leojphZuaUtv1DnKGFGzmzP4jf6vfKx9IVzwihuI+5uV3+MP8eyZNd/5fPHcgxs7oi
	 nKCcaiibNrmKAcLwzVhHObX7Hjt1CFLIWpotiiwM/air+dz9RxIgc8/fHuX5IQxUG4dPX
	 KI5DpqkiwRliUlgYl+wdGkxpDpptDfiICAM8a+Uqunelf+2tD8itdeCTk1+LmW46/AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452008;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mK2x9J8DRMq47yHdDKKSaXJTWWVVEzbLr5jIKSSbArc=;
	b=HrxqHr9se0OrCAWwoz4+w5ygsrnjJi3wcUQdBY/VJIfrM3SkXdkbdyc0cgQjQUWJmnb5
	 pmBIgFbwBRLlBFDY173ywN0/cHr4VpQazKcmN7TCbRjvumAY1VrdhkpTOZJhkuUYGrJGg
	 +rLXVr/innI2USyJE73BWwhL6SPaWRT5ZpFQclrbHf2K254+TkbToRgi+XeuRaO8nVZrL
	 r3ad/gGQ+9ugZJb6h+ATBImaQRiMlvTLl/YWlSMOao+t8Qz2o/dp8zSbPW2EKjypUE9Vw
	 mVYZeSFsq7m2cqH2rt7vwNDm/1HsPikJDUYGawRsEAgZtkw6TLKXiTCvdLqqE2k1JKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlVOuSfP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A48606A335;
	Mon, 23 Nov 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BlVOuSfP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1831F000D1;
	Mon, 23 Nov 2026 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452008;
	bh=mK2x9J8DRMq47yHdDKKSaXJTWWVVEzbLr5jIKSSbArc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BlVOuSfPnOF1qPwAm9fG4jwG4wGmJpVBuusA2i92aNgvxFW6qqIq/l+55FeLBHbtE
	 nKYN4x9so8tcgzf+Y1L7ox7wqTc9tv2QeNc9M3qNy/HCuCH4E4T/NF4NTpja7+Jl5Z
	 +mwyUQxDwSatRvSfsxY46jiABmaxGv0MRr6UPvOS90VykRMrrtREvlQLPwuMqWbKE4
	 lbCItL5t3FbASk8FD2NpNhkpHtZsiBqerMfwhgy/Zvl/GtohsGDp5ufRRrS7sV8Syp
	 gP/LIvWPQXF072lvuo2+T4/x/wVRqShqGRdcKvN/rLthszVcgb3P+zTZ1tYF8GPLSn
	 x51Ya/uPwir8Q==
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
Subject: Re: [PATCH v4 4/4] clk: siflower: Add SF19A2890 peripheral clock
 and reset manager driver
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261122-sf19a2890-sysm-v4-4-bbfe1c495e2e@telaak.dev>
References: <20261122-sf19a2890-sysm-v4-0-bbfe1c495e2e@telaak.dev>
 <20261122-sf19a2890-sysm-v4-4-bbfe1c495e2e@telaak.dev>
Date: Mon, 23 Nov 2026 11:39:57 -0500
Message-Id: <179545199778.209212.2921325243361338047.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=9478; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=2uVT9SbP2VytXAdgMdFr8rIK+phVKpZnhIuGO3jzqvE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZchL9WQPLL36uu+TQYZxR2r1q8X+R7mLfwNKPIQsnX
 jN8HJHUUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEQ+tjMyvPSXtivInPEmLvd4
 /HuRtVkpCkt5i7KfXueLDN+wxqpJlJFh1Yz1rz14JRwFTLU2TFRfHBIiZvvyecPPPLHvPTdCPc6
 yAgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joseph,

> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
> 
> Each CRM block manages a group of APB peripherals through three registers:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
> 
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
> 
> Some peripherals have more than one reset line, one for each clock
> domain of the same IP. The driver exposes each such group as one reset,
> because the lines have to be asserted together:
> 
>   - GMAC: bits 0-1 are the two sides of an asynchronous AXI bridge, and
>     asserting one alone locks up the bus.
>   - SPI: bits 4-5 are the PL022's PRESETn and nSSPRST, and its TRM
>     requires nSSPRST to be asserted with PRESETn.
>   - UART: bits 0-2 are the PL011s' PRESETn and bits 4-6 their nUARTRST,
>     with the same requirement in the PL011 TRM.
>   - USB: bits 0-2 are the DWC2 controller's clock domains, its AXI
>     master among them.
>   - WLAN: bits 0-2 are the AXI slave, AXI master and platform domains.

There's a lot of low level detail here. Give a more high level overview
of what's here.

> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - one compatible per block, with its gate bits, critical gates and
>     reset masks in tables in the driver instead of the
>     siflower,valid-gates, siflower,critical-gates,
>     siflower,reset-masks and siflower,num-resets properties
>   - parent gate N to input clock N by index, not by global name
>   - update the gates under the spinlock too, taken with guard()
>   - drop the separator comments
>   - Kconfig dependencies and help, subject]
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  MAINTAINERS                                    |   1 +
>  drivers/clk/siflower/Kconfig                   |  11 +
>  drivers/clk/siflower/Makefile                  |   1 +
>  drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 362 +++++++++++++++++++++++++
>  4 files changed, 375 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47a3a72a5d08..34ff7ec0b60e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25704,6 +25704,7 @@ L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
>  F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
> +F:	drivers/clk/siflower/clk-sf19a2890-periphcrm.c
>  F:	drivers/clk/siflower/clk-sf19a2890.c
>  F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
>  F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
> diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfig
> index ad1b04b4bb9b..4fa6dd156b8a 100644
> --- a/drivers/clk/siflower/Kconfig
> +++ b/drivers/clk/siflower/Kconfig
> @@ -9,3 +9,14 @@ config CLK_SF19A2890
>  	  and the muxes and dividers that feed the CPU, the buses and the
>  	  peripherals. The GIC timer runs from the CPU clock, so a kernel
>  	  for this SoC needs it built in.
> +
> +config CLK_SF19A2890_PERIPHCRM
> +	bool "Clock and reset driver for Siflower SF19A2890 peripherals"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	default MACH_SIFLOWER_MIPS
> +	select RESET_CONTROLLER
> +	help
> +	  Supports the peripheral clock and reset managers of the Siflower
> +	  SF19A2890. Each peripheral block has one, with its clock gates,
> +	  its resets and the bus output enable it needs to answer bus
> +	  requests.
> diff --git a/drivers/clk/siflower/Makefile b/drivers/clk/siflower/Makefile
> index 3f4d689f7d9b..c4f4e0b8820d 100644
> --- a/drivers/clk/siflower/Makefile
> +++ b/drivers/clk/siflower/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_CLK_SF19A2890) += clk-sf19a2890.o
> +obj-$(CONFIG_CLK_SF19A2890_PERIPHCRM) += clk-sf19a2890-periphcrm.o
> diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
> new file mode 100644
> index 000000000000..c3642fb743b4
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Siflower SF19A2890 peripheral clock and reset manager driver.
> + *
> + * Each managed block has three registers:
> + *   RESET    at base + 0x0  - per-peripheral reset bitmasks
> + *   CLK_GATE at base + 0x4  - one bit per clock gate
> + *   BOE      at base + 0xc  - shared Bus Output Enable; bits [1:0] must be set
> + *                             for any APB peripheral in the block to respond
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device-id/of.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/clock/siflower,sf19a2890-periph-crm.h>
> +
> +#define REG_RESET	0x0
> +#define REG_CLK_GATE	0x4
> +#define REG_BOE		0xc
> +#define BOE_EN		GENMASK(1, 0)
> +
> +struct sf19a2890_periphcrm_gate {
> +	const char *name;
> +	u8 bit;
> +	unsigned long flags;
> +};
> +
> +struct sf19a2890_periphcrm_data {
> +	const struct sf19a2890_periphcrm_gate *gates;
> +	unsigned int num_gates;
> +	const u32 *reset_masks;
> +	unsigned int num_resets;
> +};
> +
> +struct sf19a2890_periphcrm {
> +	void __iomem *base;
> +	spinlock_t lock;	/* serializes all register updates */
> +	struct reset_controller_dev rcdev;
> +	const u32 *reset_masks;
> +	struct clk_hw_onecell_data clk_data;
> +};
> +
> +struct sf19a2890_periphclk {
> +	struct sf19a2890_periphcrm *crm;
> +	struct clk_hw hw;
> +	u32 idx;
> +};
> +
> +static inline struct sf19a2890_periphclk *hw_to_periphclk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct sf19a2890_periphclk, hw);
> +}
> +
> +static int sf19a2890_periphclk_enable(struct clk_hw *hw)
> +{
> +	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
> +	struct sf19a2890_periphcrm *crm = gate->crm;
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&crm->lock);
> +	reg = readl(crm->base + REG_CLK_GATE);
> +	writel(reg | BIT(gate->idx), crm->base + REG_CLK_GATE);
> +	writel(BOE_EN, crm->base + REG_BOE);
> +	return 0;
> +}
> +
> +static void sf19a2890_periphclk_disable(struct clk_hw *hw)
> +{
> +	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
> +	struct sf19a2890_periphcrm *crm = gate->crm;
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&crm->lock);
> +	reg = readl(crm->base + REG_CLK_GATE);
> +	reg &= ~BIT(gate->idx);
> +	writel(reg, crm->base + REG_CLK_GATE);
> +	if (reg == 0)
> +		writel(0, crm->base + REG_BOE);
> +}
> +
> +static int sf19a2890_periphclk_is_enabled(struct clk_hw *hw)
> +{
> +	struct sf19a2890_periphclk *gate = hw_to_periphclk(hw);
> +	struct sf19a2890_periphcrm *crm = gate->crm;
> +
> +	return !!(readl(crm->base + REG_CLK_GATE) & BIT(gate->idx));
> +}
> +
> +static const struct clk_ops sf19a2890_periphclk_ops = {
> +	.enable = sf19a2890_periphclk_enable,
> +	.disable = sf19a2890_periphclk_disable,
> +	.is_enabled = sf19a2890_periphclk_is_enabled,
> +};
> +
> +static inline struct sf19a2890_periphcrm *
> +rcdev_to_periphcrm(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct sf19a2890_periphcrm, rcdev);
> +}
> +
> +static int sf19a2890_periphcrm_reset_update(struct reset_controller_dev *rcdev,
> +					    unsigned long id, bool assert)
> +{
> +	struct sf19a2890_periphcrm *crm = rcdev_to_periphcrm(rcdev);
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&crm->lock);
> +	reg = readl(crm->base + REG_RESET);
> +	if (assert)
> +		reg |= crm->reset_masks[id];
> +	else
> +		reg &= ~crm->reset_masks[id];
> +	writel(reg, crm->base + REG_RESET);
> +	return 0;
> +}
> +
> +static int sf19a2890_periphcrm_reset_assert(struct reset_controller_dev *rcdev,
> +					    unsigned long id)
> +{
> +	return sf19a2890_periphcrm_reset_update(rcdev, id, true);
> +}
> +
> +static int
> +sf19a2890_periphcrm_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return sf19a2890_periphcrm_reset_update(rcdev, id, false);
> +}
> +
> +static int sf19a2890_periphcrm_reset_status(struct reset_controller_dev *rcdev,
> +					    unsigned long id)
> +{
> +	struct sf19a2890_periphcrm *crm = rcdev_to_periphcrm(rcdev);
> +
> +	return !!(readl(crm->base + REG_RESET) & crm->reset_masks[id]);
> +}
> +
> +static const struct reset_control_ops sf19a2890_periphcrm_reset_ops = {
> +	.assert = sf19a2890_periphcrm_reset_assert,
> +	.deassert = sf19a2890_periphcrm_reset_deassert,
> +	.status = sf19a2890_periphcrm_reset_status,
> +};

Please move the reset functionality to drivers/reset. You can use either
the auxiliary device or MFD.

Brian

-- 
Brian Masney <masneyb@kernel.org>
