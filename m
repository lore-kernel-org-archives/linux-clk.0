Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4038DC76
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429889; cv=none; b=lsdrSQvVHcyKvTLTTwZ44z/ayIyHrV4RYC0LapzGOnUAP/NwmrJiLpO7LY0dcu3YY4DmwKCet/KalF31uS09H3yor/aKzCPyySwqxbyXnb2gGMTiaUD1MZdO4tWcQ6l1DAJfY+iaqeRDuHmWAd0G5JA3FywKVJdem1JhLOHhgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429889; c=relaxed/simple;
	bh=JZl9+bHfMay/ZjhPDF2Xq1YsJ/7+DBgVZx801cLovVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPfs7QAM3LjndFFLLPkkvTs4nRddgQyL6nT4s9T38rlSHEQ72iQbznmN7xnsOj5tBjic3EfLgdvK13S24Miwa8Vcrs6Ioe1P2kjkCdRs6bzOx/o1gh3RWnVn4sLAHPNPS4TNsPOpOo8wI3itDm2RSUrE8XSbXrbefB0TfKJIHSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RP7vNkQ/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=geIcb8nU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RP7vNkQ/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="geIcb8nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvDcicCf/92emzHQEOVPNFWhRbB0UzW7pFnECrP6Om0=;
	b=RP7vNkQ/r4l0Cxo4tEgHvVW6xNUcTm0shHCwJxXBnEAD2gDXDKDw1XWxxSAhzeH5eqGih0
	gdjfZQthKTkDYUfxo6xH/vemZb17QeH4L+yuUS41qI+cv6GV/6G4ucOd93SibcfVglzOfv
	6X/mVlYJaJ59QT5AXbpKFpXAqoHcvno=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-0g9_LUPFPZi12ZAI4HHzaA-1; Thu, 30 Jul 2026 12:44:43 -0400
X-MC-Unique: 0g9_LUPFPZi12ZAI4HHzaA-1
X-Mimecast-MFC-AGG-ID: 0g9_LUPFPZi12ZAI4HHzaA_1785429883
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e6fce9ed7so477407b3.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429883; x=1786034683; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvDcicCf/92emzHQEOVPNFWhRbB0UzW7pFnECrP6Om0=;
        b=geIcb8nUaq2stMM0DE8ZsZ5G9Y9bjjEH0y4HJVCR2K7MwhZ/TL2ULeCPYC1uC6X1RD
         /TH+8GAB22gNKNjGGAHXz+Gkj1qB/XmqV8dKwqNSo8EYf5EcoK9zwwFTcontuiPGIygu
         FejpRePW5XahqsS9APVlfnSWxepAkZKrRhZnSE8MJjLeSlIYHMQrXSAZqjLAYFJP4s36
         thmPLAjuo7lPvbp/3KpHBknlYPQybIpIW08dIazkP3cSqSJudq/cDYvMVnNVwvbf7zbm
         ufZUbSfNMZVWZJmzaePKBGi+Ftr5U8qUDpIn/aH273m+UL1eNVTlMbBLFN3cpH1TuXrF
         /GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429883; x=1786034683;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QvDcicCf/92emzHQEOVPNFWhRbB0UzW7pFnECrP6Om0=;
        b=J7mOnQNvHwLJJQrekWYe2khMaxtXx6MMBnlXmLxH5dsq/C/hmqLTwfrlpevj3y66o5
         6kO+vmMUqqgCjx2o1Al+rEholggSECxdrz5RuS7w0KahQKgOQyC2X1DRC6hxGDpIWqya
         7ZvurMwhT1yrYyGrjdHm4f5nvxO+5uf9/7DM9MUPJf9CVUeFzxuAHcvOet0H2i7zUgiR
         kRoaYQGZgNUOU44s+SF43GYQREqFiEJ4EuPoYz78jisrXZdRbp+kvF9sRc4msr6XnsIV
         xRitccuOCsdv6QUWCY7iKh2mxyqya28XRwRsji25IDK1v+LjP43vV4iuQWYUiYj3GlwE
         bByw==
X-Forwarded-Encrypted: i=1; AHgh+RrPyvPCamjMmOQbIgby9BQEmR5jc+1iJUAftb+r2Vtwogx6vEwf0gmiKoOhzgLB470JyqBCDaWpEYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6CEpBi9rsrHxwdxgTXIwLY8gaWwg9gQd0eVQu6nk6pjz0Ems
	wWH9kFZtlHDvjGR87qr8PX+bdetFlEcWA48rWRxvWrK3xxYxfMZmJu/Qr73UvpioFUvwjfCkkFE
	EX1tjie9/Y4Mq66BPkO4ld3QSuFdCATVK/VtMnu2ayfbbZyAa9YMPNT5+MkyUJA==
