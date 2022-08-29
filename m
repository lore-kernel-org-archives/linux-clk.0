Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65854ECAAD4
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 09:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiH2Jx0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 05:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiH2JxZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 05:53:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D925C5E646
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:53:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bu22so9130065wrb.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc;
        bh=Lzh/Ve7Auc5u8oHwvardUiFGbITEcNzSdf/E6GOkK+c=;
        b=tqmgEwNXNLtJJzMDOXqOvHQ6b1z9DSKBg9Grb3dARLNdaKXjDaMlLfvXBp//Q3SwVI
         9ns3q2bhM+/HJz3IQu0fPl5zRShnbbtcwfNa9lts/tnTNtB8D1G2EnE/iEjam4oPyC/f
         XPLJPIUDgEUYkxgHtywLPeMIOs0dC2ZdJh6GJr/jWc1xsT34EqtzVaTIFyDTjk8WesuU
         TU6WgS4cM/yr0PCjK+aAKQRGBXgrTYGEiK6djsv5gYv9sfkJerrFFTeL80gLuENGRkFx
         vz06J1CMa9HV4kwA0QiCAidjQM47FjJoKJZFpJ5sLZX+ZXyAEIz/wTYWpSHFZgd63Cbt
         juzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc;
        bh=Lzh/Ve7Auc5u8oHwvardUiFGbITEcNzSdf/E6GOkK+c=;
        b=KXdoiUWO0LQ3jNN0vGRRHBdQe5EXQrNwPkbp2aQMXv18oTDaIw3eHmenHau27U5Nj5
         lxwksBHoLqgrvKWJ+L8h19OPVRweLPcLQlB+n9NSd/dVlnpU+w5LE4t25WhTvHihoDxp
         sY9g+XVzDWa3jGnGeQ3PncuRmZMHQjathtZW+sriCQBaDVL9vCxxpnZL8s/nurqgwijF
         79+bSiq/SwPf+TOi1tcpLdcQsDE16c5SoVArONfQ3L2jDF3ZqcWagscZYm/M32LMdCo1
         UupqOOThghT0p34YaKPt5BU6mhywW8/AJs8uAj/9sO+NkktxOln04v1SERjm8QCBhnQu
         1Mkw==
X-Gm-Message-State: ACgBeo1CwQMbUbM83OcFXK8SQZN45QgNRndhDWpehjcM/lDXBfNwcy4s
        QnlpDcNrFRtBAP9Kw+1vwgHVow==
X-Google-Smtp-Source: AA6agR5QI/RlL+5E9EPzJxWVVMknB8GYGNT2HwSugiZa2lFsqRVLOS3WtEti45tEJAwRz+dl6Wqojg==
X-Received: by 2002:a5d:588d:0:b0:225:6e1a:8696 with SMTP id n13-20020a5d588d000000b002256e1a8696mr5827570wrf.512.1661766800954;
        Mon, 29 Aug 2022 02:53:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b003a83ca67f73sm7700198wmb.3.2022.08.29.02.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:53:20 -0700 (PDT)
References: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date:   Mon, 29 Aug 2022 11:52:16 +0200
In-reply-to: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
Message-ID: <1jo7w3tlyo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun 14 Aug 2022 at 23:29, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.
>
> Whilst we're at it: All callers of this function return -EIO
> in case of failure, therefore we can return this value directly
> in the timeout case.

I'm okay with this change but I'd prefer if one change addressed a
single topic. Please split this out.

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index daa025b6d..d70bee331 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -277,17 +277,17 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -	int delay = 24000000;
> +	int delay = 5000;
>  
>  	do {
> -		/* Is the clock locked now ? */
> +		/* Is the clock locked now ? Time out after 100ms. */
>  		if (meson_parm_read(clk->map, &pll->l))
>  			return 0;
>  
> -		delay--;
> -	} while (delay > 0);
> +		udelay(20);
> +	} while (--delay);
>  
> -	return -ETIMEDOUT;
> +	return -EIO;
>  }
>  
>  static int meson_clk_pll_init(struct clk_hw *hw)
> @@ -350,10 +350,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	/* Take the pll out reset */
>  	meson_parm_write(clk->map, &pll->rst, 0);
>  
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> -
> -	return 0;
> +	return meson_clk_pll_wait_lock(hw);
>  }
>  
>  static void meson_clk_pll_disable(struct clk_hw *hw)

