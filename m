Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F0DC3527D
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 17:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354771AbiEDRFW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 13:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356222AbiEDRE6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 13:04:58 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF617506F4
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 09:53:58 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so1760318fac.7
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2klMetXGa1eUlKZSFzvlKnCFZIMh5g+h156STL277cU=;
        b=xwSoPZhK4O9KfF0E9rB8njkdJRtTwkZ4NR9LCTG0wMvOKwKndxeRPvixpmBIcXqHdY
         qnYVcoFOds+xnLyeSRi6JCoJvovK5Ont8ITuL89eG48BDLXzDfbI7+wpAhSS4VqLEciS
         /ExulmzKoBHM1in91h9JtnFioxJJ+rQ4dOTGBUTyPiyzOCm25ErpRvSq4X/7e5xg6frM
         hsHarDuHST1RgfinipAKy/JnsW5bKxiotUgLWcM9FS5fR3VZ2LAqpOXfbkI13sUKo+bm
         O6AUeLw1hRpkjAOw9PYtndBN0mDjRpFPXAzA4IvNiK6aP9CHCbcgb7OCexn1diIWIYGI
         x2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2klMetXGa1eUlKZSFzvlKnCFZIMh5g+h156STL277cU=;
        b=Uq+vS2n1XY33fP60X0Fexgcq72RdTkosBB7udxwuvfgExruqP8mp9+8G6FlY5QeVuQ
         LGBaMWuGlxhh3kx0F7i6LJ0CZeYEMUEhxhvhRz6cfrJSn8Ml81SxXUZa2jMZmftvCmvb
         mEaTzyx0VToFmpjr/g/HuU+Ge3Tw7D6Z7+CpTGv3cnSEJDzguBz/a5P6iaHno2YfURsw
         fXHZP+jkCNAnSWIIeEK0T1Ny/bVDV/YpTjcjISQp6O3Em8LrfzUOrS/ABKEGh6phNokI
         Dx7oDlqymxB/nJPyXsIaIOuAjsCQpuoOlWrsK3Lz+UwaIp5bJv3VskbSiX70kI6v8hyU
         OTDQ==
X-Gm-Message-State: AOAM531RKxxY5BfgkYWDhfJWa5up5O6e1zKdHBAWoQeGB9OiwhEy8ZZ3
        ZLgA0OCh5h8JjQCGJq2MDy/Mmg==
X-Google-Smtp-Source: ABdhPJyocyOzuasLctGeqNeBJMplgmBUpdNyW29oi9jqBr4TwlqaFgI/BnBfrAb7QdBgNToE3dbmIQ==
X-Received: by 2002:a05:6870:b6aa:b0:ed:a7de:cc26 with SMTP id cy42-20020a056870b6aa00b000eda7decc26mr169045oab.259.1651683237792;
        Wed, 04 May 2022 09:53:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r42-20020a056808212a00b00325cda1ff85sm4484697oiw.4.2022.05.04.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:53:57 -0700 (PDT)
Date:   Wed, 4 May 2022 11:53:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
Message-ID: <YnKvoh+h07at8b65@builder.lan>
References: <20220412194505.614002-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412194505.614002-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 12 Apr 14:45 CDT 2022, Stephen Boyd wrote:

> Set the wake and sleep state for BCM clks here, not just the active
> state, as the active only state is dropped when CPUs go to deep idle.
> This ensures the clk is always on when the driver thinks it is on.
> 
> This was found by inspection, and could very well be incorrect if the
> RPMh hardware copies over the active only state to the sleep and wake
> states.
> 

Taking another look at this patch and now it makes perfect sense to me.
Sorry for not grasping the problem earlier.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Will you take this in fixes, or do you want me to pick it for 5.19?

> Cc: Alex Elder <elder@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index aed907982344..29da1ffd10cf 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -260,6 +260,7 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>  	struct tcs_cmd cmd = { 0 };
>  	u32 cmd_state;
>  	int ret = 0;
> +	enum rpmh_state state;
>  
>  	mutex_lock(&rpmh_clk_lock);
>  	if (enable) {
> @@ -274,15 +275,19 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>  		cmd.addr = c->res_addr;
>  		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>  
> -		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
> -		if (ret) {
> -			dev_err(c->dev, "set active state of %s failed: (%d)\n",
> -				c->res_name, ret);
> -		} else {
> -			c->last_sent_aggr_state = cmd_state;
> +		for (state = RPMH_SLEEP_STATE; state <= RPMH_ACTIVE_ONLY_STATE; state++) {
> +			ret = clk_rpmh_send(c, state, &cmd, enable);

Nit. We only need to pass the positive enable on the last iteration here...

Regards,
Bjorn

> +			if (ret) {
> +				dev_err(c->dev, "set %s state of %s failed: (%d)\n",
> +					!state ? "sleep" :
> +					state == RPMH_WAKE_ONLY_STATE	?
> +					"wake" : "active", c->res_name, ret);
> +				goto out;
> +			}
>  		}
> +		c->last_sent_aggr_state = cmd_state;
>  	}
> -
> +out:
>  	mutex_unlock(&rpmh_clk_lock);
>  
>  	return ret;
> 
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17
> -- 
> https://chromeos.dev
> 
