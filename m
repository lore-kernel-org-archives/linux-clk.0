Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C334C19D07B;
	Wed, 18 Dec 2024 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525382; cv=none; b=awgud2V7E5p7tObeEmfiVWR4NBBrotG49Fy7KApaTXz4XKF5chcqjgVWQAIxv7+ECGUJgwjyXFFG5riFf3AAegDuxW5s+m+daTNmXESZq9m2eP3HrW2Qg58Hf0l5l7a5HJGHaMj7TBotX9Ww8qt4ZafA5gEDZpEiVB5Fw+/0sIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525382; c=relaxed/simple;
	bh=X3u3/WgGaAVc9Em0ZNhDkYuBKaTt70hyGkHfd+2DZsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJFqQTLMZ8OwHzSK3KMi60byN8odBfMu0KzQr1F2JacXi5U+r9lmafkIESJc5LBwhHG48IsMdffQuAiSlBAcHWAQQCs+CiITK6+yr8AzHJWiinWQB4Wa4h+1ck+u2Rj10WSPQMvGKXAWDIouOoDj20kowKJwXmFK0ZmWFVZ6ZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=VBhCsyLV; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=NRw5Dv/I; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="VBhCsyLV";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="NRw5Dv/I"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 2A743122FE21;
	Wed, 18 Dec 2024 04:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734525376; bh=X3u3/WgGaAVc9Em0ZNhDkYuBKaTt70hyGkHfd+2DZsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBhCsyLVvNrUPBfIGrrC7XEyAMiGmLw11SnxZ6y9QMqCa8vtQrY70VxhMiss7n6tp
	 hU6BWS5SUa/Y/C/jHU3QsTb90AhCVihsT57ROjU6oDEKeSXjH5LDvqvSQiBKqPTKbs
	 NKBpr62fyA/oMB50AgCJlcXpPc159mclEOSogXaaAjtn1/EP5zPrCDb0Jhx8rQpAet
	 tPwQb03VutFYmPTVWNsyDWakwHJZDvkB7eYQ8vvNym9UJxtuXgsFUHXBmhICYyYNmC
	 ZY3sk6d0uoN44oR10rh40LqCkAI3YFsrMiwFTZc9S33gTw0Sp51soa6lcGOSHQmV9W
	 spSk7+C7WCOyA==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kV9WWjRu-8DP; Wed, 18 Dec 2024 04:36:14 -0800 (PST)
