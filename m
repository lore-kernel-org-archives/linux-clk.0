Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30643C3C15
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226128; cv=none; b=eX+xl4fPbhd9n7BFyC6b7zQ9f34ECLPRS1DYWEUxPqLVtwdOKcR4gE8fIgAXyY821iI0WSQRMZP2glxpzYtTX8jTmeC5W7Lpkm69F+zBMHdkQ24BcBXq68vIPdjem8p4X/mBi1WkZhV6gSZVTOAw3xFaKRmzeQIapYQE50bjbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226128; c=relaxed/simple;
	bh=uEN7fGevsYun/ye4tomwsN5hANnptUfzEO6ThhwrvUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7l+K7wpawjzWOkwZtBLfh3hoUVeWfWOO+T2L2bDpXNAR0YOZ8wYsrG1U+XzN2W1RR5iDCaFhZTezw6q8zIJRkk1ibu7LGzH/Po/mSw/gqLJKPJ7qXSoLvGArLHrLvn+8v8S0WKhW/5MqeG6FdHb619MtRNrBKdSc51NgCAmu/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7rQ/9cx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+uRsnkb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7rQ/9cx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+uRsnkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=;
	b=T7rQ/9cxBVwnpKr7P2H2l/FhUC1bxCgpbNnZd5p3r/vlu96FW46zu7hm1fz8V4jUpVxxW2
	McoB09BJfPemY20GNC4x2MnHgIx0jGYpSvQEMHOghu+kWu1vY1YJ8c5CzmBpVdGQSNUmSr
	uyiiJQCGR+bRtzgXlCYHjyEe6RhIo70=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-R8HOarsbMkiPg6yPBFDCSA-1; Fri, 03 Apr 2026 10:22:04 -0400
X-MC-Unique: R8HOarsbMkiPg6yPBFDCSA-1
X-Mimecast-MFC-AGG-ID: R8HOarsbMkiPg6yPBFDCSA_1775226124
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so31098531cf.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775226124; x=1775830924; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=;
        b=I+uRsnkbwRpuyKIR/8sT9AAe+i2ldf/RXE2X7wK9iqVBQa7ArYgwIE1ZnTYgTyiy2x
         ZCMGQOMrAnxz4rPtEKQ2Fmz6F+L5qFzPRBB9JzxYw1s4B2nr5/5LMeWObGmlQJKvVywJ
         JSzNJR8TFGXmGZUy6McX8hdo0Yg/5Jz4uNrhlvRE2nC1Qvt/F/nCWlNKgXzpEHZ1RNBC
         9rJMIX0HSyleBqYV4GHotGeF8/9H2IRmma8YCzo6qnGXZtAwhyZRwpzBzxktVfPmeqd4
         Xr/goA9PhUOdhnoTqxkT7WaakO+GNzQrAsOtsrgk5akQWV7yC8J9CJIIyYpo7ZxiFx0A
         5aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226124; x=1775830924;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFaUzbzw3UwrOKQve5iqMJ9GUoUB8a24kPcMKP3uvaA=;
        b=h8dh26QBHfl0XxuElKTV3EcozePbpl9CjkL5obC6GpR4wMHUy1JgGlesnt/6zgefyB
         wQ3kC4kumeUhD6KO3Nw9hqAtGrOmfkLoXFc5BRu6jbEEvYtoLNpdk1RcwTwafAc6ow50
         36cz9ybH9Kb+OrdDJ1yFclinkMOfZLfs3r3dleWO5r7FNyJjJPBsmpJCrSwI4GykchEP
         COuLkXBQWL1F2/XK+fXk+mElsgRBP1XCifXM0/l4dRUcPffOA5hfMTy3mEwuRpth6tbU
         gJkzEDI/CkzG3LiOGKENR1hQLExrlyY7ETIuIb9jTFO+5r/xzOtsSmaeLkDpZSSpm9PQ
         AuLg==
X-Forwarded-Encrypted: i=1; AJvYcCWXHEyiE8YYf7RcoDM5j32iQL5Qad+djgIbn0iBydD74IgMm1bClUFHRoZIdDbn2fZQJdOmMMMcBSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7oPVUobLF2zSNMejTJZgv2SricZ5l5WroLkgO1mztm+wpenwu
	V8EtJ2sB5dUIu+N4uXw/bDpQvhgkecm9G6djd4Py2H57KHL+BkuNY1Z5lmcKAStjiYZk4udUPBr
	ftly34tFQ/BupUTd2WnM9h2zq/OPl7LaQfxPP1igHU+2k/oRPRbqnKCFcPCEATg==
