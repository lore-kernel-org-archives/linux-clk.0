Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF233AA507
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245941; cv=none; b=lFCsJWc2BExXLDcSz19ZE2rpXArf1OOxSPo0Edwxd9BBRNIckWNgWaZCSHl3g4iuRZ24pu6Zll/qrmbgJBagLQ5Gq7ccRE/sImxk3V3RhWTIlBbILuho6JOCguS1abuPIX5Zh6GY72r2QFjHRtj4q1pbE/zWeMT07R9ZQBfnkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245941; c=relaxed/simple;
	bh=L6IpbZpEKeuQUddgH0C1rr4lacIkjRdw8Vg8ixcyAP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcrchDWRa9MZLwR8XN9amtu7k0z4KYEd/Inw2e81OkvwpL/REnsWkBfw3URk3c87Hq+HAsQKmQnNOM5i/TgWOWOoZ7UK8NYQM99Mnj8qCwaWDAiBkna4lwP7vL8+LgbRFJhJJAIvHdtocHk07t6ZolN6wuwgzsC33p33xa76zr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hU4Bw4FA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XVJKupHx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hU4Bw4FA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XVJKupHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785245938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIUOpHJxOe8ruIEi6QwPuhoVVlbLAzplV44Vn78Oxa4=;
	b=hU4Bw4FAhVEiTsF+pJQszfAuMDrpCIwnISSxCNL79tZeaZiJ6vN5PR92Pqjlmd1cDMXZL9
	LDcGco7LsQXJttrZY569p8qu4KlaO1m5lApgvI9vnmTr7dpcpanDztd08qVTM4w9s+uuft
	LSeWag/rfOCr3NgceTqaLhS6bmWXfx4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-tj7lv6kNM6KzhGh71oicMw-1; Tue, 28 Jul 2026 09:38:57 -0400
X-MC-Unique: tj7lv6kNM6KzhGh71oicMw-1
X-Mimecast-MFC-AGG-ID: tj7lv6kNM6KzhGh71oicMw_1785245937
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8efad04d884so79919826d6.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785245937; x=1785850737; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIUOpHJxOe8ruIEi6QwPuhoVVlbLAzplV44Vn78Oxa4=;
        b=XVJKupHxRkeE/li5MT3HfJYiwUC8n5KvnXKb0ASVowEI2pWUxSta8TBpxqR6N9o576
         ZqOGMXxXFmTRoTYjN6ce9P7B3qYM8chOC3MPkS1G/csW3fmFHBghdZK0f98G8WwTGaGK
         ZnFcSz5K9Q2COHQflvTl26BA1XYFbwU+5LngEUcQKDjo12BrWunrqB9KEiYifxiABuJg
         GexOcd6dAyNwmX+yKxhM32wZP3/JbSoZ84VvB2OKoS4b/IrYYAKv9SA6xcfMf9VBydKm
         xRf5Kkg7iRpD3CBk/rDrqzVyiicXGf+LLe9miVRkG46B8J1XCHP14ePYdlhcBfPK6G9y
         lrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245937; x=1785850737;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zIUOpHJxOe8ruIEi6QwPuhoVVlbLAzplV44Vn78Oxa4=;
        b=AXJbZdDrbA9r26ab/BvAc8W9ItFXN03AzSuki2oNGCWeaxDqNK+mTYp37Ps8h7oQn9
         DPK1RI1mNfZtAtgcbyhVR3suhHLQnnatVNiXwLoCvTq0p8KNRdNpSbIGHtAn+Q5lTtB8
         5kprGUONkyMbKXJt3FZKEhOYUw5L3utRFwZ9GTexTg2IbaNhlycE+hOkt5MUO5tS4SKN
         kBBpZ9DU4DdqeY8AIz5YaDw8yjfGN3BGhmw//dLvEshNZg2W6WdwtR0D5AVBXeM3E9I7
         Ull/y9uAQrbaZi7IVd1uFX+sxRxC8bPs86H2kjnIBHgstab9pjID+/Xsj60DUn4+JnpH
         lz6A==
