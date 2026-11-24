Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540364;
	b=bj7dBz2tv07S+rb6izEXjWdNd0tbNig8OCX8+Lr67sn97UTaZiK7X7nlnZmTWfvMytBH
	 h/uMOyppKrjlHQdF/4Nzlc4MjestBLzzpxD+Hoxy/Q47n1J+6o9D6YDQxbu36JZ/61KfZ
	 v37erE0N3TU7oDwLAYggzSSWT6ozaeWSuumrevBHkrTUTnIruvCEB6TmX3l+xE6NnzLtO
	 dB8k9MismWZKELlWgpeC6GLNVpws6t3wvs0430M+loHfN3Lv55gL//CT692DyulqFvfB6
	 /V/QrBWKhIGKjfDSSEXC5+t86vEknLMfnSSZTsHDcCNLXZd9Fp2lSjivGMYoWEyeV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540364;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=tZicJN8WSvhii4IUoQLB2IJqpXlbaB7rrJrQ3BqZbkM=;
	b=0z0fHP2V+No6v6e1yfOoun8J1JYmoRb+ptjPrWKIQLXRqW7UdAgwon7pRQ8Gbed+NrSR
	 g1WAOxtwnUVW6xy9CLJu2aIJxQSzF3OzCiCbMeIWQ0kOfVRfQWPHeX/rqaLeY00KcSId/
	 nt5VbZvW2PtPdvjjGVX8dPYiKgzCEC7xctlb7/0rATNUSbqRTrJwkzSTp7kj649dqsNsq
	 wAeUf0Mm5eO66U/8bZSeG8RN2sATEJ6Iqa6XeI3+k00Y06vfWkvcfMw0YfoFcZZ7L/qmT
	 W+StQCk+ZkbTigIg256ap7ugqiiCNqhevasmpM6OrOzs9ZjSMoknA0tEwYYIXaVwYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VclK5N1A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D44606A31E;
	Tue, 24 Nov 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VclK5N1A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227561F000D0;
	Tue, 24 Nov 2026 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540363;
	bh=tZicJN8WSvhii4IUoQLB2IJqpXlbaB7rrJrQ3BqZbkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VclK5N1AUX7DTqF7jzIbm3VG+FBxriINu/7v1LZqHYNcEMYH47kgVIPWLcbqIWogf
	 lO87PK3T2sE+iAVfg7veEHPYvXFsaOCrBTQb23rAabjZHGKjQ06Zosg8SDc0K3GVUU
	 ej7R/5NkQNghALpIthFdi0fjfPI9Bv1i6oxF4hrVNIPOQZ6klNLcF+TlFTf8p9JdF3
	 AzFANgjSahL56QC+qe3V+WuPeB/X+D4Coc08sz1YlbGtP2zbH0ZpEPCK0BBPNPeejO
	 W+JYvpjje4cZEY7rFoSDFOtzWo+qwYQZhW5ex4McaEk+5E+jWaFgrgdJIHzemBxIG/
	 a4vgwlLsHOZ8w==
Date: Tue, 24 Nov 2026 12:12:38 -0500
From: Brian Masney <masneyb@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
Message-ID: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Fil,

