Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503713;
	b=MnDc1Ql7TPYelmfbtZI3O3WTjMf+yDYFl05MJVRLWi54/oWBZDsrk1DKD9magzEA0uAD
	 Jwo5lXDVyhFZ2g505/wMzYKlasn74+iWwPN1NaDCTaX1feBNH9uJPzwfD3o3oymK5NAeP
	 bshEupLvFHiG05HD0fwUYlibnU18pqjEj5tXEbg8XGn0+SHwpEacGRCWepIK5tvnC/bQK
	 UQgBNc1jBBJYlyjID0uyQgaJtd4E2yxeEKLF7wrhoX5nyChU4b8OX71LGHfaMMa6NwR0n
	 IVOldcbfZxDGLOGor6muFHfY/kjXugnmgzNWZ4yTMbqrsvOEXYs15heslQpDDUD3QQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503713;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dmnPvjDfR4N1o9Mk751/ywbCn9sy/0MzBMcwvdAnKLs=;
	b=sKdfQ9+Q2gPG4FG4RTmGKvCYz84NRtLrH4fc22wmczJAsdL15sfNjdq1IKg4BbR4yerG
	 uc2GaZKybyroghVvn2XrsYsKUlk/2iB4v5DItUCRAb+BHbUiOTn6WTKsurTuSdwanv8oi
	 nk3R/d73c0TARtQrya9FJJX8X77jgozbXRO36ujI2A3xw/27xPjMaRdgko/5bkJdlHcJc
	 TocXJKRHybuhKRzg9fJJWfZRa0CFNQ9Od2lBlDx+syN6sqCbqfpCpUSa4xOa26XIcqGaU
	 3GXoemeBFzgl4G8OFxhSnrhLkLFBglRtXbSdm1A/Z+qlZEUm55cRgC5q9xEfAnxgjNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vm3lBY7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D0460A3823;
	Thu, 12 Nov 2026 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vm3lBY7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7211F000D3;
	Thu, 12 Nov 2026 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503713;
	bh=dmnPvjDfR4N1o9Mk751/ywbCn9sy/0MzBMcwvdAnKLs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Vm3lBY7vJ5rUbKN/BpXsGoNY4z4PlX/wG4kXB8RnNxgfK8cO7Iz9Ot9cU8k7hVd+O
	 1nL3ekg/gVDyxPKzv1PN38N9TWou55yNwvrFrlWO4iWwSj2GLnY1U2KmKVnm4TQVfd
	 Ukt4pjQ4JcAIUpNjawPreV9Ou9e1n0TU6C4XMLDEi55DLDugZfQSyIz66kULlsWOUO
	 pVqsiR6bDkKjO07Vyqh5mSRZ6c21fotjWHSkBviSQOgJb23I+Q/6lG6ciIxn7rbm1M
	 Yavm2cOFlKp/icmSmy4ubLcNLW4M2GZrLC6h53e07iwyagWLF32ZHqfQg2nDCNPMDg
	 Tr19HwU7Up62w==
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
Subject: Re: [PATCH v16 6/9] clk: realtek: Add support for MMC-tuned PLL
 clocks
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-7-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-7-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369605.1227210.10143810675268582312.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=19059; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=SJdoMcpCeBtrRwlMBwkR5fB4SV3Qbjd8XS4Ubh+2IB8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+fhFd9VQ2o4Xnt06oZ9N0Hr3n+6Zfvft9e0P6e5vqA
 xIdO765dpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRIzyMDLNXttT4PAqz9s1l
 MO1/fMPVRdTS9oq36eFd5/ZXK4TxxDIyNGQ32e9I17xrIcccvdm0qpP15S43kZQ/IVel/LQPJq/
 mBAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Add clk_pll_mmc_ops for enable/disable, rate control, and status operations
