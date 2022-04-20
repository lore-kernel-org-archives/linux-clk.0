Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B421FC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 20 Apr 2022 02:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238634AbiDTCuA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 22:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241999AbiDTCuA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 22:50:00 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CF73878C
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id b188so598208oia.13
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
        b=iruwlQMQmkHPdfb5AUtOdH7s6RB4z+YA3vS74UUFPPoI9qTD2pH2mcQTnXg78CVToG
         Q5zsNfXphSO1QQAk/vj3875wHTzoeSlZ2vXJO7asCXN5yVk/jZK7KSzWIN+zQrtjHSzC
         JgLnEjBkjJMfRSqoiGAfGUFtMKk5Qd1MHOcNNK9rXQ2N79STDLNknk3YsCQqROd8eqDN
         K83lmvqOaYoK5rTmwC1AcQhk/7BiBVtX+7UPL3qdAkdGRGvB06YApqKCgowV1mMo16wa
         JdLAiTaTpGjpbImKUzleBacTZtMddsi30sZpK2RLjT2atcF2jhXSpjpCs7xbkuxbnlEa
         Bv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=84Z8Ou62HiUqb8n4/xIdxq8unXBMW3W4N2w/x005ArY=;
        b=LlFdGfBkjuoTnMJ3xnttv29NhTbTf0NcS6BlsYoLEJlK/O2eiRSNQBTR515FxY71N6
         VWpK4jmyn2wVWhzXIQ/KtZGYVK7BCgQuHN7XgPRGdZf4OzjGVNEsx8S9ECb5sS4Sut65
         Vccf0jbCL5cCBBVvYw73R9TrzcmGuWYT5a5rL29CI2472XP6WCpl+2z6WopP/s8E5A2g
         XXxyT+gZahIvp5eNIJb0+ZtRKjTtpo5CGziH8PS9vy1GIPg+6S5w2lr8YOEw2ljotbeI
         BEV+e7yRB9Wx7/qnqcRipWpiLsDB+m4ydYv4N+2v1qA9sAPhqaa/e3VkxzhFHQZaHiD0
         2ZXQ==
X-Gm-Message-State: AOAM531dizQS6BdRIGjWcqWg1Es6b6+/czVVp0RphRTvfBSBkhzeVwgf
        scuwMZiQx3NMFDO+xb6PLSeLbg==
X-Google-Smtp-Source: ABdhPJwpUgs1fxza/ioCVfipQG6pgrpTluzQomDGAxienilt70kyO+VUXsamqwicKGfF+JtOL5M7+g==
X-Received: by 2002:a05:6808:140a:b0:2f9:a830:d12e with SMTP id w10-20020a056808140a00b002f9a830d12emr772201oiv.235.1650422835061;
        Tue, 19 Apr 2022 19:47:15 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o19-20020a4a9593000000b0032176119e65sm6117380ooi.34.2022.04.19.19.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 19:47:14 -0700 (PDT)
Date:   Tue, 19 Apr 2022 21:47:12 -0500
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
Message-ID: <Yl90MENoa52cGtna@builder.lan>
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Stephen, please pick this for -fixes.

Thanks,
Bjorn

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
