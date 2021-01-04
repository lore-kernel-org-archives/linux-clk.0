Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E240FC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A950F21D93
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 11:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbhADLny (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 06:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbhADLny (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 06:43:54 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D043C061793
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 03:43:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id j16so27011131edr.0
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 03:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=YJMXYPP+Zpc8fAzHM+tOsE5l9dX3cXSxu+6LXuQVQIY=;
        b=P5ZpcTTEIS6JO3tLdGP1J8WCi7VGcCDBePpY9T78KseCTeXZgQk/rHpdAWH3wCgIJ1
         InUe6Fo0SvE7hskI0Aeyuu3A7yo68PPKJ2EkIix99qXQAxdA5Kni1u5B5jHHBI6KMFxS
         fyIkG5/ctTqUZpjJ7r8HvuDuw441eqBot+kdH7D0dJQXL8jeOV9MmDFU38l0yUTHzloq
         F6vH0wbvSiYcuAYbrq/homLDEAC6D/0fgpv9WKqzlwDxaYPspnXaXbreaQgS8sfYHo/m
         g4Er8PyeQpoZ6t5YZW0VFHsgcUFaI/6r2VpZt1W5vBgA5YQgnd2dmD02s7Sn1Iknpkpq
         LnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=YJMXYPP+Zpc8fAzHM+tOsE5l9dX3cXSxu+6LXuQVQIY=;
        b=lTfOy/hoUum2NZ98023AbKfLHsDYIWrrr6loBa2YnkVbnnzhcn5Wj+40/D37HiG8K3
         w+ErY8TV2/PdsZ+U7NLoEQK8XeATkA9ecLSWzFykefDVv4OanMWw6OhslympOxXjH/CX
         zYtWMD/lAro0Z5U+9SLRvZfZv7pJp2FNOTn+xy8WfcobNwfBUhX3ORly5PKVEVu4rWgu
         brO435ug1etmBisHhY+ywPkzVoToEjk4UIUZn8D4nQv6SVtoVaCBo9PDS3pTcQrKnGGN
         qF1mUzFBQp6Xi95oQS4nmw0mVcLiUrXQQo3WdqGBb3+56AfYxsw7fxrHSqPY9/ELd0dg
         ngIQ==
X-Gm-Message-State: AOAM531aFQgoZor4B6/ITVE0cSFLGWdkDG/iwuShRlKyBgjZDIRn0eDV
        mgNETNcVe/clIiI5a6IapWQJQg==
X-Google-Smtp-Source: ABdhPJzJZBo2eMXhVWesKa5PqRsTKXztqcgpvKwHFN+xiQ1Vt6luAU/jDR0cjkwoLG6zGogqOwHIQA==
X-Received: by 2002:a50:cd9c:: with SMTP id p28mr68774887edi.83.1609760592341;
        Mon, 04 Jan 2021 03:43:12 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id s15sm15294357eja.36.2021.01.04.03.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 03:43:11 -0800 (PST)
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
 <20201226121556.975418-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: meson: clk-pll: fix initializing the old rate
 (fallback) for a PLL
In-reply-to: <20201226121556.975418-2-martin.blumenstingl@googlemail.com>
Message-ID: <1j35zhx700.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 12:43:11 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sat 26 Dec 2020 at 13:15, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The "rate" parameter in meson_clk_pll_set_rate() contains the new rate.
> Retrieve the old rate with clk_hw_get_rate() so we don't inifinitely try
> to switch from the new rate to the same ratte again.

Small typo above fixed while applying


>
> Fixes: 7a29a869434e8b ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index b17a13e9337c..9404609b5ebf 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -371,7 +371,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (parent_rate == 0 || rate == 0)
>  		return -EINVAL;
>  
> -	old_rate = rate;
> +	old_rate = clk_hw_get_rate(hw);
>  
>  	ret = meson_clk_get_pll_settings(rate, parent_rate, &m, &n, pll);
>  	if (ret)

