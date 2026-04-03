Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED728352FA5
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228870; cv=none; b=nPV+L9X0dePGHR6J/lOz2mWlCMn3YtDRzEo/CDrMHTImPfsOIaSM1LWSZ2Kv6YTIFThnCyy3kTW8QakHvi6aq5IWcZrXBQPQR2TjkCMIv78pO32n2kws6EGESilTHNLZsEdgb8DUl5zFwmncq+lZpgjELpJPN4jhE4pUDJwArZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228870; c=relaxed/simple;
	bh=Jy0Z3lyV2RsN8oiZ1yOi6ize7teFbrFqGxBK5zkSl6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edn++juIxxTZwohTEznuMQUDmo0VO9gkXv1fDFaaUz/qm/rzydcyL9sXRyFh1ZpUN53WKZkmpjkydRcARC6GOYhoXHEWlicbsiEu0tE+9Voaf+NeewVP182cNYMdQguEQn/0vAHmvYr91hXXk7Z8bunB2HN9r5LcV/GxU3KM46g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eiqPwPqg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=THz/VikQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eiqPwPqg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="THz/VikQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775228868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=;
	b=eiqPwPqg/7cKG75JRXuJYsqJSIqE9kdQRFiSM+shDjbkCsqOWyc8TPJldsaW2DsLUvGhGZ
	C0CpXpR2pk4dSyFTchW36lgN5nBoDiqyiAEWVDiMuMfx/9H+gH14OmAIDQSzQMptw30T+w
	TCXuqp/FKUFhqMyWf26g1U/t0v/6aiE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-_BJ7yLlQOta6rBvvuOuIQw-1; Fri, 03 Apr 2026 11:07:38 -0400
X-MC-Unique: _BJ7yLlQOta6rBvvuOuIQw-1
X-Mimecast-MFC-AGG-ID: _BJ7yLlQOta6rBvvuOuIQw_1775228857
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso24258281cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775228857; x=1775833657; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=;
        b=THz/VikQoD8NSsHV36RwFDuteMWMNoCORhws6h0ddRuZO1j5eSrX0lUA+9BpVuKrDV
         SYxnEbUIrUufUauZq/xG8gj4tYV37t1zW3Bfbsd//hws+ZOaR2RbVObXGJPqWxwyVOX/
         W4xrPhIwwFDeKvFxPNVkJ9ioDav3dRFkWeXlRR+osdUHD0nBO2IIx0DahHGB+7JFeFu5
         7dwxe/Ye3DRUrycT35SlNU0dV2OgRM7J6QiC9NG0oZYX0kFd0DZ8AkPUIJkh3oyf+Gz2
         /ftNHqOqWUDf/lfYPrpWbJmuRBvqSLHVznFEKq6SFiGB73kmsQMK7P9ETBfeH2nts22X
         K32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228857; x=1775833657;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VUq3iHyJBlap7+8lACX3iuj8cpAeT8KumT6dvPCbu8=;
        b=FIZeOOUYZBJyYGLZCB7PyCVNaS4IpMlWVtuIvFxTrVyIUQhNsyBFC3yAyLaqV6vj1u
         mBg4vkOZ66ErekqMxbchNtG67UKoaGK+nmtSnCEt6RkM+RuikGHBb3jNwYkiGgntjIQu
         eIK9APCaXtykmtshUiIHGU94SD56xmgdOnk0ZuP9ZZfsTALWTVZijcgle0dZgolBTBYj
         qCcJQR2AOxwaWmqqgg3sP0ED84wmgx7Bb5JE+VYnDaavHMds2VaQ6QJz5312q1kyexlg
         SEAAIUCaYEur+aG4yDPQmbiFHAr1uKZO23a5ZsC+l3b3Tlj+njEj086d6VB7MDwC1k9R
         yU9w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7EUJQEp5xlQbdb7uxWvm4mEIoaK/CYeiXHdsqxgE2pDduhUuwhBglfsyxeQAYpkAiKWA84o+Sjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw595b0sf5Oc8xvtcYkNgZ4VtXO2J29Ui2a8QWq+8ECC4pmDOrG
	bUngHpN/e0nvLsV16Ec9R1tZdL9C47nD+a/Uw6yw6hqJ8GEtyWqSTwoGufKYD9Pe3bfc2gcONbf
	E9rYEDASFWWnhMf8VZiDz0iAfhJ9CC+nMyBJN7Zzh4szFzr769Nvu5Jpej3Aodg==
X-Gm-Gg: AeBDieu7pe7yAQhjs6FwuZDgRcKAJa0tguhJKzbZGmeOg5UHyiDjR8kWKtWZBrsmsZ/
	KTNrG2Ug9Bd6HYKiwi1ZgqDOF//d7Ot3cwtA2ti7eaBt27V58Ho0lzCnl6fmggYbcRVlpKN4hAG
	WEj/4tZIFC1ku+aiVfDdH5qW7k5KEm2nFvkIot1B2yysGRAoNb3P6BKtxJbG97kTo98cKtnx3UO
	pbbwF4wEIDLyRsfKa4jY5jbu56dcgIn4fpH7hIJJdP/3KYcWAK7ql/UV0/aNLA/CfOfQKOHgyA3
	/eAbNgVPUbUWWO/1gBYz+KLvyTLXYVrsN/f6JYap8Gt4VrJSVDwTxS9UaoIrfK+gez+CSFG/Aq4
	degjFYiXOmEmC1RjdL8xqViUgTSVINJdSYWXunVF03rE1t8SLVZh8NS5A
