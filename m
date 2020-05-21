Return-Path: <SRS0=ANMQ=7D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B42C433DF
	for <linux-clk@archiver.kernel.org>; Thu, 21 May 2020 05:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11345207D8
	for <linux-clk@archiver.kernel.org>; Thu, 21 May 2020 05:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="minxTFlf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgEUFbV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 May 2020 01:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgEUFbU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 May 2020 01:31:20 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C8AC05BD43
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2020 22:31:19 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x13so2774303pfn.11
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2020 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JRDVqTKJQn9dGE105GZgiJ5dIsRRSP/IE0bUFoyPwmE=;
        b=minxTFlfVaz+SQH5XAqsAX1gwrfQV0SdY3KPyk3AA1TjZ6nBs+FvNcAzctmxiE0EK2
         06mrdQCQqsZPfkXdRQ8qP89raYNqyLpMT0vLB2iEXPJh6ny/my0yqBVLVh81LmVBw0lU
         juUnhG5y0owA8r48hnlnnTt3ZqlD7q4bFS+lU3W3lFEgICPEjgj4cwO66HwP+xdXeVN2
         X7WWLeYS2lqfnRSD4BAVnC3+PB/fJa1mqZc11hsv0yoI9HuTPFourSlVaB6IAE50tnlN
         1XpVIz8wJIujOVOHASrdXjIr5/EjdPlE1EFau6jk6QodfuDmLTOmpilWzvcLH+J7375Z
         Cu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JRDVqTKJQn9dGE105GZgiJ5dIsRRSP/IE0bUFoyPwmE=;
        b=c+OSIZnof2M1k3HejFvSJk5Q3Mt4/VGC4LtfmhXpermvNJ1sENzBfE39FWGvxV0X2K
         Gja7P1fQX9SvCJnm1AtDGNVJBjtiknkePu2dwQf1YeWHezQv8wty2zk5Wv7SnLKKWRtM
         kdUv/1EHU+3Scex1hdPQR4RJLx+IISgsvHylklEI4GWoWJHory24w+tp7af6Z6AjuJb7
         voQwW/gqF7vZyPeFjlidV2rT86iEJo3KDcQoDyeCTZ1OK2FbOIZCnfOj5aGtdG3UFMpl
         9UB6NndJ3U00kDvYBpWp778x6FbH9ZyTEAuuMMjdK3J2lsFA8X6Q53sN9cYsRnT5PoCu
         ugRQ==
X-Gm-Message-State: AOAM53246qKOtmiwex3tesXoRWRufxeLcFxv7FeiM2PT6oqRTgsi7tj1
        8Yr3vm4Vuk9EGw1NNTtEbGzzMA==
X-Google-Smtp-Source: ABdhPJynp4GTJ87m3nlVCg3ltv9cM+qafeErszv1aY5MJp0I7TBIe7mHWz7XYuDvahHx8iXuUDBCYQ==
X-Received: by 2002:a62:2544:: with SMTP id l65mr7776595pfl.288.1590039078602;
        Wed, 20 May 2020 22:31:18 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e16sm3007001pgg.8.2020.05.20.22.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 22:31:17 -0700 (PDT)
Date:   Wed, 20 May 2020 22:31:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix parent for gpll0_out_even
Message-ID: <20200521053115.GF11847@yoga>
References: <20200521052728.2141377-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521052728.2141377-1-vkoul@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 20 May 22:27 PDT 2020, Vinod Koul wrote:

> Documentation says that gpll0 is parent of gpll0_out_even, somehow
> driver coded that as bi_tcxo, so fix it
> 
> Fixes: 2a1d7eb854bb ("clk: qcom: gcc: Add global clock controller driver for SM8150")
> Reported-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gcc-sm8150.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 2bc08e7125bf..72524cf11048 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -76,8 +76,7 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
>  	.clkr.hw.init = &(struct clk_init_data){
>  		.name = "gpll0_out_even",
>  		.parent_data = &(const struct clk_parent_data){
> -			.fw_name = "bi_tcxo",
> -			.name = "bi_tcxo",
> +			.hw = &gpll0.clkr.hw,
>  		},
>  		.num_parents = 1,
>  		.ops = &clk_trion_pll_postdiv_ops,
> -- 
> 2.25.4
> 
