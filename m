Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFB407CCC
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676839; cv=none; b=uL/9JZaXkhTlV/Xva7up6Wt3CgLhyLqEhdYjHCnO2rMB0b5g/fvi/qEgCpnYetgQ9bPR9n03n6mH9B5R7+4gQ8pwe0QyLFT/5kX4Wr6eqdAcTr1D6fCqKTUXUUYUW0YUmRJ0PfWFXlrJd+p8jsNpK7sYFgA60vDEyLzC5mx7QGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676839; c=relaxed/simple;
	bh=jmHkekrqCTRVBjNf/RdIQ8U8/EnKEcv18sVhKF2efiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/PoJel6fc00SB8aznC7lc4nOAAVEIpc99fDc7EYE9Zsqoz8WJDu219//6tCUPYgVr3i1XHAn+ataQUpmwY7nfUdNmBypHyaKZI4QsV+SndUe2UMLS9JLEz0jNAmcBgyhlCqjV5e1C4qImZqc9nq04PpdUx58xfq+NNIn39bz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HCerxSFj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QZitEJ9A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HCerxSFj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QZitEJ9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784676836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
	b=HCerxSFj4al8p5UXr/38Pdi2+neKgwdljZQSchVeftiZYYy2vagpfYj9cC1aykg04zS+at
	Sbe2jaHn3V9QMH0FuESE0stzR0aMmkOCkTLaCn+dSDG1U3uIKmyI+bY3uAAegCWmvNScJV
	Ae672CalGyYLGe9/4HD7teGe73CztjQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-lEOYmsfwMce6VRjuHhOV-Q-1; Tue, 21 Jul 2026 19:33:50 -0400
X-MC-Unique: lEOYmsfwMce6VRjuHhOV-Q-1
X-Mimecast-MFC-AGG-ID: lEOYmsfwMce6VRjuHhOV-Q_1784676830
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so2234313585a.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784676830; x=1785281630; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
        b=QZitEJ9AkmeHCOdJBF46fe7TVyISpvljb87/rFdOUmzzDzxXr0ClnrR9HawRfHEzLU
         fcN7PBGOtk1rvlZuC/JyXpQ3xWHD75FXdadzrQIjmo0HX1z5zdWeOo+3U+QWrkQ0bCbp
         F7/YfsSRTeqDkvMRLNxkTbAOn8mqwn/PEyk7ZCqXUUdZcGgXGU/R0NW9mZP24EP0riWN
         9TGwrK1UX2ZZQNGIkNY8NFYirjZdHoBJFQ9JEqHEMwJ1NBnGPf2AIf+9zYZjdNLzpx0b
         iKfMGCf6WbQ8SiOTtIJPgOJEUvUtA9Bb0m5gF96JZ5Yj5GJyDEeOWXXdWrsCShR3Patp
         ZgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676830; x=1785281630;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auMz2LN5tHJag03mf+TQgvTRqEM9EzBNH8krKUgiijs=;
        b=qnoix3DHz9j0/ZbN1rZ/PZM1dTRykHwcUDWgvy9bW9EoD+Kxmo+v+8d5dGMkyItYUI
         8alQAgYNAU0ApKJD1/0atqXhqE9w6L6K26mzI+EeVWwS442vXU2LDxA6fa1jmBxZHUBc
         PqlAltfSa/osfPt9NZj1qo/Gzltolou4uveCeExm6GJVfonzzGBG4/IIZbc9nQLi9ubS
         3g9NEiLa60Uv5Iya4LpG+RJfC8bnGeMel1R5ub04uvq1OSAEO5X/AED9T3lvd+U9ant0
         Yc4EifsX4PfcFaJHQwlnpCdFlI8mF1WWumywawFFmKHUj2tNuyAsPpP47W7wzFBBLYYR
         qb7w==
X-Forwarded-Encrypted: i=1; AHgh+RqN4f0pKXwUL4UFGpUlSORHTWxf+LKfYcN53zq5qPpBTwbWEDoGNtZ/WtWmtNnGW3ijk9K5vPjLLvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWO4+lFt+RlFYSv1oayTtPU2LvATNnAxrCgsuwum7RVln6Ws3
	oaRFBMKBNcj+klyz1wfdCE73lAFPKVH/kccwTaCMW2brKVnHtfBwqXo1GfJ9035p6jsufqz5GE8
	qbBLt2ky/tq/bLtgqPXvrsO/mFlDc68CDQ6oVcoMteqEczsBQ3mBjtQJ7T6JZrQ==
