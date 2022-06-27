Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC056C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 21:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241176AbiF0VSw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 17:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241151AbiF0VSs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 17:18:48 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCE118B22
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 14:18:47 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 95447205A7;
        Mon, 27 Jun 2022 23:18:45 +0200 (CEST)
Date:   Mon, 27 Jun 2022 23:18:44 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v3 5/7] clk: qcom: gcc-msm8916: move
 gcc_mss_q6_bimc_axi_clk down
Message-ID: <20220627211844.6kwk2kyalgyb3ysm@SoMainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <20220619212735.1244953-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619212735.1244953-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022-06-20 00:27:33, Dmitry Baryshkov wrote:
> The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
> Move it down in the file to come after the source clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/clk/qcom/gcc-msm8916.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 7962edbdbcf6..4d726ca4b0da 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -2594,23 +2594,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
>  	},
>  };
>  
> -static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
> -	.halt_reg = 0x49004,
> -	.clkr = {
> -		.enable_reg = 0x49004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gcc_mss_q6_bimc_axi_clk",
> -			.parent_names = (const char *[]){
> -				"bimc_ddr_clk_src",
> -			},
> -			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch gcc_oxili_ahb_clk = {
>  	.halt_reg = 0x59028,
>  	.clkr = {
> @@ -2860,6 +2843,23 @@ static struct clk_branch gcc_bimc_gpu_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_mss_q6_bimc_axi_clk = {

How'd you settle on placing it here?  It isn't right below
bimc_ddr_clk_src, nor the last user of bimc_ddr_clk_src, doesn't seem to
have any alphabetical or .enable_reg related ordering to the other clks
either?

> +	.halt_reg = 0x49004,
> +	.clkr = {
> +		.enable_reg = 0x49004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_mss_q6_bimc_axi_clk",
> +			.parent_names = (const char *[]){
> +				"bimc_ddr_clk_src",
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch gcc_jpeg_tbu_clk = {
>  	.halt_reg = 0x12034,
>  	.clkr = {
> -- 
> 2.35.1
> 