> on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> - Move the MMC PLL structs and ops declarations out of clk-pll.h into a new
>   clk-regmap-pll-mmc.h.
> - Add a separate 'struct rtk_clk_pll_mmc_phase' with its own to_clk_pll_mmc_phase().
> - Merge prepare/unprepare/is_prepared into enable/disable/is_enabled, as
>   suggested: there is no sleeping operation.
> - Introduce the 'rtk_clk_pll_mmc_div_cfg' table for the SSCPLL analog tuning.
> - Introduce the 'rtk_clk_pll_mmc_rate' table.
>    - determine_rate() selects the closest entry within [min_rate, max_rate]
>    - set_rate() programs that entry only
>    - recalc_rate() matches all five raw register fields against the table. However,
>    only on a miss does it fall back to 'clk_pll_mmc_calc_rate()', which implements
>    the formula.
> ---
>  drivers/clk/realtek/Kconfig              |   3 +
>  drivers/clk/realtek/Makefile             |   2 +
>  drivers/clk/realtek/clk-regmap-pll-mmc.c | 457 +++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-pll-mmc.h |  66 ++++
>  drivers/clk/realtek/freq_table.c         |   1 +
>  5 files changed, 529 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-pll-mmc.h
>
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index e8deccf93f94..00ef9c5ba969 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -26,4 +26,7 @@ config RTK_CLK_COMMON
>  	  infrastructure to spawn reset controllers via the auxiliary bus
>  	  where required.
>  
> +config RTK_CLK_PLL_MMC
> +	bool
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 4be39e2dd5b4..5fefe9bf901f 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -6,3 +6,5 @@ clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += clk-regmap-pll.o
>  clk-rtk-y += freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-regmap-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-regmap-pll-mmc.c b/drivers/clk/realtek/clk-regmap-pll-mmc.c
> new file mode 100644
> index 000000000000..50df27ef8539
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-pll-mmc.c
> @@ -0,0 +1,457 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/math64.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-pll-mmc.h"
> +
> +#define RTK_PLL_EMMC1_OFFSET            0x0
> +#define RTK_PLL_EMMC2_OFFSET            0x4
> +#define RTK_PLL_EMMC3_OFFSET            0x8
> +#define RTK_PLL_EMMC4_OFFSET            0xc
> +#define RTK_PLL_SSC_DIG_EMMC0_OFFSET    0x0
> +#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
> +#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
> +
> +#define RTK_PLL_PHRT0_MASK              BIT(0)
> +#define RTK_PLL_PHSEL_MASK              GENMASK(4, 0)
> +#define RTK_PLL_SSCPLL_RS_MASK          GENMASK(12, 10)
> +#define RTK_PLL_SSCPLL_ICP_MASK         GENMASK(9, 5)
> +#define RTK_PLL_SSC_DIV_EXT_F_MASK      GENMASK(25, 13)
> +#define RTK_PLL_PI_IBSELH_MASK          GENMASK(28, 27)
> +#define RTK_PLL_SSC_DIV_N_MASK          GENMASK(23, 16)
> +#define RTK_PLL_NCODE_SSC_EMMC_MASK     GENMASK(20, 13)
> +#define RTK_PLL_FCODE_SSC_EMMC_MASK     GENMASK(12, 0)
> +#define RTK_PLL_GRAN_EST_EM_MC_MASK     GENMASK(20, 0)
> +#define RTK_PLL_EN_SSC_EMMC_MASK        BIT(0)
> +#define RTK_PLL_SSC_DIG_EMMC0_EN_SSC    BIT(1)
> +#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
> +
> +#define RTK_PLL_PHRT0_SHIFT             1
> +
> +#define CYCLE_DEGREES                   360
> +#define PHASE_STEPS                     32
> +#define PHASE_SCALE_FACTOR              1125
> +
> +static inline struct rtk_clk_regmap_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll_mmc, clkr);
> +}
> +
> +static inline struct rtk_clk_pll_mmc_phase *to_clk_pll_mmc_phase(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_pll_mmc_phase, clkr);
> +}
> +
> +static inline int get_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &reg);
> +	if (ret)
> +		return ret;
> +
> +	*val = (reg >> RTK_PLL_PHRT0_SHIFT) & RTK_PLL_PHRT0_MASK;
> +
> +	return 0;
> +}
> +
> +static inline int set_phrt0(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +				  RTK_PLL_PHRT0_MASK << RTK_PLL_PHRT0_SHIFT,
> +				  val << RTK_PLL_PHRT0_SHIFT);
> +}
> +
> +static inline int clk_pll_emmc_set_sscpll_rs(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_RS_MASK, FIELD_PREP(RTK_PLL_SSCPLL_RS_MASK, val));
> +}
> +
> +static inline int clk_pll_emmc_set_sscpll_icp(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap,
> +				  clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_ICP_MASK,
> +				  FIELD_PREP(RTK_PLL_SSCPLL_ICP_MASK, val));
> +}
> +
> +static inline int clk_pll_emmc_set_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSC_DIV_EXT_F_MASK,
> +				  FIELD_PREP(RTK_PLL_SSC_DIV_EXT_F_MASK, val));
> +}
> +
> +static inline int clk_pll_emmc_set_pi_ibselh(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_PI_IBSELH_MASK, FIELD_PREP(RTK_PLL_PI_IBSELH_MASK, val));
> +}
> +
> +static inline int clk_pll_emmc_set_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET,
> +				  RTK_PLL_SSC_DIV_N_MASK, FIELD_PREP(RTK_PLL_SSC_DIV_N_MASK, val));
> +}
> +
> +static inline int set_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, val);
> +}
> +
> +static inline int get_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = raw_val;
> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
> +{
> +	struct rtk_clk_pll_mmc_phase *clkm = to_clk_pll_mmc_phase(hw);
> +	int ret;
> +	u32 val;
> +
> +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +				 RTK_PLL_PHSEL_MASK << clkm->shift, val << clkm->shift);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct rtk_clk_pll_mmc_phase *clkm = to_clk_pll_mmc_phase(hw);
> +	unsigned int raw_val;
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_mmc->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +			  &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	val = (raw_val >> clkm->shift) & RTK_PLL_PHSEL_MASK;
> +
> +	return DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
> +	.set_phase = rtk_clk_regmap_pll_mmc_phase_set_phase,
> +	.get_phase = rtk_clk_regmap_pll_mmc_phase_get_phase,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "CLK_REALTEK");
> +
> +static int rtk_clk_regmap_pll_mmc_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	int ret;
> +
> +	ret = set_pow_ctl(clkm, 7);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_phrt0(clkm, 1);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);
> +
> +	return 0;
> +}
> +
> +static void rtk_clk_regmap_pll_mmc_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_phrt0(clkm, 0);
> +	udelay(10);
> +	set_pow_ctl(clkm, 0);
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 pow_val, phrt_val;
> +	int ret;
> +
> +	ret = get_pow_ctl(clkm, &pow_val);
> +	if (ret)
> +		return 1;
> +
> +	ret = get_phrt0(clkm, &phrt_val);
> +	if (ret)
> +		return 1;
> +
> +	return (pow_val != 0x0) && (phrt_val == 0x1);
> +}
> +
> +static unsigned long clk_pll_mmc_calc_rate(unsigned long parent_rate,
> +					   u32 div_n, u32 div_ext_f)
> +{
> +	u64 rate = (u64)parent_rate * (div_n + 2);
> +
> +	rate += (u64)parent_rate * div_ext_f / 8192;
> +
> +	return div64_u64(rate, 4);
> +}
> +
> +static unsigned long rtk_clk_regmap_pll_mmc_recalc_rate(struct clk_hw *hw,
> +							unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 emmc2, emmc3, ssc3, ssc4, val, ext_f, ncode, fcode, gran_est;
> +
> +	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &emmc2))
> +		return 0;
> +
> +	if (regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &emmc3))
> +		return 0;
> +
> +	if (regmap_read(clkm->clkr.regmap, clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET, &ssc3))
> +		return 0;
> +
> +	if (regmap_read(clkm->clkr.regmap, clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET, &ssc4))
> +		return 0;
> +
> +	val = FIELD_GET(RTK_PLL_SSC_DIV_N_MASK, emmc3);
> +	ext_f = FIELD_GET(RTK_PLL_SSC_DIV_EXT_F_MASK, emmc2);
> +	ncode = FIELD_GET(RTK_PLL_NCODE_SSC_EMMC_MASK, ssc3);
> +	fcode = FIELD_GET(RTK_PLL_FCODE_SSC_EMMC_MASK, ssc3);
> +	gran_est = FIELD_GET(RTK_PLL_GRAN_EST_EM_MC_MASK, ssc4);
> +
> +	for (unsigned int i = 0; clkm->rate_tbl && i < clkm->num_rate_tbl; i++) {
> +		const struct rtk_clk_pll_mmc_rate *entry = &clkm->rate_tbl[i];
> +
> +		if (entry->ssc_div_n == val && entry->ssc_div_ext_f == ext_f &&
> +		    entry->ncode == ncode && entry->fcode == fcode &&
> +		    entry->gran_est == gran_est)
> +			return entry->rate;
> +	}
> +
> +	return clk_pll_mmc_calc_rate(parent_rate, val, ext_f);
> +}
> +
> +static const struct rtk_clk_pll_mmc_rate *
> +rtk_clk_pll_mmc_find_rate(const struct rtk_clk_regmap_pll_mmc *clkm, unsigned long rate)
> +{
> +	if (!clkm->rate_tbl || !clkm->num_rate_tbl)
> +		return NULL;
> +
> +	for (unsigned int i = 0; i < clkm->num_rate_tbl; i++) {
> +		if (clkm->rate_tbl[i].rate == rate)
> +			return &clkm->rate_tbl[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct rtk_clk_pll_mmc_rate *
> +rtk_clk_pll_mmc_find_closest_rate(const struct rtk_clk_pll_mmc_rate *tbl, u32 num,
> +				  unsigned long rate, unsigned long min_rate,
> +				  unsigned long max_rate)
> +{
> +	const struct rtk_clk_pll_mmc_rate *best = NULL;
> +	unsigned long best_delta = ~0UL;
> +
> +	for (unsigned int i = 0; i < num; i++) {
> +		const struct rtk_clk_pll_mmc_rate *entry = &tbl[i];
> +		unsigned long delta;
> +
> +		if (entry->rate < min_rate || entry->rate > max_rate)
> +			continue;
> +
> +		delta = entry->rate >= rate ? entry->rate - rate : rate - entry->rate;
> +		if (delta < best_delta) {
> +			best = entry;
> +			best_delta = delta;
> +		}
> +	}
> +
> +	return best;
> +}

This duplicates the functionality in ftbl_find_closest_by_rate() from
patch 3.

> +
> +static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	const struct rtk_clk_pll_mmc_rate *entry;
> +
> +	if (!clkm->rate_tbl || !clkm->num_rate_tbl ||
> +	    req->min_rate > req->max_rate)

clk_core_check_boundaries() already checks the min/max rate.

> +		return -EINVAL;
> +
> +	entry = rtk_clk_pll_mmc_find_closest_rate(clkm->rate_tbl,
> +						  clkm->num_rate_tbl, req->rate,
> +						  req->min_rate, req->max_rate);
> +	if (!entry)
> +		return -EINVAL;
> +
> +	req->rate = entry->rate;
> +
> +	return 0;
> +}
> +
> +static const struct rtk_clk_pll_mmc_div_cfg clk_pll_emmc_default_div_cfg[] = {
> +	{ 31, 46, 3, 3, 2 },
> +	{ 20, 30, 2, 3, 1 },
> +	{ 10, 19, 1, 2, 1 },
> +	{  5,  9, 0, 2, 0 },
> +};
> +
> +static const struct rtk_clk_pll_mmc_div_cfg *
> +clk_pll_emmc_find_div_cfg(struct rtk_clk_regmap_pll_mmc *clkm, u32 div)
> +{
> +	const struct rtk_clk_pll_mmc_div_cfg *tbl = clkm->div_cfg;
> +	u8 num = clkm->num_div_cfg;

This is a u32 in struct rtk_clk_regmap_pll_mmc.

> +
> +	if (!tbl) {
> +		tbl = clk_pll_emmc_default_div_cfg;
> +		num = ARRAY_SIZE(clk_pll_emmc_default_div_cfg);
> +	}
> +
> +	for (unsigned int i = 0; i < num; i++) {
> +		if (div >= tbl[i].div_min && div <= tbl[i].div_max)
> +			return &tbl[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int clk_pll_emmc_program_div_cfg(struct rtk_clk_regmap_pll_mmc *clkm, u32 div)
> +{
> +	const struct rtk_clk_pll_mmc_div_cfg *t = clk_pll_emmc_find_div_cfg(clkm, div);
> +	int ret;
> +
> +	if (!t)
> +		return -EINVAL;
> +
> +	ret = clk_pll_emmc_set_pi_ibselh(clkm, t->ibselh);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_pll_emmc_set_sscpll_rs(clkm, t->rs);
> +	if (ret)
> +		return ret;
> +
> +	return clk_pll_emmc_set_sscpll_icp(clkm, t->icp);
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	const struct rtk_clk_pll_mmc_rate *entry = rtk_clk_pll_mmc_find_rate(clkm, rate);
> +	int ret;
> +
> +	if (!entry)
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_FLAG_INITIAL_EMMC_MASK, 0));
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_pll_emmc_set_ssc_div_n(clkm, entry->ssc_div_n);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_pll_emmc_set_ssc_div_ext_f(clkm, entry->ssc_div_ext_f);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_pll_emmc_program_div_cfg(clkm, entry->ssc_div_n);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_NCODE_SSC_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_NCODE_SSC_EMMC_MASK, entry->ncode));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_FCODE_SSC_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_FCODE_SSC_EMMC_MASK, entry->fcode));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
> +				 RTK_PLL_GRAN_EST_EM_MC_MASK,
> +				 FIELD_PREP(RTK_PLL_GRAN_EST_EM_MC_MASK, entry->gran_est));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
> +				 RTK_PLL_SSC_DIG_EMMC0_EN_SSC,
> +				 FIELD_PREP(RTK_PLL_SSC_DIG_EMMC0_EN_SSC, 1));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_EN_SSC_EMMC_MASK, 1));
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_EN_SSC_EMMC_MASK, 0));

