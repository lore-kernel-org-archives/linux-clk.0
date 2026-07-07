Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825EB3BE644
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783454082; cv=none; b=Z1khLiuFpSFIKXLv4S2eJuH0KCnnzgC6hS/BQd8+jSkRpw5FKnNrhPaqtatTfO9si/QIcFTn4Yma9sNnfXUR5zM1JLOFE7ZH4yRxEEn6i/Kg5aFCb+m370LESPl1P6vSBEcmR61T3snP2ubvvhNU3dfJtgtRIbGHcakpXTvkLWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783454082; c=relaxed/simple;
	bh=Ua5KQwt1GmcIZ8E77R6eAA3mgGFKu9vM0SGPGBTrqdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d29Xm97Ew4xocv884oIcNEwtc56QmCQJgsc6sGVDAIcr11Wfw61R9dF7nxBA++s8AeeHaKOwu+3z1zo43ebwt0Km8CQPcB0BHvcRWmdQTBLFIyaSPqn2FyU1FZ6zzvQfG76O1Tdz1vhY+CQK4bJ0QevZvcfRI04ITqNSSq3YAGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UkiQGru4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0N9xe1L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UkiQGru4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0N9xe1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783454079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unIuywujNYdkgUTdYaK7LkQijd5tY0RoqZIlmMgDOcA=;
	b=UkiQGru4jy0c/DuFm7Zd35+SWZ2vp4i3HIiLgFfRlgXMbzaJ6RTrL2OEYJSnkWtPkEelVr
	5diLE4TunQG6oMQlaCEJFvVtPxPBYg7JGyNWmsLzclDp+nOf62y6UZ+fVYs3sheiBVm2jl
	ugzACPl2sM/1deIHBWjiyN4+xH5nEok=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-NuZSSAHzMUWpu9TOnDRleg-1; Tue, 07 Jul 2026 15:54:38 -0400
X-MC-Unique: NuZSSAHzMUWpu9TOnDRleg-1
X-Mimecast-MFC-AGG-ID: NuZSSAHzMUWpu9TOnDRleg_1783454078
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6b59d85dcso6947410a34.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783454077; x=1784058877; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unIuywujNYdkgUTdYaK7LkQijd5tY0RoqZIlmMgDOcA=;
        b=M0N9xe1L0xO1MfiTxsSb5VsNZTSGIrXa4Pvw4eoBr541tNotavZDf0MijgNKDa3li4
         ukqxyz2w/DoT2brPpi2Kw3E7JN3x6usNJCiLOAyaWNXe9kar7V3zwK3ZLXFokgIqJ9F7
         Lqm2TOS5jGizfEX8jF5J+/CU5KdCnlABNrINVhUNcDrOKjRVfvHBmPx0CJMyRq+k5t1F
         R5ZEWg1LwkyLfTwvl6BbODWlcRQJyW6yz65QhcYNu/3nO5kivPIyuXGaz9OWOnQNdY6e
         1+CIHwtWOO6rrZ/D52ukCQkNCDQ+l8T73/XKnwo25tW8jkuKuvcqCCuOHJdkOO8+3ixH
         56NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783454077; x=1784058877;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unIuywujNYdkgUTdYaK7LkQijd5tY0RoqZIlmMgDOcA=;
        b=GzYjZwg0HBrZVTtmX2aTT2dEGcsvKvW8BK02tbxSSkjWKusVmydsxIxdv/xpfAjoUh
         SSZB745EO4/45yttPHtPvDdvqZyIJym8+6jUoK8RC+I9OURU24tOx4OImAzXuyryY59P
         EMF6hgujXU/WxINhlVfgMK/u0MQMnAJcwQ7rEvhJ4udw5QoZ7lq/zV4LeP+90702aD8M
         4qwGLwaCuyDAyrL8afiNZzHmSvSRubIa1yTgJDuVMrmD5GYS3fSrgcl7LwQvh/iSgWrd
         OlHjlQzI/CKM5OkLJhiws6ck2lO4LEx5iF2mytb3xKCQGkd5nnj/S+ntFbau86eZPioa
         duxw==
