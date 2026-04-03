Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513D3B52E6
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224833; cv=none; b=ltLzsldj+o/6KYd14mqHr7w2R8ZsJeOFaRYDFyvOKFOyfxddw0HBodiNoVXOkREWp1JWtWbQeLkGXkGyYq+6e64k9P4Z2Hvtu9Gy7Smf8mviqm/J3mcKu+aUMabeQAx+qJ7ad7ao2Q27R9FESaPnmtqwV3HuxbTyf1DeYOIGSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224833; c=relaxed/simple;
	bh=VbQuSZ5Pbb6up49jFwgFR2o/z+OkY0kAsrTIbbD6lPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgq1sILupt3uiDxyI4J6cKz9OEAnaeb1z863R4gATG4SlPX6pmZCIDb+8BPdYklV8J71cuK6WFMUqeFGNpIriP/oPP2SZBDbmN5we3WvgoNdFzAdWFduk2yzVxl3wZsnMfMrOwteRf3I9ZGZnFQZajHIMmNppRW4t7HfQ64e5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMH3esVE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZ8YSJx+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMH3esVE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZ8YSJx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775224823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBk6FGYMB/WMLSlkM/MD6rRM/q0dtXelhnrB1zKixDQ=;
	b=VMH3esVER2t4gk6BOFO3FhRUwdgQcF9++qp2W/5GWInNLztlIXoUY8EIivF97QQBMb1kxB
	6iaJAiVodgmfuc6ZwTFeQyBZI/RHFQ3VSuK1pOArRcOv6dkziIPAma96pb8yhxvrlWrQff
	bfiIe53iHebcUkZg3zj3B5Vzt+vbjJs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-0hJksRAtMv2SY3lqKr27tg-1; Fri, 03 Apr 2026 10:00:22 -0400
X-MC-Unique: 0hJksRAtMv2SY3lqKr27tg-1
X-Mimecast-MFC-AGG-ID: 0hJksRAtMv2SY3lqKr27tg_1775224821
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a14905811cso66770906d6.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775224821; x=1775829621; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBk6FGYMB/WMLSlkM/MD6rRM/q0dtXelhnrB1zKixDQ=;
        b=dZ8YSJx+2iw80DZ2d+5wT/88E2Xy+fZi91chEDehxeEmFUx8Vs8rhr+owQR+vlFamb
         bplsJe4mKszz46j6PBaMyuE9gI80MYczFr2jDbPperB3lFgK56343pZZh2T8cwtMS/Tz
         A8n8pwON2E8arOeGcNpT9sDAJsgsd0QMnoN14cfpFZ+z5xpRDzMdsywnIPznLyByUuQq
         Co9ufV67Q/MxGKvcEdvm7lxzozwtqxe3Q6lGoaNuMl/SftoLxGyo16Fnyqo23eVLQYVw
         oOM1JhS7qbl4czsoDrOkmV6pvzWVECLccEai90Ga9lGqDNJ47qysF/FGuA4CAJWZUvDb
         8jFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224821; x=1775829621;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBk6FGYMB/WMLSlkM/MD6rRM/q0dtXelhnrB1zKixDQ=;
        b=GcBWh5SZmxk6YVseasT5MD+cikAXuYnyiB+rbBUAQJ8WJ1XGJfZ+rnnDqFcg+n4clW
         1XOxTiP+da/vq3vu4TBaOJS5dIZRFNlhgm1CG54eekPR3U/xo7svBxEEid+fGQRTndjd
         hBPIw/cQoRuHoyd/DCTMZjvcWJRqRoijgQq0o6vgcemxELLlqfOcj1OpolGREjCqa3Oj
         wQiBAquDpk6K0/hLHY2M+4XNGG6hDX1EDOmwKXYXU4L5cI1TqdTl7VHcjmtrdQSreQNk
         9Qwy+blVjYz0YgOI+Bt6GRMZPKLLVwlu+wEDCZe9lGC0rHTjwOTqLv8946IGNtL0D4Vk
         Ytog==
