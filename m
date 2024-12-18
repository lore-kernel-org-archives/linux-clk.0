Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841D21537B9;
	Wed, 18 Dec 2024 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506861; cv=none; b=Z/CYvcOFhepRg8KiUJ9o545+mYDdVxq7tjG9UtEyKcWXWwuhBBs559nBc9tz0Wdelp2Y+Xyww3KG7EhjhF2eq/SVBRNA3n7tZxpWVMoC3a8YWYtSv12qeERO8rOZHzcDMOzFreAE8d4ooiqKjpfqooN5L/NxP6c3A143ObFAST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506861; c=relaxed/simple;
	bh=24yKxQP3AHYO1KDZFMvZjzah1HywRDY7jknQOwXhgEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvWYkMf3EKLqJtBwu/956evcLezP+FeNSB+y9jZ6k7wOfJtaUEflm3ngAKmEI3LtNGUFR1y6arRRiu2WZCavHry+So4RMc7AHcAXBcAmdSuulczg1KiSe1oYqkSmqBSV1kjpru0sSK4p4w9UTLMI7kWUUCh6uCD6mys2ml1j77w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 18 Dec 2024 15:27:27 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <20241218072727-GYA3467167@gentoo>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <20241126143125.9980-7-heylenay@4d2.org>
 <xswwcu4htkls4rdaoccrlyotup4rxjma332wewyqkmctezouxl@oplcxg5nglty>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xswwcu4htkls4rdaoccrlyotup4rxjma332wewyqkmctezouxl@oplcxg5nglty>

