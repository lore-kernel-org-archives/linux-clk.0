Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632053242BA
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 22:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577153; cv=none; b=U2tth6LQPezttjZPQFEO0/KAS9995THPlwiW3BeFv+A13r3A/RFe9t2zZTbpM8mFlRcuPdwODwuFU4LboQu4iPsmyhWZr+SIOFOA77oKlV6OeRvY9EYK4cEL4NXJBTApc7uZ9P7ggVVpJ0eFBt+6uAd7zh5uf8V1Ag/sFmxBwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577153; c=relaxed/simple;
	bh=0MWLmlecLouhoos2THt5a5dyX6JbfKRQ69xQ+MGf0cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA+lIb6Em1g+wXgSTEue0UqP+u9gaqVFgyqSbt42KVkAO24gg9tQU5gJDWMTR4EmDW1c/5fzd0YXTNf6GP1eVU4Lw92p8FdZia19XS+3GsBnuYlMny75DJWmppM/ry0TKMofJp1vhvWBhMdh7P/SO6WqahL4vk56HhH9daStvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbH0EL2Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=buIKKSA4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbH0EL2Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="buIKKSA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772577148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cj2vgiDFhsV9G+iGH89ZDsqr3e/Lf9rAxpbeVdvR3No=;
	b=gbH0EL2ZsUW0RvXko8iQ0emQ+cvrNf/5cVZecGvG2odQt3N6tZM92r9/KirmoTCDEBiK3t
	N+k+KQwC9YjN8cN0o3fGPmxVuvg+5w4zADknnY+OzJkqd4eHRaDk+5tp45AdbrvyGa0XiC
	X67Pdyz3CQn1ltkmh04E/7Ln/a27Ezk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-D73BJgrwPYmx3udLz8AZXg-1; Tue, 03 Mar 2026 17:32:27 -0500
X-MC-Unique: D73BJgrwPYmx3udLz8AZXg-1
X-Mimecast-MFC-AGG-ID: D73BJgrwPYmx3udLz8AZXg_1772577147
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a0258c5e5so36041486d6.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 14:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772577147; x=1773181947; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj2vgiDFhsV9G+iGH89ZDsqr3e/Lf9rAxpbeVdvR3No=;
        b=buIKKSA4CdRfJdvgm4w2qTqW3q0UHXbUcIOHV5yvu2jko32dc7TtDA1tBB6mSG47yX
         RPgfO7TxQEBgz2Cm0aW66On2dthU/Nr7QUDVylT4Dbu9ODHAn8vIms8xlIRYjvSEOnhS
         gEBZ2jxvxeYYvDoPIJBvTvpx2FOvdzNMqHjU8wL1VBDmFgyc1CPh/2cxT/pgf02wpikK
         lW5DSpF/HNDF9GBREUagp4QOtFkVKj1rjA9mbHY1l/qAVSzSzbFp1Cp6+oDf3Qu0S7pn
         5xdSq6gqj9PeExdRQys2um7VprpPDBKAGMT0KR274PIwS98FUflbIaDr0P2SO3wvZhaU
         tZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577147; x=1773181947;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cj2vgiDFhsV9G+iGH89ZDsqr3e/Lf9rAxpbeVdvR3No=;
        b=xQhgPhqEa6n9HF+PZuXt3hmurtMiJOl15wOb9wDZtpvZsb2peJpW2L/bZk1uYqwMkG
         9/H5jdbvYLqxx2YjRe1jXgqesKJOhng9PMx0hY1fbQRmGWwWVDKGSLS1sEgEqYEZVvpd
         D6NSL+t91bZLCifC/6Sm2SyFj/zZaQQ03+Rd6v3EAu+9VUz0sFGnIbWVoGPbs4DhvbPb
         OPKzUfc+DKQ3uV+a1gNWagrtOpHkcWXevcZJ5KvgSMWcN2QRpjurF6J1cCOTw4It4/Ee
         oV5e5OaQ7d5mrVOpyjG+89hTCQlgMIEmyNEmdSnoIl81y/JMpo2q+z856W035v1Z+vFA
         MyqA==
X-Forwarded-Encrypted: i=1; AJvYcCWCfzrZrEOOhzjqeoIIJ4S5rnpyo1BjBYlt46RAB4i356AyK6xy9SDNZ6FKOU1ucoJLb583euEPgUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6/EIu2JXTppyExcVaqgAp0wvmBxZoxLx/YLMQroz0u4y8dBY3
	nUZVolH/xjIpdFozBzF8Mgw0wPNT97gAfNwudCt5Ab9iLZM1skFyTVLQ+11hGXnGvSme7hy6vzR
	fy+cBYjKJm+nyl7PEpG5bfwYCdaDxU2c/gZJZc83prkclJ0VU5ZM6d8vDAFsucg==
X-Gm-Gg: ATEYQzxQquMZmTicib4Td9tuVQLa+jHZHDCTLzARbBGeKKIuhOD3+KqhZixQSiSYEgP
	INCCL/+M5kn5O+IlpczGOkbVQfEj/ufROfpvZmHQ2a6YFN6DUXaWUJan0Z73A8sSZ+LNynBxHDx
	UN6nPdEwf5kfst2ZXdWLmdrwiCVd63k3O8wJ/6iCALXzD/kaFeVVf+4msph5gftSa8hwP5Y9WiT
	HWlsJKE7M7Q1LzVLMH0c3hgkIWtbzer8yZ2gSmugPCEh3uK7Sz52m02Qjz30iRny5pKr+DnQjwm
	ZjDT98peQQSDhTsopS0anBhNZRtnFm0uIVg4b3PQWNN59WJac3/86o0cQtySvXzQnBjC21brLtK
	gthWqBwUg+B4N/Lh2muDm2WXXoBtmGaPhWIZlJtnsKz4aOWRvojMNESm8
