Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5F0C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 15:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiKUPo3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:44:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbiKUPnv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 10:43:51 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B85B961D
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:43:29 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id i12so16591779wrb.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2lIGlwcvsCZa9IcKo7MgrHT6cVmzxMA6TTWsMTFuyA=;
        b=SQNXv+al5NAgzXmoSIlSRMh5Az4zjemYDhPwzrQdgHLcKwZu8w5OIBKViycqriQkBN
         Vdh2og/8cCf8/66kVpPm9A7+27DN/9Fiunvp7VRXEmuESt9CD33tmWiGwvuZNXdoZU6y
         7kElMsvfa4SbhSZc/QNGhVtL/geinCVN7vgzKEnGnxA3AhUbZoMFJ5DYh8UHZ34mN46M
         +IqEVxe6lyYVhjK4JezThrxx17x6d54Vh3VUMPjqjLosdBP9B3fThzxIg9aF3EEuvt6I
         a94QmISZX0Da8eT5Bou71jh1CKbkmYKX9PFNimWF/48lg09R5E1ZnZoFC5z/VvbCoTWY
         aQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2lIGlwcvsCZa9IcKo7MgrHT6cVmzxMA6TTWsMTFuyA=;
        b=kWDqJfKFz0j71OU4ZrF75m8aAM7eKiivYkNJyuwUrNDx4Fat022V1gHSiurnf0UIhN
         ECgA8lCWlv1SjwESieXTcKGK0Y1N3w8bShTvmMyR1uJmCNoAaVoBezwIL7coEBXh6sWE
         Hb7gUPKVzMl/UA1VTGPo2ZP22CR1ovl6lcXYeBKZvfQyBix0e/j6gfgSlH79RwPL4kZ+
         fDrVYF1Px4Qebs7AJeLEIo0/zIit722GBUJVpbSijernAJ0Gigmd0eCPzC6/a4HiZV+q
         FynLhnip+xJ1YeWEAjuK9wnBOeCRdjhFy8pIby5l6N+PZu9Kd+v3SVSpFACg/Az1M7P/
         vWdQ==
X-Gm-Message-State: ANoB5plPcqhBVCIHhJuGD8x1LKa78dJdkZGLCRPysSIm8S11179OqtBL
        Cvp7K5+vvsTZZB7KR0hj3nl4Jw==
X-Google-Smtp-Source: AA0mqf4ntZh4kH2zh2P3K0YmZa58vopdhnQOfQpnr59oiFjsoJ9dGaVRr6/+xEXN+ItxC32qiL7gqw==
X-Received: by 2002:a5d:58cc:0:b0:236:5c6c:1e06 with SMTP id o12-20020a5d58cc000000b002365c6c1e06mr709597wrf.156.1669045407991;
        Mon, 21 Nov 2022 07:43:27 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05600c524a00b003cf9bf5208esm20551850wmb.19.2022.11.21.07.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 07:43:27 -0800 (PST)
Date:   Mon, 21 Nov 2022 17:43:25 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Message-ID: <Y3ucncQOBNHpZaxn@linaro.org>
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-28 14:41:08, Rasmus Villemoes wrote:
> We have an imx8mp-based board with an external gpio-triggered
> watchdog. Currently, we don't get to handle that in time before it
> resets the board.
> 
> The probe of the watchdog device gets deferred because the SOC's GPIO
> controller is not yet ready, and the probe of that in turn gets deferred
> because its clock provider (namely, this driver) is not yet
> ready. Altogether, the watchdog does not get handled until the late
> initcall deferred_probe_initcall has made sure all leftover devices
> have been probed, and that's way too late.
> 
> Aside from being necessary for our board, this also reduces total boot
> time because fewer device probes get deferred.
> 

I'm gonna be honest here. I can't say I'm happy with this.
I would suggest finding a solution to disable the external watchdog
before booting the kernel, up until the driver probes, would be preferable
to me.

> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> It would probably be reasonable to do the same to the other imx8m* clk
> drivers, but I don't have any such hardware to test on.
> 
>  drivers/clk/imx/clk-imx8mp.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index e89db568f5a8..9ddd39a664cc 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -734,7 +734,19 @@ static struct platform_driver imx8mp_clk_driver = {
>  		.of_match_table = imx8mp_clk_of_match,
>  	},
>  };
> -module_platform_driver(imx8mp_clk_driver);
> +
> +static int __init imx8mp_clk_init(void)
> +{
> +	return platform_driver_register(&imx8mp_clk_driver);
> +}
> +arch_initcall(imx8mp_clk_init);
> +
> +static void __exit imx8mp_clk_exit(void)
> +{
> +	platform_driver_unregister(&imx8mp_clk_driver);
> +}
> +module_exit(imx8mp_clk_exit);
> +
>  module_param(mcore_booted, bool, S_IRUGO);
>  MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
>  
> -- 
> 2.37.2
> 