Received: from ketchup (unknown [183.217.82.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 421ED122FE1A;
	Wed, 18 Dec 2024 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734525373; bh=X3u3/WgGaAVc9Em0ZNhDkYuBKaTt70hyGkHfd+2DZsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRw5Dv/IyrJKfXPlBWvkHxrrcHiPz6y6IK6fBQ3OJbnxearB/53AoYSNhggcDMZor
	 Ahn+y8PwMy8K0gdfcmUHRt3Ikobx4atCFLfHs/RDx58Ey4DcYpX35LghDdPugZLYnD
	 L/cDx6VhOEjvllmp5ZO2jdCt5JLagOq95RCTZgCvyhf2z9IZ0tXcVP2dBwIki6TJEP
	 yDoxoHHGMKjS3noW1f+K2Ph4VO/HmY444zZvU8oABpSCyKRZGjj4zp7zGwczC9Aolo
	 qyBb5+4ythnI4hpqnPlyTfcNdnzUyM1zAE5p1J/wDAQBigosDHfaZ0ybCai5eyIJkm
	 rKv/wf+6wN/Pw==
Date: Wed, 18 Dec 2024 12:36:01 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z2LBsQ7a3T3mElLl@ketchup>
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

On Sun, Dec 08, 2024 at 02:47:43PM +0800, Inochi Amaoto wrote:
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
> >  12 files changed, 2977 insertions(+)
> >  create mode 100644 drivers/clk/spacemit/Kconfig
> >  create mode 100644 drivers/clk/spacemit/Makefile
> >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> > diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
> > new file mode 100644
> > index 000000000000..9910fb69bc9e
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_common.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#ifndef _CCU_COMMON_H_
> > +#define _CCU_COMMON_H_
> > +
> > +#include <linux/regmap.h>
> > +
> > +enum ccu_div_type {
> > +	CLK_DIV_TYPE_1REG_NOFC_V1 = 0,
> > +	CLK_DIV_TYPE_1REG_FC_V2,
> > +	CLK_DIV_TYPE_2REG_NOFC_V3,
> > +	CLK_DIV_TYPE_2REG_FC_V4,
> > +	CLK_DIV_TYPE_1REG_FC_DIV_V5,
> > +	CLK_DIV_TYPE_1REG_FC_MUX_V6,
> > +};
> > +
> > +struct ccu_common {
> > +	struct regmap *base;
> > +	struct regmap *lock_base;
> > +
> > +	enum ccu_div_type reg_type;
> > +
> > +	union {
> > +		struct {
> > +			u32 reg_ctrl;
> > +			u32 reg_sel;
> > +			u32 reg_xtc;
> > +			u32 fc;
> > +		};
> > +		struct {
> > +			u32 reg_swcr1;
> > +			u32 reg_swcr2;
> > +			u32 reg_swcr3;
> > +		};
> > +	};
> > +
> > +	unsigned long flags;
> > +	const char *name;
> > +	const char * const *parent_names;
> > +	int num_parents;
> > +
> > +	struct clk_hw hw;
> > +};
> > +
> > +static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
> > +{
> > +	return container_of(hw, struct ccu_common, hw);
> > +}
> > +
> > +#define ccu_read(reg, c, val)	regmap_read((c)->base, (c)->reg_##reg, val)
> > +#define ccu_write(reg, c, val)	regmap_write((c)->base, (c)->reg_##reg, val)
> > +#define ccu_update(reg, c, mask, val) \
> > +	regmap_update_bits((c)->base, (c)->reg_##reg, mask, val)
> > +#define ccu_poll(reg, c, tmp, cond, sleep, timeout) \
> > +	regmap_read_poll_timeout_atomic((c)->base, (c)->reg_##reg,	\
> > +					tmp, cond, sleep, timeout)
> > +
> > +#endif /* _CCU_COMMON_H_ */
> > diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> > new file mode 100644
> > index 000000000000..7a68652676ce
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_ddn.c
> > @@ -0,0 +1,146 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Spacemit clock type ddn
> > + *
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenay@outlook.com>
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_ddn.h"
> > +
> > +/*
> > + * It is M/N clock
> > + *
> > + * Fout from synthesizer can be given from two equations:
> > + * numerator/denominator = Fin / (Fout * factor)
> > + */
> > +static void ccu_ddn_disable(struct clk_hw *hw)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_common *common = &ddn->common;
> > +
> > +	if (!ddn->gate)
> > +		return;
> 
> Use a new clk_ops to represent the gateable ddn clock and remove this
> check. This also applys to the following function.
> 
> > +
> > +	ccu_update(sel, common, ddn->gate, 0);
> > +}
> > +
> > +static int ccu_ddn_enable(struct clk_hw *hw)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_common *common = &ddn->common;
> > +
> > +	if (!ddn->gate)
> > +		return 0;
> > +
> > +	ccu_update(sel, common, ddn->gate, ddn->gate);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ccu_ddn_is_enabled(struct clk_hw *hw)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_common *common = &ddn->common;
> > +	u32 tmp;
> > +
> > +	if (!ddn->gate)
> > +		return 1;
> > +
> > +	ccu_read(sel, common, &tmp);
> > +
> > +	return tmp & ddn->gate;
> > +}
> > +
> > +static long clk_ddn_round_rate(struct clk_hw *hw, unsigned long drate,
> > +			       unsigned long *prate)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_ddn_config *params = &ddn->ddn;
> > +	unsigned long rate = 0, prev_rate;
> > +	unsigned long result;
> > +	int i;
> > +
> > +	for (i = 0; i < params->tbl_size; i++) {
> > +		prev_rate = rate;
> > +		rate = (((*prate / 10000) * params->tbl[i].den) /
> > +			(params->tbl[i].num * params->info->factor)) * 10000;
> > +		if (rate > drate)
> > +			break;
> > +	}
> > +
> > +	if ((i == 0) || (i == params->tbl_size)) {
> > +		result = rate;
> > +	} else {
> > +		if ((drate - prev_rate) > (rate - drate))
> > +			result = rate;
> > +		else
> > +			result = prev_rate;
> > +	}
> > +
> > +	return result;
> > +}
> > +
> > +static unsigned long clk_ddn_recalc_rate(struct clk_hw *hw,
> > +		unsigned long parent_rate)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_ddn_config *params = &ddn->ddn;
> > +	unsigned int val, num, den;
> > +	unsigned long rate;
> > +
> > +	ccu_read(ctrl, &ddn->common, &val);
> > +
> > +	num = (val >> params->info->num_shift) & params->info->num_mask;
> > +	den = (val >> params->info->den_shift) & params->info->den_mask;
> > +
> > +	if (!den)
> > +		return 0;
> > +
> > +	rate = ((parent_rate / 10000)  * den) / (num * params->info->factor);
> > +	rate *= 10000;
> > +
> 
> It is pretty interested here. Why you need to divide the clock by 10000
> and multiple it? Is "(parent_rate * den) / (num * params->info->factor)"
> OK?

Basically this rounds the rate down to 10000 and the only affected clock
is slow_uart_1. I think it's some type of workaround for the vendor UART
driver.

Anyway, it is technically incorrect and not necessary anymore. I'll
remove it in v4. Same for the similar trick in clk_ddn_set_rate.

