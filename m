Return-Path: <SRS0=QqMK=XO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F694C3A5A6
	for <linux-clk@archiver.kernel.org>; Thu, 19 Sep 2019 13:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35E2621924
	for <linux-clk@archiver.kernel.org>; Thu, 19 Sep 2019 13:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hn5Featf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388442AbfISNBc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Sep 2019 09:01:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41334 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387963AbfISNBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Sep 2019 09:01:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so2988401wrw.8
        for <linux-clk@vger.kernel.org>; Thu, 19 Sep 2019 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=T/oUm0WVxShCr4Uz7hk8J9IALquJO7fiM1qSUhv05Fw=;
        b=hn5FeatfnL4cSmnI9pQY3P9osYNKz/jSMr9nvitnLWGqkM6yvb/KGWYyxLf0EWZMEI
         KgwmvOwSr91t9Mdl7+1BaWEye0QJfGIrTU3vNMygFbaStWk0TycOssQlLpCEvM/clXy+
         3c3DwwJsbMG7A8Q9+NOW0CeeOeSpBuu+QCb79uhRFq52xorUxM7W5ZX6CRCE0mcZhwO7
         ervFdUK+7qMMaDaMDg9nDlOQ4Qdivk2ccaWWMpBlMbmTOcQmIvHKqKAi5f2OioQOt96K
         6MzEc5hr0Hxo8IPf6+sVZSw0qiqkjUIhdcrxZWM2/ugwrQApKhoIZA2uC/hFihcP+ihK
         Wwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=T/oUm0WVxShCr4Uz7hk8J9IALquJO7fiM1qSUhv05Fw=;
        b=efwIUfL1etbYwPeOSL7Gw3b4bOj+aB4huRzTMKTzw5aV0sdb8YFQQyjVGGQ/tmAWuo
         Gc0oLwFexyO+o3rh7WARqbKwzAP0OetiBt7e0bcG9cthZR4Fq+YCvwn9+BTgeN7en/Gb
         jhixxkAz5xTxJ//OvNv3QiYnsilJ6ikIRfHZ/bt7cLQ7UampQv+Q6RmSqSqaTbm+gzFa
         HN5JUm7xiZb6BsDPb8bXDLuBIFbCiG6lGlbomGaEMTY+Yr4l6ZzQR2jnYQ7VDa0lcYyq
         YFwQVo5r/W6m19ht6ZZch9NRY3pDQteGrHBiRNdmY3w0aM755QcRmeXqAJqQL2UXQ/Nz
         aIvA==
X-Gm-Message-State: APjAAAV/IJtianhC9Nk845nfxkkNoIGF6Yib/S7QQaDQH4GGcBbcaTMi
        aFlMlgZliotNckAN4hiXrP6+ag==
X-Google-Smtp-Source: APXvYqxKBAJr87TccDhptPDgvDzaS8VrHoiGhYT2TmlGfQgTSWUsboVo13NiIL/acFFfMXMWH02NEg==
X-Received: by 2002:adf:e485:: with SMTP id i5mr1971966wrm.175.1568898090150;
        Thu, 19 Sep 2019 06:01:30 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a18sm20259922wrh.25.2019.09.19.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 06:01:29 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: always enable a critical PLL when setting the rate
In-Reply-To: <20190919093809.21364-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com> <20190919093809.21364-1-narmstrong@baylibre.com>
Date:   Thu, 19 Sep 2019 15:01:28 +0200
Message-ID: <1j1rwce8yf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 19 Sep 2019 at 11:38, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Make sure we always enable a PLL on a set_rate() when the PLL is
> flagged as critical.
>
> This fixes the case when the Amlogic G12A SYS_PLL gets disabled by the
> PSCI firmware when resuming from suspend-to-memory, in the case
> where the CPU was not clocked by the SYS_PLL, but by the fixed PLL
> fixed divisors.
> In this particular case, when changing the PLL rate, CCF doesn't handle
> the fact the PLL could have been disabled in the meantime and set_rate()
> only changes the rate and never enables it again.
>
> Fixes: d6e81845b7d9 ("clk: meson: clk-pll: check if the clock is already enabled')
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index ddb1e5634739..8c5adccb7959 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -379,7 +379,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	}
>  
>  	/* If the pll is stopped, bail out now */
> -	if (!enabled)
> +	if (!(hw->init->flags & CLK_IS_CRITICAL) && !enabled)

This is surely a work around to the issue at hand but:

* Enabling the clock, critical or not, should not be done but the
set_rate() callback. This is not the purpose of this callback.

* Enabling the clock in such way does not walk the tree. So, if there is
ever another PSCI Fw which disable we would get into the same issue
again. IOW, This is not specific to the PLL driver so it should not have
to deal with this.

Since this clock can change out of CCF maybe it should be marked with
CLK_GET_RATE_NOCACHE ?

When CCF hits a clock with CLK_GET_RATE_NOCACHE while walking the tree,
in addition to to calling get_rate(), CCF could also call is_enabled()
if the clock has CLK_IS_CRITICAL and possibly .enable() ?

Stephen, what do you think ?

>  		return 0;
>  
>  	if (meson_clk_pll_enable(hw)) {
> -- 
> 2.22.0
