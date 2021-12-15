Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D73C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 09:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241111AbhLOJSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 04:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbhLOJSo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 04:18:44 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968ECC061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 01:18:44 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0CB4320379;
        Wed, 15 Dec 2021 10:18:43 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:18:41 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 02/15] clk: qcom: gpucc-sdm660: get rid of the test
 clock
Message-ID: <20211215091841.r3fahl5stxacuzey@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-12-15 03:54:10, Dmitry Baryshkov wrote:
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Fair enough, the test clock doesn't even exist in this driver: it's
merely an unused enum variant.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gpucc-sdm660.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
> index 7c07b0979aea..71a1ee05e822 100644
> --- a/drivers/clk/qcom/gpucc-sdm660.c
> +++ b/drivers/clk/qcom/gpucc-sdm660.c
> @@ -29,7 +29,6 @@
>  
>  enum {
>  	P_GPU_XO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL0_OUT_MAIN_DIV,
>  	P_GPU_PLL0_PLL_OUT_MAIN,
> -- 
> 2.33.0
> 