X-Gm-Gg: AR+sD11lEyr5n7QEjG+YgTBa9nvh9FNl6qByXo3tsO+MM2NRXNYKVkK9xRg/dRVCfY3
	nOsqJxoYAivMXRk2SgVw4WGssBKsCUGx9ueBdeRvdPodIEDPqkqnCtDSDdh5fMx/JOEgxBh51r2
	spS7GtCtX/Pk1qSeuylAutCW/A92AHu8uk+NTvd/wqwqoTz2QXNLtXxjPVqbkIQ+BmKPr+cBgLC
	h4UuRVkVDpB5gumZJRXbIDvdsLebNplm7L34IlgeuOsYBB1POlIBkBpS6jwZONMYmpA7ecvL5Ih
	bWbChWNXwZeV0sVDmE+isE5g+9D5g0YqpjXqJLOAAgN74cQE5JTzzk9W/aaapIjCHyI/RDXRypx
	xdlT4XExudk142oUabSZglaatFB4ichY3qjA=
X-Received: by 2002:a05:690c:6a11:b0:80b:bfee:c427 with SMTP id 00721157ae682-81fc1dfdb7bmr7624747b3.13.1785429882983;
        Thu, 30 Jul 2026 09:44:42 -0700 (PDT)
X-Received: by 2002:a05:690c:6a11:b0:80b:bfee:c427 with SMTP id 00721157ae682-81fc1dfdb7bmr7624377b3.13.1785429882395;
        Thu, 30 Jul 2026 09:44:42 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8a89734sm13512147b3.29.2026.07.30.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:44:41 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:44:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <amt_dXo576fJeqKU@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-9-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-9-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:28:03PM +0800, Yu-Chun Lin wrote:
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
> Changes in v11:
> - Remove PLL MMC MAINTAINER entry.
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Kconfig       |   3 +
>  drivers/clk/realtek/Makefile      |   2 +
>  drivers/clk/realtek/clk-pll-mmc.c | 434 ++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h     |  13 +
>  4 files changed, 452 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll-mmc.c
> 
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index ed97531e321d..2ff780581ae0 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -27,4 +27,7 @@ config RTK_CLK_COMMON
>  	  multiple Realtek clock implementations, and include integration
>  	  with reset controllers where required.
>  
> +config RTK_CLK_PLL_MMC
> +	bool
> +
>  endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 3b014240a211..97447e92bc35 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -6,3 +6,5 @@ clk-rtk-y += clk-pll.o
>  clk-rtk-y += freq_table.o
>  clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
> new file mode 100644
> index 000000000000..8da1933a5a07
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,434 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/export.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define RTK_PLL_MMC_VAL_MIN 1
> +#define RTK_PLL_MMC_VAL_MAX 255
> +
> +#define RTK_PLL_EMMC1_OFFSET           0x0
> +#define RTK_PLL_EMMC2_OFFSET           0x4
> +#define RTK_PLL_EMMC3_OFFSET           0x8
> +#define RTK_PLL_EMMC4_OFFSET           0xc
> +#define RTK_PLL_SSC_DIG_EMMC1_OFFSET   0x0
> +#define RTK_PLL_SSC_DIG_EMMC3_OFFSET   0xc
> +#define RTK_PLL_SSC_DIG_EMMC4_OFFSET   0x10
> +
> +#define RTK_PLL_MMC_SSC_DIV_N_VAL      0x1b
> +
> +#define RTK_PLL_PHRT0_MASK             BIT(0)
> +#define RTK_PLL_PHSEL_MASK             GENMASK(4, 0)
> +#define RTK_PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
> +#define RTK_PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
> +#define RTK_PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
> +#define RTK_PLL_PI_IBSELH_MASK         GENMASK(28, 27)
> +#define RTK_PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
> +#define RTK_PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
> +#define RTK_PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
> +#define RTK_PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
> +#define RTK_PLL_EN_SSC_EMMC_MASK       BIT(0)
> +#define RTK_PLL_FLAG_INITAL_EMMC_MASK  BIT(8)
> +
> +#define RTK_PLL_PHRT0_SHIFT            1
> +#define RTK_PLL_SSCPLL_RS_SHIFT        10
> +#define RTK_PLL_SSCPLL_ICP_SHIFT       5
> +#define RTK_PLL_SSC_DIV_EXT_F_SHIFT    13
> +#define RTK_PLL_PI_IBSELH_SHIFT        27
> +#define RTK_PLL_SSC_DIV_N_SHIFT        16
> +#define RTK_PLL_NCODE_SSC_EMMC_SHIFT   13
> +#define RTK_PLL_FLAG_INITAL_EMMC_SHIFT 8
> +
> +#define CYCLE_DEGREES                  360
> +#define PHASE_STEPS                    32
> +#define PHASE_SCALE_FACTOR             1125
> +
> +static inline struct rtk_clk_regmap_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_pll_mmc, clkr);
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
> +static inline int get_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 *val)
> +{
> +	u32 sft = id ? 8 : 3;
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val >> sft) & RTK_PLL_PHSEL_MASK;
> +
> +	return 0;
> +}
> +
> +static inline int set_phsel(struct rtk_clk_regmap_pll_mmc *clkm, int id, u32 val)
> +{
> +	u32 sft = id ? 8 : 3;
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC1_OFFSET,
> +				  RTK_PLL_PHSEL_MASK << sft, val << sft);
> +}
> +
> +static inline int set_sscpll_rs(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_RS_MASK, val << RTK_PLL_SSCPLL_RS_SHIFT);
> +}
> +
> +static inline int set_sscpll_icp(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSCPLL_ICP_MASK, val << RTK_PLL_SSCPLL_ICP_SHIFT);
> +}
> +
> +static inline int get_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	u32 raw_val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & RTK_PLL_SSC_DIV_EXT_F_MASK) >> RTK_PLL_SSC_DIV_EXT_F_SHIFT;
> +
> +	return 0;
> +}
> +
> +static inline int set_ssc_div_ext_f(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_SSC_DIV_EXT_F_MASK,
> +				  val << RTK_PLL_SSC_DIV_EXT_F_SHIFT);
> +}
> +
> +static inline int set_pi_ibselh(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC2_OFFSET,
> +				  RTK_PLL_PI_IBSELH_MASK, val << RTK_PLL_PI_IBSELH_SHIFT);
> +}
> +
> +static inline int set_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET,
> +				  RTK_PLL_SSC_DIV_N_MASK, val << RTK_PLL_SSC_DIV_N_SHIFT);
> +}
> +
> +static inline int get_ssc_div_n(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC3_OFFSET, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = (raw_val & RTK_PLL_SSC_DIV_N_MASK) >> RTK_PLL_SSC_DIV_N_SHIFT;
> +
> +	return 0;
> +}
> +
> +static inline int set_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 val)
> +{
> +	return regmap_write(clkm->clkr.regmap, clkm->pll_ofs + RTK_PLL_EMMC4_OFFSET, val);
> +}
> +
> +static inline int get_pow_ctl(struct rtk_clk_regmap_pll_mmc *clkm, u32 *val)
> +{
> +	int ret;
> +	u32 raw_val;
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
> +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;
> +
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
> +	val = DIV_ROUND_CLOSEST(degrees * 100, PHASE_SCALE_FACTOR);
> +	ret = set_phsel(clkm, phase_id, val);
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
> +	struct clk_hw *hwp;
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	int phase_id;
> +	int ret;
> +	u32 val;

Put in reverse Christmas tree order. You can combine the two int rows.

> +
> +	hwp = clk_hw_get_parent(hw);
> +	if (!hwp)
> +		return -ENOENT;
> +
> +	clkm = to_clk_pll_mmc(hwp);
> +	phase_id = (hw == &clkm->phase0_hw) ? 0 : 1;
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
> +	.set_phase = rtk_clk_regmap_pll_mmc_phase_set_phase,
> +	.get_phase = rtk_clk_regmap_pll_mmc_phase_get_phase,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "REALTEK_CLK");

