Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BE47D95E;
	Thu, 27 Aug 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841566; cv=none; b=nT6DNZgE8UK1ctcbwhh610kLVKpShHcCHOcpUOJYst3YhZY4EbqRxjfJgLrTglYhObup4pQeoNegYH1u1OaVFe824+GfrVXTV7jD5QYvAniS+eSkn1WA46tDLmMQDobCzp3Vu2qj/j/TMlqX6Ym0ZgXdcWPCjOuX3vfyKF0tHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841566; c=relaxed/simple;
	bh=4CAvsdNuYr1TOINvsiS1bTij7h5KBCM5YfX9B09fXK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWjEdrlYcjBZOpAvPCifNQESDlc33jyaFXcoZQ9bUNNNlDIA4d33OgY2iH5HnbxfpG8agGhUsuEmoSVOcXtxfKk0NPEfxKHtn9Or9nXYQkvZzZcg7ZCM+d80EHD/zoyudhyXwv8XRJZDceAl3jLCAjBBns2g4ul6wl2F3W6RwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVvwoMql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVvwoMql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09F41F00A3F;
	Thu, 27 Aug 2026 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841555;
	bh=X3ZQPN6AFGtjHd4y95l29Jb5lUMLezaPvyPRtl/8seI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nVvwoMqlk2UIZNrdBfIvjkaZ+8qULJhY6MvieEbF8RiXDCh0dOWWV2ok6CHDSCnEA
	 xsMKkCQhpbs9vCf1hCULVkYJ+jwqwb6SgZoy/g826vM9ZdPtTnu645sbvpT1mXX45F
	 Oh2sVf7eCpTeNBbTFjtjI/gUXgCF5++gnFCGNapKzAWe7mg3quutilvpBOg9xVBp8e
	 ykgehE2av2EIl7jE/kJjXz8ILPfdhmsafZwGV9y5lsAYhcZI9F1BKenMwWfLj8TE/G
	 Xgr17owP+gFamRO3btbFUiXdC1RDDWSGSDVJCCg5qJRW8ttjKiivGOjhQ3wiGBjkBR
	 5H8eMtyysZmcw==
Message-ID: <4a493c7f-a248-4896-890d-3aa55e074ddd@kernel.org>
Date: Thu, 27 Aug 2026 22:38:54 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: socfpga: agilex72: add clock manager driver for
 Agilex72
Content-Language: en-US
To: evon.chiam@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Ng Tze Yee <tzeyee.ng@altera.com>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1786006669.git.evon.chiam@altera.com>
 <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 17:25, evon.chiam@altera.com wrote:
> From: "Chiam, Evon" <evon.chiam@altera.com>
> 
> Add new Clock manager driver to support new Altera Agilex72 platform
> 
> Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
> ---
>   MAINTAINERS                        |    5 +
>   drivers/clk/socfpga/Kconfig        |    3 +-
>   drivers/clk/socfpga/Makefile       |    2 +-
>   drivers/clk/socfpga/clk-agilex72.c | 1181 ++++++++++++++++++++++++++++
>   drivers/clk/socfpga/clk-agilex72.h |   91 +++
>   5 files changed, 1280 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/clk/socfpga/clk-agilex72.c
>   create mode 100644 drivers/clk/socfpga/clk-agilex72.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..1b850dc3d6b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3581,6 +3581,11 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
>   F:	drivers/media/platform/samsung/s5p-mfc/
>   
> +ARM/SOCFPGA AGILEX72 CLOCK DRIVER
> +M:	Chiam, Evon <evon.chiam@altera.com>
> +S:	Maintained
> +F:	drivers/clk/socfpga/clk-agilex72.[ch]
> +