X-Received: by 2002:a05:6214:3116:b0:8a3:a172:46b0 with SMTP id 6a1803df08f44-8a705194a7cmr47589946d6.44.1775228856618;
        Fri, 03 Apr 2026 08:07:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3116:b0:8a3:a172:46b0 with SMTP id 6a1803df08f44-8a705194a7cmr47589096d6.44.1775228856001;
        Fri, 03 Apr 2026 08:07:36 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf51b6sm60006436d6.17.2026.04.03.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:07:35 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:07:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <ac_XtHzDpIjHW8xT@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-8-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun and Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move to_clk_pll_mmc() from clk-pll.h to clk-pll-mmc.c to limit its scope.
> - Change offset type from int to unsigned int.
> ---
>  MAINTAINERS                       |   8 +
>  drivers/clk/realtek/Kconfig       |   3 +
>  drivers/clk/realtek/Makefile      |   2 +
>  drivers/clk/realtek/clk-pll-mmc.c | 410 ++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h     |  13 +
>  5 files changed, 436 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8318156a02b5..4b28af4b26b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22245,6 +22245,14 @@ F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
>  
> +REALTEK SOC PLL CLOCK FOR MMC SUPPORT
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Jyan Chou <jyanchou@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	drivers/clk/realtek/clk-pll-mmc.c
> +
>  REALTEK SPI-NAND
>  M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
>  S:	Maintained
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index bc47d3f1c452..b31a31e57b3a 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -25,4 +25,7 @@ config RTK_CLK_COMMON
>  	  multiple Realtek clock implementations, and include integration
>  	  with reset controllers where required.
>  
> +config RTK_CLK_PLL_MMC
> +	bool
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index f90dc57fcfdb..fd7d777902c8 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -7,3 +7,5 @@ clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
> new file mode 100644
> index 000000000000..d28c7027d3f0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define PLL_EMMC1_OFFSET           0x0
> +#define PLL_EMMC2_OFFSET           0x4
> +#define PLL_EMMC3_OFFSET           0x8
> +#define PLL_EMMC4_OFFSET           0xc
> +#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
> +#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
> +#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
> +
> +#define PLL_MMC_SSC_DIV_N_VAL      0x1b
> +
> +#define PLL_PHRT0_MASK             BIT(1)
> +#define PLL_PHSEL_MASK             GENMASK(4, 0)
> +#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
> +#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
> +#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
> +#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
> +#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
> +#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
> +#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
> +#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
> +#define PLL_EN_SSC_EMMC_MASK       BIT(0)
> +#define PLL_FLAG_INITAL_EMMC_MASK  BIT(1)
> +
> +#define PLL_PHRT0_SHIFT            1
> +#define PLL_SSCPLL_RS_SHIFT        10
> +#define PLL_SSCPLL_ICP_SHIFT       5
> +#define PLL_SSC_DIV_EXT_F_SHIFT    13
> +#define PLL_PI_IBSELH_SHIFT        27
> +#define PLL_SSC_DIV_N_SHIFT        16
> +#define PLL_NCODE_SSC_EMMC_SHIFT   13
> +#define PLL_FLAG_INITAL_EMMC_SHIFT 8
> +
> +#define CYCLE_DEGREES              360
> +#define PHASE_STEPS                32
> +#define PHASE_SCALE_FACTOR         1125
> +
> +static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +
> +	return container_of(clkr, struct clk_pll_mmc, clkr);
> +}
> +
> +static inline int get_phrt0(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &reg);
> +	if (ret)
> +		return ret;
> +
> +	*val = (reg >> PLL_PHRT0_SHIFT) & PLL_PHRT0_MASK;

Sashiko reports the following:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    With PLL_PHRT0_SHIFT defined as 1 and PLL_PHRT0_MASK as BIT(1) (0x02), shifting
    right by 1 moves the target bit 1 to position 0, but masking with 0x02 checks
    position 1 of the shifted value.
    
    Will this cause clk_pll_mmc_is_enabled() to always evaluate to false since it
    expects val == 0x1?

