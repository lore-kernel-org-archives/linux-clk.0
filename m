Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80F34DB41
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773028; cv=none; b=CAPkzZALgqr/audTajwzZiXiDuKEstJTX2pbLwUX1RHk8CAJITnfj2GSHn3RXMwc93t+zuou6dRJM+iBqyn3AhQshwklJXURYbtVybJgHP7aib1UE3jJ7rAqlcviwQFdxeCML5eyTzA9wJVZpxUfp7TRthw6S0zt8nbCUYiBLdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773028; c=relaxed/simple;
	bh=6jclqOKOhjX9T39epJHDKQCYP1HNUlhp9z3RRJ50uOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBLlUXrYW0hoBZ3tBCzhjw5ehKTJn01fkmUWVYlA5mfaoPPRjJJNl/4UAhDndFe7vNOGwqlWhWJTrcSKLfBVzAU5CoU16WiKZwWLIxPn7ojEPMmqMjJ92K1c49Ox16w2lFxEd4F73VEFyPhjHup9fcrd0mBzNHodn1p/DgZeBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWI2STJS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/sBWJr4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWI2STJS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/sBWJr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3o05UEgOpPrf4lyr749hyVgnBUqxpDlvn19KzqMCcY=;
	b=bWI2STJS/dNYs5u+KWImQnHJuRaPkBb6pCD8dHwA0egoaYjI3BHwmMJfVfAmhMLIQFpfZI
	5LdFh8NzEs4bk25cyBqcahj39Y1H5T+gVB3PftZPROvo0rcPUBKtEd1MuuYa9csAc3LGXc
	00WVnM5OXqf+siJq2zYrYGcJu4yy5To=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296--oKfuFpcPCKWVZmS2Z5Xew-1; Mon, 03 Aug 2026 12:03:42 -0400
X-MC-Unique: -oKfuFpcPCKWVZmS2Z5Xew-1
X-Mimecast-MFC-AGG-ID: -oKfuFpcPCKWVZmS2Z5Xew_1785773022
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6bb29581so129217657b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785773022; x=1786377822; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3o05UEgOpPrf4lyr749hyVgnBUqxpDlvn19KzqMCcY=;
        b=U/sBWJr4/4VsyrV/aBNVVpSoAttzI0aOy6YzTKr9rMpEHOTRi/jlg4Y3k7rgT0ZKFm
         DGMB3bbfnxXTSwBBbnPPjDdLRhxMkVe3ixc8gZfXWyAk5vExer27j+Ch0wrJry71SYwE
         7y5rT7xq84PtwcHmxzEMRlV+nFiKuwTX06G6zK3LXFL4j/Xp4VE9F3orNFIMUX7ryUiq
         i6dLm+ROO82tB2UcQmLZDQwIx8H8kL2H5mIsN3KfNaMCubBRffR/8InZ3WnrHtXZQs3G
         JZhCidESuDJKlaClCQPOL9c7wbOrg1aZfG4O53Yolphc4lfvpAI4TWNolWgYFzlFEINR
         Nu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773022; x=1786377822;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3o05UEgOpPrf4lyr749hyVgnBUqxpDlvn19KzqMCcY=;
        b=NH6LlVxYi4x7YSiBy9sLcPje15r5hS9LzY+GiFZlHVjo+T7ngbL4hjdL5Tm7N+xDMC
         UVQwWLadbuk62TULKtbhIwr7nfo7bbITKLf6Knlkib6NwNpWjcFouMV4/gVhjVy4nH74
         f9W4elCjls5bYfS2mL+/elyduQhDI6PVQN/IEoRcVRYqbWMej3zfSRiByyLzifqawMzQ
         Ei2Rbe796k96LxZefskOLLb51Ru7SfsOfQaDSAFvGlIfU+cA7OYiIbBckx234iGMg3Jk
         Vwchkkg4NzlPpx+tscuX/bfQNN1OpwBi0Ow7X8Ap02WILPsWJnkf4A3vUq2be1toOLsC
         RDuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwidF4Xm4ThpH4XssvhPQ+vT74tXOYMTQi6VVLU4q3eZwwYp3zGBhoxUgCQ6cMcrRiHUTMLuvy4Bs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZpnoJnRjMetD+LR+S/Ft6os5T6i6yAsCbTlB9x0i8xVVMYJq
	gXheswxOma+x0KxgCqrC/Aa0Y5jed2mHNkHBceF+ZHzEZPj3So/PmwNjrU1K09SvKxx9jWcfpQK
	AGHS3VblaSBDsUGLuBNHqXPdDWClbfuECQ3iY/kWtpLOn4Iqbajpm7tneAKeJqA==
