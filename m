Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FFB14EC73;
	Sat, 14 Mar 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479959; cv=none; b=rOQv1zrMWgGB8wofOccBfBg4IGOl2zOkfwb+LvI8/WP92rS57tU7O9Yp26jElKetsGQ6bjnjCgKYxxeXMzUmlwYL7wjazp77ylbTCg1g5YAoFPOayTTThxQ5qnnHg6pnyiylhxd+ErQmcFWx0mAyVOmPvW80vZYx7gv121NpLPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479959; c=relaxed/simple;
	bh=YbB77Yc70N5EwVs5uQal1oO5lYDCV1c+r8TobCUec+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sexl88qwh/nD4CWB0+ne8FFOUqR6iGXdRHuHXa16UMq0V/GHT74KKsN/yzkQGWBa8WVCUjTRuXn2hTPBwt7Xgd9zFr6Ly7c0s+lmPXZoFsfCT/GQNGVZeWlwObvhbfldd1twih39QlnBzo+pb5oxqNOQjqyicKsMhZtdYO/VwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyDSe+ld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyDSe+ld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98896C19425;
	Sat, 14 Mar 2026 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773479959;
	bh=YbB77Yc70N5EwVs5uQal1oO5lYDCV1c+r8TobCUec+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyDSe+ldITlSVLhJ9AfIV+C3Z93j4l7b8mlVxdCU/aHSesj4VMtdEVRqtGt8JJ67g
	 hTzexjMn4eUOCbvGTXbp3/lxcrR9RTCoh8Vo873TGHwap5L48OHOCVwj+WDWATjqL+
	 PgcNrYEsEhe12cbOdsw62Tr7bj/8S0k5faXWeO24dbt2Y0IXCLTqZPmEnVSknrA4ZA
	 kzPVp8qHe0UfUTVEvwQorBI7Zwxpf4aNp/3rcv2feMWY43vQv2wijbOokcE6g+KLsl
	 EVfvJuNG+1rZWDx6HU0VFwo9dv8VkcskdC6Tv+5EtA8rqko3yuur+FOJO1NvX59Wig
	 /eo74kzyl4NrQ==
Date: Sat, 14 Mar 2026 10:19:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v4 03/10] clk: realtek: Add basic reset support
Message-ID: <20260314-silky-goshawk-of-penetration-f00964@quoll>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313081100.596224-4-eleanor.lin@realtek.com>

On Fri, Mar 13, 2026 at 04:10:53PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Define the reset operations backed by a regmap-based register
> interface and prepare the reset controller to be registered
> through the reset framework.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v4:
> - Add forward declaration for struct regmap in reset.h.
> - Move struct rtk_reset_data definition into reset.c as it's only used there.
> - Remove rtk_reset_reset() due to unnecessary implementation.
> - Remove unnecessary parameter from rtk_reset_get_id().
> ---
>  MAINTAINERS                  |   1 +
>  drivers/clk/Kconfig          |   1 +
>  drivers/clk/Makefile         |   1 +
>  drivers/clk/realtek/Kconfig  |  27 ++++++++++
>  drivers/clk/realtek/Makefile |   4 ++
>  drivers/clk/realtek/reset.c  | 104 +++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/reset.h  |  28 ++++++++++
>  7 files changed, 167 insertions(+)
>  create mode 100644 drivers/clk/realtek/Kconfig
>  create mode 100644 drivers/clk/realtek/Makefile
>  create mode 100644 drivers/clk/realtek/reset.c
>  create mode 100644 drivers/clk/realtek/reset.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b7d64cc8d90..53a2f3575c37 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22247,6 +22247,7 @@ L:	devicetree@vger.kernel.org
>  L:	linux-clk@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	drivers/clk/realtek/*
>  F:	include/dt-bindings/clock/realtek*
>  
>  REALTEK SPI-NAND
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
> index 000000000000..121158f11dd1
> --- /dev/null
> +++ b/drivers/clk/realtek/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config COMMON_CLK_REALTEK
> +	bool "Clock driver for Realtek SoCs"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	default y
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

Reset drivers go to reset directory.

> +	select RESET_CONTROLLER
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
> index 000000000000..52267de2eef4
> --- /dev/null
> +++ b/drivers/clk/realtek/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> +
> +clk-rtk-y += reset.o
> diff --git a/drivers/clk/realtek/reset.c b/drivers/clk/realtek/reset.c
> new file mode 100644
> index 000000000000..45713785d76d
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include "reset.h"

And here is the proof that none of your reset header constants are
bindings - do you see the header here above? No.

Best regards,
Krzysztof

