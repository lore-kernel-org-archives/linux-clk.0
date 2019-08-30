Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E17C3A5A6
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 21:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 727D72343D
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 21:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="qks3GcI2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbfH3V5N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 17:57:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41048 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbfH3V5M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 17:57:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id m24so7768991ljg.8
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2019 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=OIMQ5gerYhuOsRypocR2IiSSlvfpiTfEKw63P5FeflU=;
        b=qks3GcI2JtvwXz3+YHwROnTIz+ULI/ibMgiuTNy3C7mWCEV0SyNNhaf2/j++4xQEt/
         IdHpIYIOgGsy10lmM1T9FbtyhTwIh+aWtUDuyUbMPBBrFEBwsWMM0+6cFoAoHYnxNYKK
         DxSCwjAZk6EocceqKxpZayFt9OVZuhAvTbytKKHmjlyzwaiKXPBKDp1I2YMddRVj4rDk
         MyM68aTxct+LEa7O+1+tjWQ3kD80ijAWelY/XB31Drmyexyd+bfyQT3mTh+dIyEV82Kn
         m2ISo/iZ3NbQszPb2ijDgqUZsHSTCQjrUUmuZUWCMJ/YaUC7UAsCL9QhNalLksc8B6bS
         AYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=OIMQ5gerYhuOsRypocR2IiSSlvfpiTfEKw63P5FeflU=;
        b=cqmZO5UaQ3vyOZdymqo11TyZ8lfpNyRYDHNi5XOUy6R0qHEOH0qPfiidON3vdvXTa2
         HQuXvxOCWBpK1urbMMAduaqXLCu1qoOy6NthLTeyguU4DjFOqEz+VuDyCb2H8eNM+ZcH
         6Kr6tFdJ5mP4jE0UbPFXUX4Mt6Mzo/B+ATvY+oG1HaXlARDzfVs8Ytwkrx65Yx89D8wX
         MszcPM3NKmjzpr5H+DRxXMzB5QrcBiiP3uSvN2lUXWTw7LDc2EN6BFiLiUor9gWW7BWP
         igv+PbZUK2vd5X1mPdfebQunTKvDTrnZxDOSQ/A11A/VWHYunTfc2TwR663UlbXQlkSQ
         KloQ==
X-Gm-Message-State: APjAAAWKRlRauhh1sDMP3/6ecJR4zb+CNSfZHqhVlOgy5ckFTacRzfXW
        qS1uXkxbq0/P2LQzBH4yEeq8IYDVEec=
X-Google-Smtp-Source: APXvYqzXASr5hEdWIknrvJUTLQbQyDYLPkCrGU0QQu8XvV8j3+0dFw6N53nQEI6Eg+5Y9MpN9BshKg==
X-Received: by 2002:a05:651c:1036:: with SMTP id w22mr9519786ljm.79.1567202230673;
        Fri, 30 Aug 2019 14:57:10 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id 63sm1053595ljs.84.2019.08.30.14.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 14:57:10 -0700 (PDT)
Date:   Fri, 30 Aug 2019 23:57:09 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/8] clk: renesas: rcar-gen3: Improve arithmetic
 divisions
Message-ID: <20190830215709.GR8479@bigcity.dyn.berto.se>
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190830134515.11925-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190830134515.11925-3-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-08-30 15:45:09 +0200, Geert Uytterhoeven wrote:
>   - Use div64_ul() instead of div_u64() if the divisor is unsigned long,
>     to avoid truncation to 32-bit on 64-bit platforms,
>   - Use div_u64() for 64-by-32 divisions.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> v2:
>   - New.
> ---
>  drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 043ab6ed9d550732..3480284a08308134 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -122,10 +122,10 @@ static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	unsigned int mult;
>  
>  	prate = *parent_rate / zclk->fixed_div;
> -	mult = div_u64(rate * 32ULL, prate);
> +	mult = div64_ul(rate * 32ULL, prate);
>  	mult = clamp(mult, 1U, 32U);
>  
> -	return (u64)prate * mult / 32;
> +	return div_u64((u64)prate * mult, 32);
>  }
>  
>  static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