X-Forwarded-Encrypted: i=1; AJvYcCVOHTz9ZA1nGAvGG3EV75FkTPIDEUkMGkBAYSQeAQrBJmI4FeTruwQqQmIbvzM67Kjx4braenXJyKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9IAI9mZ7E+RDUZtoRyrhf5q56ovNCqoc3iT9HXVOjHcyi/Ja
	3OSdh5yy7CD8NM6cPa35xQzGa4Q9nKNPkY057VjBYOB1z+/oDMtf0FuoOZoFds2YVHdJIxKDHdv
	zXnTEKo2g+EIs6nojRKm8vo/WACFjR7mE3FI8RtZSQev/S1Om9RaWWb6qd9QxpQ==
X-Gm-Gg: AeBDieu6xSFfFG2mFlX6nBI3MWFVZ95m2Q8HmFzO12gT2tjfy80T49XChn/B39kbNkB
	gHKPaxlnEb7CFkMAoKFBOWb+JFdKFQUO16blH9+yb1LSeglv6idKYgP8ipLvYSvTyb9/8A8BTbL
	gJsEOLW4vvsiApSiwZB+3mUA6fuePiBXy1AyFGDjZmY3luKwPi5H6PsIRjRYbJWF2ErhA1nh4Cq
	SPby08iyrrEROmp75Yz4sIZxGIH7gPwCMgGxVlhv7zXYGnAYfSkem85bpclbZcczuIg3AwlO0Gr
	lvgwo5ZJ582kdVIG0V8Oz4nwXKqj30LiZ7pC6WUXSZglYevDu/Wi9nn0gkuSEpMXCatWMgC+x9B
	0p5f5cyb1Dfm+qet/1e8I4mQuro+k8euK5RwCktr4iZF8j6qodhOFfCBA
X-Received: by 2002:a05:6214:4586:b0:89c:e5f0:8f26 with SMTP id 6a1803df08f44-8a7021c49cemr50163156d6.8.1775224819804;
        Fri, 03 Apr 2026 07:00:19 -0700 (PDT)
X-Received: by 2002:a05:6214:4586:b0:89c:e5f0:8f26 with SMTP id 6a1803df08f44-8a7021c49cemr50160456d6.8.1775224818848;
        Fri, 03 Apr 2026 07:00:18 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf51b6sm58221326d6.17.2026.04.03.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:00:17 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:00:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH 2/3] clk: eswin: Add eic7700 HSP clock driver
Message-ID: <ac_H7kSCgzz5HRxV@redhat.com>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
 <20260403093612.725-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403093612.725-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Xuyang,