X-Gm-Gg: AR+sD11XIcgwgIhN6ZbtANGWvKM/309AXK9I2Sd/RtviBFto5ZXIBilWQLB/7ghptCZ
	92GKEMxgiZashy3fvyOZcCPttLXctmc9jRxn+9/PZK4IBURC7djmDubXYf2sr8Ttvp1ZvDkjvKv
	+H/NXZLYqnyDIgGaEqqSm0CkNKz9npn7hjsU2yLdJ7qSl76z+hN0uJF3ETpAYDVEzyWY9WGh467
	5Eu1+bQvOH8ZENN+pkVTNzJPgTJjh34Pyy4UHn0MlStqF3JDs7HvjkmQBi0xrKl4r+/L2Apw44o
	ZSWeWeLlUizgz3OtngI3xDQN1Ei3lzVqDVZlfEUDZnrFOu8ObL2S0w5jir4PH7aQlwK1tF5/Ajn
	2fEZ0G/1KhceQPGb2X7smRxIGpzrnJU+cKK0=
X-Received: by 2002:a05:690c:16:b0:81e:4aa9:d025 with SMTP id 00721157ae682-81fd49f6badmr118627957b3.6.1785773022056;
        Mon, 03 Aug 2026 09:03:42 -0700 (PDT)
X-Received: by 2002:a05:690c:16:b0:81e:4aa9:d025 with SMTP id 00721157ae682-81fd49f6badmr118625467b3.6.1785773019839;
        Mon, 03 Aug 2026 09:03:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm57341507b3.13.2026.08.03.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:03:38 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:03:36 -0400
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
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anC72Cf1zKcLYWlC@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Sun, Aug 02, 2026 at 11:33:37PM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 9:
> Rework parent matching and clock export control. Most of the changes
> will be in the next patches. The visible change here is that the clock
> array is unified with single clocks having a type rather than one array
> per type.
> 
> Depend on HAS_IOMEM, similarly to Sashiko's flagged issue in the Reset
> patch
> 
> ZX297520V3_CLK_NO_EXPORT is gone again.
> 
> The explicit clock input array and enabling of LSP's pclk is removed
> from the clock driver. The MFD parent takes care of this instead. The
> clock driver does some sanity checking on the static clock data though.
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
>  drivers/clk/zte/Kconfig      |  17 ++++
>  drivers/clk/zte/Makefile     |   5 ++
>  drivers/clk/zte/clk-regmap.c |  32 ++++++++
>  drivers/clk/zte/clk-zx.c     | 189 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/zte/clk-zx.h     | 142 ++++++++++++++++++++++++++++++++
>  drivers/clk/zte/pll-zx.c     |  18 +++++
>  9 files changed, 406 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b9f96455bca7..77fa86c671b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3915,6 +3915,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
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
> index 6899e32e14aa..651fe866ddad 100644
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
> index 000000000000..152c2423b8f0
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# ZTE Clock Drivers
> +#
> +
> +config COMMON_CLK_ZTE
> +	tristate "Clock driver for ZTE SoCs"
> +	depends on HAS_IOMEM
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
> index 000000000000..80332dba97f6
> --- /dev/null
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Stefan Dösinger
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-zx.h"
> +
> +struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
> +				    const struct zx_gate_desc *desc,
> +				    struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
> +				       const struct zx_div_desc *desc,
> +				       struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
> +struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
> +				   const struct zx_mux_desc *desc,
> +				   struct clk_hw * const *clocks)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 000000000000..27bbafd8ce4d
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
> @@ -0,0 +1,189 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +
> +#include "clk-zx.h"
> +
> +static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
> +						const struct zx_fixed_divider_desc *desc,
> +						struct clk_hw * const *clocks)
> +{
> +	const struct zx_parent_desc *p = &desc->parent;
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name, p->fw_name,
> +								CLK_SET_RATE_PARENT, 1, desc->div);
> +
> +	case ZX_PARENT_ID:
> +		return devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name, clocks[p->id],
> +								   CLK_SET_RATE_PARENT, 1,
> +								   desc->div);
> +	}
> +	WARN_ON_ONCE(1);
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int zx_clk_validate(struct device *dev, struct device_node *of_node,
> +			   const struct zx_clk_data *data)
> +{
> +	const struct zx_parent_desc *parents;
> +	unsigned int i, p, num_parents;
> +	struct clk *clk;
> +
> +	/*
> +	 * Sanity check: Make sure all parents are there and write a clear message rather than
> +	 * leave potential orphans.
> +	 */

It's not common for clk drivers to have a validate function like this.
That said, I know you are reverse engineering what's in the downstream
BSP without documentation, and there is value in having this. I think
it'd be useful to clarify that in the comments because code usually gets
copied and pasted between drivers over time.

That said, once it's verified that the clock tree is correct, can these
checks be eventually dropped so that this validation logic isn't ran on
every boot?

k
> +	for (i = 0; i < data->num_clocks; ++i) {
> +		switch (data->clocks[i].type) {
> +		case ZX_CLOCK_PLL:
> +			parents = data->clocks[i].pll.parents;
> +			num_parents = data->clocks[i].pll.num_parents;
> +			break;
> +
> +		case ZX_CLOCK_FIXED_DIV:
> +			parents = &data->clocks[i].fixed_div.parent;
> +			num_parents = 1;
> +			break;
> +
> +		case ZX_CLOCK_MUX:
> +			parents = data->clocks[i].mux.parents;
> +			num_parents = data->clocks[i].mux.num_parents;
> +			break;
> +
> +		case ZX_CLOCK_DIV:
> +			parents = &data->clocks[i].div.parent;
> +			num_parents = 1;
> +			break;
> +
> +		case ZX_CLOCK_GATE:
> +			parents = &data->clocks[i].gate.parent;
> +			num_parents = 1;
> +			break;
> +
> +		default:
> +			return dev_err_probe(dev, -EINVAL, "Invalid clock entry %u\n", i);
> +		}
> +
> +		for (p = 0; p < num_parents; ++p) {
> +			switch (parents[p].type) {
> +			case ZX_PARENT_FW:
> +				clk = of_clk_get_by_name(of_node, parents[p].fw_name);
> +				if (IS_ERR(clk))
> +					return dev_err_probe(dev, PTR_ERR(clk),
> +							     "Input clk %s failure\n",
> +							     parents[p].fw_name);
> +				clk_put(clk);
> +				break;
> +
> +			case ZX_PARENT_ID:
> +				if (parents[p].id >= i)
> +					return dev_err_probe(dev, -EINVAL,
> +							     "Clock %u has parent %u\n",
> +							     i, parents[p].id);
> +				break;
> +
> +			default:
> +				return dev_err_probe(dev, -EINVAL,
> +						     "Clock %u has unexpected parent of type %u\n",
> +						     i, parents[p].type);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
> +	struct clk_hw_onecell_data *exports;
> +	struct clk_hw **clocks;
> +	struct regmap *map;
> +	unsigned int i;
> +	int res;
> +
> +	res = zx_clk_validate(dev, of_node, data);
> +	if (res)
> +		return res;
> +
> +	map = device_node_to_regmap(of_node);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	clocks = devm_kcalloc(dev, data->num_clocks, sizeof(*clocks), GFP_KERNEL);
> +	if (!clocks)
> +		return -ENOMEM;
> +
> +	if (data->init) {
> +		res = data->init(map);
> +		if (res)
> +			return res;
> +	}
> +
> +	for (i = 0; i < data->num_clocks; ++i) {
> +		struct clk_hw *hw;
> +
> +		switch (data->clocks[i].type) {
> +		case ZX_CLOCK_PLL:
> +			hw = zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);
> +			break;
> +
> +		case ZX_CLOCK_FIXED_DIV:
> +			hw = zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clocks);
> +			break;
> +
> +		case ZX_CLOCK_MUX:
> +			hw = zx_clk_register_mux(dev, map, &data->clocks[i].mux, clocks);
> +			break;
> +
> +		case ZX_CLOCK_DIV:
> +			hw = zx_clk_register_divider(dev, map, &data->clocks[i].div, clocks);
> +			break;
> +
> +		case ZX_CLOCK_GATE:
> +			hw = zx_clk_register_gate(dev, map, &data->clocks[i].gate, clocks);
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw), "Failed to register clk %u\n", i);
> +
> +		clocks[i] = hw;
> +	}
> +
> +	exports = devm_kzalloc(dev, struct_size(exports, hws, data->num_exports), GFP_KERNEL);
> +	if (!exports)
> +		return -ENOMEM;
> +	exports->num = data->num_exports;
> +
> +	for (i = 0; i < data->num_exports; ++i) {
> +		if (data->exports[i] >= data->num_clocks)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Export %u points to out of range clock %u\n",
> +					     i, data->exports[i]);
> +
> +		exports->hws[i] = clocks[data->exports[i]];
> +	}
> +
> +	devm_kfree(dev, clocks);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
> +}
> +EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
> +
> +MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE common clock driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> new file mode 100644
> index 000000000000..175fbba3e0b3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#ifndef __DRV_CLK_ZX_H
> +#define __DRV_CLK_ZX_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
> +#define CLK_ZX_MAX_PARENTS		8
> +
> +enum zx_parent_type {
> +	ZX_PARENT_FW,
> +	ZX_PARENT_ID,
> +};
> +
> +struct zx_parent_desc {
> +	enum zx_parent_type		type;
> +	union {
> +		const char		*fw_name;
> +		unsigned int		id;
> +	};
> +};
> +
> +#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
> +
> +#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
> +
> +static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
> +						   struct clk_hw * const *clocks)
> +{
> +	struct clk_parent_data ret = {};
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		ret.fw_name = p->fw_name;
> +		ret.index = -1;
> +		return ret;
> +
> +	case ZX_PARENT_ID:
> +		ret.hw = clocks[p->id];
> +		ret.index = -1;
> +		return ret;
> +	};
> +
> +	WARN_ON_ONCE(1);
> +	return ret;
> +}
> +
> +struct zx_pll_desc {
> +	const char			*name;
> +	const struct zx_parent_desc	*parents;
> +	unsigned int			num_parents;
> +	unsigned long			rate;
> +	u16				reg;
> +	u16				flags;
> +};
> +
> +struct zx_fixed_divider_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	unsigned int			div;
> +};
> +
> +struct zx_mux_desc {
> +	const char			*name;
> +	const struct zx_parent_desc	*parents;
> +	unsigned int			num_parents;
> +	u16				reg;
> +	u8				shift, size;
> +};
> +
> +struct zx_div_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	u16				reg;
> +	u8				shift, size;
> +};
> +
> +struct zx_gate_desc {
> +	const char			*name;
> +	struct zx_parent_desc		parent;
> +	unsigned long			flags;
> +	u16				reg;
> +	u8				shift;
> +};
> +
> +enum zx_clock_type {
> +	ZX_CLOCK_INVALID = 0,
> +	ZX_CLOCK_PLL,
> +	ZX_CLOCK_FIXED_DIV,
> +	ZX_CLOCK_MUX,
> +	ZX_CLOCK_DIV,
> +	ZX_CLOCK_GATE,
> +};
> +
> +struct zx_clock {
> +	enum zx_clock_type type;
> +	union {
> +		struct zx_pll_desc pll;
> +		struct zx_fixed_divider_desc fixed_div;
> +		struct zx_mux_desc mux;
> +		struct zx_div_desc div;
> +		struct zx_gate_desc gate;
> +	};
> +};
> +
> +struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
> +				   const struct zx_pll_desc *desc,
> +				   struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
> +				   const struct zx_mux_desc *desc,
> +				   struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
> +				       const struct zx_div_desc *desc,
> +				       struct clk_hw * const *clocks);
> +struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
> +				    const struct zx_gate_desc *desc,
> +				    struct clk_hw * const *clocks);
> +
> +struct zx_clk_export {
> +	unsigned int priv;
> +	unsigned int binding;
> +};

Sashiko flagged this as unused.

Brian