On 14:47 Sun 08 Dec     , Inochi Amaoto wrote:
> On Tue, Nov 26, 2024 at 02:31:28PM +0000, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and is managed by several independent controllers in
> > different SoC parts (APBC, APBS and etc.), thus different compatible
> > strings are added to distinguish them.
> > 
> > Some controllers may share IO region with reset controller and other low
> > speed peripherals like watchdog, so all register operations are done
> > through regmap to avoid competition.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  drivers/clk/Kconfig               |    1 +
> >  drivers/clk/Makefile              |    1 +
> >  drivers/clk/spacemit/Kconfig      |   20 +
> >  drivers/clk/spacemit/Makefile     |    5 +
> >  drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
> >  drivers/clk/spacemit/ccu_common.h |   62 +
> >  drivers/clk/spacemit/ccu_ddn.c    |  146 +++
> >  drivers/clk/spacemit/ccu_ddn.h    |   85 ++
> >  drivers/clk/spacemit/ccu_mix.c    |  296 +++++
> >  drivers/clk/spacemit/ccu_mix.h    |  336 ++++++
> >  drivers/clk/spacemit/ccu_pll.c    |  198 ++++
> >  drivers/clk/spacemit/ccu_pll.h    |   80 ++
....snip
> > diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
> > new file mode 100644
> > index 000000000000..de343405fcc7
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_mix.c
> > @@ -0,0 +1,296 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Spacemit clock type mix(div/mux/gate/factor)
> > + *
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_mix.h"
> > +
> > +#define MIX_TIMEOUT	10000
> > +
> > +#define mix_hwparam_in_sel(c) \
> > +	((c)->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 || \
> > +	 (c)->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > +
> 
> > +static void ccu_mix_disable(struct clk_hw *hw)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_gate_config *gate = mix->gate;
> > +
> > +	if (!gate)
> > +		return;
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_update(sel, common, gate->gate_mask, gate->val_disable);
> > +	else
> > +		ccu_update(ctrl, common, gate->gate_mask, gate->val_disable);
> > +}
> > +
> > +static int ccu_mix_enable(struct clk_hw *hw)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_gate_config *gate = mix->gate;
> > +	u32 val_enable, mask;
> > +	u32 tmp;
> > +
> > +	if (!gate)
> > +		return 0;
> > +
> > +	val_enable	= gate->val_enable;
> > +	mask		= gate->gate_mask;
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_update(sel, common, mask, val_enable);
> > +	else
> > +		ccu_update(ctrl, common, mask, val_enable);
> > +
> > +	if (common->reg_type == CLK_DIV_TYPE_2REG_NOFC_V3 ||
> > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4)
> > +		return ccu_poll(sel, common, tmp, (tmp & mask) == val_enable,
> > +				10, MIX_TIMEOUT);
> > +	else
> > +		return ccu_poll(ctrl, common, tmp, (tmp & mask) == val_enable,
> > +				10, MIX_TIMEOUT);
> > +}
> > +
> > +static int ccu_mix_is_enabled(struct clk_hw *hw)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_gate_config *gate = mix->gate;
> > +	u32 tmp;
> > +
> > +	if (!gate)
> > +		return 1;
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_read(sel, common, &tmp);
> > +	else
> > +		ccu_read(ctrl, common, &tmp);
> > +
> > +	return (tmp & gate->gate_mask) == gate->val_enable;
> > +}
> > +
> > +static unsigned long ccu_mix_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_div_config *div = mix->div;
> > +	unsigned long val;
> > +	u32 reg;
> > +
> > +	if (!div) {
> > +		if (mix->factor)
> > +			return parent_rate * mix->factor->mul / mix->factor->div;
> > +
> > +		return parent_rate;
> > +	}
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_read(sel, common, &reg);
> > +	else
> > +		ccu_read(ctrl, common, &reg);
> > +
> > +	val = reg >> div->shift;
> > +	val &= (1 << div->width) - 1;
> > +
> > +	val = divider_recalc_rate(hw, parent_rate, val, div->table,
> > +				  div->flags, div->width);
> > +
> > +	return val;
> > +}
> 
> I think you should distinguish these muxs, it is not good to
> use mix_hwparam_in_sel everywhere. There are two types of mux.
> 
> > +
> > +
> 
> Double empty line here, you should run checkpatch.
> 
> > +static int ccu_mix_trigger_fc(struct clk_hw *hw)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	unsigned int val = 0;
> > +	int ret = 0;
> > +
> > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5 ||
> > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6) {
> > +		ccu_update(ctrl, common, common->fc, common->fc);
> > +
> > +		ret = ccu_poll(ctrl, common, val, !(val & common->fc),
> > +			       5, MIX_TIMEOUT);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int ccu_mix_determine_rate(struct clk_hw *hw,
> > +				  struct clk_rate_request *req)
> > +{
> > +	return 0;
> > +}
> > +
> 
> Why a empty determine_rate function?
> 
> > +static unsigned long
> > +ccu_mix_calc_best_rate(struct clk_hw *hw, unsigned long rate, u32 *mux_val,
> > +		       u32 *div_val)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_div_config *div = mix->div ? mix->div : NULL;
> > +	struct clk_hw *parent;
> > +	unsigned long parent_rate = 0, best_rate = 0;
> > +	u32 i, j, div_max;
> > +
> > +	for (i = 0; i < common->num_parents; i++) {
> > +		parent = clk_hw_get_parent_by_index(hw, i);
> > +		if (!parent)
> > +			continue;
> > +
> > +		parent_rate = clk_hw_get_rate(parent);
> > +
> > +		if (div)
> > +			div_max = 1 << div->width;
> > +		else
> > +			div_max = 1;
> > +
> > +		for (j = 1; j <= div_max; j++) {
> > +			if (abs(parent_rate/j - rate) < abs(best_rate - rate)) {
> > +				best_rate = DIV_ROUND_UP_ULL(parent_rate, j);
> > +				*mux_val = i;
> > +				*div_val = j - 1;
> > +			}
> > +		}
> > +	}
> > +
> > +	return best_rate;
> > +}
> > +
> > +static int ccu_mix_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			   unsigned long parent_rate)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_div_config *div = mix->div;
> > +	struct ccu_mux_config *mux = mix->mux;
> > +	u32 cur_mux, cur_div, mux_val = 0, div_val = 0;
> > +	unsigned long best_rate = 0;
> > +	int ret = 0, tmp = 0;
> > +
> > +	if (!div && !mux)
> > +		return 0;
> > +
> > +	best_rate = ccu_mix_calc_best_rate(hw, rate, &mux_val, &div_val);
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_read(sel, common, &tmp);
> > +	else
> > +		ccu_read(ctrl, common, &tmp);
> > +
> > +	if (mux) {
> > +		cur_mux = tmp >> mux->shift;
> > +		cur_mux &= (1 << mux->width) - 1;
> > +
> > +		if (cur_mux != mux_val)
> > +			clk_hw_set_parent(hw, clk_hw_get_parent_by_index(hw, mux_val));
> > +	}
> > +
> > +	if (div) {
> > +		cur_div = tmp >> div->shift;
> > +		cur_div &= (1 << div->width) - 1;
> > +
> > +		if (cur_div == div_val)
> > +			return 0;
> > +	} else {
> > +		return 0;
> > +	}
> > +
> > +	tmp = GENMASK(div->width + div->shift - 1, div->shift);
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_update(sel, common, tmp, div_val << div->shift);
> > +	else
> > +		ccu_update(ctrl, common, tmp, div_val << div->shift);
> > +
> > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_DIV_V5)
> > +		ret = ccu_mix_trigger_fc(hw);
> > +
> > +	return ret;
> > +}
> > +
> > +static u8 ccu_mix_get_parent(struct clk_hw *hw)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_mux_config *mux = mix->mux;
> > +	u32 reg;
> > +	u8 parent;
> > +
> > +	if (!mux)
> > +		return 0;
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_read(sel, common, &reg);
> > +	else
> > +		ccu_read(ctrl, common, &reg);
> > +
> > +	parent = reg >> mux->shift;
> > +	parent &= (1 << mux->width) - 1;
> > +
> > +	if (mux->table) {
> > +		int num_parents = clk_hw_get_num_parents(&common->hw);
> > +		int i;
> > +
> > +		for (i = 0; i < num_parents; i++)
> > +			if (mux->table[i] == parent)
> > +				return i;
> > +	}
> > +
> > +	return parent;
> > +}
> > +
> > +static int ccu_mix_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +	struct ccu_mix *mix = hw_to_ccu_mix(hw);
> > +	struct ccu_common *common = &mix->common;
> > +	struct ccu_mux_config *mux = mix->mux;
> > +	int ret = 0;
> > +	u32 mask;
> > +
> > +	if (!mux)
> > +		return 0;
> > +
> > +	if (mux->table)
> > +		index = mux->table[index];
> > +
> > +	mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
> > +
> > +	if (mix_hwparam_in_sel(common))
> > +		ccu_update(sel, common, mask, index << mux->shift);
> > +	else
> > +		ccu_update(ctrl, common, mask, index << mux->shift);
> > +
> > +	if (common->reg_type == CLK_DIV_TYPE_1REG_FC_V2 ||
> > +	    common->reg_type == CLK_DIV_TYPE_2REG_FC_V4 ||
> > +	    common->reg_type == CLK_DIV_TYPE_1REG_FC_MUX_V6)
> > +		ret = ccu_mix_trigger_fc(hw);
> > +
> > +	return ret;
> > +}
> > +
> > +const struct clk_ops spacemit_ccu_mix_ops = {
> > +	.disable	 = ccu_mix_disable,
> > +	.enable		 = ccu_mix_enable,
> > +	.is_enabled	 = ccu_mix_is_enabled,
> > +	.get_parent	 = ccu_mix_get_parent,
> > +	.set_parent	 = ccu_mix_set_parent,
> > +	.determine_rate  = ccu_mix_determine_rate,
> > +	.recalc_rate	 = ccu_mix_recalc_rate,
> > +	.set_rate	 = ccu_mix_set_rate,
> > +};
> 
> I think you should separate the clock into different type and
> use pre-defined function to simplify, but not use a unified,
> complex and hard to read structure to represent all kinds of
> clocks.
> 
agree