EN_SSC_EMMC is set and then immediately cleared. If this is intentional
then put a comment here to be sure it's intentional.

> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC0_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 FIELD_PREP(RTK_PLL_FLAG_INITIAL_EMMC_MASK, 1));
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_ops = {
> +	.enable           = rtk_clk_regmap_pll_mmc_enable,
> +	.disable          = rtk_clk_regmap_pll_mmc_disable,
> +	.is_enabled       = rtk_clk_regmap_pll_mmc_is_enabled,
> +	.recalc_rate      = rtk_clk_regmap_pll_mmc_recalc_rate,
> +	.determine_rate   = rtk_clk_regmap_pll_mmc_determine_rate,
> +	.set_rate         = rtk_clk_regmap_pll_mmc_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-pll-mmc.h b/drivers/clk/realtek/clk-regmap-pll-mmc.h
> new file mode 100644
> index 000000000000..c2e973f3df72
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-pll-mmc.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_PLL_MMC_H
> +#define __CLK_REALTEK_CLK_PLL_MMC_H
> +
> +#include "clk-rtk-common.h"
> +
> +/* SSCPLL charge-pump settings per divider range */
> +struct rtk_clk_pll_mmc_div_cfg {
> +	u16 div_min;
> +	u16 div_max;
> +	u8 ibselh;
> +	u8 rs;
> +	u8 icp;
> +};
> +
> +/* Register settings for a specific eMMC PLL rate */
> +struct rtk_clk_pll_mmc_rate {
> +	unsigned long rate;
> +	u32 ssc_div_n;
> +	u32 ssc_div_ext_f;
> +	u32 ncode;
> +	u32 fcode;
> +	u32 gran_est;
> +};
> +
> +struct rtk_clk_regmap_pll_mmc {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int pll_ofs;
> +	unsigned int ssc_dig_ofs;
> +
> +	/*
> +	 * Optional per-SoC tuning table. When NULL, the driver's default table
> +	 * is used and num_div_cfg is ignored;

Replace ; at end with .

Brian

-- 
Brian Masney <masneyb@kernel.org>
