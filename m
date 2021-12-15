Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD67C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 09:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241049AbhLOJN5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 04:13:57 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:44583 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhLOJN5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 04:13:57 -0500
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2B426203E2;
        Wed, 15 Dec 2021 10:13:55 +0100 (CET)
Date:   Wed, 15 Dec 2021 10:13:53 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 01/15] clk: qcom: gpucc-sdm660: fix two clocks with
 parent_names
Message-ID: <20211215091353.vr4afla7ffbwjxzf@SoMainline.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
 <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-12-15 03:54:09, Dmitry Baryshkov wrote:
> Two clocks are still using parent_names, use parent_hws instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nice catch!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
> index 41bba96a08b3..7c07b0979aea 100644
> --- a/drivers/clk/qcom/gpucc-sdm660.c
> +++ b/drivers/clk/qcom/gpucc-sdm660.c
> @@ -204,8 +204,8 @@ static struct clk_branch gpucc_rbbmtimer_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gpucc_rbbmtimer_clk",
> -			.parent_names = (const char *[]){
> -				"rbbmtimer_clk_src",
> +			.parent_hws = (const struct clk_hw*[]){
> +				&rbbmtimer_clk_src.clr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -222,8 +222,8 @@ static struct clk_branch gpucc_rbcpr_clk = {
>  		.enable_mask = BIT(0),
>  		.hw.init = &(struct clk_init_data){
>  			.name = "gpucc_rbcpr_clk",
> -			.parent_names = (const char *[]){
> -				"rbcpr_clk_src",
> +			.parent_hws = (const struct clk_hw*[]){
> +				&rbcpr_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> -- 
> 2.33.0
> 