X-Gm-Gg: ATEYQzxvEAzcVwbO6fdCIGFJOwcRJbk4HLSzQdpIwu3dZ4Z12gAf8f+SjTCQgsbni8+
	8o4LU9E8R7XbvlAFQk08lEzy3vgts5wlmF+Feph/uNzNmYOwqYiKDIT90fwLoNoPF71Fptm0Lvr
	y2Wfxa639WR2xH7kfE7gDjKpAfg4Ti1B/YWLOUXVxqlIL9aSFGkBMDI1RsHMqA+MA/z8TOrSGUc
	FwDvG5uv3DEuf30H3jmkNRtoGkfWdtRBwaFKz5MzTJ+J4Xryc2Ab5mLU88kneedRdBckSHubxEF
	vglKe5OTy1FIgD75v3oTRQTx+xLWqddOyJkjf0RXl6CIcsflSX0WPljKRFkBGueQPmKJi3iMvQ3
	R39nk3y2ILjgEXyuO9cwTmJZw/zuJnAOs1gk0/6ZaxRkm+hFLXh6UyWr0
X-Received: by 2002:a05:620a:25c9:b0:8c7:1118:c514 with SMTP id af79cd13be357-8d41c3b4678mr430490385a.17.1775226123831;
        Fri, 03 Apr 2026 07:22:03 -0700 (PDT)
X-Received: by 2002:a05:620a:25c9:b0:8c7:1118:c514 with SMTP id af79cd13be357-8d41c3b4678mr430484085a.17.1775226123228;
        Fri, 03 Apr 2026 07:22:03 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8c29f00sm427002585a.45.2026.04.03.07.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:22:02 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:21:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 03/10] clk: realtek: Introduce a common probe()
Message-ID: <ac_NB8y414PtbtqM@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-4-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:50PM +0800, Cheng-Yu Lee wrote:
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
> Changes in v6:
> - Replace direct reset controller initialization with auxiliary device creation.
> - Add aux_name parameter to rtk_clk_probe() to register the reset auxiliary device.
> - Simplify rtk_clk_desc because reset data is handled entirely by the auxiliary reset driver.
> - In Kconfig, change "depends on RESET_CONTROLLER" to "select RESET_CONTROLLER"
> - Remove unused includes headers and added <linux/auxiliary_bus.h>.
> ---
>  MAINTAINERS                  |  1 +
>  drivers/clk/Kconfig          |  1 +
>  drivers/clk/Makefile         |  1 +
>  drivers/clk/realtek/Kconfig  | 28 +++++++++++++++
>  drivers/clk/realtek/Makefile |  4 +++
>  drivers/clk/realtek/common.c | 67 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/common.h | 37 ++++++++++++++++++++
>  7 files changed, 139 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/common.c
>  create mode 100644 drivers/clk/realtek/common.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f355896583b..8318156a02b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22240,6 +22240,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	drivers/reset/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  F:	include/dt-bindings/reset/realtek*
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3d803b4cf5c1..d60f6415b0a3 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -519,6 +519,7 @@ source "drivers/clk/nuvoton/Kconfig"
>  source "drivers/clk/pistachio/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
>  source "drivers/clk/ralink/Kconfig"
> +source "drivers/clk/realtek/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7bce3951a30..69b84d1e7bcc 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -140,6 +140,7 @@ obj-$(CONFIG_COMMON_CLK_PISTACHIO)	+= pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
>  obj-y					+= ralink/
> +obj-$(CONFIG_COMMON_CLK_REALTEK)	+= realtek/
>  obj-y					+= renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> new file mode 100644
> index 000000000000..bc47d3f1c452
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	bool "Clock driver for Realtek SoCs"
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
> +	select RESET_CONTROLLER
> +	select RESET_RTK_COMMON

select AUXILIARY_BUS ?

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
> index 000000000000..377ec776ee47
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += common.o
> diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
> new file mode 100644
> index 000000000000..c5aea15a3714
> --- /dev/null
> +++ b/drivers/clk/realtek/common.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation

If you are making changes here, should the copyrights be updated to
include 2026?

> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include "common.h"
> +
> +static int rtk_reset_controller_register(struct device *dev, const char *aux_name)
> +{
> +	struct auxiliary_device *adev;
> +
> +	if (!of_property_present(dev->of_node, "#reset-cells"))
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, aux_name, NULL);
> +
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
> +	return 0;

Add newline before return.

> +}
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc,
> +		  const char *aux_name)
> +{
> +	int i, ret;
> +	struct regmap *regmap;
> +	struct device *dev = &pdev->dev;

Put variables in reverse Christmas tree order.

> +
> +	regmap = device_node_to_regmap(pdev->dev.of_node);
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
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +
> +		if (ret) {

Remove newline before if.

> +			dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
> +				 ret);
> +			desc->clk_data->hws[i] = NULL;

This chunk doesn't take into account probe deferrals.

Brian

