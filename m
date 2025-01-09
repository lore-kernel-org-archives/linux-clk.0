Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589B204089;
	Thu,  9 Jan 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413751; cv=none; b=MkCueNVg3StI6t+igiDibrbWqkONESUcGiQ10oPYb0p7i203TxiMxRjr5gr/djUJL4I+0cTln49ZkqFlgxwgPTme/TsmJViMS5qvd686l32bM9XwX2/upYjjx/lWY7GCti/U7jUjU64bULwylOIoz9niKhuODghw/tMF0+osDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413751; c=relaxed/simple;
	bh=+C/mtPc8iGLYxE9PyPfLPavd2M332vHt5s3DSZ3Nwqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMX/L3kERUWrsrXfOl2a6rIUPe2250qkXaPzLBw06bGEKmvl2Wf/gUh7iCB1g+LLj3iJKXED1gNoX1UyPNwc5/Xf6ym8EyJMthhhSVX7GeA4t60jxa77mfakI22s5ojJdK9pj1UKUew6nFGK0HkWchRgvHWWskULOsB5b9kg8nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKSFHlaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKSFHlaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D53BC4CED2;
	Thu,  9 Jan 2025 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413750;
	bh=+C/mtPc8iGLYxE9PyPfLPavd2M332vHt5s3DSZ3Nwqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKSFHlaO6bRHZl1BUF8Eyh42H/t16zn1TkrSxOnEQRetaksEk3eUQdyUJZiNMSRyk
	 niXVWRfYuVOWvoY7mmaRlgM/c+gTv+7qaptKWS4bxKyAUpng8v9/lZSH7gQXUuRRWs
	 AXTPQ74bRRWi/CQoPPGdTGjm1KQZyc4zsYTNit9wyah8vnC/DgW3jLHYVS1k3UQ8P6
	 DUz2cShCNBd7AqQHdOzJxLFwktUEYvfzKFZUu5xQqgykPMWtEsgsANlHT0Quu1uAwY
	 VMBwhrf7CmVhnGoewxqdAelcBVOcX9otNLSktMvVC/REyxN4CXsL9oZ+6QdH1zs6Ov
	 CE9gJgRSdeVpg==
Date: Thu, 9 Jan 2025 10:09:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v2 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <amccq3geq2mgmwcqz4ber7jws7oaxlqia4uh3kcmgoiwbw7cth@mfq6r6rfhbii>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-2-27b30a2ca52d@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-b4-k230-clk-v2-2-27b30a2ca52d@zohomail.com>

On Wed, Jan 08, 2025 at 07:53:08PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
> 
> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  drivers/clk/Kconfig    |    6 +
>  drivers/clk/Makefile   |    1 +
>  drivers/clk/clk-k230.c | 1424 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1431 insertions(+)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..f63355ab8adeeee90d29d1a975607f5dc0a58bd6 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>  	help
>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>  
> +config COMMON_CLK_K230
> +	bool "Clock driver for the Canaan Kendryte K230 SoC"
> +	depends on OF && (ARCH_CANAAN || COMPILE_TEST)
> +        help
> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
> +
>  config COMMON_CLK_SP7021
>  	tristate "Clock driver for Sunplus SP7021 SoC"
>  	depends on SOC_SP7021 || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
>  obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
>  obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
>  obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
> +obj-$(CONFIG_COMMON_CLK_K230)		+= clk-k230.o
>  obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
>  obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
>  obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..412944699a4e57502df4155fd0811d41444d15bc
> --- /dev/null
> +++ b/drivers/clk/clk-k230.c
> @@ -0,0 +1,1424 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + * Author: Troy Mitchell <troymitchell988@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/k230-clk.h>
> +#include <linux/bitfield.h>

Where is it used?

> +#include <linux/clk.h>

Are you sure you use it?

> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>

Not used?

> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

Where is it used?

> +#include <linux/of_clk.h>
> +#include <linux/of_device.h>

