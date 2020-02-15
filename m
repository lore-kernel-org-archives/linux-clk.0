Return-Path: <SRS0=2DPS=4D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A85C352A4
	for <linux-clk@archiver.kernel.org>; Sat, 15 Feb 2020 07:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2B992086A
	for <linux-clk@archiver.kernel.org>; Sat, 15 Feb 2020 07:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWIz6DVL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgBOHd0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Feb 2020 02:33:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36893 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgBOHdZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Feb 2020 02:33:25 -0500
Received: by mail-pg1-f195.google.com with SMTP id z12so6248327pgl.4
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2020 23:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j2dlqe8IHtaY+LXzB/pHVq0hnRV+mre/jg+PwqEvcS8=;
        b=AWIz6DVLJIdQMqoVfz3wRh+Vy3/YO6Rj8qdKR2ACR5688rL4INQjtCNtispusY7Ghb
         l+/zlkPJOyc9OvjpGe49NyVv5RN8BXhSxij1ywTbneVx/yeJdoAa72TerVGYvsoeQ21Z
         pVzSt2aZvqMDeByl6BvVzbktr7TDkoQelaONUM1M9diTwokpM62mCAkUc9qZB47sT9xJ
         dVUf2Wv+swFD0uj4xCzd/YNgHJKupqzR3fKOVgabOZbexx6idJNwtj3FU8ZjZu25PoY5
         ebMGD+wkA41u48Ku7MC8KpJuVLez9j01fvFOUtnauOxGJopZHIA9iFIcVof484y/BJJP
         71sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j2dlqe8IHtaY+LXzB/pHVq0hnRV+mre/jg+PwqEvcS8=;
        b=P0IOrvQpWch/DoutbFDxrtjiqt0Ebuk6WgkGptPn4Pg1q9odF/txGwbYrK7IEh8Mjd
         Nice/klb43kYF8LI6GhhlhIihtYPacQLHxzHs/Zw2Vz+rLxTmmKmsm/RAZNw4Q1wFk+V
         uYmEMKr5kD9ou91tCVzznP5eUJPjlbo0r0/LQoP5ia9On2bmBsYW9LbaCCn6lD2xSIxv
         8Yas3+KyZG78vU5Kz62I2yB1ZEh0lTD7Nc8KZY0/WStIQwSG6mVEsCeLojAv8nksTRFv
         ithZUk4gcCwGJb0LnaxPX+l4PnbsvZZYgTt6MM0Hqv2Zb8R4U0PKEOPdw5qTArEx5Uv2
         3LUw==
X-Gm-Message-State: APjAAAXEQ39a4YRgRDIDIQjYT2g/kjGEzJxUZKAmbQ3KJ9CR9IPr33tx
        FS7heB0oEokyc7E5dvdC5Mefvw==
X-Google-Smtp-Source: APXvYqwzKt7r8ABDtNBtoVyypViXPLxmsWx0rlgyfwfvOampDMUmR5cQA/VWM5u3tqLUqTrYXWhqjg==
X-Received: by 2002:a63:df0a:: with SMTP id u10mr7715505pgg.282.1581752005210;
        Fri, 14 Feb 2020 23:33:25 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t16sm9912477pgo.80.2020.02.14.23.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 23:33:24 -0800 (PST)
Date:   Fri, 14 Feb 2020 23:32:33 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mike Tipton <mdtipton@codeaurora.org>
Cc:     sboyd@kernel.org, tdas@codeaurora.org, mturquette@baylibre.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-rpmh: Wait for completion when enabling
 clocks
Message-ID: <20200215073233.GR955802@ripper>
References: <20200215021232.1149-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200215021232.1149-1-mdtipton@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 14 Feb 18:12 PST 2020, Mike Tipton wrote:

> The current implementation always uses rpmh_write_async, which doesn't
> wait for completion. That's fine for disable requests since there's no
> immediate need for the clocks and they can be disabled in the
> background. However, for enable requests we need to ensure the clocks
> are actually enabled before returning to the client. Otherwise, clients
> can end up accessing their HW before the necessary clocks are enabled,
> which can lead to bus errors.
> 
> Use the synchronous version of this API (rpmh_write) for enable requests
> in the active set to ensure completion.
> 
> Completion isn't required for sleep/wake sets, since they don't take
> effect until after we enter sleep. All rpmh requests are automatically
> flushed prior to entering sleep.
> 
> Fixes: 9c7e47025a6b ("clk: qcom: clk-rpmh: Add QCOM RPMh clock driver")
> Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/clk-rpmh.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 12bd8715dece..3137595a736b 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -143,6 +143,19 @@ static inline bool has_state_changed(struct clk_rpmh *c, u32 state)
>  		!= (c->aggr_state & BIT(state));
>  }
>  
> +static int clk_rpmh_send(struct clk_rpmh *c, enum rpmh_state state,
> +			 struct tcs_cmd *cmd, bool wait_for_completion)
> +{
> +	int ret;
> +
> +	if (wait_for_completion)
> +		ret = rpmh_write(c->dev, state, cmd, 1);
> +	else
> +		ret = rpmh_write_async(c->dev, state, cmd, 1);
> +
> +	return ret;
> +}
> +
>  static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
>  {
>  	struct tcs_cmd cmd = { 0 };
> @@ -159,7 +172,8 @@ static int clk_rpmh_send_aggregate_command(struct clk_rpmh *c)
>  			if (cmd_state & BIT(state))
>  				cmd.data = on_val;
>  
> -			ret = rpmh_write_async(c->dev, state, &cmd, 1);
> +			ret = clk_rpmh_send(c, state, &cmd,
> +				cmd_state && state == RPMH_ACTIVE_ONLY_STATE);
>  			if (ret) {
>  				dev_err(c->dev, "set %s state of %s failed: (%d)\n",
>  					!state ? "sleep" :
> @@ -267,7 +281,7 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>  	cmd.addr = c->res_addr;
>  	cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>  
> -	ret = rpmh_write_async(c->dev, RPMH_ACTIVE_ONLY_STATE, &cmd, 1);
> +	ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
>  	if (ret) {
>  		dev_err(c->dev, "set active state of %s failed: (%d)\n",
>  			c->res_name, ret);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