I'd not object to use composite clock, it simplify the implementation,
but, in this version, there is lots of "if" conditions which make it
hard to review and maintain..

would it possibile to use more basic clk prototype? or just the composite
model[1] or something similar as owl-composite.c [2] which has more fine
composite prototype (instead of bundling all in one)

drivers/clk/clk-composite.c [1]
drivers/clk/actions/owl-composite.c [2]

> > +
> > diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> > new file mode 100644
> > index 000000000000..c7d91e1c03fd
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_mix.h
> > @@ -0,0 +1,336 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#ifndef _CCU_MIX_H_
> > +#define _CCU_MIX_H_
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +struct ccu_gate_config {
> > +	u32 gate_mask;
> > +	u32 val_enable;
> > +	u32 val_disable;
> > +	u32 flags;
> > +};
> > +
> > +struct ccu_factor_config {
> > +	u32 div;
> > +	u32 mul;
> > +};
> > +
> > +struct ccu_mux_config {
> > +	const u8 *table;
> > +	u32 flags;
> > +	u8 shift;
> > +	u8 width;
> > +};
> > +
> > +struct ccu_div_config {
> > +	struct clk_div_table *table;
> > +	u32 max;
> > +	u32 offset;
> > +	u32 flags;
> > +	u8 shift;
> > +	u8 width;
> > +};
> > +
> > +struct ccu_mix {
> > +	struct ccu_factor_config *factor;
> > +	struct ccu_gate_config *gate;
> > +	struct ccu_div_config *div;
> > +	struct ccu_mux_config *mux;
> > +	struct ccu_common common;
> > +};
> > +
> > +#define CCU_GATE_INIT(_gate_mask, _val_enable, _val_disable, _flags)		\
> > +	(&(struct ccu_gate_config) {						\
> > +		.gate_mask   = _gate_mask,					\
> > +		.val_enable  = _val_enable,					\
> > +		.val_disable = _val_disable,					\
> > +		.flags	     = _flags,						\
> > +	})
> > +
> > +#define CCU_FACTOR_INIT(_div, _mul)					\
> > +	(&(struct ccu_factor_config) {					\
> > +		.div = _div,						\
> > +		.mul = _mul,						\
> > +	})
> > +
> > +
> > +#define CCU_MUX_INIT(_shift, _width, _table, _flags)			\
> > +	(&(struct ccu_mux_config) {					\
> > +		.shift	= _shift,					\
> > +		.width	= _width,					\
> > +		.table	= _table,					\
> > +		.flags	= _flags,					\
> > +	})
> > +
> > +#define CCU_DIV_INIT(_shift, _width, _table, _flags)			\
> > +	(&(struct ccu_div_config) {					\
> > +		.shift	= _shift,					\
> > +		.width	= _width,					\
> > +		.flags	= _flags,					\
> > +		.table	= _table,					\
> > +	})
> > +
> > +#define CCU_PARENT_HW(_parent)		{ .hw = &_parent.common.hw }
> > +#define CCU_PARENT_NAME(_name)		{ .fw_name = #_name }
> > +
> > +#define CCU_MIX_INITHW(_name, _parent, _flags)				\
> > +	(&(struct clk_init_data) {					\
> > +		.flags		= _flags,				\
> > +		.name		= _name,				\
> > +		.parent_data	= (const struct clk_parent_data[])	\
> > +					{ _parent },			\
> > +		.num_parents	= 1,					\
> > +		.ops		= &spacemit_ccu_mix_ops,		\
> > +	})
> > +
> > +#define CCU_MIX_INITHW_PARENTS(_name, _parents, _flags)			\
> > +	CLK_HW_INIT_PARENTS_DATA(_name, _parents,			\
> > +				 &spacemit_ccu_mix_ops, _flags)
> > +
> > +#define CCU_GATE_DEFINE(_struct, _name, _parent, _reg, _gate_mask,	\
> > +			 _val_enable, _val_disable, _flags)		\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.common	= {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init	= CCU_MIX_INITHW(_name, _parent,	\
> > +						 _flags),		\
> > +	}								\
> > +}
> > +
> > +#define CCU_FACTOR_DEFINE(_struct, _name, _parent, _div, _mul)		\
> > +struct ccu_mix _struct = {						\
> > +	.factor	= CCU_FACTOR_INIT(_div, _mul),				\
> > +	.common = {							\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init	= CCU_MIX_INITHW(_name, _parent, 0),	\
> > +	}								\
> > +}
> > +
> > +#define CCU_MUX_DEFINE(_struct, _name, _parents, _reg, _shift, _width,	\
> > +		       _flags)						\
> > +struct ccu_mix _struct = {						\
> > +	.mux	= CCU_MUX_INIT(_shift, _width, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	}								\
> > +}
> > +
> > +#define CCU_DIV_DEFINE(_struct, _name, _parent, _reg, _shift, _width,	\
> > +		       _flags)						\
> > +struct ccu_mix _struct = {						\
> > +	.div	= CCU_DIV_INIT(_shift, _width, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init = CCU_MIX_INITHW(_name, _parent, _flags)	\
> > +	}								\
> > +}
> > +
> > +#define CCU_GATE_FACTOR_DEFINE(_struct, _name, _parent, _reg,		\
> > +			       _gate_mask, _val_enable, _val_disable,	\
> > +			       _div, _mul, _flags)			\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.factor	= CCU_FACTOR_INIT(_div, _mul),				\
> > +	.common = {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init = CCU_MIX_INITHW(_name, _parent, _flags)	\
> > +	}								\
> > +}
> > +
> > +
> > +#define CCU_MUX_GATE_DEFINE(_struct, _name, _parents, _reg, _shift,	\
> > +			    _width, _gate_mask, _val_enable,		\
> > +			    _val_disable, _flags)			\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.mux	= CCU_MUX_INIT(_shift, _width, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	}								\
> > +}
> > +
> > +#define CCU_DIV_GATE_DEFINE(_struct, _name, _parent, _reg, _shift,	\
> > +			    _width, _gate_mask, _val_enable,		\
> > +			    _val_disable, _flags)			\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_shift, _width, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_ctrl	= _reg,					\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init	= CCU_MIX_INITHW(_name, _parent,	\
> > +						 _flags),		\
> > +	}								\
> > +}
> > +
> > +
> > +#define CCU_DIV_MUX_GATE_DEFINE(_struct, _name, _parents,  _reg_ctrl,	\
> > +				_mshift, _mwidth, _muxshift, _muxwidth,	\
> > +				_gate_mask, _val_enable, _val_disable,	\
> > +				_flags)					\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common	= {							\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	},								\
> > +}
> > +
> > +#define CCU_DIV2_FC_MUX_GATE_DEFINE(_struct, _name, _parents,		\
> > +				    _reg_ctrl, _reg_sel, _mshift,	\
> > +				    _mwidth, _fc, _muxshift, _muxwidth,	\
> > +				    _gate_mask, _val_enable,		\
> > +				    _val_disable, _flags)		\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common = {							\
> > +	    .reg_type = CLK_DIV_TYPE_2REG_FC_V4,			\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.reg_sel	= _reg_sel,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	},								\
> > +}
> > +
> > +
> > +#define CCU_DIV_FC_MUX_GATE_DEFINE(_struct, _name, _parents, _reg_ctrl,	\
> > +				   _mshift, _mwidth, _fc, _muxshift,	\
> > +				   _muxwidth, _gate_mask, _val_enable,	\
> > +				   _val_disable, _flags)		\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_type	= CLK_DIV_TYPE_1REG_FC_V2,		\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	},								\
> > +}
> > +
> > +#define CCU_DIV_MFC_MUX_GATE_DEFINE(_struct, _name, _parents,		\
> > +				    _reg_ctrl, _mshift, _mwidth, _fc,	\
> > +				    _muxshift, _muxwidth, _gate_mask,	\
> > +				    _val_enable, _val_disable, _flags)	\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_type = CLK_DIV_TYPE_1REG_FC_MUX_V6,		\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	},								\
> > +}
> > +
> > +#define CCU_DIV_FC_WITH_GATE_DEFINE(_struct, _name, _parent, _reg_ctrl,	\
> > +				    _mshift, _mwidth, _fc, _gate_mask,	\
> > +				    _val_enable, _val_disable, _flags)	\
> > +struct ccu_mix _struct = {						\
> > +	.gate	= CCU_GATE_INIT(_gate_mask, _val_enable,		\
> > +				_val_disable, 0),			\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_type = CLK_DIV_TYPE_1REG_FC_V2,			\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= 1,					\
> > +		.hw.init	= CCU_MIXINITHW(_name, _parent,		\
> > +						_flags),		\
> > +	},								\
> > +}
> > +
> > +#define CCU_DIV_FC_MUX_DEFINE(_struct, _name, _parents, _reg_ctrl,	\
> > +			      _mshift, _mwidth, _fc, _muxshift,		\
> > +			      _muxwidth, _flags)			\
> > +struct ccu_mix _struct = {						\
> > +	.div	= CCU_DIV_INIT(_mshift, _mwidth, NULL, 0),		\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_type	= CLK_DIV_TYPE_1REG_FC_V2,		\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags),		\
> > +	},								\
> > +}
> > +
> > +#define CCU_MUX_FC_DEFINE(_struct, _name, _parents, _reg_ctrl, _fc,	\
> > +			  _muxshift, _muxwidth, _flags)			\
> > +struct ccu_mix _struct = {						\
> > +	.mux	= CCU_MUX_INIT(_muxshift, _muxwidth, NULL, 0),		\
> > +	.common = {							\
> > +		.reg_type	= CLK_DIV_TYPE_1REG_FC_V2,		\
> > +		.reg_ctrl	= _reg_ctrl,				\
> > +		.fc		= _fc,					\
> > +		.name		= _name,				\
> > +		.num_parents	= ARRAY_SIZE(_parents),			\
> > +		.hw.init = CCU_MIX_INITHW_PARENTS(_name, _parents,	\
> > +						  _flags)		\
> > +	},								\
> > +}
> > +
> > +static inline struct ccu_mix *hw_to_ccu_mix(struct clk_hw *hw)
> > +{
> > +	struct ccu_common *common = hw_to_ccu_common(hw);
> > +
> > +	return container_of(common, struct ccu_mix, common);
> > +}
> > +
> > +extern const struct clk_ops spacemit_ccu_mix_ops;
> > +
> > +#endif /* _CCU_DIV_H_ */
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > new file mode 100644
> > index 000000000000..cf6e547f073b
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -0,0 +1,198 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Spacemit clock type pll
> > + *
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "ccu_common.h"
> > +#include "ccu_pll.h"
> > +
> > +#define PLL_MIN_FREQ	600000000
> > +#define PLL_MAX_FREQ	3400000000
> > +#define PLL_DELAY_TIME	3000
> > +
> > +#define PLL_SWCR1_REG5_OFF	0
> > +#define PLL_SWCR1_REG5_MASK	GENMASK(7, 0)
> > +#define PLL_SWCR1_REG6_OFF	8
> > +#define PLL_SWCR1_REG6_MASK	GENMASK(15, 8)
> > +#define PLL_SWCR1_REG7_OFF	16
> > +#define PLL_SWCR1_REG7_MASK	GENMASK(23, 16)
> > +#define PLL_SWCR1_REG8_OFF	24
> > +#define PLL_SWCR1_REG8_MASK	GENMASK(31, 24)
> > +
> > +#define PLL_SWCR2_DIVn_EN(n)	BIT(n + 1)
> > +#define PLL_SWCR2_ATEST_EN	BIT(12)
> > +#define PLL_SWCR2_CKTEST_EN	BIT(13)
> > +#define PLL_SWCR2_DTEST_EN	BIT(14)
> > +
> > +#define PLL_SWCR3_DIV_FRC_OFF	0
> > +#define PLL_SWCR3_DIV_FRC_MASK	GENMASK(23, 0)
> > +#define PLL_SWCR3_DIV_INT_OFF	24
> > +#define PLL_SWCR3_DIV_INT_MASK	GENMASK(30, 24)
> > +#define PLL_SWCR3_EN		BIT(31)
> > +
> > +static int ccu_pll_is_enabled(struct clk_hw *hw)
> > +{
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	u32 tmp;
> > +
> > +	ccu_read(swcr3, &p->common, &tmp);
> > +
> > +	return tmp & PLL_SWCR3_EN;
> > +}
> > +
> > +/* frequency unit Mhz, return pll vco freq */
> > +static unsigned long __get_vco_freq(struct clk_hw *hw)
> 
> It is better to use ccu_pll_get_vco_freq.
> 
> > +{
> > +	unsigned int reg5, reg6, reg7, reg8, size, i;
> > +	unsigned int div_int, div_frc;
> > +	struct ccu_pll_rate_tbl *freq_pll_regs_table;
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	struct ccu_common *common = &p->common;
> > +	u32 tmp;
> > +
> > +	ccu_read(swcr1, common, &tmp);
> > +	reg5 = (tmp & PLL_SWCR1_REG5_MASK) >> PLL_SWCR1_REG5_OFF;
> > +	reg6 = (tmp & PLL_SWCR1_REG6_MASK) >> PLL_SWCR1_REG6_OFF;
> > +	reg7 = (tmp & PLL_SWCR1_REG7_MASK) >> PLL_SWCR1_REG7_OFF;
> > +	reg8 = (tmp & PLL_SWCR1_REG8_MASK) >> PLL_SWCR1_REG8_OFF;
> > +
> > +	ccu_read(swcr3, common, &tmp);
> > +	div_int = (tmp & PLL_SWCR3_DIV_INT_MASK) >> PLL_SWCR3_DIV_INT_OFF;
> > +	div_frc = (tmp & PLL_SWCR3_DIV_FRC_MASK) >> PLL_SWCR3_DIV_FRC_OFF;
> > +
> > +	freq_pll_regs_table = p->pll.rate_tbl;
> > +	size = p->pll.tbl_size;
> > +
> > +	for (i = 0; i < size; i++)
> > +		if ((freq_pll_regs_table[i].reg5 == reg5) &&
> > +		    (freq_pll_regs_table[i].reg6 == reg6) &&
> > +		    (freq_pll_regs_table[i].reg7 == reg7) &&
> > +		    (freq_pll_regs_table[i].reg8 == reg8) &&
> > +		    (freq_pll_regs_table[i].div_int == div_int) &&
> > +		    (freq_pll_regs_table[i].div_frac == div_frc))
> > +			return freq_pll_regs_table[i].rate;
> > +
> > +	WARN_ON_ONCE(1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ccu_pll_enable(struct clk_hw *hw)
> > +{
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	struct ccu_common *common = &p->common;
> > +	unsigned int tmp;
> > +	int ret;
> > +
> > +	if (ccu_pll_is_enabled(hw))
> > +		return 0;
> > +
> > +	ccu_update(swcr3, common, PLL_SWCR3_EN, PLL_SWCR3_EN);
> > +
> > +	/* check lock status */
> > +	ret = regmap_read_poll_timeout_atomic(common->lock_base,
> > +					      p->pll.reg_lock,
> > +					      tmp,
> > +					      tmp & p->pll.lock_enable_bit,
> > +					      5, PLL_DELAY_TIME);
> > +
> > +	return ret;
> > +}
> > +
> > +static void ccu_pll_disable(struct clk_hw *hw)
> > +{
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	struct ccu_common *common = &p->common;
> > +
> > +	ccu_update(swcr3, common, PLL_SWCR3_EN, 0);
> > +}
> > +
> > +/*
> > + * pll rate change requires sequence:
> > + * clock off -> change rate setting -> clock on
> > + * This function doesn't really change rate, but cache the config
> > + */
> > +static int ccu_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			       unsigned long parent_rate)
> > +{
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	struct ccu_common *common = &p->common;
> > +	struct ccu_pll_config *params = &p->pll;
> > +	struct ccu_pll_rate_tbl *entry;
> > +	unsigned long old_rate;
> > +	bool found = false;
> > +	u32 mask, val;
> > +	int i;
> > +
> > +	if (ccu_pll_is_enabled(hw)) {
> > +		pr_err("%s %s is enabled, ignore the setrate!\n",
> > +		       __func__, __clk_get_name(hw->clk));
> 
> Just use clk_hw_get_name.
> 
> > +		return 0;
> > +	}
> > +
> > +	old_rate = __get_vco_freq(hw);
> > +
> > +	for (i = 0; i < params->tbl_size; i++) {
> > +		if (rate == params->rate_tbl[i].rate) {
> > +			found = true;
> > +			entry = &params->rate_tbl[i];
> > +			break;
> > +		}
> > +	}
> > +	WARN_ON_ONCE(!found);
> > +
> > +	mask = PLL_SWCR1_REG5_MASK | PLL_SWCR1_REG6_MASK;
> > +	mask |= PLL_SWCR1_REG7_MASK | PLL_SWCR1_REG8_MASK;
> > +	val |= entry->reg5 << PLL_SWCR1_REG5_OFF;
> > +	val |= entry->reg6 << PLL_SWCR1_REG6_OFF;
> > +	val |= entry->reg7 << PLL_SWCR1_REG7_OFF;
> > +	val |= entry->reg8 << PLL_SWCR1_REG8_OFF;
> > +	ccu_update(swcr1, common, mask, val);
> > +
> > +	mask = PLL_SWCR3_DIV_INT_MASK | PLL_SWCR3_DIV_FRC_MASK;
> > +	val = entry->div_int << PLL_SWCR3_DIV_INT_OFF;
> > +	val |= entry->div_frac << PLL_SWCR3_DIV_FRC_OFF;
> > +	ccu_update(swcr3, common, mask, val);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> > +					 unsigned long parent_rate)
> > +{
> > +	return __get_vco_freq(hw);
> > +}
> > +
> > +static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			       unsigned long *prate)
> > +{
> > +	struct ccu_pll *p = hw_to_ccu_pll(hw);
> > +	struct ccu_pll_config *params = &p->pll;
> > +	unsigned long max_rate = 0;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < params->tbl_size; i++) {
> > +		if (params->rate_tbl[i].rate <= rate) {
> > +			if (max_rate < params->rate_tbl[i].rate)
> > +				max_rate = params->rate_tbl[i].rate;
> > +		}
> > +	}
> > +
> > +	return MAX(max_rate, PLL_MIN_FREQ);
> > +}
> > +
> > +const struct clk_ops spacemit_ccu_pll_ops = {
> > +	.enable		= ccu_pll_enable,
> > +	.disable	= ccu_pll_disable,
> > +	.set_rate	= ccu_pll_set_rate,
> > +	.recalc_rate	= ccu_pll_recalc_rate,
> > +	.round_rate	= ccu_pll_round_rate,
> > +	.is_enabled	= ccu_pll_is_enabled,
> > +};
> > +
> > diff --git a/drivers/clk/spacemit/ccu_pll.h b/drivers/clk/spacemit/ccu_pll.h
> > new file mode 100644
> > index 000000000000..a2252e79ff4a
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_pll.h
> > @@ -0,0 +1,80 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#ifndef _CCU_PLL_H_
> > +#define _CCU_PLL_H_
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +struct ccu_pll_rate_tbl {
> > +	unsigned long long rate;
> > +	u32 reg5;
> > +	u32 reg6;
> > +	u32 reg7;
> > +	u32 reg8;
> > +	unsigned int div_int;
> > +	unsigned int div_frac;
> > +};
> > +
> > +struct ccu_pll_config {
> > +	struct ccu_pll_rate_tbl *rate_tbl;
> > +	u32 tbl_size;
> > +	u32 reg_lock;
> > +	u32 lock_enable_bit;
> > +};
> > +
> > +#define CCU_PLL_RATE(_rate, _reg5, _reg6, _reg7, _reg8, _div_int, _div_frac) \
> > +	{									\
> > +		.rate		= (_rate),					\
> > +		.reg5		= (_reg5),					\
> > +		.reg6		= (_reg6),					\
> > +		.reg7		= (_reg7),					\
> > +		.reg8		= (_reg8),					\
> > +		.div_int	= (_div_int),				\
> > +		.div_frac	= (_div_frac),				\
> > +	}
> > +
> > +struct ccu_pll {
> > +	struct ccu_pll_config	pll;
> > +	struct ccu_common	common;
> > +};
> > +
> > +#define CCU_PLL_CONFIG(_table, _reg_lock, _lock_enable_bit) \
> > +	{									\
> > +		.rate_tbl	 = (struct ccu_pll_rate_tbl *)&(_table),	\
> > +		.tbl_size	 = ARRAY_SIZE(_table),				\
> > +		.reg_lock	 = (_reg_lock),					\
> > +		.lock_enable_bit = (_lock_enable_bit),				\
> > +	}
> > +
> > +#define CCU_PLL_HWINIT(_name, _flags) \
> > +	CLK_HW_INIT_NO_PARENT(_name, &spacemit_ccu_pll_ops, _flags)
> > +
> > +#define CCU_PLL_DEFINE(_struct, _name, _table, _reg_swcr1, _reg_swcr2,	\
> > +		       _reg_swcr3, _reg_lock, _lock_enable_bit, _flags)		\
> > +										\
> > +	struct ccu_pll _struct = {						\
> > +		.pll	= CCU_PLL_CONFIG(_table, _reg_lock, _lock_enable_bit),	\
> > +		.common = {							\
> > +			.reg_swcr1	= _reg_swcr1,				\
> > +			.reg_swcr2	= _reg_swcr2,				\
> > +			.reg_swcr3	= _reg_swcr3,				\
> > +			.hw.init	= CCU_PLL_HWINIT(_name, _flags)		\
> > +		}								\
> > +	}
> > +
> > +static inline struct ccu_pll *hw_to_ccu_pll(struct clk_hw *hw)
> > +{
> > +	struct ccu_common *common = hw_to_ccu_common(hw);
> > +
> > +	return container_of(common, struct ccu_pll, common);
> > +}
> > +
> > +extern const struct clk_ops spacemit_ccu_pll_ops;
> > +
> > +#endif
> > -- 
> > 2.47.0
> > 
> > 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
