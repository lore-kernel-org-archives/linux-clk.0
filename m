Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAA1547FF;
	Wed, 18 Dec 2024 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512604; cv=none; b=FtJOh9kCwUDNeui1CTckeghHV+kK2mpWeuqDp39QXaOlSkaCQpGU9WbQI04yLIad58YT+VAzQahd5q9qQE/ShQ8FgzcjiMykpiY48DaMN94v4sU+56ivolpuYEzATA82lgFhJL79hwbmGmO87hnpxIjoPnWunUMUIfK3VWLTKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512604; c=relaxed/simple;
	bh=8NoGq6kk78SSnYva/6rAdF5mld6OTdv2DieIppgMxw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fibuaryRGNNNFDY6JTS+qqEEf3j19JLJv+aadlIZIXfiFa8yWh4goRj4H2X9SrtQk/L6plgJOhiK/Hef3Kr2dfcxHoI6fgqltUNPyIps7mYGJzx6gCLMoMY8tjZageqtyCgZJpYWlqbDm4BU/GK0V+efKKPyM05XsvC5G3toHv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eswQ8N2h; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eswQ8N2h"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6fc5bf609so354260885a.1;
        Wed, 18 Dec 2024 01:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734512601; x=1735117401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRdLdfLHCtTxVWya9q7QwJ93naqGXr0sXIFf7mt5Vkg=;
        b=eswQ8N2hK/QZk0rj+Ybahm258T96jsIt9EOIPlxsUOS9drwZOzlDbZLQkpqOjHgQ1j
         KKC0pqunmO6aeGU6FxWJwY+5mpfRQ+Xm0CzFFgebkz/YWg5fZcUpRpZChk6CF4lu3pe/
         48l0Zn0IL++CA0dVUDM/1y1UF3+9mYABADtAJaUhqtJWxZO/3Cg/McTlfUAqvann0JQX
         T2/D8nC76e1DuwsM6WvfwGPWL4Z0ySgoiliF9sE7+QXdgtJpOKCoh1gwsqJDQ7UcXrUd
         bv5xCLG+1xV8z9eAb2qDg5SYQ2Y5YEUGGyhqFeghkPt82Iy5Z/b40fTMmuVNVWyI6ed1
         MTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734512601; x=1735117401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRdLdfLHCtTxVWya9q7QwJ93naqGXr0sXIFf7mt5Vkg=;
        b=HG3UR+xhUv5Wtiz4EAOPyClltGPPa/TKA38NLuaIptbsVJLYztDTLm6/IDCDJFAvej
         OjFq3iF70LoR/Cp3yAUzf37vjzODz30NQhoZviNjQEdUEyKV6DQkahl+0Od8dFg8n0QJ
         R2xSKxOSjT3YeTPPTqjb1VUkzKgWKDFUWmbI5k8j5AAKSu0gnDvV6B3o1R6fsT/Z9MqJ
         AppOrqh7jmqsjaWf5Mr8yc7YEmJ2TfoHVgBekJaDyNz5PHd44xky4E8pWVXfXwAq1dzd
         LDntdjVgzqhjMqA419mU/9Zw467iofReHayvhkTxeCkfB76PnhaFs14FUsj3qGamVSur
         cBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVdgoTsX9qnp/gb0+nTVJPO5yohWLXBoq4atlsZMtf2F3xnK7ElTRoU+eFhnrBbQxICILulO1NQTwHukta@vger.kernel.org, AJvYcCW02G+7SIiz7ggt9t1wIO7wZidoV4fASu0JS3zxjt1nUkzxNGwbqTS6g+rufJq0cAVOvUfviAGIJ/dR@vger.kernel.org, AJvYcCWccAndkk4nOK5McvmPsWUkSzmoGLzHi0LsL4qDaSHTHD5WNfbX6GFLvVoDeuZo2IMk8eaNx3QxSJF5@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvwuMwYcUrCkulBlY1s5N8/v9CiliSCUjjZfDPW3HVAzXm/aN
	M4Xq1VN+5xXEmcJGFJWvQD639pnFbBq9fUASpgwGQe0ERvqx64Zg