X-Forwarded-Encrypted: i=1; AHgh+RphR6j1u8p3QVYDCz7tNo3gp70XRscRPMjYXyFJqfsxzpGnf4eILZy01MtTvaL70Xxm9jAg/VE3Kb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1jVvdpnj3RfU/LKDLDjPc6KdAdhISPLcV4JUOztiQJcbLjKN
	4oGrdbdewWxTWuCN+x4yQvyaQc109vYxl3xSuCAR0R6Rk1UxRW7d4CgF5/bNXBdIghIDXyFQpx4
	6CfiA5ABnsuj0qVkaUWI8EKmvghT0AM49dq6IP0DMlGsfUBI3971byidT70X7zQ==
X-Gm-Gg: AR+sD12AZDVZHJxG27JdXldDJbY6XZWzHIGe08/1+ODkuJB0RAHIdP4ak1cmAeqKApn
	qGwvAUnBdchapIXadg0YetXZmkQtWpQRJkK9mv+aFQJk/+obkj9zlVSrKCUR6TA/rJnUVUMsUwi
	3962pfTMZ9FKjZueY/megGqw9zDTiiOkcEN7Oo2JPY/UmsLAvc5YxfZD4mU+w+lz4AzQb3bjl2H
	Yc4tHEdLjhaDHQSeJuby7k5a8t/tERCn8Xq8IVOb+7qfk1tQqzZ/5LNsZNSh+p+JZtHO0QVcwX3
	xPQhVlGNwaShW6bUqzBFXje2dsQWXlgLGBMgMCTfPiTJg61nmdHqnQUUUrIrT/tvBCWhiYp0z2q
	JMhFLc3vfVQBW0zNvBVpP1wxxRzqK5t3akOA=
X-Received: by 2002:a05:6214:5541:b0:8ef:aa2b:a668 with SMTP id 6a1803df08f44-90817395db2mr22709696d6.41.1785245936863;
        Tue, 28 Jul 2026 06:38:56 -0700 (PDT)
X-Received: by 2002:a05:6214:5541:b0:8ef:aa2b:a668 with SMTP id 6a1803df08f44-90817395db2mr22709306d6.41.1785245936406;
        Tue, 28 Jul 2026 06:38:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d499dsm87709486d6.42.2026.07.28.06.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:38:55 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:38:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <amiw7mfPfSPjLHLH@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Mon, Jul 27, 2026 at 09:24:20PM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 8:
> Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
> and starting clock indices at 1, is a common pattern in existing
> drivers, it exposes a driver implementation detail in the hardware
> binding interface.
> 
> If desired, I can change the special index to a separate field in the
> structs.
> 
> Fix the return value if the ->init() callback fails. (Sashiko)
> 
> Version 7:
> *) Add fixed dividers to handle PLL subdivisions
> *) Never register PLLs directly as exported clocks - everything on this
> SoC goes through a gate before it leaves a controller.
> 
> Version 6:
> *) Remove auxdev now that LSP clocks also use MFD
> *) Error codepath fixes pointed out by Sashiko.
> 
> Version 5:
> 
> *) Pass the static clk data instead of calling get_match_data to prepare
> for operating as an MFD child.
> 
> *) Don't use devm_kzalloc to allocate the auxiliary_device
> structure. I guess Sashiko is right, and that's what "Because once the
> device is placed on the bus the parent driver can not tell what other
> code may have a reference to this data" is trying to tell me.
> 
> *) Fix error check for device_node_to_regmap.
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/zte/Kconfig      |  16 +++++
>  drivers/clk/zte/Makefile     |   5 ++
>  drivers/clk/zte/clk-regmap.c |  34 ++++++++++
>  drivers/clk/zte/clk-zx.c     | 155 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/zte/clk-zx.h     |  91 +++++++++++++++++++++++++
>  drivers/clk/zte/pll-zx.c     |  16 +++++
>  9 files changed, 320 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b04e9d43cfb0..692f005cb2c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	drivers/clk/zte/
>  F:	drivers/mfd/zte-zx297520v3-crm.c
>  F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
>  F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..6f0a863951ca 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -545,6 +545,7 @@ source "drivers/clk/uniphier/Kconfig"
>  source "drivers/clk/visconti/Kconfig"
>  source "drivers/clk/x86/Kconfig"
>  source "drivers/clk/xilinx/Kconfig"
> +source "drivers/clk/zte/Kconfig"
>  source "drivers/clk/zynqmp/Kconfig"
>  
>  # Kunit test cases
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..13a5478f1112 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -167,5 +167,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
>  obj-$(CONFIG_X86)			+= x86/
>  endif
>  obj-y					+= xilinx/
> +obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
>  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
>  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> new file mode 100644
> index 000000000000..0222549dd211
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# ZTE Clock Drivers
> +#
> +
> +config COMMON_CLK_ZTE
> +	tristate "Clock driver for ZTE SoCs"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	default ARCH_ZTE
> +	select MFD_SYSCON
> +	help
> +	  This option selects common clock infrastructure for ZTE based SoCs.
> +	  You will need to enable one or more SoC specific drivers to make use
> +	  of this.
> +
> +	  Enable this if you are building a kernel for a ZTE designed board.
> diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> new file mode 100644
> index 000000000000..27db07293165
> --- /dev/null
> +++ b/drivers/clk/zte/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
> +
> +clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
> diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> new file mode 100644
> index 000000000000..984abeb45ab2
> --- /dev/null
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Copyright (c) 2018 BayLibre, SAS.
> + * Copyright (c) 2026 Stefan Dösinger.
> + * Author: Stefan Dösinger <stefandoesinger@gmail.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/errno.h>

Sort the headers.

> +
> +#include "clk-zx.h"
> +
> +int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
> +			  const struct zx_gate_desc *desc, unsigned int num,
> +			  struct clk_hw_onecell_data *clocks)
> +{
> +	return -ENODEV;
> +}
> +
> +int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
> +			     const struct zx_div_desc *desc, unsigned int num)
> +{
> +	return -ENODEV;
> +}
> +
> +int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
> +			  const struct zx_mux_desc *desc, unsigned int num,
> +			  struct clk_hw_onecell_data *clocks)
> +{
> +	return -ENODEV;
> +}
> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 000000000000..c9e9048d3ade
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/errno.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>

Also sort the headers.

