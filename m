Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA71CC43461
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70C6A6143E
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhD2JVh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 05:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbhD2JVg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Apr 2021 05:21:36 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67369C06138D
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:20:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p6-20020a05600c3586b029014131bbe5c7so7608684wmq.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=emtycNn+wWCzpWR3wOPRX/lfC7/b7fgfW6hulP1Fj7Y=;
        b=e+xfgr7nxfd1QlWEWsqxjy1GUZPA7ol9k+mWo0/8JLNUhvS0J4jmiBTTLfDxEradFq
         CIsxtz0S7SxSbc0qvNJyclrHPRSJoKUWSX82ziobYfkzic6lu1CJwOvrwXFy1JEn8DG6
         riIHtBrWT3/TJecwwZsUF56rWIPkKRAY06iNxlRjDM/cu5dyjOWlOXfHXVAyDbGyQDDU
         itrhfxwLXaAoAWzkdiS3cbP8Y6BhMOdJEwkBTLUBAtmwHaqrL0RQJugTwhjrSpkof4O9
         xsK5HjjySgkp+4Ki7kNyWs2+LPU8iM0GG1ZtoYg5PByLRn/upr8gWhOPaG5M+zOwEh6p
         //nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=emtycNn+wWCzpWR3wOPRX/lfC7/b7fgfW6hulP1Fj7Y=;
        b=pmd9URI/ui46LkLEEZYiXGbN2e1qTvDNPDh92BTQsJTJaRZSF5QskwJmTfZ5Pi4oiI
         tL5h5eTE2QI1EjqT6xZYyE1xMkq+Koxtc0uG0bjaMaPe5YlyKSCbIrZ6gOiVwu6nG59+
         ANpdjji7ySDAdZaCkgxiJvhGAiGvoi4ZaQUrMp98D+s97J2J3V3k79dxkqGq2c3ZuQyF
         jqQypuuHCb9BnwhLXZnx0YYddrMhONQOCYubezZH/uIIFCIv6bYD3m5Gmvxi7O4yJI9a
         qTZFjb2e1b+eySkdy65Vicy+m2YnWjJga4FIqv3U8rZ8qDTEUUEosAJVoQP7+bjo/t0b
         ly/w==
X-Gm-Message-State: AOAM532VfF/Vplkg9IMfy0iwpUonMCXJzF6XT82Q3EN7uV6+Wwf8owdd
        q9zE31MX7kpVhx5MCa2aO4+vKQ==
X-Google-Smtp-Source: ABdhPJz5ekuOvwFtm5X+ti48U3iGu1NlkQkbznQFO3DSiirw/PRy6N7TyqP6K1tEDIiQl8WB7C7+sQ==
X-Received: by 2002:a1c:1bca:: with SMTP id b193mr2500141wmb.28.1619688008970;
        Thu, 29 Apr 2021 02:20:08 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9? ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
        by smtp.gmail.com with ESMTPSA id f6sm3835949wrt.19.2021.04.29.02.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 02:20:08 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210429090516.61085-1-jbrunet@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ea42fa60-77cb-179b-ae2b-18b230383578@baylibre.com>
Date:   Thu, 29 Apr 2021 11:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429090516.61085-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2021 11:05, Jerome Brunet wrote:
> Do not print an error if we are just waiting for the reset controller to
> come up.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 7c8d02164443..5e501eff0840 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  
>  	ret = device_reset(dev);
>  	if (ret) {
> -		dev_err(dev, "failed to reset device\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to reset device\n");
>  		return ret;
>  	}
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
