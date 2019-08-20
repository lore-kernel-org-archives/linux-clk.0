Return-Path: <SRS0=z1pn=WQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2A0C3A589
	for <linux-clk@archiver.kernel.org>; Tue, 20 Aug 2019 05:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9505214DA
	for <linux-clk@archiver.kernel.org>; Tue, 20 Aug 2019 05:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r64wB7eo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbfHTFGr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Aug 2019 01:06:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42410 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfHTFGr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Aug 2019 01:06:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id i30so2612478pfk.9
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 22:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OqyBt72+HRdQSPxvyiOhBsg4vGDZX8wKRIhh8Lp7a2k=;
        b=r64wB7eot4fP/Bp5C/HtJxo8jbVwoW3MWjNDRUxDecaVsdLQrsh1QWdqqBym4WJ9ZS
         bcS+leU2JHV1ZGAkweyrD60H1vXvJD5UEQFBGF3mShFuiCpRCR0FDayhNE6kWq1+vtcH
         tXkazx48o6gKzdkAGpcJuDB6/1flUGoIQS1f1FAHynDA4Olscne9OqC0tozXXmqNvVD9
         OqhljtSEWzYtBQYtzQHXXBucCkTtCvj/iI1qAbhA22amHFwmuXqp5P7lDunU9MoAPT/P
         GJIz3exkovLjMtmoKj2x07ywRKpMhWza774YrT7Qa+0SV0NSO6KjZsYcb/9JwUjD2m9S
         3XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OqyBt72+HRdQSPxvyiOhBsg4vGDZX8wKRIhh8Lp7a2k=;
        b=SaGVZNoq0g353USLqEB1PZEgl0HwXj1dfRsx4j3pThZTz07TxNuptNJKBhH0+0WXqU
         cbfRQnqk7oE1dV7arYD7EhuDd6QXX198J069ktLWvGkasTw65yrvWuXZzSFg16oRmGKn
         YVh3OHptrQIDBhwmC+Q2xOcxOf7osP3jXA2a+m2WwPhNdz4lgUnrUWVO7OC2O/j2ZJH6
         LwSxKjTL0Xi2Y1OXdPw4iCSun8BnqkPnHWb/CX1UXD7VRtoyjMxrjk/mXAW7XHozzuct
         P78+y/Dy4UL/feQSSWgtOlum3w5ieM3my0WXBz2pub1NDYSDbvg28lkO3Z/N8vz3P2NM
         lhUg==
X-Gm-Message-State: APjAAAUtM3GEZLaz9EjVCyrC6Ec0wrpqtVDF4NmcInANVRCI+zUS7+C5
        b+ZWsRMe8OC7Cboscbj/7kWVxg==
X-Google-Smtp-Source: APXvYqzfpmTbPMUDkRGO94REyg9svhHdPNoykxj+dBjibXscnZyM67qn9OYMTb+x0zwriqoXqBchTA==
X-Received: by 2002:aa7:8202:: with SMTP id k2mr28630274pfi.31.1566277606440;
        Mon, 19 Aug 2019 22:06:46 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 4sm10321880pfe.76.2019.08.19.22.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 22:06:45 -0700 (PDT)
Date:   Mon, 19 Aug 2019 22:08:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Message-ID: <20190820050829.GJ26807@tuxbook-pro>
References: <20190819073947.17258-1-vkoul@kernel.org>
 <20190819073947.17258-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819073947.17258-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 19 Aug 00:39 PDT 2019, Vinod Koul wrote:

> Convert the rpmh clock driver to use the new parent data scheme by
> specifying the parent data for board clock.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c3fd632af119..16d689e5bb3c 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name,					\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo",		\
> +					.name = "xo",		\

Shouldn't .name be "xo_board" to retain backwards compatibility?

Regards,
Bjorn

> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> @@ -110,7 +113,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name_active,				\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo",		\
> +					.name = "xo",		\
> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	}
> -- 
> 2.20.1
> 