On Fri, Apr 03, 2026 at 05:36:12PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
> 
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/clk/eswin/Kconfig           |  12 +
>  drivers/clk/eswin/Makefile          |   1 +
>  drivers/clk/eswin/clk-eic7700-hsp.c | 339 ++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
> 
> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> index 0406ec499ec9..e6cc2a407bac 100644
> --- a/drivers/clk/eswin/Kconfig
> +++ b/drivers/clk/eswin/Kconfig
> @@ -13,3 +13,15 @@ config COMMON_CLK_EIC7700
>  	  SoC. The clock controller generates and supplies clocks to various
>  	  peripherals within the SoC.
>  	  Say yes here to support the clock controller on the EIC7700 SoC.
> +
> +config COMMON_CLK_EIC7700_HSP
> +	tristate "EIC7700 HSP Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select COMMON_CLK_EIC7700
> +	select RESET_EIC7700_HSP if RESET_CONTROLLER
> +	help
> +	  This driver provides support for clock controller on ESWIN EIC7700
> +	  HSP. The clock controller generates and supplies clocks to high
> +	  speed peripherals within the SoC.
> +	  Say yes here to support the clock controller on the EIC7700 HSP.
> diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
> index 4a7c2af82164..21a09a3396df 100644
> --- a/drivers/clk/eswin/Makefile
> +++ b/drivers/clk/eswin/Makefile
> @@ -6,3 +6,4 @@
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= clk.o
>  
>  obj-$(CONFIG_COMMON_CLK_EIC7700)	+= clk-eic7700.o
> +obj-$(CONFIG_COMMON_CLK_EIC7700_HSP)	+= clk-eic7700-hsp.o
> diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-eic7700-hsp.c
> new file mode 100644
> index 000000000000..65ad9e762ee9
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700-hsp.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 HSP Clock Driver
> + *
> + * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/eswin,eic7700-hspcrg.h>
> +
> +#include "common.h"
> +
> +#define EIC7700_HSP_SATA_REG		0x300
> +#define EIC7700_HSP_MSHC0_REG		0x510
> +#define EIC7700_HSP_MSHC1_REG		0x610
> +#define EIC7700_HSP_MSHC2_REG		0x710
> +#define EIC7700_HSP_USB0_REG		0x800
> +#define EIC7700_HSP_USB0_REF_REG	0x83c
> +#define EIC7700_HSP_USB1_REG		0x900
> +#define EIC7700_HSP_USB1_REF_REG	0x93c
> +
> +#define USB_REF_XTAL24M			0x2a
> +#define EIC7700_HSP_NR_CLKS		(EIC7700_HSP_CLK_GATE_SATA + 1)
> +
> +struct eic7700_hsp_clk_gate {
> +	struct clk_hw hw;
> +	unsigned int id;
> +	void __iomem *reg;
> +	void __iomem *ref_reg;
> +	const char *name;
> +	const struct clk_parent_data *parent_data;
> +	unsigned long flags;
> +	unsigned long offset;
> +	unsigned long ref_offset;
> +	u8 bit_idx;
> +	u8 gate_flags;
> +	spinlock_t *lock; /* protect register read-modify-write cycle */
> +};
> +
> +static inline struct eic7700_hsp_clk_gate *to_gate_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eic7700_hsp_clk_gate, hw);
> +}
> +
> +#define EIC7700_HSP_GATE(_id, _name, _pdata, _flags, _offset, _idx,	\
> +			 _ref_offset)					\
> +	{								\
> +		.id		= _id,					\
> +		.name		= _name,				\
> +		.parent_data	= _pdata,				\
> +		.flags		= _flags,				\
> +		.offset		= _offset,				\
> +		.ref_offset	= _ref_offset,				\
> +		.bit_idx	= _idx,					\
> +	}
> +
> +static void hsp_clk_gate_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(gate->lock, flags);
> +
> +	reg = readl(gate->reg);
> +
> +	if (enable)
> +		reg |= BIT(gate->bit_idx);
> +	else
> +		reg &= ~BIT(gate->bit_idx);
> +
> +	/*
> +	 * Hardware bug: The reference clock is 24MHz, but the reference clock
> +	 * register reset to an incorrect default value.
> +	 * Workaround: Rewrite the correct value before enabling/disabling
> +	 * the gate clock.
> +	 */
> +	writel(USB_REF_XTAL24M, gate->ref_reg);
> +	writel(reg, gate->reg);
> +
> +	spin_unlock_irqrestore(gate->lock, flags);
> +}
> +
> +static int hsp_clk_gate_enable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, 1);
> +
> +	return 0;
> +}
> +
> +static void hsp_clk_gate_disable(struct clk_hw *hw)
> +{
> +	hsp_clk_gate_endisable(hw, 0);
> +}
> +
> +static int hsp_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct eic7700_hsp_clk_gate *gate = to_gate_clk(hw);
> +	u32 reg;
> +
> +	reg = readl(gate->reg);
> +
> +	reg &= BIT(gate->bit_idx);

Personally I would remove the newline between the two reg lines
since it's the same variable.

