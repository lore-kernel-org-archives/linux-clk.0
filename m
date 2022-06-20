Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C166CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 12:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242064AbiFTMJi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242281AbiFTMJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 08:09:35 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08994186DD;
        Mon, 20 Jun 2022 05:09:32 -0700 (PDT)
Received: from [192.168.1.101] (abxh227.neoplus.adsl.tpnet.pl [83.9.1.227])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7B8E420068;
        Mon, 20 Jun 2022 14:09:30 +0200 (CEST)
Message-ID: <e1ba3dd9-206c-8f9f-743d-dba1608732cd@somainline.org>
Date:   Mon, 20 Jun 2022 14:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/7] clk: qcom: gcc-msm8916: move
 gcc_mss_q6_bimc_axi_clk down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
 <20220619212549.1240891-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220619212549.1240891-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19.06.2022 23:25, Dmitry Baryshkov wrote:
> The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
> Move it down in the file to come after the source clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
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