> +
> +#include "clk-zx.h"
> +
> +static int zx_clk_register_fixed_dividers(struct device *dev, struct regmap *regmap,
> +					  const struct zx_fixed_divider_desc *desc,
> +					  unsigned int num)
> +{
> +	struct clk_hw *clk;
> +	unsigned int i;
> +
> +	for (i = 0; i < num; ++i) {
> +		clk = devm_clk_hw_register_fixed_factor(dev, desc[i].name, desc[i].parent,
> +							CLK_SET_RATE_PARENT, 1, desc[i].div);
> +		if (IS_ERR(clk)) {

The { } is not needed here.

> +			return dev_err_probe(dev, PTR_ERR(clk), "Failed to register clk %s\n",
> +					     desc[i].name);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void zx_delete_clk_provider(void *data)
> +{
> +	of_clk_del_provider(data);
> +}
> +
> +static void zx_clk_disable_unprepare_put(void *data)
> +{
> +	clk_disable_unprepare(data);
> +	clk_put(data);
> +}
> +
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
> +	unsigned int public_clk_count = 0, highest_id = 0;
> +	struct clk_hw_onecell_data *clocks;
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned int i;
> +	int res;
> +
> +	map = device_node_to_regmap(of_node);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	for (i = 0; i < data->num_muxes; ++i) {
> +		if (data->muxes[i].id != ZX297520V3_CLK_NO_EXPORT) {
> +			if (data->muxes[i].id > highest_id)
> +				highest_id = data->muxes[i].id;
> +			public_clk_count++;
> +		}
> +	}
> +	for (i = 0; i < data->num_gates; ++i) {
> +		if (data->gates[i].id != ZX297520V3_CLK_NO_EXPORT) {
> +			if (data->gates[i].id > highest_id)
> +				highest_id = data->gates[i].id;
> +			public_clk_count++;
> +		}
> +	}
> +
> +	if (WARN_ON(public_clk_count != highest_id + 1))
> +		return -EINVAL;
> +
> +	clocks = devm_kzalloc(dev, struct_size(clocks, hws, public_clk_count), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +	clocks->num = public_clk_count;
> +
> +	for (i = 0; i < data->num_inputs_enable; ++i) {
> +		clk = of_clk_get_by_name(of_node, data->inputs_enable[i]);
> +		if (IS_ERR(clk)) {
> +			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
> +					     data->inputs_enable[i]);
> +		}
> +
> +		res = clk_prepare_enable(clk);
> +		if (res) {
> +			clk_put(clk);
> +			return dev_err_probe(dev, res, "Input clk %s enable failure\n",
> +					     data->inputs_enable[i]);
> +		}
> +		res = devm_add_action_or_reset(dev, zx_clk_disable_unprepare_put, clk);
> +		if (res)
> +			return res;
> +	}
> +	for (i = 0; i < data->num_inputs; ++i) {
> +		/* FIXME: devm_get_clk_from_child doesn't do any tree traversal, so it works here
> +		 * whether "of_node" belongs to "dev" or a parent of "dev". Is it supposed to be
> +		 * used that way though?
> +		 */
> +		clk = devm_get_clk_from_child(dev, of_node, data->inputs[i]);

I don't know the intention of the original function without digging into
the history. Can you just use of_clk_get_by_name(of_node, data->inputs[i])
like you do in the for loop above for consistency?

> +		if (IS_ERR(clk)) {
> +			return dev_err_probe(dev, PTR_ERR(clk), "Input clk %s failure\n",
> +					     data->inputs[i]);
> +		}
> +	}
> +
> +	if (data->init) {
> +		res = data->init(map);
> +		if (res)
> +			return res;
> +	}
> +
> +	res = zx_clk_register_fixed_dividers(dev, map, data->fixed_divs, data->num_fixed_divs);
> +	if (res)
> +		return res;
> +
> +	res = zx_clk_register_plls(dev, map, data->plls, data->num_plls);
> +	if (res)
> +		return res;
> +
> +	res = zx_clk_register_muxes(dev, map, data->muxes, data->num_muxes, clocks);
> +	if (res)
> +		return res;
> +
> +	res = zx_clk_register_dividers(dev, map, data->divs, data->num_divs);
> +	if (res)
> +		return res;
> +
> +	res = zx_clk_register_gates(dev, map, data->gates, data->num_gates, clocks);
> +	if (res)
> +		return res;
> +
> +	/* This is to catch holes in the tables rather than registration errors. The count vs
> +	 * highest ID should catch most static issues. This check here will trigger if an ID is
> +	 * reused by accident.
> +	 */

Comments need to be:

  /*
   * This is to ...
   */

> +	for (i = 0; i < public_clk_count; i++) {
> +		if (WARN(!clocks->hws[i], "Clock %u not registered\n", i))
> +			return -EINVAL;
> +	}
> +
> +	res = of_clk_add_hw_provider(of_node, of_clk_hw_onecell_get, clocks);
> +	if (res)
> +		return res;
> +	return devm_add_action_or_reset(dev, zx_delete_clk_provider, of_node);

Use the devm_of_clk_add_hw_provider()

Brian