> +
> +	return reg ? 1 : 0;
> +}
> +
> +static const struct clk_ops hsp_clk_gate_ops = {
> +	.enable = hsp_clk_gate_enable,
> +	.disable = hsp_clk_gate_disable,
> +	.is_enabled = hsp_clk_gate_is_enabled,
> +};
> +
> +static struct clk_hw *
> +hsp_clk_register_gate(struct device *dev, unsigned int id, const char *name,
> +		      const struct clk_parent_data *parent_data,
> +		      unsigned long flags, void __iomem *reg,
> +		      void __iomem *ref_reg, u8 bit_idx, u8 clk_gate_flags,
> +		      spinlock_t *lock)
> +{
> +	struct eic7700_hsp_clk_gate *gate;
> +	struct clk_init_data init;

struct clk_init_data init = {};

I posted a fix earlier this week with some details about a potential
issue.
https://lore.kernel.org/linux-clk/20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com/

> +	struct clk_hw *hw;
> +	int ret;
> +
> +	gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
> +	if (!gate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &hsp_clk_gate_ops;
> +	init.flags = flags;
> +	init.parent_data = parent_data;
> +	init.num_parents = 1;
> +
> +	gate->id = id;
> +	gate->reg = reg;
> +	gate->ref_reg = ref_reg;
> +	gate->bit_idx = bit_idx;
> +	gate->gate_flags = clk_gate_flags;
> +	gate->lock = lock;
> +	gate->hw.init = &init;
> +
> +	hw = &gate->hw;
> +	ret = devm_clk_hw_register(dev, hw);
> +	if (ret)
> +		hw = ERR_PTR(ret);
> +
> +	return hw;
> +}
> +
> +static struct clk_parent_data hsp_cfg[] = {

static const here and below?

> +	{ .fw_name = "hsp_cfg" }
> +};
> +
> +static struct clk_parent_data hsp_mmc[] = {
> +	{ .fw_name = "hsp_mmc" }
> +};

Sashiko brought up a good question:
https://sashiko.dev/#/patchset/20260403093459.612-1-dongxuyang%40eswincomputing.com

Will these clocks be registered to their intended parents?

    If eswin_clk_register_fixed_factor() ignores the .fw_name field and
    registers using devm_clk_hw_register_fixed_factor_index(), it will use the
    .index field.
    
    Since .index is implicitly 0 for both hsp_cfg and hsp_mmc, won't all
    these fixed factor clocks be incorrectly parented to the clock at index 0
    of the DT clocks property instead of hsp_mmc and hsp_cfg?

> +
> +static struct clk_parent_data hsp_usb_sata[] = {
> +	{ .fw_name = "hsp_sata" }
> +};
> +
> +static struct eswin_fixed_factor_clock eic7700_hsp_factor_clks[] = {

More places for static const? I'll leave out the others.

> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV2, "factor_hsp_cfg_div2",
> +		     hsp_cfg, 1, 2, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV4, "factor_hsp_cfg_div4",
> +		     hsp_cfg, 1, 4, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_MMC_DIV10, "factor_hsp_mmc_div10",
> +		     hsp_mmc, 1, 10, 0),
> +};
> +
> +static struct eswin_gate_clock eic7700_hsp_gate_clks[] = {
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_SATA, "gate_clk_hsp_sata", hsp_usb_sata,
> +		   CLK_SET_RATE_PARENT, EIC7700_HSP_SATA_REG, 28, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC0_TMR, "gate_clk_hsp_mshc0_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 8, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC1_TMR, "gate_clk_hsp_mshc1_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 8, 0),
> +	ESWIN_GATE(EIC7700_HSP_CLK_GATE_MSHC2_TMR, "gate_clk_hsp_mshc2_tmr",
> +		   hsp_mmc, CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 8, 0),
> +};
> +
> +static struct eic7700_hsp_clk_gate eic7700_hsp_spec_gate_clks[] = {
> +	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB0, "gate_clk_hsp_usb0",
> +			 hsp_usb_sata, CLK_SET_RATE_PARENT,
> +			 EIC7700_HSP_USB0_REG, 28, EIC7700_HSP_USB0_REF_REG),
> +	EIC7700_HSP_GATE(EIC7700_HSP_CLK_GATE_USB1, "gate_clk_hsp_usb1",
> +			 hsp_usb_sata, CLK_SET_RATE_PARENT,
> +			 EIC7700_HSP_USB1_REG, 28, EIC7700_HSP_USB1_REF_REG),
> +};
> +
> +static const struct clk_parent_data mux_mmc_3mux1_p[] = {
> +	{ .fw_name = "hsp_cfg" },
> +	{ .hw = &eic7700_hsp_factor_clks[0].hw },
> +	{ .hw = &eic7700_hsp_factor_clks[1].hw },
> +};
> +
> +static const struct clk_parent_data mux_mmc_2mux1_p[] = {
> +	{ .fw_name = "hsp_mmc" },
> +	{ .hw = &eic7700_hsp_factor_clks[2].hw },
> +};
> +
> +static u32 mux_mmc_3mux1_tbl[] = { 0x0, 0x1, 0x3 };
> +
> +static struct eswin_mux_clock eic7700_hsp_mux_clks[] = {
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_EMMC_3MUX1, "mux_hsp_emmc_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD0_3MUX1, "mux_hsp_sd0_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX_TBL(EIC7700_HSP_CLK_MUX_SD1_3MUX1, "mux_hsp_sd1_3mux1",
> +		      mux_mmc_3mux1_p, ARRAY_SIZE(mux_mmc_3mux1_p),
> +		      CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 16, 2, 0,
> +		      mux_mmc_3mux1_tbl),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_EMMC_CQE_2MUX1, "mux_hsp_emmc_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC0_REG, 0, 1, 0),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD0_CQE_2MUX1, "mux_hsp_sd0_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC1_REG, 0, 1, 0),
> +	ESWIN_MUX(EIC7700_HSP_CLK_MUX_SD1_CQE_2MUX1, "mux_hsp_sd1_cqe_2mux1",
> +		  mux_mmc_2mux1_p, ARRAY_SIZE(mux_mmc_2mux1_p),
> +		  CLK_SET_RATE_PARENT, EIC7700_HSP_MSHC2_REG, 0, 1, 0),
> +};
> +
> +static struct eswin_clk_info eic7700_hsp_clks[] = {
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_EMMC, "gate_clk_hsp_emmc",
> +			EIC7700_HSP_CLK_MUX_EMMC_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC0_REG, 24, 0),
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD0, "gate_clk_hsp_sd0",
> +			EIC7700_HSP_CLK_MUX_SD0_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC1_REG, 24, 0),
> +	ESWIN_GATE_TYPE(EIC7700_HSP_CLK_GATE_SD1, "gate_clk_hsp_sd1",
> +			EIC7700_HSP_CLK_MUX_SD1_3MUX1,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> +			EIC7700_HSP_MSHC2_REG, 24, 0),
> +};
> +
> +static int eic7700_hsp_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct auxiliary_device *adev;
> +	struct eswin_clock_data *data;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	data = eswin_clk_init(pdev, EIC7700_HSP_NR_CLKS);
> +	if (IS_ERR(data))
> +		return dev_err_probe(dev, PTR_ERR(data),
> +				     "failed to get clk data!\n");
> +
> +	ret = eswin_clk_register_fixed_factor
> +		(dev, eic7700_hsp_factor_clks,
> +		ARRAY_SIZE(eic7700_hsp_factor_clks), data);