On Tue, Nov 24, 2026 at 12:50:59AM +0300, Fil Dunsky wrote:
> Register PCIe gates and controller resets through the early global
> provider. Add the network engine composite reset using the same syscon
> regmap, with the existing 1 us/1000 us readback polling and partial-domain
> status error from the posted NE reset driver. Keep the PCIe reset pulse
> delays and all provider-registration failure cleanup. NE pulse reset
> remains unsupported; the Ethernet consumer needs assert/deassert/status.
> 
> Both independent consumers can use this common provider without a
> PCIe-host dependency or a resource-less network reset child.
> 
> AI assistance: Codex prepared this draft from the posted CS7542 series.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/clk/Kconfig      |   7 +-
>  drivers/clk/clk-cs7542.c | 211 ++++++++++++++++++++++++++++++++++++++++++-----
>  2 files changed, 195 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 47b5265fe..cba07bed3 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -59,13 +59,16 @@ config LMK04832
>  	  Low-Noise JESD204B Compliant Clock Jitter Cleaner With Dual Loop PLLs
>  
>  config COMMON_CLK_CS7542
> -	bool "Cortina Systems CS7542 strap-selected clocks"
> +	bool "Cortina Systems CS7542 global clocks and resets"
>  	depends on OF && HAS_IOMEM
>  	select MFD_SYSCON
> +	select RESET_CONTROLLER
>  	help
>  	  Read the boot straps of the CS7542 global control block to provide
>  	  its APB, CPU and AXI clocks. This driver does not change PLLs or
> -	  dividers. It is built in because the APB clock is needed by timers.
> +	  dividers. It also provides the three PCIe clock gates and resets,
> +	  and the exclusive network engine and DMA-LSO/SSP reset domain.
> +	  It is built in because the APB clock is needed by timers.
>  
>  config COMMON_CLK_APPLE_NCO
>  	tristate "Clock driver for Apple SoC NCOs"
> diff --git a/drivers/clk/clk-cs7542.c b/drivers/clk/clk-cs7542.c
> index 4e6c1e98a..17b7109a9 100644
> --- a/drivers/clk/clk-cs7542.c
> +++ b/drivers/clk/clk-cs7542.c
> @@ -1,24 +1,29 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Cortina Systems CS7542 strap-selected clocks */
> +/* Cortina Systems CS7542 global clocks and reset domains. */
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/printk.h>
>  #include <linux/regmap.h>
> +#include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  
>  #include <dt-bindings/clock/cortina,cs7542-clock.h>
> +#include <dt-bindings/reset/cortina,cs7542-reset.h>
>  
>  #define CS7542_GLOBAL_STRAP	0x0c
>  #define CS7542_STRAP_SPEED	GENMASK(3, 1)
> -#define CS7542_NUM_CLKS		3
> +#define CS7542_NUM_FIXED_CLKS	3
> +#define CS7542_NUM_CLKS		6
>  
>  /* Rates from the GPL vendor kernel's get_platform_clk(). */
> -static const unsigned long cs7542_rates[][CS7542_NUM_CLKS] = {
> +static const unsigned long cs7542_rates[][CS7542_NUM_FIXED_CLKS] = {
>  	/* APB, CPU, AXI */
>  	{ 100000000, 400000000, 133333333 },
>  	{ 100000000, 600000000, 150000000 },
> @@ -33,14 +38,142 @@ static const char * const cs7542_clock_names[] = {
>  	[CS7542_CLK_APB] = "cs7542-apb",
>  	[CS7542_CLK_CPU] = "cs7542-cpu",
>  	[CS7542_CLK_AXI] = "cs7542-axi",
> +	[CS7542_CLK_PCIE0] = "cs7542-pcie0",
> +	[CS7542_CLK_PCIE1] = "cs7542-pcie1",
> +	[CS7542_CLK_PCIE2] = "cs7542-pcie2",
> +};
> +
> +#define CS7542_PORTS	3
> +#define CS7542_NUM_RESETS	4
> +/* NI, FE, TM, SCH, QM, DMA-LSO/SSP, NI XRAM; never reset SDRAM (bit 4). */
> +#define CS7542_NE_RESET_MASK	(GENMASK(3, 0) | BIT(5) | BIT(16) | BIT(17))
> +#define GLOBAL_RESET	0x04
> +#define GLOBAL_CONFIG	0x10
> +
> +struct cs7542_gate {
> +	struct clk_hw hw;
> +	struct regmap *map;
> +	u32 mask;
> +};
> +
> +struct cs7542_control {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +	struct cs7542_gate gates[CS7542_PORTS];
> +	struct clk_hw_onecell_data *clks;
> +};
> +
> +static int cs7542_gate_prepare(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +
> +	return regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, gate->mask);
> +}
> +
> +static void cs7542_gate_unprepare(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +
> +	regmap_update_bits(gate->map, GLOBAL_CONFIG, gate->mask, 0);
> +}
> +
> +static int cs7542_gate_is_prepared(struct clk_hw *hw)
> +{
> +	struct cs7542_gate *gate = container_of(hw, struct cs7542_gate, hw);
> +	unsigned int value;
> +	int ret;
> +
> +	ret = regmap_read(gate->map, GLOBAL_CONFIG, &value);
> +	return ret ? ret : !!(value & gate->mask);
> +}
> +
> +static const struct clk_ops cs7542_gate_ops = {
> +	.prepare = cs7542_gate_prepare,
> +	.unprepare = cs7542_gate_unprepare,
> +	.is_prepared = cs7542_gate_is_prepared,
> +};
> +
> +static int cs7542_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
> +	unsigned int value;
> +	u32 mask, target;
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	mask = id == CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id);
> +	target = assert ? mask : 0;
> +	ret = regmap_update_bits(ctl->map, GLOBAL_RESET, mask, target);
> +	if (ret || id != CS7542_RESET_NE)
> +		return ret;
> +	return regmap_read_poll_timeout(ctl->map, GLOBAL_RESET, value,
> +				       (value & mask) == target, 1, 1000);
> +}
> +
> +static int cs7542_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, true);
> +}
> +
> +static int cs7542_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return cs7542_reset_update(rcdev, id, false);
> +}
> +
> +static int cs7542_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct cs7542_control *ctl = container_of(rcdev, struct cs7542_control, rcdev);
> +	unsigned int value;
> +	u32 mask;
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	mask = id == CS7542_RESET_NE ? CS7542_NE_RESET_MASK : BIT(6 + id);
> +	ret = regmap_read(ctl->map, GLOBAL_RESET, &value);
> +	if (ret)
> +		return ret;
> +	value &= mask;
> +	if (id == CS7542_RESET_NE && value && value != mask)
> +		return -EIO;
> +	return !!value;
> +}
> +
> +static int cs7542_reset_pulse(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	int ret;
> +
> +	if (id >= CS7542_NUM_RESETS)
> +		return -EINVAL;
> +	if (id == CS7542_RESET_NE)
> +		return -EOPNOTSUPP;
> +
> +	ret = cs7542_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	ret = cs7542_reset_deassert(rcdev, id);
> +	if (ret)
> +		return ret;
> +	usleep_range(10000, 12000);
> +	return 0;
> +}
> +
> +static const struct reset_control_ops cs7542_reset_ops = {
> +	.assert = cs7542_reset_assert,
> +	.deassert = cs7542_reset_deassert,
> +	.status = cs7542_reset_status,
> +	.reset = cs7542_reset_pulse,
>  };

The reset driver goes under drivers/reset.

Also you posted 4 different patch series for clk drivers for this same
SoC. Please post them all together as one to make the review easier.

Brian