> > +	return rate;
> > +}
> > +
> > +/* Configures new clock rate*/
> > +static int clk_ddn_set_rate(struct clk_hw *hw, unsigned long drate,
> > +			    unsigned long prate)
> > +{
> > +	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
> > +	struct ccu_ddn_config *params = &ddn->ddn;
> > +	struct ccu_ddn_info *info = params->info;
> > +	unsigned long prev_rate, rate = 0;
> > +	int i;
> > +
> > +	for (i = 0; i < params->tbl_size; i++) {
> > +		prev_rate = rate;
> > +		rate = ((prate / 10000) * params->tbl[i].den) /
> > +		       (params->tbl[i].num * info->factor);
> > +		rate *= 10000;
> > +
> > +		if (rate > drate)
> > +			break;
> > +	}
> > +
> > +	if (i > 0)
> > +		i--;
> > +
> > +	ccu_update(ctrl, &ddn->common,
> > +		   info->num_mask | info->den_mask,
> > +		   (params->tbl[i].num << info->num_shift) |
> > +		   (params->tbl[i].den << info->den_shift));
> > +
> > +	return 0;
> > +}
> > +
> > +const struct clk_ops spacemit_ccu_ddn_ops = {
> > +	.disable	= ccu_ddn_disable,
> > +	.enable		= ccu_ddn_enable,
> > +	.is_enabled	= ccu_ddn_is_enabled,
> > +	.recalc_rate	= clk_ddn_recalc_rate,
> > +	.round_rate	= clk_ddn_round_rate,
> > +	.set_rate	= clk_ddn_set_rate,
> > +};
> > diff --git a/drivers/clk/spacemit/ccu_ddn.h b/drivers/clk/spacemit/ccu_ddn.h
> > new file mode 100644
> > index 000000000000..4d369f41404c
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu_ddn.h
> > @@ -0,0 +1,85 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > + * Copyright (c) 2024 Haylen Chu <heylenayy@outlook.com>
> > + */
> > +
> > +#ifndef _CCU_DDN_H_
> > +#define _CCU_DDN_H_
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_common.h"
> > +
> > +struct ccu_ddn_tbl {
> > +	unsigned int num;
> > +	unsigned int den;
> > +};
> > +
> > +struct ccu_ddn_info {
> > +	unsigned int factor;
> > +	unsigned int num_mask;
> > +	unsigned int den_mask;
> > +	unsigned int num_shift;
> > +	unsigned int den_shift;
> > +};
> > +
> > +struct ccu_ddn_config {
> > +	struct ccu_ddn_info *info;
> > +	struct ccu_ddn_tbl *tbl;
> > +	u32 tbl_size;
> > +};
> > +
> > +struct ccu_ddn {
> > +	struct ccu_ddn_config  ddn;
> > +	struct ccu_common	common;
> > +	u32 gate;
> > +};
> > +
> > +#define CCU_DDN_CONFIG(_info, _table)					\
> > +	{								\
> > +		.info		= (struct ccu_ddn_info *)_info,		\
> > +		.tbl		= (struct ccu_ddn_tbl *)&_table,	\
> > +		.tbl_size	= ARRAY_SIZE(_table),			\
> > +	}
> > +
> > +#define CCU_DDN_INIT(_name, _parent, _flags) \
> > +	CLK_HW_INIT_HW(_name, &_parent.common.hw,			\
> > +		       &spacemit_ccu_ddn_ops, _flags)
> > +
> > +#define CCU_DDN_DEFINE(_struct, _name, _parent, _info, _table,		\
> > +		       _reg_ctrl, _flags)				\
> > +	struct ccu_ddn _struct = {					\
> > +		.ddn	= CCU_DDN_CONFIG(_info, _table),		\
> > +		.common = {						\
> > +			.reg_ctrl = _reg_ctrl,				\
> > +			.hw.init  = CCU_DDN_INIT(_name, _parent,	\
> > +						 _flags),		\
> > +		}							\
> > +	}
> > +
> > +#define CCU_DDN_GATE_DEFINE(_struct, _name, _parent, _info, _table,	\
> > +			    _reg_ddn, _reg_gate, _gate_mask, _flags)	\
> > +	struct ccu_ddn _struct = {					\
> > +		.ddn	= CCU_DDN_CONFIG(_info, _table),		\
> > +		.common = {						\
> > +			.reg_ctrl	= _reg_ddn,			\
> > +			.reg_sel	= _reg_gate,			\
> > +			.hw.init = CLK_HW_INIT(_name, _parent,		\
> > +					       &spacemit_ccu_ddn_ops,	\
> > +					       _flags),			\
> > +		}							\
> > +		.gate	= _gate_mask,					\
> > +	}
> > +
> > +
> > +static inline struct ccu_ddn *hw_to_ccu_ddn(struct clk_hw *hw)
> > +{
> > +	struct ccu_common *common = hw_to_ccu_common(hw);
> > +
> > +	return container_of(common, struct ccu_ddn, common);
> > +}
> > +
> > +extern const struct clk_ops spacemit_ccu_ddn_ops;
> > +
> > +#endif
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

It's a mistake and will be corrected in next version.

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

This makes sense.

As suggested by Yixun, we could split out several clk_ops and define
clocks with diffferent clk_ops, eliminating the ifs. I'd like to take
this scheme and clean up ddn/mix driver in v4.

> 
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

Okay.

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

Thanks, I recently found flag CLK_SET_RATE and think it's more
appropriate here, since it protects the clock from rate changes in the
framework.

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

