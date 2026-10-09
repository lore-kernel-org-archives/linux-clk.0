Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77551A75E
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570600; cv=none; b=nLulOk3V6LxeqgybEIzvwy80tINlOnKpYWXFjL/8vmtDLfan83KVLDaXXhFVo7Yyc4StRCqjqxzyc4rN1KhyIuRxciAPhmBsFeY2yJE1+hzLRudk9gr8SA3Gj+qm25uPLgH5mNpD19nh2DqOtgxGRMqGZYNY51tcAW3IOmT0uS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570600; c=relaxed/simple;
	bh=/gDtdpICbc2dl6QRANQG5U7sVbCcqdnYU9kYcSAZM1g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FEsctHhVyPzGRN5dbCoE+uE7OAgPRESdd4r7r1Dk6duFSdcvtdDpG6sEePTmuy0hif/a8cxUSrtUJl9FFNXWlAy6lKIw+f3lMHH4Pr3ifzIXrYvFpTv4QMRfpJSXSRWzMY4RD12PddFag2GFiuPiPgVmT3vxVgyQGIrwbyAtBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Amr4PwTS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Amr4PwTS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so1858255e9.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570587; x=1792175387; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=;
        b=Amr4PwTSmCkTekxqaH0SHapDLV0VzoKGMomX53ekIy9lTaD8xr5pdfMeyj5BuKhHil
         8gClfRzIAoTkzZxTS0LxXm9Di9vDrdYS9u1/IIXUvH4IyvvC4QEryJ42+x3JdilCwq0d
         F8dcMvbd4OYt7rcJjuJ+KsPmogiRaLEwc6Vj0aRmicx4+NnnoayDsip/MuCT5W753Sny
         qK9ZCESsVhsytFDW4BgMr/KJRmVGlD1d+/nAdtw6zE/RI4xe7bcM+fsvOJEGZYaZNQTJ
         ufChXi3Ls458c1NqHWONrVD/MbhIt93hfAXuOzLW5GORhHBJ/yhb6AIKF8QqfMUZsUch
         YuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570587; x=1792175387;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUQyrtOL8NOHCajM9hiI+JxRUujYqE2VpnERpyUoFds=;
        b=O3NaP0IzrA3CeFk08gI+DFD2hVwOY9PNrbJcYaGg23ogjQBPdOKbaOk8QZ4s5eHBDi
         60V1XWvvs9m2xOxkHd4hmw4rPT6/esYFIfoXBkWQ6d9g4EBMsflzsXjTsS+liSlw9SAs
         L3ggjtJVInM/vimGh4pecvPbxme5nc6ZuQNIVi8gtMj595449h15TiKLvps9QqkM0tLj
         YtLbr4XFBQHkaAkZy7UPqVAg/vgaZnl1/lXyVr+8UenI3G5G9JjKN0v2VgRBOZ/xXIRm
         yucAngdGh7lrICXwK+WhNMWMmAbTZ40cAjFUkrgAh10Q0kZfPqZb5sZZJ2e6G5u8b9g7
         PCCw==
X-Forwarded-Encrypted: i=1; AKwUvByoRk+vBCx7XvzJHkdQFqzwcN+GaiDSXVxSGyCkKfYxuWAYmKGgIjULKlrNLDF2RemVBGIrlF5nQd4=@vger.kernel.org
X-Gm-Message-State: AFuF++kr7i2dj5IZAwQvQZ90aCD6y9v/xhuaQ5pzmie7ql0NnJjnglTO
	km/C9jPT3C07fZiit2VY5JEpXqLl5o6/tJEt7HVzlQtEgnYeFFKLKtcy5bW3UYv8hOs=
X-Gm-Gg: AYBFou0F+kOiFZfqyak7Y8TUnjZgcXXEgmDWcmvSynLxDcrWaoWFM7P3A9Bwj8+Pjh9
	cQlRuC5rkB8b0WsTr8uVj+69ACOvjiIZLCEAHExaKd4wfjofbz/O9p5yGA6/bgIlckGthm3Wnfa
	JRY2LsQUSRzS5kV9NjxrLKsBclL1TrRlF5czL8AnmOp9A/zcB0XUi8dMVilM/8paf4LGckF0xXH
	X5ASKcMXVklWp5cJQ0tkToRxOlPkvpqXpUCQAZabN7p1Jj37m7mICecWoDAU7V8vB2lWnJNpBD1
	z3js5RERa7AC2CaSEnNqd4gewohOOc+AYoekMjeJxQF/sAh5GVBj3L2SgrVg6vQHKmeDpUPqqcm
	CkMbGub1Nsls8fDKbYoCU0DYhiG9ZagbscAAw8GhgR+4UfcEM89RevGWEaf8rQHThITvCmxRIEb
	YYvEGUAiLkSTE0aaVRlpQMXxd9f9PzN+GaNIDFzAk3R2Li97qW1izs09I3Vr+40lOroCuROCKvE
	azCtTt+aHP5CLryGg==
