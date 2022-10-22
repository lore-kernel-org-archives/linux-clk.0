Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC76C04A95
	for <linux-clk@archiver.kernel.org>; Sat, 22 Oct 2022 11:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiJVLfE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Oct 2022 07:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiJVLer (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Oct 2022 07:34:47 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D464B0DB
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 04:17:50 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a3so8785376wrt.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Oct 2022 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sA2bYZ3XVFkUZakMtHzGrtRu5x6TpZKvmsdXi2XwhiU=;
        b=LrelL53esVvDNzK7JlacYsdBBKAepepdYLMIrIcNIeeHhVa0CuaqIOYUfvmzbwbbIV
         NUrqiHsKKB6Ns2d5VFp/KoiTjGUOmqPuOL/iiGJNpdh8NW2j8eJXs7C75rervmICZTxy
         vfxzETx2gzUbjmkNb94Y64Aj8G/oudHvIS6OI8ani/yGrCoTlehX8oDMuifaAUOrORAo
         rCz97u12NEcgJZ957knSWDXDe19R1mo3ZQQZVj5SpbnGwz3ICo5lJBT9M71dCMh9wgAC
         zs2laFFMtTsNGJqtsv41DA8PcTb8RCHFmretqQ9Jph2v6Erc5xTfzETtymCsUs7q5nl4
         mUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA2bYZ3XVFkUZakMtHzGrtRu5x6TpZKvmsdXi2XwhiU=;
        b=Eo8Ls0UWd93i8vkLtQDtJa/j/JEtBHzH6qAQADqAb3TK/4I2yo1jux0Fi31/WYjrOr
         wINAhLi4P5W/sNV4K7W8L25NHaE4LTAajHwwwcIflRhDvUltF1nU7/EXlWxGr1mfWm1Z
         zFiUV79Q7XKq/Ew4APaoywZerw42WMGw/ec7nhhDxySm8Br4rzCfK1bZR3h2WTsvfftv
         OUd6xyalRATf60nelLKLxb3fxCnXWCqfq5RQqCE8r3cvTE2F5Hm4FmGafRWmaKP58P0I
         5r7MsLHikLjxLAVrikd/ZR3NP0+yZtdZDn+zqB6bKndWGLPidSgSDim2nznaKmLmIKTH
         lC/g==
X-Gm-Message-State: ACrzQf2U5jW1N5LgTkQFvptYnOpIF/M/+bsmvo3fP+Rvz6GYyS9vsMoM
        QTG/Bzp2EdJoOu1r9bM1zQo=
X-Google-Smtp-Source: AMsMyM4eOuJ+XVI2qTJ+GOs67GYd3px6vhRwo691fIFE3fng5a6GOhxZ/ZVSYagF1CpRvimIdXXmxA==
X-Received: by 2002:adf:b612:0:b0:236:5d1f:143a with SMTP id f18-20020adfb612000000b002365d1f143amr1922922wre.364.1666437468668;
        Sat, 22 Oct 2022 04:17:48 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9bc:1400:71ea:e20e:31:587a? (dynamic-2a01-0c23-b9bc-1400-71ea-e20e-0031-587a.c23.pool.telefonica.de. [2a01:c23:b9bc:1400:71ea:e20e:31:587a])
        by smtp.googlemail.com with ESMTPSA id r9-20020a05600c458900b003b47b913901sm12817815wmo.1.2022.10.22.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 04:17:47 -0700 (PDT)
Message-ID: <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
Date:   Sat, 22 Oct 2022 13:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
In-Reply-To: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29.08.2022 20:52, Heiner Kallweit wrote:
> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove an unrelated change
> ---
>  drivers/clk/meson/clk-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index daa025b6d..53b8e17e4 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -277,15 +277,15 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
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
>  	return -ETIMEDOUT;
>  }

Hi Jerome,
on Sep 6th you responded that the patch has been applied.
https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
However I still don't see it in linux-next. Is it pending in some other tree?

Heiner