X-Forwarded-Encrypted: i=1; AFNElJ+AwupdPBDZsDsiYWyK6oGXKlWUbA7ncX5n1Mrvkv6tZUeWj2zPx109/3t517XhkMNJsQboJnJePqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24OLwGrDfLoPby4qXSnwEw4GRxPvJAPXRvp1byfbToE1ArV+Z
	FnIWYWjTy40HTt3qcg5v8OnqsR7WlqVbT0ffdK2FrQgd/l8C9CZHk/52etsHi9MvkVyKqA6fR3F
	9GaruxRJ4iA4TMJwEu0OEBG9+W1Fs2JQJbzHWGhDPptv/o9MZpqyZLvP/aSG8bg==
X-Gm-Gg: AfdE7cmJ6dpQQ6PL8/2I9nxFYFmkPYiCh9ePwGT54ycF9uhI+x2LNF+Z9U4WUDuX0UR
	96Yh6LK/5KKm2ArIFFOXXBm0z3YNICMshld2UdtKeTwdJ57tobSEortrTPv9ZbgiOuwMjbX4ZD1
	EQ6V3/hPxUg5pkVUfshrx46tTRitdANZKxy+Kqtk3qzwDlSaTBhzs9hPTP5neLZAxjuYNK63RuV
	HyTKs6gAvTNP+1jI4kV0Hfbq9FRDzNAYadU6viWWseg4DoloHyqx81mMbS+9NVyBkMFLsKJ0m6b
	FixvpMTd9bjkH0vn56oNICguhgh9BZAI5mJhNiFsqAxb9gQJ795kPPhxZmPU68iw0GIZvw/uVAk
	890ptJTPH
X-Received: by 2002:a05:6820:1612:b0:69d:6bfd:5a3f with SMTP id 006d021491bc7-6a3553d640amr4422817eaf.51.1783454072627;
        Tue, 07 Jul 2026 12:54:32 -0700 (PDT)
X-Received: by 2002:a05:6820:1612:b0:69d:6bfd:5a3f with SMTP id 006d021491bc7-6a3553d640amr4422788eaf.51.1783454071946;
        Tue, 07 Jul 2026 12:54:31 -0700 (PDT)