> +	return 0;
> +}
> +
> +static inline int set_phrt0(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
> +				  PLL_PHRT0_MASK, val << PLL_PHRT0_SHIFT);
> +}
> +
> +static inline int get_phsel(struct clk_pll_mmc *clkm, int id, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +	u32 sft = id ? 8 : 3;

Put variables in reverse Christmas tree order.

> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val >> sft) & PLL_PHSEL_MASK;
> +	return 0;
> +}
> +
> +static inline int set_phsel(struct clk_pll_mmc *clkm, int id, u32 val)
> +{
> +	u32 sft = id ? 8 : 3;
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC1_OFFSET,
> +				  PLL_PHSEL_MASK << sft, val << sft);
> +}
> +
> +static inline int set_sscpll_rs(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSCPLL_RS_MASK, val << PLL_SSCPLL_RS_SHIFT);
> +}
> +
> +static inline int set_sscpll_icp(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSCPLL_ICP_MASK, val << PLL_SSCPLL_ICP_SHIFT);
> +}
> +
> +static inline int get_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & PLL_SSC_DIV_EXT_F_MASK) >> PLL_SSC_DIV_EXT_F_SHIFT;
> +	return 0;
> +}
> +
> +static inline int set_ssc_div_ext_f(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_SSC_DIV_EXT_F_MASK,
> +				  val << PLL_SSC_DIV_EXT_F_SHIFT);
> +}
> +
> +static inline int set_pi_ibselh(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC2_OFFSET,
> +				  PLL_PI_IBSELH_MASK, val << PLL_PI_IBSELH_SHIFT);
> +}
> +
> +static inline int set_ssc_div_n(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET,
> +				  PLL_SSC_DIV_N_MASK, val << PLL_SSC_DIV_N_SHIFT);
> +}
> +
> +static inline int get_ssc_div_n(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC3_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & PLL_SSC_DIV_N_MASK) >> PLL_SSC_DIV_N_SHIFT;
> +	return 0;
> +}
> +
> +static inline int set_pow_ctl(struct clk_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, val);
> +}
> +
> +static inline int get_pow_ctl(struct clk_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + PLL_EMMC4_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = raw_val;
> +
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_phase_set_phase(struct clk_hw *hw, int degrees)
> +{
> +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> +	struct clk_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;

Are you checking to see if these two pointers are the same? If so, what
do you think about this instead?

    hw == &clkm->phase0_hw

> +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> +	ret = set_phsel(clkm, phase_id, val);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct clk_hw *hwp;
> +	struct clk_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	hwp = clk_hw_get_parent(hw);
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw - &clkm->phase0_hw) ? 1 : 0;
> +	ret = get_phsel(clkm, phase_id, &val);
> +	if (ret)
> +		return ret;
> +
> +	val = DIV_ROUND_CLOSEST(val * CYCLE_DEGREES, PHASE_STEPS);
> +
> +	return val;
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_phase_ops = {
> +	.set_phase = clk_pll_mmc_phase_set_phase,
> +	.get_phase = clk_pll_mmc_phase_get_phase,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "REALTEK_CLK");
> +
> +static int clk_pll_mmc_prepare(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	return set_pow_ctl(clkm, 7);
> +}
> +
> +static void clk_pll_mmc_unprepare(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_pow_ctl(clkm, 0);
> +}
> +
> +static int clk_pll_mmc_is_prepared(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = get_pow_ctl(clkm, &val);
> +	if (ret)
> +		return 1;
> +
> +	return val != 0x0;
> +}
> +
> +static int clk_pll_mmc_enable(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	int ret;
> +
> +	ret = set_phrt0(clkm, 1);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);
> +	return 0;
> +}
> +
> +static void clk_pll_mmc_disable(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_phrt0(clkm, 0);
> +	udelay(10);
> +}
> +
> +static int clk_pll_mmc_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = get_phrt0(clkm, &val);
> +	if (ret)
> +		return 1;
> +
> +	return val == 0x1;
> +}
> +
> +static unsigned long clk_pll_mmc_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val, ext_f;
> +	int ret;
> +
> +	ret = get_ssc_div_n(clkm, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = get_ssc_div_ext_f(clkm, &ext_f);
> +	if (ret)
> +		return ret;
> +
> +	return parent_rate / 4 * (val + 2) + (parent_rate / 4 * ext_f) / 8192;
> +}
> +
> +static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{

Should there be a check for a parent rate of zero before the division is
done?

> +	u32 val = DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
> +
> +	req->rate = req->best_parent_rate * val / 4;
> +	return 0;
> +}
> +
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_n(clkm, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_ext_f(clkm, 1517);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 31 ... 46:
> +		ret |= set_pi_ibselh(clkm, 3);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 2);
> +		break;
> +
> +	case 20 ... 30:
> +		ret |= set_pi_ibselh(clkm, 2);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 10 ... 19:
> +		ret |= set_pi_ibselh(clkm, 1);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 5 ... 9:
> +		ret |= set_pi_ibselh(clkm, 0);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 0);
> +		break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_FCODE_SSC_EMMC_MASK, 321);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC4_OFFSET,
> +				 PLL_GRAN_EST_EM_MC_MASK, 5985);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_EN_SSC_EMMC_MASK, 0x1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_EN_SSC_EMMC_MASK, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK,
> +				 0x1 << PLL_FLAG_INITAL_EMMC_SHIFT);

It looks like the rate and parent rate are not used in this function.
Will this always end up with the same rate when everything is
successful?

Brian

