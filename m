Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DEFC3A589
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 02:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C86D120B7C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 02:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLKes6Ha"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfHSCVJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 22:21:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41079 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSCVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Aug 2019 22:21:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so187885pls.8
        for <linux-clk@vger.kernel.org>; Sun, 18 Aug 2019 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qfYeBrzqOCPRbAe0pH/EnZQJIAn9XVbtwSzrmk2jdBg=;
        b=qLKes6Hago17zpLfMDPt+c2OQICgyL5TOJe/NImEsKiFOyFi2hKnHGlqPa17Y9R6R0
         10mSZy6G4KtzroTNnEYfNx73PHe9DGThJZYLRUcabz95eKxutS7l/tQubrL2aHrBXCEn
         w4r1JEVEhOldhGXagrL3vADQ/dulzzHfwy6QWSAGovJBZ+gfsvO3JF97rHpPhiaZWWE2
         hsfWY0w3MhLVtguVB+e5LAW0QnsiiOZa2krUl4eVu1p0ZW+PwyQ9en4vyuqgXXZL5Fgj
         WJ9XVkP5d3pEiYoNl7uJ2RsROmG9Y+5kE68c2m42ZdOYCoVFJ1EYYV95jGxoOnJOlDxX
         HSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qfYeBrzqOCPRbAe0pH/EnZQJIAn9XVbtwSzrmk2jdBg=;
        b=E3rmHvdjTD+cUpHuVPIdbsx+/rVDRTDf5GxihWTdtgo9mD8UVFqYx70MxY50nHvHCi
         76Yk63R4CG0g5Yzdsb9nqn4n0N+2G3WuPz21UR5HibNnNYT4xPPq+EJOkRuuxH8iHd47
         4aXL7twskAMJmxccbi6CwXbO0iS00aH//H/7arCEaX2lqnkjaB5TE7aYi4f8VFMEl3JQ
         O5VSDWnZRImm3/vUx3O0YekE2HdCS+oi/R2qteCGPaj2irniMzJXTu076viJBA484QHF
         vyhu8v9okP794PGkBlbzv5odyXYRMJ3qedgiTXQwjzGqmxcGxvYt1VdsE0K65Hd9i4T+
         iCuQ==
X-Gm-Message-State: APjAAAWdRyD6Rr51Bi0u8NHzRSHHlJdtphbA5FzuD/z6UqBqpC7yEawa
        U2Q9dDX0DFAJH4sJLYrUAtEwbw==
X-Google-Smtp-Source: APXvYqxdUTgjI3vU7RPeKEZyZugm05SkqUttUbintank9MC7jvaxmAGcmtlcUJdxpp+cUyrtgB/ZWw==
X-Received: by 2002:a17:902:45:: with SMTP id 63mr20259916pla.264.1566181268365;
        Sun, 18 Aug 2019 19:21:08 -0700 (PDT)
Received: from localhost ([122.172.76.219])
        by smtp.gmail.com with ESMTPSA id n128sm13333302pfn.46.2019.08.18.19.21.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Aug 2019 19:21:07 -0700 (PDT)
Date:   Mon, 19 Aug 2019 07:50:38 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     vireshk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: spear: Make structure i2s_sclk_masks constant
Message-ID: <20190819022038.wkmod5qezx55e2gy@vireshk-i7>
References: <20190813085714.8079-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813085714.8079-1-nishkadg.linux@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13-08-19, 14:27, Nishka Dasgupta wrote:
> Static structure i2s_sclk_masks, having type aux_clk_masks, is only used
> when it is passed as the sixth argument to function clk_register_aux().
> However, clk_register_aux() is defined with its sixth argument as const.
> Hence i2s_sclk_masks is not modified by clk_register_aux, which is also
> the only usage of the former. Therefore make i2s_sclk_masks constant as
> it is never modified.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/clk/spear/spear1340_clock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/spear1340_clock.c b/drivers/clk/spear/spear1340_clock.c
> index e5bc8c828cf0..9163bbb46411 100644
> --- a/drivers/clk/spear/spear1340_clock.c
> +++ b/drivers/clk/spear/spear1340_clock.c
> @@ -335,7 +335,7 @@ static const struct aux_clk_masks i2s_prs1_masks = {
>  };
>  
>  /* i2s sclk (bit clock) syynthesizers masks */
> -static struct aux_clk_masks i2s_sclk_masks = {
> +static const struct aux_clk_masks i2s_sclk_masks = {
>  	.eq_sel_mask = AUX_EQ_SEL_MASK,
>  	.eq_sel_shift = SPEAR1340_I2S_SCLK_EQ_SEL_SHIFT,
>  	.eq1_mask = AUX_EQ1_SEL,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
