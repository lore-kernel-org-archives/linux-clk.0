Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEF6ECAAD4
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 09:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiH2J5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 05:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiH2J52 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 05:57:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767E54E612
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:57:27 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b16so1852331wru.7
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc;
        bh=W/wb4+5X5ScQArKn4kh2p9wnfAhIxnpSatlHXwMeb8E=;
        b=q2Mc8dJ2li6OvlIX1H7ViuURhL1UVGJXT810KqQL3AKPdpF8iTKrf8hfx60LdReR5f
         6FEiOifps19HcD0zmS1f6JVbkeNOuWf5AO5gECTd8ughKv+2zZJU9a1iCwLs83O0cEwN
         ah91xVDHWhMYzuITCwzFjQlKP4FloZE3Xc0C11Qy7Sy1AY+ER9Ax+fMHfsJlXvkVkw2n
         fTm1z4TNsCp4KgaTxuTeNeamcXDLBqLRn7kk6i4oMDAEQjAeGk4iD4Qj7/2oG+5A++4Y
         Cwej6fu11Yz4b/kGX/V0WvE4UwA6/BGvIFwWumhV66ruKL6eMGUrtUUkud8c8v93NdJU
         BMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc;
        bh=W/wb4+5X5ScQArKn4kh2p9wnfAhIxnpSatlHXwMeb8E=;
        b=ax26eGXtC2u7ivWpEAf0kSljxe74evxR+3H4e+1mEOZEPRos3XdZlWwQha7c6yGo4r
         EePp8NYekQ2J1LTyHgS9gYzK4sypNegFVwOP0kSU8VSilLE1u1nbhYIVIM4yp+WtNPIA
         FR11HoYZR+Nl4WSZRycb47nWJFIgbHYmcF6rJau+pR2hXh3CHc6lim1XzoxMrqY1ByHa
         v60qDtINrK4PcBdSxUz0K76xig5qmXFTyFAphN+6snYLBerShNMTIfmw5l9BxH345IGQ
         Q97ukF+QJfTGPTbZKgmzFPDDN7PdBL8Z4YGUNt8IGic6s1nXyBt+yVw4UlH1Eprcj7ks
         rQfw==
X-Gm-Message-State: ACgBeo3GAfVD1d08/DPUAswmZqT7eNMlIRNNsNaXYYwMWQ04H5v4lYNG
        +aUBk3esLivpeK7GmBqgolihZg==
X-Google-Smtp-Source: AA6agR6VLUFIg2m+d+eX2ZgwPDynA6glHGDACuRb2JIEf+lKOtbQEBVmCnUGBmt7RUbyTWFF3PlEiQ==
X-Received: by 2002:a5d:6b44:0:b0:225:fbb:678e with SMTP id x4-20020a5d6b44000000b002250fbb678emr6018310wrw.482.1661767046058;
        Mon, 29 Aug 2022 02:57:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d4946000000b00226d2462b32sm5663675wrs.52.2022.08.29.02.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:57:25 -0700 (PDT)
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Yu Tu <yu.tu@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from
 vendor driver
Date:   Mon, 29 Aug 2022 11:54:06 +0200
In-reply-to: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
Message-ID: <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On a S905X4-based system this call fails randomly.
> The vendor driver has a retry mechanism and on my system
> the second attempt is successful always.
>

This reason looks a bit weak to me.
I'd like AML team to comment on this PLL problem as I suspect it might
relate to other PLL we have been seeing

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 9e55617bc..daa025b6d 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  
>  static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>  {
> -	meson_clk_pll_init(hw);
> +	int retries = 10;
>  
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> +	do {
> +		meson_clk_pll_init(hw);
> +		if (!meson_clk_pll_wait_lock(hw))
> +			return 0;
> +		pr_info("Retry enabling PCIe PLL clock\n");
> +	} while (--retries);
>  
> -	return 0;
> +	return -EIO;
>  }
>  
>  static int meson_clk_pll_enable(struct clk_hw *hw)