And this?

> +#include <linux/of_platform.h>

And this?

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +/* PLL control register bits. */
> +#define K230_PLL_BYPASS_ENABLE		BIT(19)
> +#define K230_PLL_GATE_ENABLE		BIT(2)
> +#define K230_PLL_GATE_WRITE_ENABLE	BIT(18)
> +#define K230_PLL_OD_SHIFT		24
> +#define K230_PLL_OD_MASK		0xF
> +#define K230_PLL_R_SHIFT		16
> +#define K230_PLL_R_MASK			0x3F
> +#define K230_PLL_F_SHIFT		0
> +#define K230_PLL_F_MASK			0x1FFFF
> +#define K230_PLL0_OFFSET_BASE		0x00
> +#define K230_PLL1_OFFSET_BASE		0x10
> +#define K230_PLL2_OFFSET_BASE		0x20
> +#define K230_PLL3_OFFSET_BASE		0x30
> +#define K230_PLL_DIV_REG_OFFSET		0x00
> +#define K230_PLL_BYPASS_REG_OFFSET	0x04
> +#define K230_PLL_GATE_REG_OFFSET	0x08
> +#define K230_PLL_LOCK_REG_OFFSET	0x0C
> +
> +/* PLL lock register bits.  */
> +#define K230_PLL_STATUS_MASK            BIT(0)
> +
> +/* K230 CLK registers offset */
> +#define K230_CLK_AUDIO_CLKDIV_OFFSET 0x34
> +#define K230_CLK_PDM_CLKDIV_OFFSET 0x40
> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET 0x38
> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET 0x3c
> +
> +/* K230 CLK MACROS */
> +#define K230_GATE_FORMAT(_reg, _bit, _reverse, _have_gate)                      \
> +	.gate_reg_off = (_reg),                                                 \
> +	.gate_bit_enable = (_bit),                                              \
> +	.gate_bit_reverse = (_reverse),                                         \
> +	.have_gate = (_have_gate)
> +
> +#define K230_RATE_FORMAT(_mul_min, _mul_max, _mul_shift, _mul_mask,             \
> +			_div_min, _div_max, _div_shift, _div_mask,		\
> +			_reg, _bit, _method, _reg_c, _bit_c,			\
> +			_mul_min_c, _mul_max_c, _mul_shift_c, _mul_mask_c,      \
> +			_have_rate, _have_rate_c)                               \
> +	.rate_mul_min = (_mul_min),                                             \
> +	.rate_mul_max = (_mul_max),                                             \
> +	.rate_mul_shift = (_mul_shift),                                         \
> +	.rate_mul_mask = (_mul_mask),                                           \
> +	.rate_mul_min_c = (_mul_min_c),                                         \
> +	.rate_mul_max_c = (_mul_max_c),                                         \
> +	.rate_mul_shift_c = (_mul_shift_c),                                     \
> +	.rate_mul_mask_c = (_mul_mask_c),                                       \
> +	.rate_div_min = (_div_min),                                             \
> +	.rate_div_max = (_div_max),                                             \
> +	.rate_div_shift = (_div_shift),                                         \
> +	.rate_div_mask = (_div_mask),                                           \
> +	.rate_reg_off = (_reg),                                                 \
> +	.rate_reg_off_c = (_reg_c),                                             \
> +	.rate_write_enable_bit = (_bit),                                        \
> +	.rate_write_enable_bit_c = (_bit_c),                                    \
> +	.method = (_method),                                                    \
> +	.have_rate = (_have_rate),                                              \
> +	.have_rate_c = (_have_rate_c)
> +
> +#define K230_MUX_FORMAT(_reg, _shift, _mask, _have_mux)                         \
> +	.mux_reg_off = (_reg),                                                  \
> +	.mux_reg_shift = (_shift),                                              \
> +	.mux_reg_mask = (_mask),                                                \
> +	.have_mux = (_have_mux)
> +
> +#define K230_GATE_FORMAT_ZERO K230_GATE_FORMAT(0, 0, 0, false)
> +#define K230_RATE_FORMAT_ZERO K230_RATE_FORMAT(0, 0, 0, 0, 0, 0,                \
> +						0, 0, 0, 0, 0, 0,		\
> +						0, 0, 0, 0, 0, false, false)
> +#define K230_MUX_FORMAT_ZERO K230_MUX_FORMAT(0, 0, 0, false)
> +
> +struct k230_sysclk;
> +
> +/* K230 PLLs. */
> +enum k230_pll_id {
> +	K230_PLL0, K230_PLL1, K230_PLL2, K230_PLL3, K230_PLL_NUM
> +};
> +
> +struct k230_pll {
> +	enum k230_pll_id id;
> +	struct k230_sysclk *ksc;
> +	void __iomem *div, *bypass, *gate, *lock;
> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_pll(_hw)	container_of(_hw, struct k230_pll, hw)
> +
> +struct k230_pll_cfg {
> +	u32 reg;
> +	enum k230_pll_id pll_id;
> +	const char *name;
> +};
> +
> +static struct k230_pll_cfg k230_pll_cfgs[] = {

Why this cannot be const?

> +	[K230_PLL0] = {
> +		.reg = K230_PLL0_OFFSET_BASE,
> +		.pll_id = K230_PLL0,
> +		.name = "pll0",
> +	},
> +	[K230_PLL1] = {
> +		.reg = K230_PLL1_OFFSET_BASE,
> +		.pll_id = K230_PLL1,
> +		.name = "pll1",
> +	},
> +	[K230_PLL2] = {
> +		.reg = K230_PLL2_OFFSET_BASE,
> +		.pll_id = K230_PLL2,
> +		.name = "pll2",
> +	},
> +	[K230_PLL3] = {
> +		.reg = K230_PLL3_OFFSET_BASE,
> +		.pll_id = K230_PLL3,
> +		.name = "pll3",
> +	},
> +};
> +
> +struct k230_pll_div {
> +	struct k230_sysclk *ksc;
> +	struct clk_hw *hw;
> +};
> +
> +struct k230_pll_div_cfg {
> +	const char *parent_name, *name;
> +	int div;
> +};
> +
> +/* K230 PLL_DIVS */
> +enum k230_pll_div_id {
> +	K230_PLL0_DIV2,
> +	K230_PLL0_DIV3,
> +	K230_PLL0_DIV4,
> +	K230_PLL1_DIV2,
> +	K230_PLL1_DIV3,
> +	K230_PLL1_DIV4,
> +	K230_PLL2_DIV2,
> +	K230_PLL2_DIV3,
> +	K230_PLL2_DIV4,
> +	K230_PLL3_DIV2,
> +	K230_PLL3_DIV3,
> +	K230_PLL3_DIV4,
> +	K230_PLL_DIV_NUM
> +};
> +
> +static struct k230_pll_div_cfg k230_pll_div_cfgs[] = {

And this?

> +	[K230_PLL0_DIV2] = { "pll0", "pll0_div2", 2},
> +	[K230_PLL0_DIV3] = { "pll0", "pll0_div3", 3},
> +	[K230_PLL0_DIV4] = { "pll0", "pll0_div4", 4},
> +	[K230_PLL1_DIV2] = { "pll1", "pll1_div2", 2},
> +	[K230_PLL1_DIV3] = { "pll1", "pll1_div3", 3},
> +	[K230_PLL1_DIV4] = { "pll1", "pll1_div4", 4},
> +	[K230_PLL2_DIV2] = { "pll2", "pll2_div2", 2},
> +	[K230_PLL2_DIV3] = { "pll2", "pll2_div3", 3},
> +	[K230_PLL2_DIV4] = { "pll2", "pll2_div4", 4},
> +	[K230_PLL3_DIV2] = { "pll3", "pll3_div2", 2},
> +	[K230_PLL3_DIV3] = { "pll3", "pll3_div3", 3},
> +	[K230_PLL3_DIV4] = { "pll3", "pll3_div4", 4},
> +};
> +
> +/* K230 CLKS. */
> +struct k230_clk {
> +	int id;
> +	struct k230_sysclk *ksc;
> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_clk(_hw)	container_of(_hw, struct k230_clk, hw)
> +
> +enum k230_clk_div_type {
> +	K230_MUL,
> +	K230_DIV,
> +	K230_MUL_DIV,
> +};
> +
> +enum k230_clk_parent_type {
> +	K230_OSC24M,
> +	K230_PLL,
> +	K230_PLL_DIV,
> +	K230_CLK_COMPOSITE,
> +};
> +
> +#define K230_CLK_MAX_PARENT_NUM 6
> +
> +struct k230_clk_parent {
> +	enum k230_clk_parent_type type;
> +	union {
> +		enum k230_pll_div_id pll_div_id;
> +		enum k230_pll_id pll_id;
> +		int clk_id;
> +	};
> +};
> +
> +struct k230_clk_cfg {
> +	/* attr */
> +	const char *name;
> +	/* 0-read & write; 1-read only */
> +	bool read_only;
> +	int num_parent;
> +	struct k230_clk_parent parent[K230_CLK_MAX_PARENT_NUM];
> +	bool status;
> +	int flags;
> +
> +	/* rate reg */
> +	u32 rate_reg_off;
> +	u32 rate_reg_off_c;
> +	void __iomem *rate_reg;
> +	void __iomem *rate_reg_c;
> +	/* rate info*/
> +	u32 rate_write_enable_bit;
> +	u32 rate_write_enable_bit_c;
> +	enum k230_clk_div_type method;
> +	bool have_rate;
> +	bool have_rate_c;
> +	/* rate mul */
> +	u32 rate_mul_min;
> +	u32 rate_mul_max;
> +	u32 rate_mul_shift;
> +	u32 rate_mul_mask;
> +	/* rate mul-changable */
> +	u32 rate_mul_min_c;
> +	u32 rate_mul_max_c;
> +	u32 rate_mul_shift_c;
> +	u32 rate_mul_mask_c;
> +	/* rate div */
> +	u32 rate_div_min;
> +	u32 rate_div_max;
> +	u32 rate_div_shift;
> +	u32 rate_div_mask;
> +
> +	/* gate reg */
> +	u32 gate_reg_off;
> +	void __iomem *gate_reg;
> +	/* gate info*/
> +	bool have_gate;
> +	u32 gate_bit_enable;
> +	u32 gate_bit_reverse;
> +
> +	/* mux reg */
> +	u32 mux_reg_off;
> +	void __iomem *mux_reg;
> +	/* mux info */
> +	bool have_mux;
> +	u32 mux_reg_shift;
> +	u32 mux_reg_mask;
> +};
> +
> +static struct k230_clk_cfg k230_clk_cfgs[] = {

And this...


BTW, you have mixed order of declarations and definitions of static
structures/data. Usually first come declarations and then definitions.
Not inter-mixed.

> +	[K230_CPU0_SRC] = {
> +		.name = "cpu0_src",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_PLL_DIV,
> +			.pll_div_id = K230_PLL0_DIV2,
> +		},
> +		K230_RATE_FORMAT(1, 16, 0, 0,
> +				 16, 16, 1, 0xF,
> +				 0x0, 31, K230_MUL, 0, 0,
> +				 0, 0, 0, 0,
> +				 true, false),
> +		K230_GATE_FORMAT(0, 0, 0, true),
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_CPU0_ACLK] = {
> +		.name = "cpu0_aclk",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_CLK_COMPOSITE,
> +			.clk_id = K230_CPU0_SRC,
> +		},
> +		K230_RATE_FORMAT(1, 1, 0, 0,
> +				 1, 8, 7, 0x7,
> +				 0x0, 31, K230_MUL, 0, 0,
> +				 0, 0, 0, 0,
> +				 true, false),
> +		K230_GATE_FORMAT_ZERO,
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_CPU0_PLIC] = {
> +		.name = "cpu0_plic",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_CLK_COMPOSITE,
> +			.clk_id = K230_CPU0_SRC,
> +		},
> +		K230_RATE_FORMAT(1, 1, 0, 0,
> +				 1, 8, 10, 0x7,
> +				 0x0, 31, K230_DIV, 0, 0,
> +				 0, 0, 0, 0,
> +				 true, false),
> +		K230_GATE_FORMAT(0, 9, 0, true),
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_CPU0_NOC_DDRCP4] = {
> +		.name = "cpu0_noc_ddrcp4",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_CLK_COMPOSITE,
> +			.clk_id = K230_CPU0_SRC,
> +		},
> +		K230_RATE_FORMAT_ZERO,
> +		K230_GATE_FORMAT(0x60, 7, 0, true),
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_CPU0_PCLK] = {
> +		.name = "cpu0_pclk",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_PLL_DIV,
> +			.pll_div_id = K230_PLL0_DIV4,
> +		},
> +		K230_RATE_FORMAT(1, 1, 0, 0,
> +				 1, 8, 15, 0x7,
> +				 0x0, 31, K230_DIV, 0, 0,
> +				 0, 0, 0, 0,
> +				 true, false),
> +		K230_GATE_FORMAT(0, 13, 0, true),
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_PMU_PCLK] = {
> +		.name = "pmu_pclk",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_OSC24M,
> +		},
> +		K230_RATE_FORMAT_ZERO,
> +		K230_GATE_FORMAT(0x10, 0, 0, true),
> +		K230_MUX_FORMAT_ZERO,
> +	},
> +	[K230_HS_OSPI_SRC] = {
> +		.name = "hs_ospi_src",
> +		.read_only = false,
> +		.flags = 0,
> +		.status = true,
> +		.num_parent = 2,
> +		.parent[0] = {
> +			.type = K230_PLL_DIV,
> +			.pll_div_id = K230_PLL0_DIV2,
> +		},
> +		.parent[1] = {
> +			.type = K230_PLL_DIV,
> +			.pll_div_id = K230_PLL2_DIV4,
> +		},
> +		K230_RATE_FORMAT_ZERO,
> +		K230_GATE_FORMAT(0x18, 24, 0, true),
> +		K230_MUX_FORMAT(0x20, 18, 0x1, true),
> +	},
> +};
> +
> +#define K230_NUM_CLKS ARRAY_SIZE(k230_clk_cfgs)
> +
> +struct k230_sysclk {
> +	struct platform_device *pdev;
> +	void __iomem			*pll_regs, *regs;
> +	spinlock_t			pll_lock, clk_lock;
> +	struct k230_pll			plls[K230_PLL_NUM];
> +	struct k230_clk			clks[K230_NUM_CLKS];
> +	struct k230_pll_div		dclks[K230_PLL_DIV_NUM];
> +} clksrc;

