Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC94DC433ED
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A01A56143E
	for <linux-clk@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhD2JVg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Apr 2021 05:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhD2JUu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Apr 2021 05:20:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42501C06138B
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:20:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x5so15826668wrv.13
        for <linux-clk@vger.kernel.org>; Thu, 29 Apr 2021 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OEnZFH+XYmfSP7g7WH0QI8W4ZYWs8ZUaoUGB+JuAxoM=;
        b=Mm8xR36UEWJ6cS/XVCZAg06SJ8bVoGQwtegzm0Efe0KzMFiqiX58kizt5BxUCmAct1
         XNcx+mGKGlXGphDHdUG4u/f2it6Vn0QuWvYK52mYMVvDbtQGyOXAKbaGxcHfGISAg3Yh
         DeMttCvju5ZPiLWDNPvmxPqUzqM0QLYWmpiXtLFI0PT6tTLnXTnhUuQX3as6ClQmDFru
         jHiW5g7K8RvY8fTwdXhzC7ssqkEawqN7kie2i3PfCf+Ps82jEl6QCwTk9XV7NOvpJLDq
         OmtPqH8d98UaaR3ll3mvCB5dyZ8ZODNFu1nwAm8ueqcb+Z7VoPhrLiMWVx/2xk2838IP
         Ncfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OEnZFH+XYmfSP7g7WH0QI8W4ZYWs8ZUaoUGB+JuAxoM=;
        b=LCfxFsuZGzEdpCkOl/K2fc5jW58ZB6Lsyt5UYe2jHwmA/BmwYitonqlRhZkgcKCaro
         ht2pF3uYK0CxnR8KYJI+msiKrBQnNHPGG/MiccE+98eAuj0SW98tyaIptySIgPKQfsyw
         hrytPG2rXHi9y3pm8vzb7urrzOqlKUrdQPX75U4tli5Y92exiiSUsvusYq/0mVXXtc/r
         T38IuotoyV3/0oyBA6OblfynF45GoIgeztr4WKEnLNZEWcxz3zrF3xgDnyeHzlVW9Z56
         N6Q4aYQpF1aJ0mHeSTHtMGh8lOpjLNIoZyx+KJpg4qL89EpDyM6mQ6yEWF+aVrf/qu1L
         NPDQ==
X-Gm-Message-State: AOAM530/wtSZ9WmuUJXpBZcMW8FeGqBVwJ+T82Th+S+HpnHmHq5V4GeV
        AlLXdKtQmMRTWtGCuxm0zLqGGg==
X-Google-Smtp-Source: ABdhPJy1DesDcdMTDcl1IHz35cNr7g3mrtoEBR2y4NzPLkd9a2ncVF1iU/HEFWmsMvhhTTteYlUoQQ==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr28892118wrt.14.1619688001872;
        Thu, 29 Apr 2021 02:20:01 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9? ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
        by smtp.gmail.com with ESMTPSA id a9sm3960823wrw.26.2021.04.29.02.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 02:20:01 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <979eb290-6fc2-38df-0596-867b82d22226@baylibre.com>
Date:   Thu, 29 Apr 2021 11:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429090325.60970-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2021 11:03, Jerome Brunet wrote:
> While some SoC samples are able to lock with a PLL factor of 55, others
> samples can't. ATM, a minimum of 60 appears to work on all the samples
> I have tried.
> 
> Even with 60, it sometimes takes a long time for the PLL to eventually
> lock. The documentation says that the minimum rate of these PLLs DCO
> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
> 
> With factor range changed, the PLL seems to lock quickly (enough) so far.
> It is still unclear if the range was the only reason for the delay.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b080359b4645..a805bac93c11 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>  };
>  
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
> -	.min = 55,
> +	.min = 125,
>  	.max = 255,
>  };
>  
> 

I got other issues with GP0 when trying to use it for DSI on VIM3 & VIM3L.

I had to do change the following to have it lock correctly and achieve rates usable for MIPI-DSI requested bandwidth:

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index cde07f7ebad6..897cd6db5c0f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -391,9 +391,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
                meson_parm_write(clk->map, &pll->frac, frac);
        }

-       /* If the pll is stopped, bail out now */
+       /* If the pll is stopped, bail out now * /
        if (!enabled)
-               return 0;
+               return 0;*/

        if (meson_clk_pll_enable(hw)) {
                pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",

This one is tricky, for DSI the clock rate is set with assigned-clock-rates in DT, but
then the GP0 is seen as stopped and then the rate is never set.

When afterwards we enable the PLL, the rate set in the registers is invalid and never locks,
this permits setting the rate in the registers even if the PLL is stopped.

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 1b0167b8de3b..08174724a115 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1602,8 +1602,8 @@ static struct clk_regmap g12b_cpub_clk_trace = {
 };

 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-       .min = 55,
-       .max = 255,
+       .min = 120,
+       .max = 168,
 };

I had to change the min/max to achieve a stable and functional rate of 720MHz after the ODs.

Neil