X-Received: by 2002:a05:6214:260b:b0:89a:18c3:1e8a with SMTP id 6a1803df08f44-89a18c32222mr186626d6.32.1772577146565;
        Tue, 03 Mar 2026 14:32:26 -0800 (PST)
X-Received: by 2002:a05:6214:260b:b0:89a:18c3:1e8a with SMTP id 6a1803df08f44-89a18c32222mr186046d6.32.1772577145971;
        Tue, 03 Mar 2026 14:32:25 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ff659b75sm51134806d6.34.2026.03.03.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 14:32:25 -0800 (PST)
Date: Tue, 3 Mar 2026 17:32:23 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aadhd3LwZQPkT3A4@redhat.com>
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Anirudh,

Thanks for the patch. A few minor comments below with some minor
nitpicks, additional places to use FIELD_GET(), plus some suggestions
for additional regmap helpers to use.

On Tue, Mar 03, 2026 at 11:36:09AM -0600, Anirudh Srinivasan wrote:
> Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> of the driver covers clocks from RCPU subsystem.
> 
> 5 types of clocks generated by this controller: PLLs (PLLs
> with bypass functionality and an additional Gate clk at output), Shared
> Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> Dividers and Gates. All clocks are implemented using custom clk ops and
> use the regmap interface associated with the syscon. All clocks are derived
> from a 24 Mhz oscillator.
> 
> The reset controller is also setup as an auxiliary device of the clock
> controller.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                             |   1 +
>  drivers/clk/Kconfig                     |   1 +
>  drivers/clk/Makefile                    |   1 +
>  drivers/clk/tenstorrent/Kconfig         |  14 +
>  drivers/clk/tenstorrent/Makefile        |   3 +
>  drivers/clk/tenstorrent/atlantis-prcm.c | 893 ++++++++++++++++++++++++++++++++
>  6 files changed, 913 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 493d007d3c65..a7783eb0a7de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22812,6 +22812,7 @@ T:	git https://github.com/tenstorrent/linux.git
>  F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	drivers/clk/tenstorrent/
>  F:	drivers/reset/reset-tenstorrent-atlantis.c
>  F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
>  
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3d803b4cf5c1..8cc300b90b5f 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -531,6 +531,7 @@ source "drivers/clk/starfive/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
>  source "drivers/clk/sunxi-ng/Kconfig"
>  source "drivers/clk/tegra/Kconfig"
> +source "drivers/clk/tenstorrent/Kconfig"
>  source "drivers/clk/thead/Kconfig"
>  source "drivers/clk/stm32/Kconfig"
>  source "drivers/clk/ti/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7bce3951a30..f52cf3ac64fc 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -155,6 +155,7 @@ obj-y					+= starfive/
>  obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
>  obj-y					+= sunxi-ng/
>  obj-$(CONFIG_ARCH_TEGRA)		+= tegra/
> +obj-y					+= tenstorrent/
>  obj-$(CONFIG_ARCH_THEAD)		+= thead/
>  obj-y					+= ti/
>  obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
> diff --git a/drivers/clk/tenstorrent/Kconfig b/drivers/clk/tenstorrent/Kconfig
> new file mode 100644
> index 000000000000..9d4391eeeae0
> --- /dev/null
> +++ b/drivers/clk/tenstorrent/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config TENSTORRENT_ATLANTIS_PRCM
> +	tristate "Support for Tenstorrent Atlantis PRCM Clock Controller"
> +	depends on ARCH_TENSTORRENT || COMPILE_TEST
> +	default ARCH_TENSTORRENT
> +	select REGMAP_MMIO
> +	select AUXILIARY_BUS
> +	select MFD_SYSCON
> +	help
> +	  Say yes here to support the different clock
> +	  controllers found in the Tenstorrent Atlantis SoC.
> +	  This includes the clocks from the RCPU, HSIO, MMIO
> +	  and PCIE domain.
> diff --git a/drivers/clk/tenstorrent/Makefile b/drivers/clk/tenstorrent/Makefile
> new file mode 100644
> index 000000000000..95d87bac7bf5
> --- /dev/null
> +++ b/drivers/clk/tenstorrent/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_TENSTORRENT_ATLANTIS_PRCM)	+= atlantis-prcm.o
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> new file mode 100644
> index 000000000000..b0a8e3526901
> --- /dev/null
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -0,0 +1,893 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Tenstorrent Atlantis PRCM Clock Driver
> + *
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +/* RCPU Clock Register Offsets */
> +#define RCPU_PLL_CFG_REG	0x0000
> +#define RCPU_NOCC_PLL_CFG_REG	0x0004
> +#define RCPU_NOCC_CLK_CFG_REG	0x0008
> +#define RCPU_DIV_CFG_REG	0x000C
> +#define RCPU_BLK_CG_REG		0x0014
> +#define LSIO_BLK_CG_REG		0x0018
> +#define PLL_RCPU_EN_REG		0x011c
> +#define PLL_NOCC_EN_REG		0x0120
> +#define BUS_CG_REG		0x01FC
> +
> +/* PLL Bit Definitions */
> +#define PLL_CFG_EN_BIT		BIT(0)
> +#define PLL_CFG_BYPASS_BIT	BIT(1)
> +#define PLL_CFG_REFDIV_MASK	GENMASK(7, 2)
> +#define PLL_CFG_REFDIV_SHIFT	2
> +#define PLL_CFG_POSTDIV1_MASK	GENMASK(10, 8)
> +#define PLL_CFG_POSTDIV1_SHIFT	8
> +#define PLL_CFG_POSTDIV2_MASK	GENMASK(13, 11)
> +#define PLL_CFG_POSTDIV2_SHIFT	11
> +#define PLL_CFG_FBDIV_MASK	GENMASK(25, 14)
> +#define PLL_CFG_FBDIV_SHIFT	14
> +#define PLL_CFG_LKDT_BIT	BIT(30)
> +#define PLL_CFG_LOCK_BIT	BIT(31)
> +#define PLL_LOCK_TIMEOUT_US	1000
> +#define PLL_BYPASS_WAIT_US	500
> +
> +struct atlantis_clk_common {
> +	int clkid;
> +	struct regmap *regmap;
> +	struct clk_hw hw;
> +};
> +
> +static inline struct atlantis_clk_common *
> +hw_to_atlantis_clk_common(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct atlantis_clk_common, hw);
> +}
> +
> +struct atlantis_clk_mux_config {
> +	u8 shift;
> +	u8 width;
> +	u32 reg_offset;
> +};
> +
> +struct atlantis_clk_mux {
> +	struct atlantis_clk_common common;
> +	struct atlantis_clk_mux_config config;
> +};
> +
> +struct atlantis_clk_gate_config {
> +	u32 reg_offset;
> +	u32 enable;
> +};
> +
> +struct atlantis_clk_gate {
> +	struct atlantis_clk_common common;
> +	struct atlantis_clk_gate_config config;
> +};
> +
> +struct atlantis_clk_divider_config {
> +	u8 shift;
> +	u8 width;
> +	u32 flags;
> +	u32 reg_offset;
> +};
> +
> +struct atlantis_clk_divider {
> +	struct atlantis_clk_common common;
> +	struct atlantis_clk_divider_config config;
> +};
> +
> +struct atlantis_clk_pll_config {
> +	u32 tbl_num;
> +	u32 reg_offset;
> +	u32 en_reg_offset;
> +	u32 cg_reg_offset;
> +	u32 cg_reg_enable;
> +};
> +
> +/* Models a PLL with Bypass Functionality and Enable Bit + an optional Gate Clock at it's output */
> +struct atlantis_clk_pll {
> +	struct atlantis_clk_common common;
> +	struct atlantis_clk_pll_config config;
> +};
> +
> +struct atlantis_clk_gate_shared_config {
> +	u32 reg_offset;
> +	u32 enable;
> +	unsigned int *share_count;
> +	spinlock_t *refcount_lock;
> +};
> +
> +struct atlantis_clk_gate_shared {
> +	struct atlantis_clk_common common;
> +	struct atlantis_clk_gate_shared_config config;
> +};
> +
> +struct atlantis_clk_fixed_factor_config {
> +	unsigned int mult;
> +	unsigned int div;
> +};
> +
> +struct atlantis_clk_fixed_factor {
> +	struct atlantis_clk_fixed_factor_config config;
> +	struct atlantis_clk_common common;
> +};
> +
> +static inline struct atlantis_clk_mux *hw_to_atlantis_clk_mux(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_mux, common);
> +}
> +
> +static inline struct atlantis_clk_gate *
> +hw_to_atlantis_clk_gate(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_gate, common);
> +}
> +
> +static inline struct atlantis_clk_divider *
> +hw_to_atlantis_clk_divider(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_divider, common);
> +}
> +
> +static inline struct atlantis_clk_pll *hw_to_atlantis_pll(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_pll, common);
> +}
> +
> +static inline struct atlantis_clk_gate_shared *
> +hw_to_atlantis_clk_gate_shared(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_gate_shared, common);
> +}
> +
> +static inline struct atlantis_clk_fixed_factor *
> +hw_to_atlantis_clk_fixed_factor(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_common *common = hw_to_atlantis_clk_common(hw);
> +
> +	return container_of(common, struct atlantis_clk_fixed_factor, common);
> +}
> +
> +static u8 atlantis_clk_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_mux *mux = hw_to_atlantis_clk_mux(hw);
> +	u32 val;
> +
> +	regmap_read(mux->common.regmap, mux->config.reg_offset, &val);
> +	val >>= mux->config.shift;
> +	val &= (BIT(mux->config.width) - 1);
> +
> +	return val;