X-Gm-Gg: AR+sD12/w4r6H9eUmLW/ZgZ96vgnVZEsw95hRZbJ/gq4VL18bO511P7oX6VFVbdPXs9
	N1XfGpaUgpJpERx65x1ytYSZpQn6o7sVaknK330d9iq2IixHXhuAtrJ1jz5r01aUa2TYtLC+GS/
	b2hO7vqpwikkBaF9Sg9uh6INfYlZRg8NQ19HqqGivCTG+dPxLiZqnVSPJiFOGttPY1LA3bwonjV
	E3AXmdMCD+ELrJ4y0CRJ7nT8dMC8RH24Bo9HuY0eVlERF1rthgZBL2i2PteiuBJK0eEXXvA5J62
	O06atb0SIKg8GoQ9XCN1e1FzFrJfYl8X0RlYzbKJazxHWhHlowdGk6j2Afei0EthpTOGTSeg97Z
	uGqtHTQmK/1LVoc+e/cLyy8dqWJXKTUuotb8=
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261450085a.50.1784676830122;
        Tue, 21 Jul 2026 16:33:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:916:1a02:1965 with SMTP id af79cd13be357-930b41b1a22mr2261448185a.50.1784676829600;
        Tue, 21 Jul 2026 16:33:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a88b88sm15993885a.42.2026.07.21.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:33:48 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:33:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v10 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amAB2rr8UxY7QsCn@redhat.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713155630.3054636-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 13, 2026 at 11:56:23PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v10:
> Add 'aux_name' to 'struct rtk_clk_desc'
> ---
>  MAINTAINERS                          |  1 +
>  drivers/clk/Kconfig                  |  1 +
>  drivers/clk/Makefile                 |  1 +
>  drivers/clk/realtek/Kconfig          | 30 ++++++++++++
>  drivers/clk/realtek/Makefile         |  4 ++
>  drivers/clk/realtek/clk-rtk-common.c | 70 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-rtk-common.h | 37 +++++++++++++++
>  7 files changed, 144 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.c
>  create mode 100644 drivers/clk/realtek/clk-rtk-common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 02b34a53b258..1fffb1fc5de1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22742,6 +22742,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..97ad817457db 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -525,6 +525,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..b1aa373e9f84 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -141,6 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..ed97531e321d
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	tristate "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default ARCH_REALTEK
> +	help
> +	  Enable the common clock framework infrastructure for Realtek
> +	  system-on-chip platforms.
> +
> +	  This provides the base support required by individual Realtek
> +	  clock controller drivers to expose clocks to peripheral devices.
> +
> +	  If you have a Realtek-based platform, say Y.
> +
> +if COMMON_CLK_REALTEK
> +
> +config RTK_CLK_COMMON
> +	tristate "Realtek Clock Common"
> +	depends on RESET_CONTROLLER
> +	select AUXILIARY_BUS
> +	select MFD_SYSCON
> +	select RESET_RTK_COMMON
> +	help
> +	  Common helper code shared by Realtek clock controller drivers.
> +
> +	  This provides utility functions and data structures used by
> +	  multiple Realtek clock implementations, and include integration
> +	  with reset controllers where required.
> +
> +endif
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> new file mode 100644
> index 000000000000..13000ed4ba11
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += clk-rtk-common.o
> diff --git a/drivers/clk/realtek/clk-rtk-common.c b/drivers/clk/realtek/clk-rtk-common.c
> new file mode 100644
> index 000000000000..cea7d94313da
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "clk-rtk-common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name,
> +					 struct regmap *map)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	if (!aux_name) {
> +		dev_err(dev, "DTS requires reset controller, but aux_name is missing\n");
> +		return -EINVAL;
> +	}
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, (void *)map);
> +
> +	if (!adev)

Remove extra newline

> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int i, ret;
> +
> +	regmap = device_node_to_regmap(dev->of_node);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
> +
> +	for (i = 0; i < desc->num_clks; i++)
> +		desc->clks[i]->regmap = regmap;
> +
> +	for (i = 0; i < desc->clk_data->num; i++) {
> +		struct clk_hw *hw = desc->clk_data->hws[i];
> +
> +		if (!hw)

Remove extra newline.

> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register hw of clk%d\n", i);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add clock provider\n");
> +
> +	return rtk_reset_controller_register(dev, desc->aux_name, regmap);
> +}
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_probe, "REALTEK_CLK");
> +
> +MODULE_DESCRIPTION("Realtek clock infrastructure");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/realtek/clk-rtk-common.h b/drivers/clk/realtek/clk-rtk-common.h
> new file mode 100644
> index 000000000000..d2aee7f421b4
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtk-common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2016-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_COMMON_H
> +#define __CLK_REALTEK_COMMON_H
> +
> +#include <linux/clk-provider.h>
> +
> +#define __clk_regmap_hw(_p) ((_p)->hw)
> +
> +struct device;
> +struct platform_device;
> +struct regmap;
> +
> +struct clk_regmap {

Please rename this to clk_rtk_regmap. drivers/clk/qcom/clk-regmap.h
already has this name, and they won't collide, but it makes things like
grep less ambiguous with a unique name.

Brian