X-Gm-Gg: ASbGncvAzThZK84LJHLVHQq3dqhIta7QqD4WT3Y5aNwxWxOvfBN9KUseEflJvqGhejn
	SzNizBgKiXlrH5ghpNtjrJTOaClpWLpmDTYYBl/Ql1MxqXtg/HeAEf24is+hy7Bw+DVAIJ/iCPU
	z+ty4+mhYpdVbIo7APX8W0ZDOgExa7M8tD/+HdIoHx/E32q45hwCzhsBTuNWLfF3R9ROgq22dsg
	k6GY5Lpq1LW4iFCeEfCye41D/cUPFOE
X-Google-Smtp-Source: AGHT+IHIh+isE6oKIPishyr/XKqQDlHJnnTXjbRPJxsMVMeZi6BTkAZUEnn6VdDa/2khagRhtmmCIQ==
X-Received: by 2002:a05:620a:1915:b0:7b6:da92:fcd0 with SMTP id af79cd13be357-7b8636e88bdmr234217885a.8.1734512600956;
        Wed, 18 Dec 2024 01:03:20 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048bd90dsm404115785a.87.2024.12.18.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:03:20 -0800 (PST)
Date: Wed, 18 Dec 2024 17:03:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <3fhnjybnrrixse5h6epfp2aj7pk3uo6fk34gvsqkku6sofir6r@t3ofcy5xure6>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-7-heylenay@4d2.org>
 <xswwcu4htkls4rdaoccrlyotup4rxjma332wewyqkmctezouxl@oplcxg5nglty>
 <20241218072727-GYA3467167@gentoo>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218072727-GYA3467167@gentoo>