FIELD_GET() ?

> +}
> +
> +static int atlantis_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct atlantis_clk_mux *mux = hw_to_atlantis_clk_mux(hw);
> +	u32 val = index;
> +
> +	return regmap_update_bits(mux->common.regmap, mux->config.reg_offset,
> +				  (BIT(mux->config.width) - 1)
> +					  << mux->config.shift,

This doesn't make the line that much longer, and is nicer to read:

    (BIT(mux->config.width) - 1) << mux->config.shift,

> +				  val << mux->config.shift);
> +}
> +
> +static int atlantis_clk_mux_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	return clk_mux_determine_rate_flags(hw, req, hw->init->flags);
> +}
> +
> +static const struct clk_ops atlantis_clk_mux_ops = {
> +	.get_parent = atlantis_clk_mux_get_parent,
> +	.set_parent = atlantis_clk_mux_set_parent,
> +	.determine_rate = atlantis_clk_mux_determine_rate,
> +};
> +
> +static void atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)

Should this return an int? This looks like we should use this return
value below in atlantis_clk_gate_enable().

> +{
> +	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
> +	u32 val;
> +
> +	if (enable)
> +		val = gate->config.enable;
> +	else
> +		val = ~(gate->config.enable);
> +
> +	regmap_update_bits(gate->common.regmap, gate->config.reg_offset,
> +			   gate->config.enable, val);

This chunk could be simplified to use regmap_set_bits() and
regmap_clear_bits().

> +}
> +
> +static int atlantis_clk_gate_enable(struct clk_hw *hw)
> +{
> +	atlantis_clk_gate_endisable(hw, 1);
> +
> +	return 0;

Follow up from above. Any reason why the return value of
regmap_update_bits() in atlantis_clk_gate_endisable() is discarded?

I know it's not used below in the disable().

> +}
> +
> +static void atlantis_clk_gate_disable(struct clk_hw *hw)
> +{
> +	atlantis_clk_gate_endisable(hw, 0);
> +}
> +
> +static int atlantis_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
> +	u32 val;
> +
> +	regmap_read(gate->common.regmap, gate->config.reg_offset, &val);
> +	val &= gate->config.enable;
> +
> +	return !!val;

