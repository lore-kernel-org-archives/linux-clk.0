Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2E0C43334
	for <linux-clk@archiver.kernel.org>; Tue,  7 Jun 2022 12:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243574AbiFGMSC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243583AbiFGMRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jun 2022 08:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91D53F7488
        for <linux-clk@vger.kernel.org>; Tue,  7 Jun 2022 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654604153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oMK24xIGG6wu595QaPQlChtbwsTC3JSyEhFxYI/TvBY=;
        b=FjUq0gs+Ne4/F5RXNkuLGNYNE6i12mTLsGAi87Scneatkv3b+jCoueak5RcsCcD9GWntWJ
        4fWeAcZ3ClsPhLgSwzTEKmh3XBzzs9nOJ6frKpHjrUf9agnxC3lHxKYF1HHeOhe5kwvPNS
        bQefxyAbpAdI4a7HgWjzzy7ClINr3pA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-ul_bECn9NJKtkBqrCystxA-1; Tue, 07 Jun 2022 08:15:52 -0400
X-MC-Unique: ul_bECn9NJKtkBqrCystxA-1
Received: by mail-qk1-f200.google.com with SMTP id v14-20020a05620a0f0e00b00699f4ea852cso13984524qkl.9
        for <linux-clk@vger.kernel.org>; Tue, 07 Jun 2022 05:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oMK24xIGG6wu595QaPQlChtbwsTC3JSyEhFxYI/TvBY=;
        b=1uNJ+2PUrScZAXi5svBTVJA09CSCfieBgaaVzj9YTme9YTFrRrdgUP/rygMLmRD6Yp
         pWbJ7fvY2/rWUsLiqd+n740q32w1O9tuaKW4Ju2hPNFkvRK+0L/iMnUnmWPaTI9VLfFi
         A+JJFJXqxEK41jgPBE6JD9E03/LQ4rElJet8/95OjXRtbtiJrxrrzguJdtBYFUANqObu
         lFfCUiW2BRi0SDiiUqi6zU5MY6/K068Vw586toUDXs9MZrdNGPB48ZlYCn0v0QQfxfUQ
         r7bgk0exfY/+4FivmkruXBzb4FXnzA3jfVh+qnRwcJFqtugQoOkDJtPN04oeyIUeT8Ay
         8qIA==
X-Gm-Message-State: AOAM530xY44ELULA6QfJGxMUWmYIsXZDdg9pWpmV1ZBlUSiJc9VgWPet
        744JkGwxHlLWFGMcINXvUJ6dXfJJEtYPGQj9mOiBjmSL4xXlajlZ4l9OIoKofTHN4TRx7rX+zgy
        agY+TYCPKQGti0dpSxhUI
X-Received: by 2002:ae9:df87:0:b0:6a6:acfe:f1ed with SMTP id t129-20020ae9df87000000b006a6acfef1edmr10438247qkf.579.1654604152054;
        Tue, 07 Jun 2022 05:15:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0A1/Z3+7HGeA0k9MPhFMYSifjOBR8tuyrQVy1bAdH0gssRyCDYA3k9yt79LLbL7gI80w4HQ==
X-Received: by 2002:ae9:df87:0:b0:6a6:acfe:f1ed with SMTP id t129-20020ae9df87000000b006a6acfef1edmr10438233qkf.579.1654604151818;
        Tue, 07 Jun 2022 05:15:51 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id bl33-20020a05620a1aa100b006a6f1c30701sm353511qkb.115.2022.06.07.05.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:15:50 -0700 (PDT)
Date:   Tue, 7 Jun 2022 07:15:48 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Bump parent usage count when GDSC is
 found enabled
Message-ID: <20220607121548.fhzpjcmoahlkue4t@halaneylaptop>
References: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 06, 2022 at 02:21:12PM -0700, Bjorn Andersson wrote:
> When a GDSC is found to be enabled at boot the pm_runtime state will
> be unbalanced as the GDSC is later turned off. Fix this by increasing
> the usage counter on the power-domain, in line with how we handled the
> regulator state.
> 
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 44520efc6c72..a1fa7c4cff60 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -420,6 +420,9 @@ static int gdsc_init(struct gdsc *sc)
>  				return ret;
>  		}
>  
> +		/* ...and the power-domain */
> +		gdsc_pm_runtime_get(sc);
> +
>  		/*
>  		 * Votable GDSCs can be ON due to Vote from other masters.
>  		 * If a Votable GDSC is ON, make sure we have a Vote.
> -- 
> 2.35.1
> 

Makes sense to me!

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

