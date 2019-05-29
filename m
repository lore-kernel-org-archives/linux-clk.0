Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA8BC28CC0
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 21:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EA02241E0
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 21:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="q7RBmWip"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfE2VKJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 17:10:09 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33156 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfE2VKJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 17:10:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so3270818lfe.0
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2019 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Mu5MGiwViAE+xq3hYJVecKhrhSmdgp+dy0KSK59tJJQ=;
        b=q7RBmWipjWlju0c41VvigqOXIk1DHR+H76XwOrJtqCU1G+2CXeXcUuG3K44zkwDp+2
         9LzH/KNMAYFMDhlBOwDGclMMxcSD7ElKD6PKZ4GoU4LF1uuXxuro7d5mFJi8jWcW/eZP
         UnG4YFQJhGvLfF/CX4aL1/G9bIhMHL152eqyHiYUnRhAHKHO18OwU9Vrokd42Unt0UtR
         LXR5ls+D2SdbpSSLA3wP4dwEXPeHujWC0q8qtoTijto1v/a2iLViNmUi0YGXvOc++HFc
         u9IyM/GyDngsdEB+UUcuNSv8l7KPgk6QtkkfapeRBvwxv9J7xnwsLbqRzr5Luq883BcB
         e2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Mu5MGiwViAE+xq3hYJVecKhrhSmdgp+dy0KSK59tJJQ=;
        b=rSXcvOOGva+7Xz150QxXiLaWjW5LBSjKABeVOH3YbcmmAy50SPSXE+dYoiqFAQgBnI
         ZxAErRVpEG2uc8WQOJICcjofH8+YgO00ENrEZ6Qu5tIVFDKagtM6eKNt/nXQPZrvZZl8
         DYO2dvaPIELf5QWuohHdY5mk98zKkaiVRaRGo1es7x4lPR0TfvmjFYHW1yrgdLFh/wzg
         2G5GnlyFLG+erAAEN/EBRAafMyc5ZbIjM+zwYY7YIe89SXSFxzQqdXkhP+9fBpVlixy9
         Q1/czp9wVHSQhnSKHVBlg0hn+8d/LEQ0NgrQweM2BLKyG71IFktJcEMIzjOKuZfe1I7z
         Vavw==
X-Gm-Message-State: APjAAAUq0kXdXp7Hz4MClsJm4hd6oBKUI1N7If0QWK1+Nc/TDtOpV/Gq
        hjou29vVeDPn04JvLKSb9pdeFA==
X-Google-Smtp-Source: APXvYqwzIF80yYZ/jteMvGKNCS+XyzpSGUWpSJfGRPE95IKFnWMZOJ2nNtFQbjiCMq5QxWGOxhABdw==
X-Received: by 2002:ac2:43b7:: with SMTP id t23mr27804lfl.110.1559164207194;
        Wed, 29 May 2019 14:10:07 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id g22sm83602lje.43.2019.05.29.14.10.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 14:10:06 -0700 (PDT)
Date:   Wed, 29 May 2019 23:10:05 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529211005.GO1651@bigcity.dyn.berto.se>
References: <20190527123420.7057-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527123420.7057-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-05-27 14:34:20 +0200, Geert Uytterhoeven wrote:
> pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> memory.  Hence there is no need to print error messages on failure, as
> the memory allocation core already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.3.
> 
>  drivers/clk/renesas/renesas-cpg-mssr.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index d1054204f3a75022..082d0bf12ea7f219 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -509,16 +509,12 @@ int cpg_mssr_attach_dev(struct generic_pm_domain *unused, struct device *dev)
>  		return PTR_ERR(clk);
>  
>  	error = pm_clk_create(dev);
> -	if (error) {
> -		dev_err(dev, "pm_clk_create failed %d\n", error);
> +	if (error)
>  		goto fail_put;
> -	}
>  
>  	error = pm_clk_add_clk(dev, clk);
> -	if (error) {
> -		dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
> +	if (error)
>  		goto fail_destroy;
> -	}
>  
>  	return 0;
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