X-Received: by 2002:a05:600c:6215:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a18e4fa5c9mr46277965e9.34.1791570586952;
        Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm81412255e9.10.2026.10.09.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-9-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-9-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.18071910694635064414.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15968; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/gDtdpICbc2dl6QRANQG5U7sVbCcqdnYU9kYcSAZM1g=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaYGWnR12E1oZtTZqr1f9tVBPZur/2L/rXtl7xO08
 I2w6CHrjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExktiXD/+Azi96ZGyx7H92i
 Eaevnff/wKe3N+8umm0458WNzyZOKUkMf8U+XGRr+nT3kXNiyBHddPUjFd5LyuP/Jq7vr4tK9Fz
 5hxkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

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
> Reviewed-by: Brian Masney <bmasney@redhat.com>
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
> index 217ccaf5644a..52b9cb9c2323 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -6,3 +6,5 @@ clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-pll-mmc.c
> new file mode 100644
> index 000000000000..2ee90b5d8a38
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,430 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define RTK_PLL_EMMC1_OFFSET            0x0
> +#define RTK_PLL_EMMC2_OFFSET            0x4
> +#define RTK_PLL_EMMC3_OFFSET            0x8
> +#define RTK_PLL_EMMC4_OFFSET            0xc
> +#define RTK_PLL_SSC_DIG_EMMC1_OFFSET    0x0
> +#define RTK_PLL_SSC_DIG_EMMC3_OFFSET    0xc
> +#define RTK_PLL_SSC_DIG_EMMC4_OFFSET    0x10
> +
> +#define RTK_PLL_MMC_SSC_DIV_N_VAL       0x1b
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
> +#define RTK_PLL_FLAG_INITIAL_EMMC_MASK  BIT(8)
> +
> +#define RTK_PLL_PHRT0_SHIFT             1
> +#define RTK_PLL_SSCPLL_RS_SHIFT         10
> +#define RTK_PLL_SSCPLL_ICP_SHIFT        5
> +#define RTK_PLL_SSC_DIV_EXT_F_SHIFT     13
> +#define RTK_PLL_PI_IBSELH_SHIFT         27
> +#define RTK_PLL_SSC_DIV_N_SHIFT         16
> +#define RTK_PLL_NCODE_SSC_EMMC_SHIFT    13
> +#define RTK_PLL_FLAG_INITIAL_EMMC_SHIFT 8
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
> +	u32 raw_val;
> +	int ret;
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
> +	struct clk_hw *hwp = clk_hw_get_parent(hw);
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	int phase_id, ret;
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
> +	struct rtk_clk_regmap_pll_mmc *clkm;
> +	struct clk_hw *hwp;
> +	int phase_id, ret;
> +	u32 val;
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
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_phase_ops, "CLK_REALTEK");
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

looks fairly close to the regular gate as it stand.
should your _pow be in there instead ?

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

So you've got a pre-divider

> +	rate = base * (val + 2);

Then an integer divider

> +	rate += div_u64(base * ext_f, 8192);

and finally the fractional part

> +
> +	return rate;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	u32 val = RTK_PLL_MMC_SSC_DIV_N_VAL + 2;
> +	u64 tmp;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	req->rate = req->best_parent_rate / 4 * val;

Here you seem to support only a single integer part setting

> +	tmp = (u64)(req->best_parent_rate / 4) * 1517;
> +	req->rate += tmp >> 13;

So nothing says that here that the math won't overflow

Could you explain the 1517 here ? I suppose it is linked to the 8192 above ?

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

Maybe you should fix the mmc driver then and properly request 27MHz if this what
you expect of this particular PLL. Just taking any request and setting something
else regardless is not OK.

> +	 * This is because these settings reflect the input reference clock
> +	 * frequency to the SSCPLL, not the final PLL output frequency.
> +	 *
> +	 * The actual frequency division to achieve the requested eMMC rate
> +	 * is handled internally by the downstream eMMC host controller.
> +	 */
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 0x0 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
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
> +	ret = set_pi_ibselh(clkm, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_sscpll_rs(clkm, 3);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_sscpll_icp(clkm, 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << RTK_PLL_NCODE_SSC_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC3_OFFSET,
> +				 RTK_PLL_FCODE_SSC_EMMC_MASK, 321);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC4_OFFSET,
> +				 RTK_PLL_GRAN_EST_EM_MC_MASK, 5985);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK, 0x1);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_EN_SSC_EMMC_MASK, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + RTK_PLL_SSC_DIG_EMMC1_OFFSET,
> +				 RTK_PLL_FLAG_INITIAL_EMMC_MASK,
> +				 0x1 << RTK_PLL_FLAG_INITIAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 20);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops rtk_clk_pll_mmc_ops = {
> +	.prepare          = rtk_clk_regmap_pll_mmc_prepare,
> +	.unprepare        = rtk_clk_regmap_pll_mmc_unprepare,
> +	.is_prepared      = rtk_clk_regmap_pll_mmc_is_prepared,

prepare is meant for slow (as in sleeping) operation.
I've seen no sleeping operation in your implementation.
If the regmap is slow, then there is problem because your using the same one
in enable/disable() which run under a spin lock

> +	.enable           = rtk_clk_regmap_pll_mmc_enable,
> +	.disable          = rtk_clk_regmap_pll_mmc_disable,
> +	.is_enabled       = rtk_clk_regmap_pll_mmc_is_enabled,
> +	.recalc_rate      = rtk_clk_regmap_pll_mmc_recalc_rate,
> +	.determine_rate   = rtk_clk_regmap_pll_mmc_determine_rate,
> +	.set_rate         = rtk_clk_regmap_pll_mmc_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_mmc_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> index 023b49bbcbee..d21793387eee 100644
> --- a/drivers/clk/realtek/clk-pll.h
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -44,4 +44,17 @@ struct rtk_clk_regmap_pll {
>  extern const struct clk_ops rtk_clk_pll_ops;
>  extern const struct clk_ops rtk_clk_pll_ro_ops;
>  
> +struct rtk_clk_regmap_pll_mmc {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int pll_ofs;
> +	unsigned int ssc_dig_ofs;
> +	struct clk_hw phase0_hw;
> +	struct clk_hw phase1_hw;

your phases and pll use completly different ops. Why do you to mix the 2 here ?

-- 
Jerome