No, drop clksrc. No singletons. Especially no globla singletons.


...

> +static int k230_clk_find_approximate(struct k230_clk *clk,
> +				     u32 mul_min,
> +				     u32 mul_max,
> +				     u32 div_min,
> +				     u32 div_max,
> +				     enum k230_clk_div_type method,
> +				     unsigned long rate,
> +				     unsigned long parent_rate,
> +				     u32 *div,
> +				     u32 *mul)
> +{
> +	long abs_min;
> +	long abs_current;
> +	long perfect_divide;
> +	struct k230_clk_cfg *cfg = &k230_clk_cfgs[clk->id];
> +
> +	u32 codec_clk[9] = {


You do not like const atribute, do you?

> +		2048000,
> +		3072000,
> +		4096000,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	u32 codec_div[9][2] = {
> +		{3125, 16},
> +		{3125, 24},
> +		{3125, 32},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +
> +	u32 pdm_clk[20] = {
> +		128000,
> +		192000,
> +		256000,
> +		384000,
> +		512000,
> +		768000,
> +		1024000,
> +		1411200,
> +		1536000,
> +		2048000,
> +		2822400,
> +		3072000,
> +		4096000,
> +		5644800,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	u32 pdm_div[20][2] = {
> +		{3125, 1},
> +		{6250, 3},
> +		{3125, 2},
> +		{3125, 3},
> +		{3125, 4},
> +		{3125, 6},
> +		{3125, 8},
> +		{125000, 441},
> +		{3125, 12},
> +		{3125, 16},
> +		{62500, 441},
> +		{3125, 24},
> +		{3125, 32},
> +		{31250, 441},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +

...

> +
> +static int k230_clk_init_plls(struct platform_device *pdev)
> +{
> +	struct k230_sysclk *ksc = &clksrc;
> +	int ret = 0;
> +
> +	spin_lock_init(&ksc->pll_lock);
> +
> +	ksc->pll_regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (!ksc->pll_regs) {
> +		dev_err(&pdev->dev, "failed to map registers\n");
> +		ret = PTR_ERR(ksc->pll_regs);

What is the point of ret here?

> +		return ret;
> +	}
> +
> +	ret = k230_register_plls(pdev, ksc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register plls failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = k230_register_pll_divs(pdev, ksc);
> +	if (ret)
> +		dev_err(&pdev->dev, "register pll_divs failed %d\n", ret);
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, k230_clk_hw_pll_divs_onecell_get, ksc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "add plls provider failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (int i = 0; i < K230_PLL_DIV_NUM; i++) {
> +		ret = devm_clk_hw_register_clkdev(&pdev->dev, ksc->dclks[i].hw,
> +						  k230_pll_div_cfgs[i].name, NULL);
> +		if (ret) {
> +			dev_err(&pdev->dev, "clock_lookup create failed %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int k230_clk_init_sysclk(struct platform_device *pdev)
> +{
> +	struct k230_sysclk *ksc = &clksrc;
> +	int ret = 0;
> +
> +	spin_lock_init(&ksc->clk_lock);
> +
> +	ksc->regs = devm_platform_ioremap_resource(pdev, 1);
> +	if (!ksc->regs) {
> +		dev_err(&pdev->dev, "failed to map registers\n");
> +		ret = PTR_ERR(ksc->regs);
> +		return ret;
> +	}
> +
> +	ret = k230_register_clks(pdev, ksc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register clock provider failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, k230_clk_hw_onecell_get, ksc);
> +	if (ret)
> +		dev_err(&pdev->dev, "add clock provider failed %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int k230_clk_probe(struct platform_device *pdev)
> +{
> +	struct k230_sysclk *ksc = &clksrc;
> +	int ret = 0;
> +
> +	ksc->pdev = pdev;
> +
> +	if (!pdev) {
> +		dev_err(&pdev->dev, "platform device pointer is NULL\n");

So how did you probe? Is this even remotely possible?

> +		ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	ret = k230_clk_init_plls(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "init plls failed with %d\n", ret);

syntax is always: return dev_err_probe

> +		return ret;
> +	}
> +
> +	ret = k230_clk_init_sysclk(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "init clks failed with %d\n", ret);

syntax is always: return dev_err_probe

fix it in all other applicable places as well


> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id k230_clk_ids[] = {
> +	{ .compatible = "canaan,k230-clk" },
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, k230_clk_ids);
> +
> +static struct platform_driver k230_clk_driver = {
> +	.driver = {
> +		.name  = "k230_clock_controller",
> +		.of_match_table = k230_clk_ids,
> +	},
> +	.probe = k230_clk_probe,
> +};
> +builtin_platform_driver(k230_clk_driver);
> 
> -- 
> 2.34.1
> 