regmap_test_bits() can simplify this.

> +}
> +
> +static const struct clk_ops atlantis_clk_gate_ops = {
> +	.enable = atlantis_clk_gate_enable,
> +	.disable = atlantis_clk_gate_disable,
> +	.is_enabled = atlantis_clk_gate_is_enabled,
> +};
> +
> +static unsigned long atlantis_clk_divider_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	struct atlantis_clk_divider *divider = hw_to_atlantis_clk_divider(hw);
> +	u32 val;
> +
> +	regmap_read(divider->common.regmap, divider->config.reg_offset, &val);
> +
> +	val >>= divider->config.shift;
> +	val &= ((1 << (divider->config.width)) - 1);

FIELD_GET() ?

> +
> +	return DIV_ROUND_UP_ULL((u64)parent_rate, val + 1);
> +}
> +
> +static const struct clk_ops atlantis_clk_divider_ops = {
> +	.recalc_rate = atlantis_clk_divider_recalc_rate,
> +};
> +
> +static unsigned long
> +atlantis_clk_fixed_factor_recalc_rate(struct clk_hw *hw,
> +				      unsigned long parent_rate)
> +{
> +	struct atlantis_clk_fixed_factor *factor =
> +		hw_to_atlantis_clk_fixed_factor(hw);
> +	unsigned long long rate;
> +
> +	rate = (unsigned long long)parent_rate * factor->config.mult;
> +	do_div(rate, factor->config.div);

newline

> +	return (unsigned long)rate;
> +}
> +
> +static const struct clk_ops atlantis_clk_fixed_factor_ops = {
> +	.recalc_rate = atlantis_clk_fixed_factor_recalc_rate,
> +};
> +
> +static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> +	u32 val, en_val, cg_val;
> +
> +	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> +	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
> +	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
> +
> +	/* Check if PLL is powered on, locked, not bypassed and Gate clk is enabled */
> +	return !!(en_val & PLL_CFG_EN_BIT) && !!(val & PLL_CFG_LOCK_BIT) &&
> +	       (!pll->config.cg_reg_enable || (cg_val & pll->config.cg_reg_enable)) &&
> +	       !(val & PLL_CFG_BYPASS_BIT);

Could regmap_test_bits() make this a bit cleaner?

> +}
> +
> +static int atlantis_clk_pll_enable(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> +	u32 val, en_val, cg_val;
> +	int ret;
> +
> +	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> +	regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_val);
> +	regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_val);
> +
> +	/* Check if PLL is already enabled, locked, not bypassed and Gate clk is enabled */
> +	if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &&
> +	    (!pll->config.cg_reg_enable || (cg_val & pll->config.cg_reg_enable)) &&
> +	    !(val & PLL_CFG_BYPASS_BIT)) {

Same about regmap_test_bits() here.

> +		return 0;
> +	}
> +
> +	/* Step 1: Set bypass mode first */
> +	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
> +			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
> +
> +	/* Step 2: Enable PLL (clear then set power bit) */
> +	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
> +			   PLL_CFG_EN_BIT, 0);
> +
> +	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
> +			   PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
> +
> +	/* Step 3: Wait for PLL lock */
> +	ret = regmap_read_poll_timeout(pll->common.regmap,
> +				       pll->config.reg_offset, val,
> +				       val & PLL_CFG_LOCK_BIT, 10,
> +				       PLL_BYPASS_WAIT_US);

Should the last two parameters be 
PLL_BYPASS_WAIT_US, PLL_LOCK_TIMEOUT_US instead of
10, PLL_BYPASS_WAIT_US?

