Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7CAC433B4
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D09D61261
	for <linux-clk@archiver.kernel.org>; Tue, 18 May 2021 07:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347273AbhERHtL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 May 2021 03:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347262AbhERHtK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 May 2021 03:49:10 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5163C061573
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:47:52 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so927597wmk.0
        for <linux-clk@vger.kernel.org>; Tue, 18 May 2021 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=qbYhZ0j3U7IXcdLANW6Ri1lM6U26+3AlkXH54c6o33U=;
        b=UNsPc7NxgufwBvAxSN+WYxjkS2wP7YKuiSTAO7fTBlrx/MXk+8EAEXbijP/ncLJppV
         YKZwrNuPv7BHS+5JF9a2f2mrChqUm8Wm30714fyBi5RGDFFT/3u28/M6Dq/ytavc4/Cm
         YFGoYw75AF05UHj8+dO72HXzxU4ztfGlP4CRpZLvb2z+qX7eTsPdDUQD4X3T2Td/8P5M
         OTX6yFpjac7arJZg1O5HVRCtB9e4Yf+Pk2wDTqBTiywkFhLH/kdYr7ycSm0EYpgGFJGm
         6dQ7lY47+udLjko7x7r0B3k6MLh04dYisbni7GEtbw4B+04zstbs5XCaAwH5k9Sowuzh
         Tf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=qbYhZ0j3U7IXcdLANW6Ri1lM6U26+3AlkXH54c6o33U=;
        b=lj8lTA88WMErX5RNCWeYPgZMiFPM17Sl9mWxVScKBvVsnW3z2o1Cg/dFLydfXIdyGE
         qXWuWGwPbTMgK9sdMSMUWr6jmftJevaoDvgY1Ix+A2VQIoVsu+hMAZAQD/QGpulzxNBN
         0OZ6sYW8cEBcyuNMDMXD9sh05tO4eqEbFvtSzbmEvJ6wy1QzToWIm+wCxRNQwzdGRFbp
         surAvFqAFBi7U2o+0AW52kNZmhiFJG500iXEfmz7goWeKgYQR0aYFLrgHOhPzkzfrYql
         hLp0b5QwAgOP7Cb9n6JD5e0EhK2pI0/IlUtwk5KxbbVrLb/RxsnOe5jJf4dxEWnVL3O7
         T/Mg==
X-Gm-Message-State: AOAM532o3b8p+ifFf6APHUGJlIpFUu1XzW0htyoETKwE65T3Jdg2WWR+
        D1Qn2vUcr7Pirh8PP0tO9ehBekre4NTirQ==
X-Google-Smtp-Source: ABdhPJynC+inihhIFx014wY+OTem05Sqe/Rnseyfe0Fwn2uGEqzQBo+xrnoV58p3lDVwgvyj1pRh0w==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr3404815wmb.15.1621324071556;
        Tue, 18 May 2021 00:47:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id x11sm20088700wrl.13.2021.05.18.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 00:47:51 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     khilman@baylibre.com, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 2/3] clk: meson: regmap: switch to determine_rate
 for the dividers
In-reply-to: <20210517203724.1006254-3-martin.blumenstingl@googlemail.com>
Message-ID: <1jr1i41o0p.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 18 May 2021 09:47:50 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This increases the maxmium supported frequency on 32-bit systems from
> 2^31 (signed long as used by clk_ops.round_rate, maximum value:
> approx. 2.14GHz) to 2^32 (unsigned long as used by
> clk_ops.determine_rate, maximum value: approx. 4.29GHz).
> On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
> capable of running at up to 2.97GHz. So switch the divider
> implementation in clk-regmap to clk_ops.determine_rate to support these
> higher frequencies on 32-bit systems.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/clk-regmap.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
> index dcd1757cc5df..8ad8977cf1c2 100644
> --- a/drivers/clk/meson/clk-regmap.c
> +++ b/drivers/clk/meson/clk-regmap.c
> @@ -75,8 +75,8 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
>  				   div->width);
>  }
>  
> -static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *prate)
> +static int clk_regmap_div_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> @@ -87,18 +87,17 @@ static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
>  	if (div->flags & CLK_DIVIDER_READ_ONLY) {
>  		ret = regmap_read(clk->map, div->offset, &val);
>  		if (ret)
> -			/* Gives a hint that something is wrong */
> -			return 0;
> +			return ret;
>  
>  		val >>= div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		return divider_ro_round_rate(hw, rate, prate, div->table,
> -					     div->width, div->flags, val);
> +		return divider_ro_determine_rate(hw, req, div->table,
> +						 div->width, div->flags, val);
>  	}
>  
> -	return divider_round_rate(hw, rate, prate, div->table, div->width,
> -				  div->flags);
> +	return divider_determine_rate(hw, req, div->table, div->width,
> +				      div->flags);
>  }
>  
>  static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -123,14 +122,14 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops clk_regmap_divider_ops = {
>  	.recalc_rate = clk_regmap_div_recalc_rate,
> -	.round_rate = clk_regmap_div_round_rate,
> +	.determine_rate = clk_regmap_div_determine_rate,
>  	.set_rate = clk_regmap_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_regmap_divider_ops);
>  
>  const struct clk_ops clk_regmap_divider_ro_ops = {
>  	.recalc_rate = clk_regmap_div_recalc_rate,
> -	.round_rate = clk_regmap_div_round_rate,
> +	.determine_rate = clk_regmap_div_determine_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_regmap_divider_ro_ops);