The first two lines can be combined together to improve the formatting:

     ret = eswin_clk_register_fixed_factor(dev, eic7700_hsp_factor_clks,

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register fixed factor clock\n");
> +
> +	ret = eswin_clk_register_gate(dev, eic7700_hsp_gate_clks,
> +				      ARRAY_SIZE(eic7700_hsp_gate_clks), data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register gate clock\n");
> +
> +	ret = eswin_clk_register_mux(dev, eic7700_hsp_mux_clks,
> +				     ARRAY_SIZE(eic7700_hsp_mux_clks),
> +				     data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register mux clock\n");
> +
> +	ret = eswin_clk_register_clks(dev, eic7700_hsp_clks,
> +				      ARRAY_SIZE(eic7700_hsp_clks), data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register clock\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(eic7700_hsp_spec_gate_clks); i++) {
> +		struct eic7700_hsp_clk_gate *gate;
> +
> +		gate = &eic7700_hsp_spec_gate_clks[i];
> +		hw = hsp_clk_register_gate(dev, gate->id, gate->name,
> +					   gate->parent_data, gate->flags,
> +					   data->base + gate->offset,
> +					   data->base + gate->ref_offset,
> +					   gate->bit_idx, 0, &data->lock);
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register gate clock\n");
> +
> +		data->clk_data.hws[gate->id] = hw;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  &data->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "add clk provider failed\n");
> +
> +	adev = devm_auxiliary_device_create(dev, "hsp-reset",
> +					    (__force void *)data->base);

So this driver is sharing the same register space with the reset driver,
and the reset driver calls devm_regmap_init_mmio(). What do you think
about having a shared regmap between the two drivers so that the __force
is not needed?

Brian


> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "register hsp-reset device failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id eic7700_hsp_clock_dt_ids[] = {
> +	{ .compatible = "eswin,eic7700-hspcrg", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, eic7700_hsp_clock_dt_ids);
> +
> +static struct platform_driver eic7700_hsp_clock_driver = {
> +	.probe	= eic7700_hsp_clk_probe,
> +	.driver = {
> +		.name	= "eic7700-hsp-clock",
> +		.of_match_table	= eic7700_hsp_clock_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(eic7700_hsp_clock_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
> +MODULE_DESCRIPTION("ESWIN EIC7700 HSP clock controller driver");
> -- 
> 2.34.1
> 