Just looking at existing clk drivers, there's 5 that use
EXPORT_SYMBOL_NS_GPL(). 3 of them use CLK_FOO, so let's just make this
CLK_REALTEK for consistency with the other drivers. I like this because
it's framework/clk subsystem. I'm not going to call this out on the
other patches.

> +
> +static int rtk_clk_regmap_pll_mmc_prepare(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	return set_pow_ctl(clkm, 7);
> +}
> +
> +static void rtk_clk_regmap_pll_mmc_unprepare(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +
> +	set_pow_ctl(clkm, 0);
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_is_prepared(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
> +static int rtk_clk_regmap_pll_mmc_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	int ret;
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
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
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
> +static unsigned long rtk_clk_regmap_pll_mmc_recalc_rate(struct clk_hw *hw,
> +							unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val, ext_f;
> +	u64 rate, base;
> +	int ret;
> +
> +	ret = get_ssc_div_n(clkm, &val);
> +	if (ret)
> +		return 0;
> +
> +	ret = get_ssc_div_ext_f(clkm, &ext_f);
> +	if (ret)
> +		return 0;
> +
> +	base = parent_rate / 4;
> +	rate = base * (val + 2);
> +	rate += div_u64(base * ext_f, 8192);
> +
> +	return rate;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	u32 val;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	val = DIV_ROUND_CLOSEST_ULL((u64)req->rate * 4, req->best_parent_rate);
> +	val = clamp_t(u32, val, RTK_PLL_MMC_VAL_MIN, RTK_PLL_MMC_VAL_MAX);
> +	req->rate = req->best_parent_rate * val / 4;
> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	/*
> +	 * The 'rate' and 'parent_rate' are intentionally unused here.
> +	 *
> +	 * Despite receiving various rate requests (e.g., 26MHz, 52MHz, 200MHz),
> +	 * this function consistently configures the hardware for 27MHz (0x1b).
> +	 * This is because these settings reflect the input reference clock
> +	 * frequency to the SSCPLL, not the final PLL output frequency.
> +	 *
> +	 * The actual frequency division to achieve the requested eMMC rate
> +	 * is handled internally by the downstream eMMC host controller.
> +	 */
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_FLAG_INITAL_EMMC_MASK,
> +				 0x0 << RTK_PLL_FLAG_INITAL_EMMC_SHIFT);

determine_rate() above implies that this PLL can do multiple frequencies.
There will be a mismatch between what the clk core thinks the frequency
is compared to what's actually programmed in the hardware. Should
determine_rate above also return the fixed rate as well?

Brian

