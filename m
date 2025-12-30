Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215022E8B7C;
	Tue, 30 Dec 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097059; cv=none; b=lLhUdPpzqrL09DhIEf/h53jcbIKSe9Isw8puVy4zLTTMVrBKxESJh3cdtbEzTFMEdWbQ0dCAAzCzOKUDrHV04mSNPPNpaC8iq6n0YbiFCILXjl3Ajz6t6Jcm0dlpPOkKTLECQ/6uyevI9t1Stx5SbHNzKBaPbIKRda99kw84PHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097059; c=relaxed/simple;
	bh=ox0wPP6LMBXIMQWmu5Q6BT0YGYrqx/xg1myQk/ISjV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6rl6a4ku4TFXP+FLvMYNsoAukIk/LgFPJeEbKxHpefpO2tDoD/kCnQD2HM6/Jn4QlwwPDYY92ml3hct25cUIbCcTj8IVuKrl10V8XZlqPP8xvP/cgv6Qg+COcwV1qmwoihecyHmMkVfcxu+EgytY1yvwPhLFWJ3u2GKEeKDEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnJkOS9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnJkOS9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65028C4CEFB;
	Tue, 30 Dec 2025 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097058;
	bh=ox0wPP6LMBXIMQWmu5Q6BT0YGYrqx/xg1myQk/ISjV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnJkOS9nOnCk9GMcG5nvQJe0Gs+FbDhqcKLBgJ/5nXwo3L95xBlRyNm6kE7NdPXgC
	 B6skgqpOX/aa7/XyEzPEsQrlKi++xqiHZ7VPCKxNInamAA+EGN2v7AdaAailNxBCv5
	 wKoFV3Yv4TJv0LqSLa83a2R6u+qrAKx7b1qlYUusQQvCYR/0StGhiWkTtI8ouGK1Fo
	 UeZqwBHLXXG1z26V0wDYLwh9/b/cJAgsBidLOAPI661hjycz8JyOrQwHpIAjM3Jsrv
	 3+CqWe8tDoXVKekfJIm3ewyGb87gnWWOOcCJskB+DA9Sx9Oy+mVjeL3DYVkGbVfGZL
	 jQbSqjsgBYDTA==
Date: Tue, 30 Dec 2025 13:17:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH 3/9] clk: realtek: Introduce a common probe()
Message-ID: <20251230-congenial-vagabond-cicada-d6b8fe@quoll>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
 <20251229075313.27254-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-4-eleanor.lin@realtek.com>

On Mon, Dec 29, 2025 at 03:53:07PM +0800, Yu-Chun Lin wrote:
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> add the clock provider, and optionally register a reset controller when
> reset bank data is provided.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  drivers/clk/realtek/Makefile |  1 +
>  drivers/clk/realtek/common.c | 72 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/realtek/common.h | 40 ++++++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/clk/realtek/common.c
>  create mode 100644 drivers/clk/realtek/common.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 52267de2eef4..4041951b7c62 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
> +clk-rtk-y += common.o
>  clk-rtk-y += reset.o
> diff --git a/drivers/clk/realtek/common.c b/drivers/clk/realtek/common.c
> new file mode 100644
> index 000000000000..df89d2a10291
> --- /dev/null
> +++ b/drivers/clk/realtek/common.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include "common.h"
> +
> +int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
> +{
> +	int i, ret;
> +	struct device *dev = &pdev->dev;
> +	struct rtk_reset_initdata reset_initdata = { 0 };
> +

There is never blank line between declarations.

> +	struct regmap *regmap = device_node_to_regmap(pdev->dev.of_node);

This is not supposed to be declaration with initialization.

> +

There is never blank line between get and if().

> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "Failed to get regmap: %d\n", ret);
> +		return ret;

Syntax is just return dev_err_probe. Don't send us 2022 code, but
completely rework this to match upstream style.

> +	}
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
> +			dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
> +				 ret);
> +			desc->clk_data->hws[i] = NULL;
> +		}
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					  desc->clk_data);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to add clock provider\n");

Really... 2022 code...

Best regards,
Krzysztof