> +	if (ret) {
> +		pr_err("PLL failed to lock within timeout\n");
> +		return ret;
> +	}
> +
> +	/* Step 4: Switch from bypass to PLL output */
> +	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
> +			   PLL_CFG_BYPASS_BIT, 0);
> +
> +	/* Enable Gate clk at PLL Output */
> +	return regmap_update_bits(pll->common.regmap, pll->config.cg_reg_offset,
> +				  pll->config.cg_reg_enable,
> +				  pll->config.cg_reg_enable);
> +}
> +
> +static void atlantis_clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> +
> +	/* Step 1: Switch to bypass mode before disabling */
> +	regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
> +			   PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
> +	/* Step 2: Power down PLL */
> +	regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
> +			   PLL_CFG_EN_BIT, 0);
> +}
> +
> +static unsigned long atlantis_clk_pll_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct atlantis_clk_pll *pll = hw_to_atlantis_pll(hw);
> +
> +	u32 val, refdiv, fbdiv, postdiv1, postdiv2;
> +	u64 fout;
> +
> +	regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> +
> +	if (val & PLL_CFG_BYPASS_BIT)
> +		return parent_rate;
> +
> +	refdiv = FIELD_GET(PLL_CFG_REFDIV_MASK, val);
> +	fbdiv = FIELD_GET(PLL_CFG_FBDIV_MASK, val);
> +	postdiv1 = FIELD_GET(PLL_CFG_POSTDIV1_MASK, val);
> +	postdiv2 = FIELD_GET(PLL_CFG_POSTDIV2_MASK, val);
> +
> +	if (!refdiv)
> +		refdiv = 1;
> +	if (!postdiv1)
> +		postdiv1 = 1;
> +	if (!postdiv2)
> +		postdiv2 = 1;
> +	if (!fbdiv)
> +		return 0;
> +
> +	fout = div64_u64((u64)parent_rate * fbdiv,
> +			 refdiv * postdiv1 * postdiv2);
> +
> +	return fout;
> +}
> +
> +static const struct clk_ops atlantis_clk_pll_ops = {
> +	.enable = atlantis_clk_pll_enable,
> +	.disable = atlantis_clk_pll_disable,
> +	.recalc_rate = atlantis_clk_pll_recalc_rate,
> +	.is_enabled = atlantis_clk_pll_is_enabled,
> +};
> +
> +static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_gate_shared *gate =
> +		hw_to_atlantis_clk_gate_shared(hw);
> +	bool need_enable;
> +	u32 reg;
> +
> +	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
> +	{
> +		need_enable = (*gate->config.share_count)++ == 0;
> +		if (need_enable) {
> +			regmap_read(gate->common.regmap,
> +				    gate->config.reg_offset, &reg);
> +			reg |= gate->config.enable;
> +			regmap_write(gate->common.regmap,
> +				     gate->config.reg_offset, reg);

Should this use regmap_set_bits()?

> +		}
> +	}
> +
> +	if (need_enable) {
> +		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
> +
> +		if (!(reg & gate->config.enable)) {

regmap_test_bits() ?

> +			pr_warn("%s: gate enable %d failed to enable\n",
> +				clk_hw_get_name(hw), gate->config.enable);
> +			return -EIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void atlantis_clk_gate_shared_disable(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_gate_shared *gate =
> +		hw_to_atlantis_clk_gate_shared(hw);
> +	u32 reg;
> +
> +	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
> +	{
> +		if (WARN_ON(*gate->config.share_count == 0))
> +			return;
> +		if (--(*gate->config.share_count) > 0)
> +			return;
> +
> +		regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
> +		reg &= ~gate->config.enable;
> +		regmap_write(gate->common.regmap, gate->config.reg_offset, reg);

Should this use regmap_clear_bits()?

> +	}
> +}
> +
> +static int atlantis_clk_gate_shared_is_enabled(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_gate_shared *gate =
> +		hw_to_atlantis_clk_gate_shared(hw);
> +	u32 reg;
> +
> +	regmap_read(gate->common.regmap, gate->config.reg_offset, &reg);
> +
> +	return !!(reg & gate->config.enable);

regmap_test_bits() ?

> +}
> +
> +static void atlantis_clk_gate_shared_disable_unused(struct clk_hw *hw)
> +{
> +	struct atlantis_clk_gate_shared *gate =
> +		hw_to_atlantis_clk_gate_shared(hw);
> +
> +	u32 reg;
> +
> +	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
> +	{
> +		if (*gate->config.share_count == 0) {
> +			regmap_read(gate->common.regmap,
> +				    gate->config.reg_offset, &reg);
> +			reg &= ~gate->config.enable;
> +			regmap_write(gate->common.regmap,
> +				     gate->config.reg_offset, reg);

regmap_clear_bits() ?

> +		}
> +	}
> +}
> +
> +static const struct clk_ops atlantis_clk_gate_shared_ops = {
> +	.enable = atlantis_clk_gate_shared_enable,
> +	.disable = atlantis_clk_gate_shared_disable,
> +	.disable_unused = atlantis_clk_gate_shared_disable_unused,
> +	.is_enabled = atlantis_clk_gate_shared_is_enabled,
> +};
> +
> +#define ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset, _cg_reg_offset, \
> +			    _cg_reg_enable)                              \
> +	{                                                                \
> +		.reg_offset = (_reg_offset),                             \
> +		.en_reg_offset = (_en_reg_offset),                       \
> +		.cg_reg_offset = (_cg_reg_offset),                       \
> +		.cg_reg_enable = (_cg_reg_enable),                       \
> +	}
> +
> +#define ATLANTIS_PLL_DEFINE(_clkid, _name, _parent, _reg_offset,               \
> +			    _en_reg_offset, _cg_reg_offset, _cg_reg_enable,    \
> +			    _flags)                                            \
> +	static struct atlantis_clk_pll _name = {                               \
> +		.config = ATLANTIS_PLL_CONFIG(_reg_offset, _en_reg_offset,     \
> +					      _cg_reg_offset, _cg_reg_enable), \
> +		.common = { .clkid = _clkid,                                   \
> +			    .hw.init = CLK_HW_INIT_PARENTS_DATA(               \
> +				    #_name, _parent, &atlantis_clk_pll_ops,    \
> +				    _flags) },                                 \
> +	}
> +#define ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset)                    \
> +	{                                                                   \
> +		.shift = _shift, .width = _width, .reg_offset = _reg_offset \
> +	}
> +
> +#define ATLANTIS_MUX_DEFINE(_clkid, _name, _parents, _reg_offset, _shift,    \
> +			    _width, _flags)                                  \
> +	static struct atlantis_clk_mux _name = {                             \
> +		.config = ATLANTIS_MUX_CONFIG(_shift, _width, _reg_offset),  \
> +		.common = { .clkid = _clkid,                                 \
> +			    .hw.init = CLK_HW_INIT_PARENTS_DATA(             \
> +				    #_name, _parents, &atlantis_clk_mux_ops, \
> +				    _flags) }                                \
> +	}
> +
> +#define ATLANTIS_DIVIDER_CONFIG(_shift, _width, _flags, _reg_offset) \
> +	{                                                            \
> +		.shift = _shift, .width = _width, .flags = _flags,   \
> +		.reg_offset = _reg_offset                            \
> +	}
> +
> +#define ATLANTIS_DIVIDER_DEFINE(_clkid, _name, _parent, _reg_offset, _shift, \
> +				_width, _divflags, _flags)                   \
> +	static struct atlantis_clk_divider _name = {                         \
> +		.config = ATLANTIS_DIVIDER_CONFIG(_shift, _width, _divflags, \
> +						  _reg_offset),              \
> +		.common = { .clkid = _clkid,                                 \
> +			    .hw.init = CLK_HW_INIT_HW(                       \
> +				    #_name, &_parent.common.hw,              \
> +				    &atlantis_clk_divider_ops, _flags) }     \
> +	}
> +#define ATLANTIS_GATE_CONFIG(_enable, _reg_offset)           \
> +	{                                                    \
> +		.enable = _enable, .reg_offset = _reg_offset \
> +	}
> +
> +#define ATLANTIS_GATE_DEFINE(_clkid, _name, _parent, _reg_offset, _enable, \
> +			     _flags)                                       \
> +	static struct atlantis_clk_gate _name = {                          \
> +		.config = ATLANTIS_GATE_CONFIG(_enable, _reg_offset),      \
> +		.common = { .clkid = _clkid,                               \
> +			    .hw.init = CLK_HW_INIT_HW(                     \
> +				    #_name, &_parent.common.hw,            \
> +				    &atlantis_clk_gate_ops, _flags) }      \
> +	}
> +#define ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable, _share_count)      \
> +	{                                                                    \
> +		.reg_offset = _reg_offset, .enable = _enable,                \
> +		.share_count = _share_count, .refcount_lock = &refcount_lock \
> +	}
> +#define ATLANTIS_GATE_SHARED_DEFINE(_clkid, _name, _parent, _reg_offset,     \
> +				    _enable, _share_count, _flags)           \
> +	static struct atlantis_clk_gate_shared _name = {                     \
> +		.config = ATLANTIS_GATE_SHARED_CONFIG(_reg_offset, _enable,  \
> +						      _share_count),         \
> +		.common = { .clkid = _clkid,                                 \
> +			    .hw.init = CLK_HW_INIT_HW(                       \
> +				    #_name, &_parent.common.hw,              \
> +				    &atlantis_clk_gate_shared_ops, _flags) } \
> +	}
> +#define ATLANTIS_CLK_FIXED_FACTOR_DEFINE(_clkid, _name, _parent, _mult, _div, \
> +					 _flags)                              \
> +	static struct atlantis_clk_fixed_factor _name = {                     \
> +		.config = { .mult = _mult, .div = _div },                     \
> +		.common = { .clkid = _clkid,                                  \
> +			    .hw.init = CLK_HW_INIT_HW(                        \
> +				    #_name, &_parent.common.hw,               \
> +				    &atlantis_clk_fixed_factor_ops, _flags) } \
> +	}
> +
> +static DEFINE_SPINLOCK(refcount_lock); /* Lock for refcount value accesses */
> +
> +static const struct regmap_config atlantis_prcm_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0xFFFC,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +struct atlantis_prcm_data {
> +	struct clk_hw **hws;
> +	size_t num;
> +	const char *reset_name;
> +};
> +
> +static const struct clk_parent_data osc_24m_clk[] = {
> +	{ .index = 0 },
> +};
> +
> +ATLANTIS_PLL_DEFINE(CLK_RCPU_PLL, rcpu_pll_clk, osc_24m_clk, RCPU_PLL_CFG_REG,
> +		    PLL_RCPU_EN_REG, BUS_CG_REG, 0, /* No Gate Clk at Output */
> +		    CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data rcpu_root_parents[] = {
> +	{ .index = 0 },
> +	{ .hw = &rcpu_pll_clk.common.hw },
> +};
> +
> +ATLANTIS_MUX_DEFINE(CLK_RCPU_ROOT, rcpu_root_mux, rcpu_root_parents,
> +		    RCPU_DIV_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
> +
> +ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV2, rcpu_div2_clk, rcpu_root_mux,
> +			RCPU_DIV_CFG_REG, 2, 4, 0, 0);
> +ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_DIV4, rcpu_div4_clk, rcpu_root_mux,
> +			RCPU_DIV_CFG_REG, 7, 4, 0, 0);
> +ATLANTIS_DIVIDER_DEFINE(CLK_RCPU_RTC, rcpu_rtc_clk, rcpu_div4_clk,
> +			RCPU_DIV_CFG_REG, 12, 6, 0, 0);
> +
> +ATLANTIS_GATE_DEFINE(CLK_SMNDMA0_ACLK, smndma0_aclk, rcpu_div2_clk,
> +		     RCPU_BLK_CG_REG, BIT(0), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SMNDMA1_ACLK, smndma1_aclk, rcpu_div2_clk,
> +		     RCPU_BLK_CG_REG, BIT(1), 0);
> +ATLANTIS_GATE_DEFINE(CLK_WDT0_PCLK, wdt0_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(2), 0);
> +ATLANTIS_GATE_DEFINE(CLK_WDT1_PCLK, wdt1_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(3), 0);
> +ATLANTIS_GATE_DEFINE(CLK_TIMER_PCLK, timer_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(4), 0);
> +ATLANTIS_GATE_DEFINE(CLK_PVTC_PCLK, pvtc_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(12), 0);
> +ATLANTIS_GATE_DEFINE(CLK_PMU_PCLK, pmu_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(13), 0);
> +ATLANTIS_GATE_DEFINE(CLK_MAILBOX_HCLK, mb_hclk, rcpu_div2_clk, RCPU_BLK_CG_REG,
> +		     BIT(14), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SEC_SPACC_HCLK, sec_spacc_hclk, rcpu_div2_clk,
> +		     RCPU_BLK_CG_REG, BIT(26), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SEC_OTP_HCLK, sec_otp_hclk, rcpu_div2_clk,
> +		     RCPU_BLK_CG_REG, BIT(28), 0);
> +ATLANTIS_GATE_DEFINE(CLK_TRNG_PCLK, trng_pclk, rcpu_div4_clk, RCPU_BLK_CG_REG,
> +		     BIT(29), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SEC_CRC_HCLK, sec_crc_hclk, rcpu_div2_clk,
> +		     RCPU_BLK_CG_REG, BIT(30), 0);
> +
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_HCLK, rcpu_smn_hclk, rcpu_div2_clk, 1,
> +				 1, 0);
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_AHB0_HCLK, rcpu_ahb0_hclk, rcpu_div2_clk,
> +				 1, 1, 0);
> +
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_PCLK, rcpu_smn_pclk, rcpu_div4_clk, 1,
> +				 1, 0);
> +
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SMN_CLK, rcpu_smn_clk, rcpu_root_mux, 1, 1,
> +				 0);
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_SCRATCHPAD_CLK, rcpu_scratchpad_aclk,
> +				 rcpu_root_mux, 1, 1, 0);
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_CORE_CLK, rcpu_core_clk,
> +				 rcpu_root_mux, 1, 1, 0);
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_RCPU_ROM_CLK, rcpu_rom_aclk, rcpu_root_mux,
> +				 1, 1, 0);
> +
> +static struct atlantis_clk_fixed_factor
> +	otp_load_clk = { .config = { .mult = 1, .div = 1 },
> +			 .common = {
> +				 .clkid = CLK_OTP_LOAD_CLK,
> +				 .hw.init = CLK_HW_INIT_PARENTS_DATA(
> +					 "otp_load_clk", osc_24m_clk,
> +					 &atlantis_clk_fixed_factor_ops,
> +					 CLK_SET_RATE_NO_REPARENT),
> +			 } };
> +
> +ATLANTIS_PLL_DEFINE(CLK_NOC_PLL, nocc_pll_clk, osc_24m_clk,
> +		    RCPU_NOCC_PLL_CFG_REG, PLL_NOCC_EN_REG, BUS_CG_REG, BIT(0),
> +		    CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data nocc_mux_parents[] = {
> +	{ .index = 0 },
> +	{ .hw = &nocc_pll_clk.common.hw },
> +};
> +
> +ATLANTIS_MUX_DEFINE(CLK_NOCC_CLK, nocc_clk_mux, nocc_mux_parents,
> +		    RCPU_NOCC_CLK_CFG_REG, 0, 1, CLK_SET_RATE_NO_REPARENT);
> +
> +ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV2, nocc_div2_clk, nocc_clk_mux,
> +			RCPU_NOCC_CLK_CFG_REG, 1, 4, 0, 0);
> +ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_DIV4, nocc_div4_clk, nocc_clk_mux,
> +			RCPU_NOCC_CLK_CFG_REG, 5, 4, 0, 0);
> +ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_RTC, nocc_rtc_clk, nocc_div4_clk,
> +			RCPU_NOCC_CLK_CFG_REG, 9, 6, 0, 0);
> +ATLANTIS_DIVIDER_DEFINE(CLK_NOCC_CAN, nocc_can_div, nocc_clk_mux,
> +			RCPU_NOCC_CLK_CFG_REG, 15, 4, 0, 0);
> +
> +static unsigned int refcnt_qspi;
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_SCLK, qspi_sclk, nocc_clk_mux,
> +			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_QSPI_HCLK, qspi_hclk, nocc_div2_clk,
> +			    LSIO_BLK_CG_REG, BIT(0), &refcnt_qspi, 0);
> +ATLANTIS_GATE_DEFINE(CLK_I2C0_PCLK, i2c0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(1), 0);
> +ATLANTIS_GATE_DEFINE(CLK_I2C1_PCLK, i2c1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(2), 0);
> +ATLANTIS_GATE_DEFINE(CLK_I2C2_PCLK, i2c2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(3), 0);
> +ATLANTIS_GATE_DEFINE(CLK_I2C3_PCLK, i2c3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(4), 0);
> +ATLANTIS_GATE_DEFINE(CLK_I2C4_PCLK, i2c4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(5), 0);
> +
> +ATLANTIS_GATE_DEFINE(CLK_UART0_PCLK, uart0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(6), 0);
> +ATLANTIS_GATE_DEFINE(CLK_UART1_PCLK, uart1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(7), 0);
> +ATLANTIS_GATE_DEFINE(CLK_UART2_PCLK, uart2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(8), 0);
> +ATLANTIS_GATE_DEFINE(CLK_UART3_PCLK, uart3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(9), 0);
> +ATLANTIS_GATE_DEFINE(CLK_UART4_PCLK, uart4_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(10), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SPI0_PCLK, spi0_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(11), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SPI1_PCLK, spi1_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(12), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SPI2_PCLK, spi2_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(13), 0);
> +ATLANTIS_GATE_DEFINE(CLK_SPI3_PCLK, spi3_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(14), 0);
> +ATLANTIS_GATE_DEFINE(CLK_GPIO_PCLK, gpio_pclk, nocc_div4_clk, LSIO_BLK_CG_REG,
> +		     BIT(15), 0);
> +
> +static unsigned int refcnt_can0;
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_HCLK, can0_hclk, nocc_div2_clk,
> +			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN0_CLK, can0_clk, nocc_can_div,
> +			    LSIO_BLK_CG_REG, BIT(17), &refcnt_can0, 0);
> +
> +static unsigned int refcnt_can1;
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_HCLK, can1_hclk, nocc_div2_clk,
> +			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
> +ATLANTIS_GATE_SHARED_DEFINE(CLK_CAN1_CLK, can1_clk, nocc_can_div,
> +			    LSIO_BLK_CG_REG, BIT(18), &refcnt_can1, 0);
> +
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN0_TIMER_CLK, can0_timer_clk,
> +				 nocc_rtc_clk, 1, 1, 0);
> +ATLANTIS_CLK_FIXED_FACTOR_DEFINE(CLK_CAN1_TIMER_CLK, can1_timer_clk,
> +				 nocc_rtc_clk, 1, 1, 0);
> +
> +static struct clk_hw *atlantis_rcpu_clks[] = {
> +	[CLK_RCPU_PLL]		= &rcpu_pll_clk.common.hw,
> +	[CLK_RCPU_ROOT]		= &rcpu_root_mux.common.hw,
> +	[CLK_RCPU_DIV2]		= &rcpu_div2_clk.common.hw,
> +	[CLK_RCPU_DIV4]		= &rcpu_div4_clk.common.hw,
> +	[CLK_RCPU_RTC]		= &rcpu_rtc_clk.common.hw,
> +	[CLK_SMNDMA0_ACLK]	= &smndma0_aclk.common.hw,
> +	[CLK_SMNDMA1_ACLK]	= &smndma1_aclk.common.hw,
> +	[CLK_WDT0_PCLK]		= &wdt0_pclk.common.hw,
> +	[CLK_WDT1_PCLK]		= &wdt1_pclk.common.hw,
> +	[CLK_TIMER_PCLK]	= &timer_pclk.common.hw,
> +	[CLK_PVTC_PCLK]		= &pvtc_pclk.common.hw,
> +	[CLK_PMU_PCLK]		= &pmu_pclk.common.hw,
> +	[CLK_MAILBOX_HCLK]	= &mb_hclk.common.hw,
> +	[CLK_SEC_SPACC_HCLK]	= &sec_spacc_hclk.common.hw,
> +	[CLK_SEC_OTP_HCLK]	= &sec_otp_hclk.common.hw,
> +	[CLK_TRNG_PCLK]		= &trng_pclk.common.hw,
> +	[CLK_SEC_CRC_HCLK]	= &sec_crc_hclk.common.hw,
> +	[CLK_SMN_HCLK]		= &rcpu_smn_hclk.common.hw,
> +	[CLK_AHB0_HCLK]		= &rcpu_ahb0_hclk.common.hw,
> +	[CLK_SMN_PCLK]		= &rcpu_smn_pclk.common.hw,
> +	[CLK_SMN_CLK]		= &rcpu_smn_clk.common.hw,
> +	[CLK_SCRATCHPAD_CLK]	= &rcpu_scratchpad_aclk.common.hw,
> +	[CLK_RCPU_CORE_CLK]	= &rcpu_core_clk.common.hw,
> +	[CLK_RCPU_ROM_CLK]	= &rcpu_rom_aclk.common.hw,
> +	[CLK_OTP_LOAD_CLK]	= &otp_load_clk.common.hw,
> +	[CLK_NOC_PLL]		= &nocc_pll_clk.common.hw,
> +	[CLK_NOCC_CLK]		= &nocc_clk_mux.common.hw,
> +	[CLK_NOCC_DIV2]		= &nocc_div2_clk.common.hw,
> +	[CLK_NOCC_DIV4]		= &nocc_div4_clk.common.hw,
> +	[CLK_NOCC_RTC]		= &nocc_rtc_clk.common.hw,
> +	[CLK_NOCC_CAN]		= &nocc_can_div.common.hw,
> +	[CLK_QSPI_SCLK]		= &qspi_sclk.common.hw,
> +	[CLK_QSPI_HCLK]		= &qspi_hclk.common.hw,
> +	[CLK_I2C0_PCLK]		= &i2c0_pclk.common.hw,
> +	[CLK_I2C1_PCLK]		= &i2c1_pclk.common.hw,
> +	[CLK_I2C2_PCLK]		= &i2c2_pclk.common.hw,
> +	[CLK_I2C3_PCLK]		= &i2c3_pclk.common.hw,
> +	[CLK_I2C4_PCLK]		= &i2c4_pclk.common.hw,
> +	[CLK_UART0_PCLK]	= &uart0_pclk.common.hw,
> +	[CLK_UART1_PCLK]	= &uart1_pclk.common.hw,
> +	[CLK_UART2_PCLK]	= &uart2_pclk.common.hw,
> +	[CLK_UART3_PCLK]	= &uart3_pclk.common.hw,
> +	[CLK_UART4_PCLK]	= &uart4_pclk.common.hw,
> +	[CLK_SPI0_PCLK]		= &spi0_pclk.common.hw,
> +	[CLK_SPI1_PCLK]		= &spi1_pclk.common.hw,
> +	[CLK_SPI2_PCLK]		= &spi2_pclk.common.hw,
> +	[CLK_SPI3_PCLK]		= &spi3_pclk.common.hw,
> +	[CLK_GPIO_PCLK]		= &gpio_pclk.common.hw,
> +	[CLK_CAN0_HCLK]		= &can0_hclk.common.hw,
> +	[CLK_CAN0_CLK]		= &can0_clk.common.hw,
> +	[CLK_CAN1_HCLK]		= &can1_hclk.common.hw,
> +	[CLK_CAN1_CLK]		= &can1_clk.common.hw,
> +	[CLK_CAN0_TIMER_CLK]	= &can0_timer_clk.common.hw,
> +	[CLK_CAN1_TIMER_CLK]	= &can1_timer_clk.common.hw,
> +};
> +
> +static const struct atlantis_prcm_data atlantis_prcm_rcpu_data = {
> +	.hws = atlantis_rcpu_clks,
> +	.num = ARRAY_SIZE(atlantis_rcpu_clks),
> +	.reset_name = "rcpu-reset"
> +};
> +
> +static int atlantis_prcm_clocks_register(struct device *dev,
> +					 struct regmap *regmap,
> +					 const struct atlantis_prcm_data *data)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +	size_t num_clks = data->num;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		struct atlantis_clk_common *common =
> +			hw_to_atlantis_clk_common(hw);
> +		common->regmap = regmap;
> +
> +		ret = devm_clk_hw_register(dev, hw);
> +

Remove newline

> +		if (ret)
> +			return ret;
> +
> +		clk_data->hws[common->clkid] = hw;
> +	}
> +
> +	clk_data->num = num_clks;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +
> +	return ret;

These 3 lines can be simplified to return devm_..();

Brian