Received: from redhat.com ([2600:382:8102:284f:288:4331:f63e:598f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm264425a34.0.2026.07.07.12.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:54:31 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:54:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: ultrarisc: add DP1000 clock driver
Message-ID: <ak1Zc7uSoqx-F_7Q@redhat.com>
References: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
 <20260617-ultrarisc-clock-v2-2-9cb16083e15e@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-ultrarisc-clock-v2-2-9cb16083e15e@ultrarisc.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Jia,

Thanks for the patch.

On Wed, Jun 17, 2026 at 02:02:55PM +0800, Jia Wang wrote:
> Add a clock driver for the UltraRISC DP1000 SoC.
> 
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS                           |   1 +
>  drivers/clk/Kconfig                   |   1 +
>  drivers/clk/Makefile                  |   1 +
>  drivers/clk/ultrarisc/Kconfig         |  18 ++
>  drivers/clk/ultrarisc/Makefile        |   4 +
>  drivers/clk/ultrarisc/clk-dp1000.c    | 153 ++++++++++++
>  drivers/clk/ultrarisc/clk-ultrarisc.c | 459 ++++++++++++++++++++++++++++++++++
>  drivers/clk/ultrarisc/clk-ultrarisc.h |  73 ++++++
>  8 files changed, 710 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b7e43313c65f..aa5021f30cb5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27444,6 +27444,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
>  L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> +F:	drivers/clk/ultrarisc/*
>  F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
>  
>  ULTRATRONIK BOARD SUPPORT
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index b2efbe9f6acb..75e336858420 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -535,6 +535,7 @@ source "drivers/clk/tenstorrent/Kconfig"
>  source "drivers/clk/thead/Kconfig"
>  source "drivers/clk/stm32/Kconfig"
>  source "drivers/clk/ti/Kconfig"
> +source "drivers/clk/ultrarisc/Kconfig"
>  source "drivers/clk/uniphier/Kconfig"
>  source "drivers/clk/visconti/Kconfig"
>  source "drivers/clk/x86/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a3e2862ebd7e..891272e8e1da 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
>  obj-y					+= tenstorrent/
>  obj-$(CONFIG_ARCH_THEAD)		+= thead/
>  obj-y					+= ti/
> +obj-y					+= ultrarisc/
>  obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
>  obj-$(CONFIG_ARCH_U8500)		+= ux500/
>  obj-y					+= versatile/
> diff --git a/drivers/clk/ultrarisc/Kconfig b/drivers/clk/ultrarisc/Kconfig
> new file mode 100644
> index 000000000000..2eecc6ac3119
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_ULTRARISC
> +	tristate
> +	depends on OF
> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +
> +config CLK_ULTRARISC_DP1000
> +	tristate "UltraRISC DP1000 clock controller"
> +	select CLK_ULTRARISC
> +	depends on OF && HAS_IOMEM
> +	depends on ARCH_ULTRARISC || COMPILE_TEST
> +	default ARCH_ULTRARISC
> +	help
> +	  This driver provides the clock controller for the UltraRISC
> +	  DP1000 SoC. It exposes the PLL output, derived fixed-factor
> +	  clocks, programmable divider clocks, and peripheral gate
> +	  clocks to Linux consumers.
> diff --git a/drivers/clk/ultrarisc/Makefile b/drivers/clk/ultrarisc/Makefile
> new file mode 100644
> index 000000000000..b013708c9444
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_CLK_ULTRARISC) += clk-ultrarisc.o
> +obj-$(CONFIG_CLK_ULTRARISC_DP1000) += clk-dp1000.o
> diff --git a/drivers/clk/ultrarisc/clk-dp1000.c b/drivers/clk/ultrarisc/clk-dp1000.c
> new file mode 100644
> index 000000000000..33a16df8f189
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/clk-dp1000.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +
> +#include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
> +
> +#include "clk-ultrarisc.h"
> +
> +#define DP1000_PLL_CFG1_OFFSET		0x400
> +#define DP1000_PLL_CFG2_OFFSET		0x404
> +
> +#define DP1000_CCR_UART_OFFSET		0x220
> +#define DP1000_CCR_I2C_OFFSET		0x224
> +#define DP1000_CCR_GMAC_OFFSET		0x228
> +#define DP1000_CCR_SPI_OFFSET		0x22c
> +#define DP1000_PERI_CLKENA_OFFSET	0x270
> +
> +#define DP1000_CCR_LOAD			BIT(16)
> +
> +#define DP1000_PERI_MAX_RATE		62500000UL
> +#define DP1000_CLK_NUM			21
> +
> +static const struct ultrarisc_pll_layout dp1000_pll_layout = {
> +	.cfg1_offset = DP1000_PLL_CFG1_OFFSET,
> +	.cfg2_offset = DP1000_PLL_CFG2_OFFSET,
> +	.frac_mask = GENMASK(23, 0),
> +	.m_mask = GENMASK(23, 16),
> +	.n_mask = GENMASK(11, 6),
> +	.oddiv1_mask = GENMASK(4, 3),
> +	.oddiv2_mask = GENMASK(1, 0),
> +};
> +
> +static const struct ultrarisc_pll_desc dp1000_plls[] = {
> +	{
> +		.id = DP1000_CLK_SYSPLL,
> +		.name = "syspll_clk",
> +	},
> +};
> +
> +#define DP1000_FIXED_FACTOR(_id, _name, _parent, _mult, _div)	\
> +	{							\
> +		.id = (_id),					\
> +		.name = (_name),				\
> +		.parent_id = (_parent),				\
> +		.mult = (_mult),				\
> +		.div = (_div),					\
> +	}
> +
> +#define DP1000_DIV(_id, _name, _offset, _parent, _max_rate)	\
> +	{							\
> +		.id = (_id),					\
> +		.name = (_name),				\
> +		.offset = (_offset),				\
> +		.parent_id = (_parent),				\
> +		.max_rate = (_max_rate),			\
> +		.load_mask = DP1000_CCR_LOAD,			\
> +		.div_shift = 8,					\
> +		.div_width = 4,					\
> +		.gate_bit = 0,					\
> +		.divider_flags = CLK_DIVIDER_ONE_BASED,		\
> +		.gate_flags = 0,				\
> +	}
> +
> +#define DP1000_GATE(_id, _name, _parent, _bit)		\
> +	{							\
> +		.id = (_id),					\
> +		.name = (_name),				\
> +		.offset = DP1000_PERI_CLKENA_OFFSET,		\
> +		.parent_id = (_parent),				\
> +		.gate_bit = (_bit),				\
> +		.gate_flags = 0,				\
> +	}
> +
> +static const struct ultrarisc_fixed_factor_desc dp1000_fixed_factor_clks[] = {
> +	DP1000_FIXED_FACTOR(DP1000_CLK_SYSPLL_DIV2, "syspll_div2_clk",
> +			    DP1000_CLK_SYSPLL, 1, 2),
> +	DP1000_FIXED_FACTOR(DP1000_CLK_SUBSYS, "subsys_clk",
> +			    DP1000_CLK_SYSPLL_DIV2, 1, 2),
> +	DP1000_FIXED_FACTOR(DP1000_CLK_PCIE_DBI, "pcie_dbi_clk",
> +			    DP1000_CLK_SYSPLL, 1, 10),
> +	DP1000_FIXED_FACTOR(DP1000_CLK_PCIEX4_CORE, "pciex4_core_clk",
> +			    DP1000_CLK_SYSPLL, 1, 2),
> +	DP1000_FIXED_FACTOR(DP1000_CLK_PCIEX16_CORE, "pciex16_core_clk",
> +			    DP1000_CLK_SYSPLL, 1, 1),
> +	DP1000_FIXED_FACTOR(DP1000_CLK_PCIE_AUX, "pcie_aux_clk",
> +			    DP1000_CLK_SYSPLL, 1, 40),
> +};
> +
> +static const struct ultrarisc_divider_desc dp1000_divider_clks[] = {
> +	DP1000_DIV(DP1000_CLK_GMAC, "gmac_clk", DP1000_CCR_GMAC_OFFSET,
> +		   DP1000_CLK_SYSPLL_DIV2, 0),
> +	DP1000_DIV(DP1000_CLK_UART_ROOT, "uart_root_clk",
> +		   DP1000_CCR_UART_OFFSET, DP1000_CLK_SUBSYS,
> +		   DP1000_PERI_MAX_RATE),
> +	DP1000_DIV(DP1000_CLK_I2C_ROOT, "i2c_root_clk",
> +		   DP1000_CCR_I2C_OFFSET, DP1000_CLK_SUBSYS,
> +		   DP1000_PERI_MAX_RATE),
> +	DP1000_DIV(DP1000_CLK_SPI_ROOT, "spi_root_clk",
> +		   DP1000_CCR_SPI_OFFSET, DP1000_CLK_SUBSYS,
> +		   DP1000_PERI_MAX_RATE),
> +};
> +
> +static const struct ultrarisc_gate_desc dp1000_gate_clks[] = {
> +	DP1000_GATE(DP1000_CLK_UART0, "uart0_clk", DP1000_CLK_UART_ROOT, 0),
> +	DP1000_GATE(DP1000_CLK_UART1, "uart1_clk", DP1000_CLK_UART_ROOT, 1),
> +	DP1000_GATE(DP1000_CLK_UART2, "uart2_clk", DP1000_CLK_UART_ROOT, 2),
> +	DP1000_GATE(DP1000_CLK_UART3, "uart3_clk", DP1000_CLK_UART_ROOT, 3),
> +	DP1000_GATE(DP1000_CLK_I2C0, "i2c0_clk", DP1000_CLK_I2C_ROOT, 4),
> +	DP1000_GATE(DP1000_CLK_I2C1, "i2c1_clk", DP1000_CLK_I2C_ROOT, 5),
> +	DP1000_GATE(DP1000_CLK_I2C2, "i2c2_clk", DP1000_CLK_I2C_ROOT, 6),
> +	DP1000_GATE(DP1000_CLK_I2C3, "i2c3_clk", DP1000_CLK_I2C_ROOT, 7),
> +	DP1000_GATE(DP1000_CLK_SPI0, "spi0_clk", DP1000_CLK_SPI_ROOT, 8),
> +	DP1000_GATE(DP1000_CLK_SPI1, "spi1_clk", DP1000_CLK_SPI_ROOT, 9),
> +};
> +
> +static const struct ultrarisc_clk_soc_data dp1000_clk_soc_data = {
> +	.num_clks = DP1000_CLK_NUM,
> +	.pll_layout = &dp1000_pll_layout,
> +	.plls = dp1000_plls,
> +	.num_plls = ARRAY_SIZE(dp1000_plls),
> +	.fixed_factors = dp1000_fixed_factor_clks,
> +	.num_fixed_factors = ARRAY_SIZE(dp1000_fixed_factor_clks),
> +	.dividers = dp1000_divider_clks,
> +	.num_dividers = ARRAY_SIZE(dp1000_divider_clks),
> +	.gates = dp1000_gate_clks,
> +	.num_gates = ARRAY_SIZE(dp1000_gate_clks),
> +};
> +
> +static int dp1000_clk_probe(struct platform_device *pdev)
> +{
> +	return ultrarisc_clk_probe(pdev, &dp1000_clk_soc_data);
> +}
> +
> +static const struct of_device_id dp1000_clk_of_match[] = {
> +	{ .compatible = "ultrarisc,dp1000-clk" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dp1000_clk_of_match);
> +
> +static struct platform_driver dp1000_clk_driver = {
> +	.probe = dp1000_clk_probe,
> +	.driver = {
> +		.name = "ultrarisc-dp1000-clk",
> +		.of_match_table = dp1000_clk_of_match,
> +	},
> +};
> +module_platform_driver(dp1000_clk_driver);
> +
> +MODULE_DESCRIPTION("UltraRISC DP1000 clock controller");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/ultrarisc/clk-ultrarisc.c b/drivers/clk/ultrarisc/clk-ultrarisc.c
> new file mode 100644
> index 000000000000..4ef222348dd7
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/clk-ultrarisc.c
> @@ -0,0 +1,459 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>

This can be dropped.

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

I think this can be dropped as well.

> +
> +#include "clk-ultrarisc.h"
> +
> +struct ultrarisc_pll_clk {
> +	struct clk_hw hw;
> +	void __iomem *base;
> +	const struct ultrarisc_pll_layout *layout;
> +};
> +
> +struct ultrarisc_divider_clk {
> +	struct clk_divider divider;
> +	struct clk_gate gate;
> +	u32 load_mask;
> +};
> +
> +#define to_ultrarisc_pll_clk(_hw) \
> +	container_of(_hw, struct ultrarisc_pll_clk, hw)
> +
> +static inline struct ultrarisc_divider_clk *
> +to_ultrarisc_divider_clk(struct clk_hw *hw)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +
> +	return container_of(divider, struct ultrarisc_divider_clk, divider);
> +}
> +
> +static unsigned long ultrarisc_pll_recalc_rate(struct clk_hw *hw,
> +					       unsigned long parent_rate)
> +{
> +	struct ultrarisc_pll_clk *pll = to_ultrarisc_pll_clk(hw);
> +	const struct ultrarisc_pll_layout *layout = pll->layout;
> +	u32 oddiv1_div, oddiv2_div;
> +	u64 mult, rate, den;
> +	u32 frac, m, n;
> +	u32 cfg1, cfg2;
> +
> +	cfg1 = readl_relaxed(pll->base + layout->cfg1_offset);
> +	cfg2 = readl_relaxed(pll->base + layout->cfg2_offset);
> +
> +	frac = field_get(layout->frac_mask, cfg1);
> +	m = field_get(layout->m_mask, cfg2);
> +	n = field_get(layout->n_mask, cfg2);
> +	oddiv1_div = 1U << field_get(layout->oddiv1_mask, cfg2);
> +	oddiv2_div = 1U << field_get(layout->oddiv2_mask, cfg2);
> +
> +	if (!n)
> +		return 0;

Can this if block be moved right after n is assigned above?

> +
> +	/*
> +	 * The output frequency is calculated as:
> +	 * fvco = parent * (m + frac / 2^24) / n
> +	 * fout = fvco / (2^oddiv1_raw * 2^oddiv2_raw)
> +	 *
> +	 * The output divider values are derived from the raw register field
> +	 * values as:

You can now go out to 100 characters on a single line.

> +	 * oddivX_div = 1 << oddivX_raw
> +	 */
> +	mult = ((u64)m << 24) + frac;
> +	rate = (u64)parent_rate * mult;
> +	den = ((u64)n << 24) * oddiv1_div * oddiv2_div;
> +
> +	return div64_u64(rate + (den >> 1), den);
> +}
> +
> +static const struct clk_ops ultrarisc_pll_ro_ops = {
> +	.recalc_rate = ultrarisc_pll_recalc_rate,
> +};
> +
> +static unsigned long
> +ultrarisc_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	u32 val;
> +
> +	val = readl_relaxed(divider->reg) >> divider->shift;
> +	val &= clk_div_mask(divider->width);
> +
> +	return divider_recalc_rate(hw, parent_rate, val, divider->table,
> +				   divider->flags, divider->width);
> +}
> +
> +static int ultrarisc_divider_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
> +}
> +
> +static int ultrarisc_divider_set_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long parent_rate)
> +{
> +	struct ultrarisc_divider_clk *divider_clk = to_ultrarisc_divider_clk(hw);
> +	struct clk_divider *divider = &divider_clk->divider;
> +	int value;
> +	u32 val;
> +
> +	value = divider_get_val(rate, parent_rate, divider->table,
> +				divider->width, divider->flags);
> +	if (value < 0)
> +		return value;
> +
> +	scoped_guard(spinlock_irqsave, divider->lock) {
> +		val = readl_relaxed(divider->reg);
> +		val &= ~(clk_div_mask(divider->width) << divider->shift);
> +		val |= value << divider->shift;
> +		writel_relaxed(val, divider->reg);
> +
> +		if (divider_clk->load_mask) {
> +			/*
> +			 * Program the new divider field, then write 1 to the
> +			 * load bit to trigger the update. The load bit is
> +			 * write-triggered and reads back as 0 on this hardware.
> +			 */
> +			writel_relaxed(val | divider_clk->load_mask,
> +				       divider->reg);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops ultrarisc_divider_ops = {
> +	.recalc_rate = ultrarisc_divider_recalc_rate,
> +	.determine_rate = ultrarisc_divider_determine_rate,
> +	.set_rate = ultrarisc_divider_set_rate,
> +};
> +
> +static void ultrarisc_clk_unregister_composite(void *data)
> +{
> +	clk_hw_unregister_composite(data);
> +}
> +
> +static struct clk_hw *
> +ultrarisc_clk_hw_register_composite(struct device *dev, const char *name,
> +				    const char * const *parent_names,
> +				    int num_parents, struct clk_hw *mux_hw,
> +				    const struct clk_ops *mux_ops,
> +				    struct clk_hw *rate_hw,
> +				    const struct clk_ops *rate_ops,
> +				    struct clk_hw *gate_hw,
> +				    const struct clk_ops *gate_ops,
> +				    unsigned long flags)
> +{
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	hw = clk_hw_register_composite(dev, name, parent_names, num_parents,
> +				       mux_hw, mux_ops, rate_hw, rate_ops,
> +				       gate_hw, gate_ops, flags);
> +	if (IS_ERR(hw))
> +		return hw;
> +
> +	ret = devm_add_action_or_reset(dev, ultrarisc_clk_unregister_composite,
> +				       hw);

Use devm_clk_hw_register_composite_pdata()

> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return hw;
> +}
> +
> +static struct clk_hw *ultrarisc_clk_register_pll(struct device *dev,
> +						 const struct ultrarisc_pll_desc *desc,
> +						 const struct ultrarisc_pll_layout *layout,
> +						 void __iomem *base)
> +{
> +	struct clk_parent_data pdata = { .index = 0 };
> +	struct ultrarisc_pll_clk *pll;
> +	struct clk_init_data init = {
> +		.name = desc->name,
> +		.ops = &ultrarisc_pll_ro_ops,
> +		.parent_data = &pdata,
> +		.num_parents = 1,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};
> +	int ret;
> +
> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pll->base = base;
> +	pll->layout = layout;
> +	pll->hw.init = &init;
> +
> +	ret = devm_clk_hw_register(dev, &pll->hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &pll->hw;
> +}
> +
> +static struct clk_hw *
> +ultrarisc_clk_register_divider(struct device *dev,
> +			       const struct ultrarisc_divider_desc *desc,
> +			       struct clk_hw *parent_hw, void __iomem *base,
> +			       spinlock_t *lock)
> +{
> +	const char * const parent_names[] = { clk_hw_get_name(parent_hw) };

Moving to devm_clk_hw_register_composite_pdata() will let you drop this
older usage of the parent_names and move to the parent_data.

> +	void __iomem *reg = base + desc->offset;
> +	struct ultrarisc_divider_clk *divider;
> +	const struct clk_ops *gate_ops = NULL;
> +	struct clk_hw *gate_hw = NULL;
> +
> +	if (!desc->div_width)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!lock)
> +		return ERR_PTR(-EINVAL);
> +
> +	divider = devm_kzalloc(dev, sizeof(*divider), GFP_KERNEL);
> +	if (!divider)
> +		return ERR_PTR(-ENOMEM);
> +
> +	divider->divider.reg = reg;
> +	divider->divider.shift = desc->div_shift;
> +	divider->divider.width = desc->div_width;
> +	divider->divider.flags = desc->divider_flags;
> +	divider->divider.lock = lock;
> +	divider->load_mask = desc->load_mask;
> +
> +	if (desc->gate_bit != ULTRARISC_CLK_NO_GATE) {

As I mentioned elsewhere, nothing sets ULTRARISC_CLK_NO_GATE.

> +		divider->gate.reg = reg;
> +		divider->gate.bit_idx = desc->gate_bit;
> +		divider->gate.flags = desc->gate_flags;
> +		divider->gate.lock = lock;
> +		gate_hw = &divider->gate.hw;
> +		gate_ops = &clk_gate_ops;
> +	}
> +
> +	return ultrarisc_clk_hw_register_composite(dev, desc->name,
> +						   parent_names, 1,
> +						   NULL, NULL,
> +						   &divider->divider.hw,
> +						   &ultrarisc_divider_ops,
> +						   gate_hw, gate_ops,
> +						   CLK_GET_RATE_NOCACHE);
> +}
> +
> +static int ultrarisc_clk_register_fixed_factors(struct device *dev,
> +						struct clk_hw_onecell_data *clk_data,
> +						const struct ultrarisc_clk_soc_data *soc_data)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < soc_data->num_fixed_factors; i++) {
> +		const struct ultrarisc_fixed_factor_desc *desc;
> +		struct clk_hw *parent_hw;
> +		struct clk_hw *hw;
> +
> +		desc = &soc_data->fixed_factors[i];
> +		if (desc->id >= clk_data->num ||
> +		    desc->parent_id >= clk_data->num)

This could be combined onto one line.

> +			return -EINVAL;
> +
> +		parent_hw = clk_data->hws[desc->parent_id];
> +		if (!parent_hw)
> +			return -EINVAL;
> +
> +		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name,
> +								 parent_hw,
> +								 CLK_GET_RATE_NOCACHE,

Should all of these clocks be registered with CLK_GET_RATE_NOCACHE? I
see that used in the other registration functions as well.

> +								 desc->mult,
> +								 desc->div);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		clk_data->hws[desc->id] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_clk_register_plls(struct platform_device *pdev,
> +				       struct clk_hw_onecell_data *clk_data,
> +				       const struct ultrarisc_clk_soc_data *soc_data,
> +				       void __iomem *base)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 i;
> +
> +	for (i = 0; i < soc_data->num_plls; i++) {
> +		const struct ultrarisc_pll_desc *desc = &soc_data->plls[i];
> +		struct clk_hw *hw;
> +
> +		if (desc->id >= clk_data->num)
> +			return -EINVAL;

Add dev_error() message here.

> +
> +		hw = ultrarisc_clk_register_pll(dev, desc, soc_data->pll_layout,
> +						base);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		clk_data->hws[desc->id] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_clk_register_dividers(struct platform_device *pdev,
> +					   struct clk_hw_onecell_data *clk_data,
> +					   const struct ultrarisc_clk_soc_data *soc_data,
> +					   void __iomem *base,
> +					   spinlock_t *lock)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 i;
> +
> +	for (i = 0; i < soc_data->num_dividers; i++) {
> +		const struct ultrarisc_divider_desc *desc;
> +		struct clk_hw *parent_hw;
> +		struct clk_hw *hw;
> +
> +		desc = &soc_data->dividers[i];
> +		if (desc->id >= clk_data->num ||
> +		    desc->parent_id >= clk_data->num)

This could be on one line as well. I see some others down below but I'm
not going to call them out separately.

> +			return -EINVAL;
> +
> +		parent_hw = clk_data->hws[desc->parent_id];
> +		if (!parent_hw)
> +			return -EINVAL;
> +
> +		hw = ultrarisc_clk_register_divider(dev, desc, parent_hw, base,
> +						    lock);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		if (desc->max_rate) {
> +			unsigned long rate;
> +
> +			clk_hw_set_rate_range(hw, 0, desc->max_rate);
> +
> +			rate = clk_hw_get_rate(hw);
> +			if (rate > desc->max_rate)
> +				dev_warn(dev, "%s rate %lu exceeds max %lu\n",
> +					 desc->name, rate, desc->max_rate);
> +		}
> +
> +		clk_data->hws[desc->id] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ultrarisc_clk_register_gates(struct platform_device *pdev,
> +					struct clk_hw_onecell_data *clk_data,
> +					const struct ultrarisc_clk_soc_data *soc_data,
> +					void __iomem *base,
> +					spinlock_t *lock)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 i;
> +
> +	for (i = 0; i < soc_data->num_gates; i++) {
> +		const struct ultrarisc_gate_desc *desc;
> +		struct clk_hw *parent_hw;
> +		struct clk_hw *hw;
> +
> +		desc = &soc_data->gates[i];
> +		if (desc->id >= clk_data->num ||
> +		    desc->parent_id >= clk_data->num)
> +			return -EINVAL;
> +
> +		parent_hw = clk_data->hws[desc->parent_id];
> +		if (!parent_hw)
> +			return -EINVAL;
> +
> +		hw = devm_clk_hw_register_gate_parent_hw(dev, desc->name,
> +							 parent_hw,
> +							 CLK_GET_RATE_NOCACHE,
> +							 base + desc->offset,
> +							 desc->gate_bit,
> +							 desc->gate_flags,
> +							 lock);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		clk_data->hws[desc->id] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +int ultrarisc_clk_probe(struct platform_device *pdev,
> +			const struct ultrarisc_clk_soc_data *soc_data)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	spinlock_t *lock;
> +	int ret;
> +
> +	if (!soc_data)
> +		return -EINVAL;
> +
> +	lock = devm_kzalloc(dev, sizeof(*lock), GFP_KERNEL);
> +	if (!lock)
> +		return -ENOMEM;
> +
> +	spin_lock_init(lock);
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws,
> +						 soc_data->num_clks),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = soc_data->num_clks;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	ret = ultrarisc_clk_register_plls(pdev, clk_data, soc_data, base);
> +	if (ret)
> +		return ret;
> +
> +	ret = ultrarisc_clk_register_fixed_factors(dev, clk_data, soc_data);
> +	if (ret)
> +		return ret;
> +
> +	ret = ultrarisc_clk_register_dividers(pdev, clk_data, soc_data, base,
> +					      lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = ultrarisc_clk_register_gates(pdev, clk_data, soc_data, base,
> +					   lock);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < clk_data->num; i++) {
> +		if (!clk_data->hws[i]) {
> +			dev_err(dev, "missing clock ID %u\n", i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   clk_data);
> +}
> +EXPORT_SYMBOL_GPL(ultrarisc_clk_probe);

Please put this in a namespace with EXPORT_SYMBOL_NS_GPL(). There's
other examples under drivers/clk.

> +
> +MODULE_DESCRIPTION("UltraRISC clock core driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/ultrarisc/clk-ultrarisc.h b/drivers/clk/ultrarisc/clk-ultrarisc.h
> new file mode 100644
> index 000000000000..1281196bb414
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/clk-ultrarisc.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ULTRARISC_CLK_ULTRARISC_H
> +#define __ULTRARISC_CLK_ULTRARISC_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define ULTRARISC_CLK_NO_GATE		(-1)

This is only used in the if statement, and is not set anywhere.

    if (desc->gate_bit != ULTRARISC_CLK_NO_GATE) {

Brian