I'll just maintain it for now under all socfpga.
>   ARM/SOCFPGA ARCHITECTURE
>   M:	Dinh Nguyen <dinguyen@kernel.org>
>   S:	Maintained
> diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
> index d88277e2a898..40cac9428fbe 100644
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -13,7 +13,8 @@ config CLK_INTEL_SOCFPGA32
>   	default ARM && ARCH_INTEL_SOCFPGA
>   
>   config CLK_INTEL_SOCFPGA64
> -	bool "Intel Stratix / Agilex / N5X / Agilex5 clock controller support" if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
> +	bool "Intel Stratix / Agilex / N5X / Agilex5 / Agilex72 clock controller support" \
> +		if COMPILE_TEST && (!ARM64 || !ARCH_INTEL_SOCFPGA)
>   	default ARM64 && ARCH_INTEL_SOCFPGA
>   
>   endif # CLK_INTEL_SOCFPGA
> diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
> index a1ea2b988eaf..97af3dfdbbad 100644
> --- a/drivers/clk/socfpga/Makefile
> +++ b/drivers/clk/socfpga/Makefile
> @@ -3,4 +3,4 @@ obj-$(CONFIG_CLK_INTEL_SOCFPGA32) += clk.o clk-gate.o clk-pll.o clk-periph.o \
>   				     clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
>   obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-s10.o \
>   				     clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o \
> -				     clk-agilex.o clk-agilex5.o
> +				     clk-agilex.o clk-agilex5.o clk-agilex72.o
> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk-agilex72.c
> new file mode 100644
> index 000000000000..e350d8a9bb4d
> --- /dev/null
> +++ b/drivers/clk/socfpga/clk-agilex72.c
> @@ -0,0 +1,1181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026, Altera Corporation
> + */
> +#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
> +#include "clk-agilex72.h"
> +
> +#define EMAC_BYPASS_OFFSET          0x10
> +#define CLK_MGR_FREE_SHIFT          16
> +#define CLK_MGR_FREE_MASK           0x7
> +#define PERI_CLK_CNT_DIV_WIDTH      11
> +#define BOOTCLKSRC_MASK             0x2000000
> +#define BOOTCLKSRC_SHIFT            25
> +#define SOCFPGA_PLL_POWER           0
> +#define BOOT_CLK                    "boot_clk"
> +#define CLK_MGR_PLL_CLK_SRC_SHIFT   27
> +#define CLK_MGR_PLL_CLK_SRC_MASK    0x3
> +#define PLL_RATE_REG_OFFSET         0x4
> +#define PLL_CR_N_HI_MASK            0xFF
> +#define PLL_CR_N_LO_MASK            0x1FE00
> +#define PLL_CR_N_LO_SHIFT           9
> +#define PLL_CRHI_M_MASK             0x1FF00000
> +#define PLL_CRHI_M_SHIFT            20
> +#define PLL_CR_C_MASK               0xFF
> +#define PLL_CR_BYPASS_DIV_MASK      0x100
> +#define PLL_FRACT_DIV_REG_OFFSET    0x5c
> +#define PLL_CR_FRACT_DIV_MASK       0xFFFFFF
> +
> +static bool agilex72_gate_is_emac(const char *name);
> +static u8 agilex72_parent_index(const char * const *parents,
> +				size_t num_parents, const char *parent_name);
> +static unsigned long agilex72_boot_clk_recalc_rate(struct clk_hw *hwclk,
> +						   unsigned long parent_rate);
> +static unsigned long agilex72_clk_pll_recalc_rate(struct clk_hw *hwclk,
> +						  unsigned long parent_rate);
> +static unsigned long agilex72_peri_c_clk_recalc_rate(struct clk_hw *hwclk,
> +						     unsigned long parent_rate);
> +static unsigned long
> +agilex72_clk_peri_cnt_clk_recalc_rate(struct clk_hw *hwclk,
> +				      unsigned long parent_rate);
> +static unsigned long agilex72_gate_clk_recalc_rate(struct clk_hw *hwclk,
> +						   unsigned long parent_rate);
> +static u8 agilex72_boot_get_parent(struct clk_hw *hwclk);
> +static u8 agilex72_clk_pll_get_parent(struct clk_hw *hwclk);
> +static u8 agilex72_peri_c_clk_get_parent(struct clk_hw *hwclk);
> +static u8 agilex72_clk_periclk_get_parent(struct clk_hw *hwclk);
> +static u8 agilex72_gate_get_parent(struct clk_hw *hwclk);
> +
> +/* External parent clocks come from DT via fw_name */
> +static const char * const boot_pll_parents[] = {
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +};
> +
> +static const char * const gppll0_clk_parents[] = {
> +	"osc1",
> +	"cb-intosc-div10-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const gppll1_clk_parents[] = {
> +	"osc1",
> +	"cb-intosc-div10-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const gppll2_clk_parents[] = {
> +	"osc1",
> +	"cb-intosc-div10-clk",
> +	"f2s-free-clk",
> +};
> +
> +/* Core free muxes */
> +static const char * const comp0_free_mux[] = {

Do you mean core0 here?

> +	"gppll1-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const core2_free_mux[] = {
> +	"gppll2-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const core3_free_mux[] = {
> +	"gppll2-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const dsu_free_mux[] = {
> +	"gppll1-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const ccu_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const hsp_noc_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const lsp_noc_free_mux[] = {
> +	"gppll0-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const trace_free_mux[] = {
> +	"gppll0-c2",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const emaca_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const emacb_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const emac_ptp_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const gpio_db_free_mux[] = {
> +	"gppll0-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const usb31_free_mux[] = {
> +	"gppll0-c0",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const s2f_user0_free_mux[] = {
> +	"gppll0-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const s2f_user1_free_mux[] = {
> +	"gppll0-c1",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const xspi_phy_clk_mux[] = {
> +	"gppll0-c3",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +static const char * const memdevice_phy_clk_mux[] = {
> +	"gppll0-c3",
> +	"osc1",
> +	"cb-intosc-div2-clk",
> +	"f2s-free-clk",
> +};
> +
> +/* Secondary muxes between free_clk and boot_clk */
> +static const char * const comp0_mux[] = {

core0?

> +	"comp0_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const core2_mux[] = {
> +	"core2_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const core3_mux[] = {
> +	"core3_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const mpu_mux[] = {
> +	"dsu_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const ccu_mux[] = {
> +	"ccu_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const hsp_noc_mux[] = {
> +	"hsp_noc_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const lsp_noc_mux[] = {
> +	"lsp_noc_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const cs_at_mux[] = {
> +	"lsp_noc_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const cs_pdbg_mux[] = {
> +	"lsp_noc_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const cs_trace_mux[] = {
> +	"trace_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const emac_mux[] = {
> +	"emaca_div_clk",
> +	"emacb_div_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const emac_ptp_mux[] = {
> +	"emac_ptp_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const gpio_db_mux[] = {
> +	"gpio_db_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const usb31_mux[] = {
> +	"usb31_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const s2f_user0_mux[] = {
> +	"s2f_user0_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const s2f_user1_mux[] = {
> +	"s2f_user1_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const xspi_mux[] = {
> +	"xspi_phy_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const char * const memdevice_phy_mux[] = {
> +	"memdevice_phy_free_clk",
> +	BOOT_CLK,
> +};
> +
> +static const struct agilex72_pll_clock pll_clks[] = {
> +	{
> +		.id = AGILEX72_BOOT_CLK,
> +		.name = BOOT_CLK,
> +		.parent_names = boot_pll_parents,
> +		.num_parents = ARRAY_SIZE(boot_pll_parents),
> +		.offset = 0x4,
> +	},
> +	{
> +		.id = AGILEX72_GPPLL0_CLK,
> +		.name = "gppll0",
> +		.parent_names = gppll0_clk_parents,
> +		.num_parents = ARRAY_SIZE(gppll0_clk_parents),
> +		.offset = 0x160,
> +	},
> +	{
> +		.id = AGILEX72_GPPLL1_CLK,
> +		.name = "gppll1",
> +		.parent_names = gppll1_clk_parents,
> +		.num_parents = ARRAY_SIZE(gppll1_clk_parents),
> +		.offset = 0x80,
> +	},
> +	{
> +		.id = AGILEX72_GPPLL2_CLK,
> +		.name = "gppll2",
> +		.parent_names = gppll2_clk_parents,
> +		.num_parents = ARRAY_SIZE(gppll2_clk_parents),
> +		.offset = 0x60,
> +	},
> +};
> +
> +static const struct agilex72_perip_c_clock main_perip_c_clks[] = {
> +	{ AGILEX72_GPPLL0_C0_CLK,
> +	  "gppll0-c0", "gppll0", 1, 0x24, 23,  0, 8, 8 },
> +	{ AGILEX72_GPPLL0_C1_CLK,
> +	  "gppll0-c1", "gppll0", 1, 0x28, 14, 23, 8, 8 },
> +	{ AGILEX72_GPPLL0_C2_CLK,
> +	  "gppll0-c2", "gppll0", 1, 0x2c,  0,  9, 8, 8 },
> +	{ AGILEX72_GPPLL0_C3_CLK,
> +	  "gppll0-c3", "gppll0", 1, 0x30,  0,  9, 8, 8 },
> +	{ AGILEX72_GPPLL0_C4_CLK,
> +	  "gppll0-c4", "gppll0", 1, 0x38,  0,  9, 8, 8 },
> +	{ AGILEX72_GPPLL0_C5_CLK,
> +	  "gppll0-c5", "gppll0", 1, 0x3c,  0,  9, 8, 8 },
> +	{ AGILEX72_GPPLL0_C6_CLK,
> +	  "gppll0-c6", "gppll0", 1, 0x40,  0,  9, 8, 8 },
> +	{ AGILEX72_GPPLL1_C0_CLK,
> +	  "gppll1-c0", "gppll1", 1, 0x24, 23,  0, 8, 8 },
> +	{ AGILEX72_GPPLL1_C1_CLK,
> +	  "gppll1-c1", "gppll1", 1, 0x28, 14, 23, 8, 8 },
> +	{ AGILEX72_GPPLL2_C0_CLK,
> +	  "gppll2-c0", "gppll2", 1, 0x24, 23,  0, 8, 8 },
> +	{ AGILEX72_GPPLL2_C1_CLK,
> +	  "gppll2-c1", "gppll2", 1, 0x28, 14, 23, 8, 8 },
> +};
> +
> +/* Non-SW clock-gated enabled clocks */
> +static const struct agilex72_perip_cnt_clock main_perip_cnt_clks[] = {
> +	{ AGILEX72_COMP0_FREE_CLK, "comp0_free_clk",
> +	  comp0_free_mux, ARRAY_SIZE(comp0_free_mux), 0xbc },
> +	{ AGILEX72_CORE2_FREE_CLK, "core2_free_clk",
> +	  core2_free_mux, ARRAY_SIZE(core2_free_mux), 0xb8 },
> +	{ AGILEX72_CORE3_FREE_CLK, "core3_free_clk",
> +	  core3_free_mux, ARRAY_SIZE(core3_free_mux), 0xb4 },
> +	{ AGILEX72_DSU_FREE_CLK, "dsu_free_clk",
> +	  dsu_free_mux, ARRAY_SIZE(dsu_free_mux), 0xc0 },
> +	{ AGILEX72_CCU_FREE_CLK, "ccu_free_clk",
> +	  ccu_free_mux, ARRAY_SIZE(ccu_free_mux), 0xc4 },
> +	{ AGILEX72_HSP_NOC_FREE_CLK, "hsp_noc_free_clk",
> +	  hsp_noc_free_mux, ARRAY_SIZE(hsp_noc_free_mux), 0x104 },
> +	{ AGILEX72_LSP_NOC_FREE_CLK, "lsp_noc_free_clk",
> +	  lsp_noc_free_mux, ARRAY_SIZE(lsp_noc_free_mux), 0x108 },
> +	{ AGILEX72_TRACE_FREE_CLK, "trace_free_clk",
> +	  trace_free_mux, ARRAY_SIZE(trace_free_mux), 0x144 },
> +	{ AGILEX72_EMAC_A_FREE_CLK, "emaca_free_clk",
> +	  emaca_free_mux, ARRAY_SIZE(emaca_free_mux), 0x128 },
> +	{ AGILEX72_EMAC_B_FREE_CLK, "emacb_free_clk",
> +	  emacb_free_mux, ARRAY_SIZE(emacb_free_mux), 0x12c },
> +	{ AGILEX72_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk",
> +	  emac_ptp_free_mux, ARRAY_SIZE(emac_ptp_free_mux), 0x130 },
> +	{ AGILEX72_GPIO_DB_FREE_CLK, "gpio_db_free_clk",
> +	  gpio_db_free_mux, ARRAY_SIZE(gpio_db_free_mux), 0x134 },
> +	{ AGILEX72_USB31_FREE_CLK, "usb31_free_clk",
> +	  usb31_free_mux, ARRAY_SIZE(usb31_free_mux), 0x140 },
> +	{ AGILEX72_S2F_USER0_FREE_CLK, "s2f_user0_free_clk",
> +	  s2f_user0_free_mux, ARRAY_SIZE(s2f_user0_free_mux), 0x138 },
> +	{ AGILEX72_S2F_USER1_FREE_CLK, "s2f_user1_free_clk",
> +	  s2f_user1_free_mux, ARRAY_SIZE(s2f_user1_free_mux), 0x13c },
> +	{ AGILEX72_XSPI_PHY_FREE_CLK, "xspi_phy_free_clk",
> +	  xspi_phy_clk_mux, ARRAY_SIZE(xspi_phy_clk_mux), 0x154 },
> +	{ AGILEX72_MEMDEVICE_PHY_FREE_CLK, "memdevice_phy_free_clk",
> +	  memdevice_phy_clk_mux, ARRAY_SIZE(memdevice_phy_clk_mux), 0x148 },
> +};
> +
> +static const char * const hsp_mp_clk_parent[] = { "hsp_mp_clk" };
> +static const char * const lsp_main_parent[] = { "lsp_main_clk" };
> +static const char * const lsp_mp_parent[] = { "lsp_mp_clk" };
> +static const char * const lsp_sp_parent[] = { "lsp_sp_clk" };
> +static const char * const usb31_bus_clk_early_parents[] = { "hsp_main_clk" };
> +static const char * const emaca_div_parents[] = { "emaca_free_clk" };
> +static const char * const emacb_div_parents[] = { "emacb_free_clk" };
> +
> +/* SW Clock gate enabled clocks */
> +static const struct agilex72_gate_clock gate_clks[] = {
> +	{ AGILEX72_COMP0_CLK, "comp0_clk", comp0_mux,

CORE0?

> +	  ARRAY_SIZE(comp0_mux), 0x30, 8, 0, 0, 0, 0x3c, 5, 0 },
> +	{ AGILEX72_CORE2_CLK, "core2_clk", core2_mux,
> +	  ARRAY_SIZE(core2_mux), 0x30, 10, 0, 0, 0, 0x3c, 10, 0 },
> +	{ AGILEX72_CORE3_CLK, "core3_clk", core3_mux,
> +	  ARRAY_SIZE(core3_mux), 0x30, 11, 0, 0, 0, 0x3c, 11, 0 },
> +	{ AGILEX72_MPU_CLK, "mpu_clk", mpu_mux,
> +	  ARRAY_SIZE(mpu_mux), 0x30, 7, 0, 0, 0, 0x3c, 4, 0 },
> +	{ AGILEX72_CCU_CLK, "ccu_clk", ccu_mux,
> +	  ARRAY_SIZE(ccu_mux), 0x30, 6, 0, 0, 0, 0x3c, 3, 0 },
> +	{ AGILEX72_APU_SYS_FREE_CLK, "apu_sys_free_clk", ccu_mux,
> +	  ARRAY_SIZE(ccu_mux), 0, 0, 0x50, 22, 2, 0x3c, 3, 0 },
> +	{ AGILEX72_HSP_SYS_FREE_CLK, "hsp_sys_free_clk", hsp_noc_mux,
> +	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0x10c, 8, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_HSP_MAIN_FREE_CLK, "hsp_main_free_clk", hsp_noc_mux,
> +	  ARRAY_SIZE(hsp_noc_mux), 0, 0, 0, 0, 0, 0xf0, 9, 0 },
> +	{ AGILEX72_HSP_MAIN_CLK, "hsp_main_clk", hsp_noc_mux,
> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },
> +	{ AGILEX72_HSP_MP_CLK, "hsp_mp_clk", hsp_noc_mux,
> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 2, 0x10c, 10, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_HSP_SP_CLK, "hsp_sp_clk", hsp_noc_mux,
> +	  ARRAY_SIZE(hsp_noc_mux), 0xe0, 3, 0x10c, 12, 2, 0xf0, 9, 0 },
Are any of these clock critical? Meaning, they cannot get gated off?


> +	{ AGILEX72_USB2OTG_HCLK, "usb2otg_hclk", hsp_mp_clk_parent,
> +	  1, 0xe0, 0, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_LSP_SYS_FREE_CLK, "lsp_sys_free_clk", lsp_noc_mux,
> +	  ARRAY_SIZE(lsp_noc_mux), 0, 0, 0x10c, 2, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_LSP_MAIN_FREE_CLK, "lsp_main_free_clk", lsp_noc_mux,
> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 0, 0, 0, 0, 0xf0, 9, 0 },

Does this clock really share the same gate as the usb2otg_hclk?
> +	{ AGILEX72_LSP_MAIN_CLK, "lsp_main_clk", lsp_noc_mux,
> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 1, 0, 0, 0, 0xf0, 9, 0 },

Are you sure this clock share the same enable bit as the hsp_main_clk?

> +	{ AGILEX72_LSP_MP_CLK, "lsp_mp_clk", lsp_noc_mux,
> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 2, 0x10c, 4, 2, 0xf0, 9, 0 },

Also here, the hsp_mp_clk has the same enable bit?

> +	{ AGILEX72_LSP_SP_CLK, "lsp_sp_clk", lsp_noc_mux,
> +	  ARRAY_SIZE(lsp_noc_mux), 0xe0, 3, 0x10c, 6, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_SPIM_0_CLK, "spim_0_clk", lsp_main_parent,
> +	  1, 0xd0, 11, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SPIM_1_CLK, "spim_1_clk", lsp_main_parent,
> +	  1, 0xd0, 12, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SPIS_0_CLK, "spis_0_clk", lsp_main_parent,
> +	  1, 0xd0, 13, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SPIS_1_CLK, "spis_1_clk", lsp_main_parent,
> +	  1, 0xd0, 14, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_0_CORE_CLK, "dma_0_core_clk", lsp_main_parent,
> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_0_HS_CLK, "dma_0_hs_clk", lsp_mp_parent,
> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_1_CORE_CLK, "dma_1_core_clk", lsp_main_parent,
> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_1_HS_CLK, "dma_1_hs_clk", lsp_mp_parent,
> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I3C_0_CORE_CLK, "i3c_0_core_clk", lsp_mp_parent,
> +	  1, 0xd0, 22, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I3C_1_CORE_CLK, "i3c_1_core_clk", lsp_mp_parent,
> +	  1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I2C_0_PCLK, "i2c_0_pclk", lsp_sp_parent,
> +	  1, 0xd0, 17, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I2C_1_PCLK, "i2c_1_pclk", lsp_sp_parent,
> +	  1, 0xd0, 18, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I2C_EMAC0_PCLK, "i2c_emac0_pclk", lsp_sp_parent,
> +	  1, 0xd0, 19, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I2C_EMAC1_PCLK, "i2c_emac1_pclk", lsp_sp_parent,
> +	  1, 0xd0, 20, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_I2C_EMAC2_PCLK, "i2c_emac2_pclk", lsp_sp_parent,
> +	  1, 0xd0, 21, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_UART_0_PCLK, "uart_0_pclk", lsp_sp_parent,
> +	  1, 0xd0, 23, 0, 0, 0, 0, 0, 0 },

Are you sure this clock share the same enable bit as the i3c_1_core_clk?

> +	{ AGILEX72_UART_1_PCLK, "uart_1_pclk", lsp_sp_parent,
> +	  1, 0xd0, 24, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_UART_2_PCLK, "uart_2_pclk", lsp_sp_parent,
> +	  1, 0xd0, 25, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SPTIMER_0_PCLK, "sptimer_0_pclk", lsp_sp_parent,
> +	  1, 0xd0, 29, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SPTIMER_1_PCLK, "sptimer_1_pclk", lsp_sp_parent,
> +	  1, 0xd0, 30, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_CS_AT_CLK, "cs_at_clk", cs_at_mux,
> +	  ARRAY_SIZE(cs_at_mux), 0xe0, 4, 0x10c, 24, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_CS_PDBG_CLK, "cs_pdbg_clk", cs_pdbg_mux,
> +	  ARRAY_SIZE(cs_pdbg_mux), 0xe0, 4, 0x10c, 28, 2, 0xf0, 9, 0 },
> +	{ AGILEX72_CS_TRACE_CLK, "cs_trace_clk", cs_trace_mux,
> +	  ARRAY_SIZE(cs_trace_mux), 0xe0, 4, 0x10c, 26, 2, 0xf0, 10, 0 },
> +	{ AGILEX72_EMACA_DIV_CLK, "emaca_div_clk", emaca_div_parents,
> +	  1, 0, 0, 0x118, 8, 2, 0, 0, 0 },
> +	{ AGILEX72_EMACB_DIV_CLK, "emacb_div_clk", emacb_div_parents,
> +	  1, 0, 0, 0x118, 10, 2, 0, 0, 0 },
> +	{ AGILEX72_EMAC0_CLK, "emac0_clk", emac_mux,
> +	  ARRAY_SIZE(emac_mux), 0xd0, 0, 0, 0, 0, 0x100, 26, 0 },
> +	{ AGILEX72_EMAC1_CLK, "emac1_clk", emac_mux,
> +	  ARRAY_SIZE(emac_mux), 0xd0, 1, 0, 0, 0, 0x100, 27, 0 },
> +	{ AGILEX72_EMAC2_CLK, "emac2_clk", emac_mux,
> +	  ARRAY_SIZE(emac_mux), 0xd0, 2, 0, 0, 0, 0x100, 28, 0 },
> +	{ AGILEX72_EMAC_PTP_CLK, "emac_ptp_clk", emac_ptp_mux,
> +	  ARRAY_SIZE(emac_ptp_mux), 0xd0, 3, 0, 0, 0, 0xf0, 2, 0 },
> +	{ AGILEX72_GPIO_DB_CLK, "gpio_db_clk", gpio_db_mux,
> +	  ARRAY_SIZE(gpio_db_mux), 0xd0, 4, 0x114, 0, 16, 0xf0, 3, 1 },
> +	{ AGILEX72_USB31_SUSPEND_CLK, "usb31_suspend_clk", usb31_mux,
> +	  ARRAY_SIZE(usb31_mux), 0xe0, 7, 0x118, 12, 6, 0xf0, 7, 1 },
> +	{ AGILEX72_USB31_BUS_CLK_EARLY, "usb31_bus_clk_early",
> +	  usb31_bus_clk_early_parents, 1, 0xe0, 7, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_S2F_USER0_CLK, "s2f_user0_clk", s2f_user0_mux,
> +	  ARRAY_SIZE(s2f_user0_mux), 0xd0, 27, 0, 0, 0, 0xf0, 4, 0 },
> +	{ AGILEX72_S2F_USER1_CLK, "s2f_user1_clk", s2f_user1_mux,
> +	  ARRAY_SIZE(s2f_user1_mux), 0xd0, 28, 0, 0, 0, 0xf0, 5, 0 },
> +	{ AGILEX72_XSPI_PCLK, "xspi_pclk", lsp_mp_parent,
> +	  1, 0xd0, 9, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_XSPI_CLK, "xspi_clk", xspi_mux,
> +	  ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
> +	{ AGILEX72_XSPI_PHY_CLK, "xspi_phy_clk", xspi_mux,
> +	  ARRAY_SIZE(xspi_mux), 0xd0, 9, 0x110, 8, 2, 0xf0, 14, 0 },
> +	{ AGILEX72_SDMMC0_SDPHY_REG_CLK, "sdmmc0_sdphy_reg_clk",
> +	  lsp_mp_parent, 1, 0xd0, 5, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SDMMC1_SDPHY_REG_CLK, "sdmmc1_sdphy_reg_clk",
> +	  lsp_mp_parent, 1, 0xd0, 7, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_SDMMC0_SDMCLK, "sdmmc0_sdmclk", memdevice_phy_mux,
> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
> +	{ AGILEX72_SDMMC1_SDMCLK, "sdmmc1_sdmclk", memdevice_phy_mux,
> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
> +	{ AGILEX72_SDMMC0_PHY_CLK, "sdmmc0_phy_clk", memdevice_phy_mux,
> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 5, 0x110, 4, 2, 0xf0, 15, 0 },
> +	{ AGILEX72_SDMMC1_PHY_CLK, "sdmmc1_phy_clk", memdevice_phy_mux,
> +	  ARRAY_SIZE(memdevice_phy_mux), 0xd0, 7, 0x110, 6, 2, 0xf0, 15, 0 },
> +};
> +

<snip>

> diff --git a/drivers/clk/socfpga/clk-agilex72.h b/drivers/clk/socfpga/clk-agilex72.h
> new file mode 100644
> index 000000000000..e120fe97fd65
> --- /dev/null
> +++ b/drivers/clk/socfpga/clk-agilex72.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier:    GPL-2.0 */
> +/*
> + * Copyright (C) 2026, Altera Corporation
> + */
> +
> +#ifndef	__AGILEX72_CLK_H
> +#define	__AGILEX72_CLK_H
> +
> +#include <linux/clk-provider.h>
> +
> +struct agilex72_clock_data {
> +	/*
> +	 * MMIO bases ioremapped from DT resources with "reg-names" property
> +	 * in probe:
> +	 *   [0] - "clkmgr"  : main clock manager register block
> +	 *   [1] - "gppll0"  : GP PLL 0 register block
> +	 *   [2] - "gppll1"  : GP PLL 1 register block
> +	 *   [3] - "gppll2"  : GP PLL 2 register block
> +	 */
> +	void __iomem *base[4];
> +
> +	/* Must be last */
> +	struct clk_hw_onecell_data	clk_data;
> +};
> +
> +struct agilex72_pll {
> +	struct clk_gate     hw;
> +	void __iomem       *pll_base;
> +};
> +
> +struct agilex72_periph_clk {
> +	struct clk_gate  hw;
> +	void __iomem    *div_reg;
> +	u8               div_lo_shift;
> +	u8               div_hi_shift;
> +};
> +
> +struct agilex72_gate_clk {
> +	struct clk_gate hw;
> +	bool div_linear;
> +	void __iomem *div_reg;
> +	void __iomem *bypass_reg;
> +	u8  div_width;	/* only valid if div_reg != 0 */
> +	u8  div_shift;	/* only valid if div_reg != 0 */
> +	u8  bypass_shift;      /* only valid if bypass_reg != 0 */
> +};
> +
> +struct agilex72_pll_clock {
> +	unsigned int	id;
> +	const char	*name;
> +	const char	* const *parent_names;
> +	u8	num_parents;
> +	unsigned long   offset;
> +};
> +
> +struct agilex72_perip_c_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char		*parent_name;
> +	u8			num_parents;
> +	unsigned long		div_offset;
> +	u8			div_lo_shift;
> +	u8			div_hi_shift;
> +	u8			div_lo_width;
> +	u8			div_hi_width;

I don't see div_lo_width and div_hi_width get used at all?

> +};
> +
> +struct agilex72_perip_cnt_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char	* const *parent_names;
> +	u8			num_parents;
> +	unsigned long		offset;
> +};
> +
> +struct agilex72_gate_clock {
> +	unsigned int		id;
> +	const char		*name;
> +	const char	* const *parent_names;
> +	u8			num_parents;
> +	unsigned long		gate_reg;
> +	u8			gate_idx;
> +	unsigned long		div_reg;
> +	u8			div_offset;
> +	u8			div_width;
> +	unsigned long		bypass_reg;
> +	u8			bypass_shift;
> +	bool			div_linear;
> +};
> +
> +#endif	/* __AGILEX72_CLK_H */

If clk-agilex72.c is the only consumer of this .h file, then just move 
the declarations to the top of the C file. Or take a look at
2050b57ecda0 ("clk: socfpga: agilex5: add clock driver for Agilex5") as 
an example.

Dinh