On Wed, Dec 18, 2024 at 03:27:27PM +0800, Yixun Lan wrote:
> On 14:47 Sun 08 Dec     , Inochi Amaoto wrote:
> > On Tue, Nov 26, 2024 at 02:31:28PM +0000, Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and is managed by several independent controllers in
> > > different SoC parts (APBC, APBS and etc.), thus different compatible
> > > strings are added to distinguish them.
> > > 
> > > Some controllers may share IO region with reset controller and other low
> > > speed peripherals like watchdog, so all register operations are done
> > > through regmap to avoid competition.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > ---
> > >  drivers/clk/Kconfig               |    1 +
> > >  drivers/clk/Makefile              |    1 +
> > >  drivers/clk/spacemit/Kconfig      |   20 +
> > >  drivers/clk/spacemit/Makefile     |    5 +
> > >  drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
> > >  drivers/clk/spacemit/ccu_common.h |   62 +
> > >  drivers/clk/spacemit/ccu_ddn.c    |  146 +++
> > >  drivers/clk/spacemit/ccu_ddn.h    |   85 ++
> > >  drivers/clk/spacemit/ccu_mix.c    |  296 +++++
> > >  drivers/clk/spacemit/ccu_mix.h    |  336 ++++++
> > >  drivers/clk/spacemit/ccu_pll.c    |  198 ++++
> > >  drivers/clk/spacemit/ccu_pll.h    |   80 ++
> ....snip
> > > diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> > > new file mode 100644
> > > index 000000000000..de343405fcc7
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/ccu_mix.c
> > > @@ -0,0 +1,296 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Spacemit clock type mix(div/mux/gate/factor)
> > > + *
> > > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +
> > > +#include "ccu_mix.h"
> > > +
> > > +#define MIX_TIMEOUT	10000
> > > +
> > > +#define mix_hwparam_in_sel(c) \
> > > +	((c)->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 || \
> > > +	 (c)->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > > +
> > 
> > > +static void ccu_mix_disable(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +
> > > +	if (!gate)
> > > +		return;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, gate->gate_mask, gate->val_disable);
> > > +	else
> > > +		ccu_update(ctrl, common, gate->gate_mask, gate->val_disable);
> > > +}
> > > +
> > > +static int ccu_mix_enable(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +	u32 val_enable, mask;
> > > +	u32 tmp;
> > > +
> > > +	if (!gate)
> > > +		return 0;
> > > +
> > > +	val_enable	= gate->val_enable;
> > > +	mask		= gate->gate_mask;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, mask, val_enable);
> > > +	else
> > > +		ccu_update(ctrl, common, mask, val_enable);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > > +		return ccu_poll(sel, common, tmp, (tmp & mask) == val_enable,
> > > +				10, MIX_TIMEOUT);
> > > +	else
> > > +		return ccu_poll(ctrl, common, tmp, (tmp & mask) == val_enable,
> > > +				10, MIX_TIMEOUT);
> > > +}
> > > +
> > > +static int ccu_mix_is_enabled(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_gate_config *gate = mix->gate;
> > > +	u32 tmp;
> > > +
> > > +	if (!gate)
> > > +		return 1;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &tmp);
> > > +	else
> > > +		ccu_read(ctrl, common, &tmp);
> > > +
> > > +	return (tmp & gate->gate_mask) == gate->val_enable;
> > > +}
> > > +
> > > +static unsigned long ccu_mix_recalc_rate(struct clk_hw *hw,
> > > +					unsigned long parent_rate)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div;
> > > +	unsigned long val;
> > > +	u32 reg;
> > > +
> > > +	if (!div) {
> > > +		if (mix->factor)
> > > +			return parent_rate * mix->factor->mul / mix->factor->div;
> > > +
> > > +		return parent_rate;
> > > +	}
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &reg);
> > > +	else
> > > +		ccu_read(ctrl, common, &reg);
> > > +
> > > +	val = reg >> div->shift;
> > > +	val &= (1 << div->width) - 1;
> > > +
> > > +	val = divider_recalc_rate(hw, parent_rate, val, div->table,
> > > +				  div->flags, div->width);
> > > +
> > > +	return val;
> > > +}
> > 
> > I think you should distinguish these muxs, it is not good to
> > use mix_hwparam_in_sel everywhere. There are two types of mux.
> > 
> > > +
> > > +
> > 
> > Double empty line here, you should run checkpatch.
> > 
> > > +static int ccu_mix_trigger_fc(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	unsigned int val = 0;
> > > +	int ret = 0;
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6) {
> > > +		ccu_update(ctrl, common, common->fc, common->fc);
> > > +
> > > +		ret = ccu_poll(ctrl, common, val, !(val & common->fc),
> > > +			       5, MIX_TIMEOUT);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ccu_mix_determine_rate(struct clk_hw *hw,
> > > +				  struct clk_rate_request *req)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > 
> > Why a empty determine_rate function?
> > 
> > > +static unsigned long
> > > +ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate, u32 *mux_val,
> > > +		       u32 *div_val)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div ? mix->div : NULL;
> > > +	struct clk_hw *parent;
> > > +	unsigned long parent_rate = 0, best_rate = 0;
> > > +	u32 i, j, div_max;
> > > +
> > > +	for (i = 0; i < common->num_parents; i++) {
> > > +		parent = clk_hw_get_parent_by_index(hw, i);
> > > +		if (!parent)
> > > +			continue;
> > > +
> > > +		parent_rate = clk_hw_get_rate(parent);
> > > +
> > > +		if (div)
> > > +			div_max = 1 << div->width;
> > > +		else
> > > +			div_max = 1;
> > > +
> > > +		for (j = 1; j <= div_max; j++) {
> > > +			if (abs(parent_rate/j - rate) < abs(best_rate - rate)) {
> > > +				best_rate = DIV_ROUND_UP_ULL(parent_rate, j);
> > > +				*mux_val = i;
> > > +				*div_val = j - 1;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	return best_rate;
> > > +}
> > > +
> > > +static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +			   unsigned long parent_rate)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_div_config *div = mix->div;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	u32 cur_mux, cur_div, mux_val = 0, div_val = 0;
> > > +	unsigned long best_rate = 0;
> > > +	int ret = 0, tmp = 0;
> > > +
> > > +	if (!div && !mux)
> > > +		return 0;
> > > +
> > > +	best_rate = ccu_mix_calc_best_rate(hw, rate, &mux_val, &div_val);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &tmp);
> > > +	else
> > > +		ccu_read(ctrl, common, &tmp);
> > > +
> > > +	if (mux) {
> > > +		cur_mux = tmp >> mux->shift;
> > > +		cur_mux &= (1 << mux->width) - 1;
> > > +
> > > +		if (cur_mux != mux_val)
> > > +			clk_hw_set_parent(hw, clk_hw_get_parent_by_index(hw, mux_val));
> > > +	}
> > > +
> > > +	if (div) {
> > > +		cur_div = tmp >> div->shift;
> > > +		cur_div &= (1 << div->width) - 1;
> > > +
> > > +		if (cur_div == div_val)
> > > +			return 0;
> > > +	} else {
> > > +		return 0;
> > > +	}
> > > +
> > > +	tmp = GENMASK(div->width + div->shift - 1, div->shift);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, tmp, div_val << div->shift);
> > > +	else
> > > +		ccu_update(ctrl, common, tmp, div_val << div->shift);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5)
> > > +		ret = ccu_mix_trigger_fc(hw);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static u8 ccu_mix_get_parent(struct clk_hw *hw)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	u32 reg;
> > > +	u8 parent;
> > > +
> > > +	if (!mux)
> > > +		return 0;
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_read(sel, common, &reg);
> > > +	else
> > > +		ccu_read(ctrl, common, &reg);
> > > +
> > > +	parent = reg >> mux->shift;
> > > +	parent &= (1 << mux->width) - 1;
> > > +
> > > +	if (mux->table) {
> > > +		int num_parents = clk_hw_get_num_parents(&common->hw);
> > > +		int i;
> > > +
> > > +		for (i = 0; i < num_parents; i++)
> > > +			if (mux->table[i] == parent)
> > > +				return i;
> > > +	}
> > > +
> > > +	return parent;
> > > +}
> > > +
> > > +static int ccu_mix_set_parent(struct clk_hw *hw, u8 index)
> > > +{
> > > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > > +	struct ccu_common *common = &mix->common;
> > > +	struct ccu_mux_config *mux = mix->mux;
> > > +	int ret = 0;
> > > +	u32 mask;
> > > +
> > > +	if (!mux)
> > > +		return 0;
> > > +
> > > +	if (mux->table)
> > > +		index = mux->table[index];
> > > +
> > > +	mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> > > +
> > > +	if (mix_hwparam_in_sel(common))
> > > +		ccu_update(sel, common, mask, index << mux->shift);
> > > +	else
> > > +		ccu_update(ctrl, common, mask, index << mux->shift);
> > > +
> > > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6)
> > > +		ret = ccu_mix_trigger_fc(hw);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +const struct clk_ops spacemit_ccu_mix_ops = {
> > > +	.disable	 = ccu_mix_disable,
> > > +	.enable		 = ccu_mix_enable,
> > > +	.is_enabled	 = ccu_mix_is_enabled,
> > > +	.get_parent	 = ccu_mix_get_parent,
> > > +	.set_parent	 = ccu_mix_set_parent,
> > > +	.determine_rate  = ccu_mix_determine_rate,
> > > +	.recalc_rate	 = ccu_mix_recalc_rate,
> > > +	.set_rate	 = ccu_mix_set_rate,
> > > +};
> > 
> > I think you should separate the clock into different type and
> > use pre-defined function to simplify, but not use a unified,
> > complex and hard to read structure to represent all kinds of
> > clocks.
> > 
> agree
> 
> I'd not object to use composite clock, it simplify the implementation,
> but, in this version, there is lots of "if" conditions which make it
> hard to review and maintain..
> 
> would it possibile to use more basic clk prototype? or just the composite
> model[1] or something similar as owl-composite.c [2] which has more fine
> composite prototype (instead of bundling all in one)
> 
> drivers/clk/clk-composite.c [1]
> drivers/clk/actions/owl-composite.c [2]
> 

This depends on what you clock is. I guest this mix has a all in one
register to perform mix/div/gate. If so, it is better to provide multiple
clk_ops to adopt the real one. Otherwise, it will be better to use
different clk type to represent the real clock.

Regards,
Inochi
