Return-Path: <SRS0=//ax=Z4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA8BC2BD09
	for <linux-clk@archiver.kernel.org>; Fri,  6 Dec 2019 15:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44EC724675
	for <linux-clk@archiver.kernel.org>; Fri,  6 Dec 2019 15:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="vp0xmB8w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfLFPz3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:55:29 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45361 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfLFPz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Dec 2019 10:55:29 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so5602776lfa.12
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2019 07:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UQ8toDsRC0YNjw3gGw86jGVjw7PA7mTM+776H0WBXh4=;
        b=vp0xmB8wiGHqs05Yg9DJZX7OJ6uzvnsiliouPnT4IAqCsSrxtxKSksoxURAwaPZHUh
         V7HHgskW8E0hMSp97tiApMxCvuDVKnEmumEgR+1MsmloEdueu2PkQ2D3ieXaMXP7EEWQ
         1McjCML/TDvUew/yOwq9QxVv8juleopDDX49ZH3CW5LX+64AyNdz389aWeb/zqjDUIlq
         rkCR7GPz2amiI5KFv+Xg3NgWoyuKuNvod5UwVGQI1SxenODncn257JanXSyuNTh4UdSU
         1+V25zZoTp6mEKLlePJZf4jSYn+d4DYg4NLxTuslVpzqCbt+Mbbj9vqHDBEaFC0gv9/Z
         tbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UQ8toDsRC0YNjw3gGw86jGVjw7PA7mTM+776H0WBXh4=;
        b=CV6sddg64G9JWjXxRtyqtcGDaCrA5YFLSC1/Z9Z3tsb2be7yJ56gatsMDNqKOHKmGd
         xgiQNXRdCW+8Z/Vw8E71yidtsuBux+Iv+oX2eZiKJtfyMWqBidUxqAmR13GKhmBrlr+c
         uQVnSeeRe8ynNn7L/DKi6UR9K++99GhN7wyr8Q9+8IxLqinPp4aNGPe/gsVheXTlzP+T
         AmvPkuWLrMF/byoUj9BW8DOVqcteBKcOB5bS9d9SNs6q4EW/jh/zXNSLyHjuAUMzmPHD
         eENJsS6ebAdBSurURZ5q7qLzL7pzrKDwtlG3r5cOeSe4HbgKaRcYBTWJyEqYR+njwGX9
         SwEA==
X-Gm-Message-State: APjAAAVbJCzaPX70zfTtlSZjJoTXByLwxlAXsdhf2WxrQ8PGFc8ELvmU
        Z9lKiePsgFFhKK57O4BEpW5gxA==
X-Google-Smtp-Source: APXvYqwX1XqeLRAU/UEqcrk+OubpQKYZPUPDrfOgmMrTwL128pFAiNeTQX4J9+SmhK741myLDkrO6g==
X-Received: by 2002:ac2:4a61:: with SMTP id q1mr8858590lfp.36.1575647726105;
        Fri, 06 Dec 2019 07:55:26 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id p4sm6936176lji.107.2019.12.06.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 07:55:25 -0800 (PST)
Date:   Fri, 6 Dec 2019 16:55:24 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen2: Change multipliers and dividers
 to u8
Message-ID: <20191206155524.GI28879@bigcity.dyn.berto.se>
References: <20191206133254.23800-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206133254.23800-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-12-06 14:32:54 +0100, Geert Uytterhoeven wrote:
> All multipliers and dividers are small.
> Storing them in u8 instead of unsigned int reduces kernel size for a
> generic kernel by ca. 0.5 KiB.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v5.6.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
>  drivers/clk/renesas/rcar-gen2-cpg.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
> index db2f57ef2f9984e4..bdcd4a38d48d01bd 100644
> --- a/drivers/clk/renesas/rcar-gen2-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen2-cpg.h
> @@ -24,10 +24,10 @@ enum rcar_gen2_clk_types {
>  };
>  
>  struct rcar_gen2_cpg_pll_config {
> -	unsigned int extal_div;
> -	unsigned int pll1_mult;
> -	unsigned int pll3_mult;
> -	unsigned int pll0_mult;		/* leave as zero if PLL0CR exists */
> +	u8 extal_div;
> +	u8 pll1_mult;
> +	u8 pll3_mult;
> +	u8 pll0_mult;		/* leave as zero if PLL0CR exists */
>  };
>  
>  struct clk *rcar_gen2_cpg_clk_register(struct device *dev,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
