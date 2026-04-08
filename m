Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3439E18F
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643695; cv=none; b=QzifWHMvJXDEWIQfkvFC/Vh0uDLuyejbg81pgaEB3IOtjEl+C5U1/W1dKumnjuOdmErqr7bahkI4Xf17+irZLHyR6k6aZBkgiHyH4nMYiBmdVR7HA1mNF1SwIiZhwIXNe3YlxhFj4vXdNTCd6Ki6k/7qlhmU0aG1TTJqLt105Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643695; c=relaxed/simple;
	bh=xhGHln0udFF3rh+H2QhtpC+7bHlOxypTvssAhy85VZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AO6ybPKz9NoZL/QtPWSZjbqs/VzP/f/U0HzYUX4n6GyY/h3KmLeUclFl6CHTCRrAVN4E2MBs82J3RvIrHWOTh8ifEo/vq2kdy9Is76xH1liyl32RUC1PzMPmBg9qeHvfr0t0dtcflF4tNFE1AsXAQU9mdsB8ka89SWiy4ZmiV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wAQ23-0004mm-KN; Wed, 08 Apr 2026 12:21:11 +0200
Message-ID: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
Date: Wed, 8 Apr 2026 12:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
To: Paul Geurts <paul.geurts@prodrive-technologies.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: martijn.de.gouw@prodrive-technologies.com
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hello Paul,

On 4/8/26 12:13 PM, Paul Geurts wrote:
> The i.MX8MM clock driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> 
> Explicitly initialize the clock driver in arch_initcall(), to make sure
> the clock driver is ready when the rest of the drivers are probed.
> 
> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")

Your commit message doesn't explain why this was a problem for you.
Does it delay your boot? What makes this patch a fix?

> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> ---
>  drivers/clk/imx/clk-imx8mm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 319af4deec01..7b2cf867b920 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -636,7 +636,19 @@ static struct platform_driver imx8mm_clk_driver = {
>  		.of_match_table = imx8mm_clk_of_match,
>  	},
>  };
> -module_platform_driver(imx8mm_clk_driver);
> +
> +static int __init imx8mm_clk_init(void)
> +{
> +	return platform_driver_register(&imx8mm_clk_driver);
> +}
> +arch_initcall(imx8mm_clk_init);

What happens if you build the driver as module with your changes applied?

Cheers,
Ahmad

> +
> +static void __exit imx8mm_clk_exit(void)
> +{
> +	platform_driver_unregister(&imx8mm_clk_driver);
> +}
> +module_exit(imx8mm_clk_exit);
> +
>  module_param(mcore_booted, bool, S_IRUGO);
>  MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
>  

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

