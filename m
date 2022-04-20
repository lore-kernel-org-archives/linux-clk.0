Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9A7C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 20 Apr 2022 02:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242900AbiDTCv1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 22:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238819AbiDTCv0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 22:51:26 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6253878E
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 19:48:42 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id r14-20020a9d750e000000b00605446d683eso246354otk.10
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 19:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
        b=xJQQvbGeiv55LxOgRCAxCgC9ZiBXWIggFHAJQV+kqOo/UxUl+LQqeAmAvnk7ypXt5V
         se5zB4Ez70kwsW8uPe+64bZzeadkPOkPg3c8sFvMS74WiPjabZ/cEm+S8w5IBAt/POhJ
         20tph+hKKIc1Rt5DSHPY3ueFYM9+Us1NVQKXMKiMwDyAI7GC+sfbC7n6aZGfKTP0Qegc
         fiRyzh4V8hHOgAGEBcLA86KqxAW1G5RaVemUcn9F4tmgwawojJN5ZCfPvl+Icqdp65N4
         gcNhDqpjrch4yLNwUu5AUrXGNZSunusoxGSUhL2YamKpprMNvIT4vp1cDS3uSEFWGzH6
         lkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2eKNulS3qlhgDAvYpJZI0rmczwYonxuVadqbW93L0aw=;
        b=MyGiZkfXQFm9oT5GojbcRrRJRA6hVdFGZMwMg9Mbs4qQFn1wWbbF5ikLrw4UJ1IyD+
         spko3yih8j4spUPb5HwLMt2RZep+um93CeFaeQGJmHE/GchtPjpsQoC/rrlr9fzLof6Z
         8NRkoctyvE1wcKD4HcEMeGAz2PhlFpuRD7dzFHQsVnsQxKAHZyNJneM1A5D3Zg5xZZum
         jiImOleRK3lYIGVOdCUgS1R1j0TzxaJX5ICZU2Heo2mq8OwTmjkB3CLO2r7wjUeujHA5
         aKf+Ga165HQ15o260v8hFvVBPOixGwwgEU2Z7xxkiaWTFKbaHmUJxyL71uUog7hAdmxl
         YHpg==
X-Gm-Message-State: AOAM530BGTaLdm/lFG/I21PNL3txfv+1WsVCalT6/Px+Z1GpA+k1/Qwz
        sXSZ1zwKrV/kPZ8bJmaV81Aejw==
X-Google-Smtp-Source: ABdhPJyDQoZdetLa1WR+iC8qmsQIEGsOqkaYfUCgaps/vrkB92VYUqzJ5B11+iUsOjAXBVem+glQDg==
X-Received: by 2002:a9d:6d06:0:b0:605:4e8e:fe89 with SMTP id o6-20020a9d6d06000000b006054e8efe89mr3984218otp.329.1650422921576;
        Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bp17-20020a056808239100b00322c34c4afbsm1165291oib.25.2022.04.19.19.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:48:41 -0700 (PDT)
Date:   Tue, 19 Apr 2022 21:48:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
Message-ID: <Yl90hxm7+nbAV4cN@builder.lan>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 19 Apr 18:54 CDT 2022, Dmitry Baryshkov wrote:

> Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> the clk_core_determine_round_nolock() would clamp the requested rate
> between min and max rates from the rate request. Normally these fields
> would be filled by clk_core_get_boundaries() called from
> clk_round_rate().
> 
> However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> which did not have these fields filled. Thus the requested frequency
> would be clamped to 0, resulting in weird frequencies being requested
> from the hardware.
> 
> Fix this by filling min_rate and max_rate to the values valid for the
> respective PLLs (0 and ULONG_MAX).
> 
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")

Reported-by: Rob Clark <robdclark@chromium.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index f675fd969c4d..e9c357309fd9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  				    struct clk_rate_request *req)
>  {
> -	struct clk_rate_request parent_req = { };
> +	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>  	struct clk_hw *xo, *p0, *p1, *p2;
>  	unsigned long p0_rate;
> -- 
> 2.35.1
> 
