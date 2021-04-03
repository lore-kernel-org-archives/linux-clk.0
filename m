Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8572C433ED
	for <linux-clk@archiver.kernel.org>; Sat,  3 Apr 2021 10:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84259611BD
	for <linux-clk@archiver.kernel.org>; Sat,  3 Apr 2021 10:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhDCK6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Apr 2021 06:58:42 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:43141 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236572AbhDCK6l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Apr 2021 06:58:41 -0400
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 46C832007C;
        Sat,  3 Apr 2021 12:57:56 +0200 (CEST)
Subject: Re: [PATCH v3 11/16] clk: qcom: dispcc-sdm845: convert to parent data
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
 <20210402205804.96507-12-dmitry.baryshkov@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <962cc7f2-715e-4646-5071-e620aa29d9f6@somainline.org>
Date:   Sat, 3 Apr 2021 12:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402205804.96507-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

On 4/2/21 10:57 PM, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sdm845.c | 188 ++++++++++++++++---------------
>   1 file changed, 95 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 5c932cd17b14..bf5e8a4a0230 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -122,7 +124,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>   	.parent_map = disp_cc_parent_map_0,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "disp_cc_mdss_byte0_clk_src",
> -		.parent_names = disp_cc_parent_names_0,
> +		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = 4,

While changing the surrounding lines, isn't it common practice to use 
ARRAY_SIZE(disp_cc_parent_data_0) here and below?

>   		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_byte2_ops,

> @@ -381,8 +383,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
>   		.enable_mask = BIT(0),
>   		.hw.init = &(struct clk_init_data){
>   			.name = "disp_cc_mdss_byte0_clk",
> -			.parent_names = (const char *[]){
> -				"disp_cc_mdss_byte0_clk_src",
> +			.parent_data = &(const struct clk_parent_data){
> +				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,

For this commit and all other "convert to parent data" commits in this 
series:  It should be possible to use .parent_hws which is a little more 
lightweight when only referencing parents that are internal to this clk 
controller.  .parent_data is used to mix internal (.hw) parent clocks 
with external (.name and .fw_name) clocks.

>   			},
>   			.num_parents = 1,
>   			.flags = CLK_SET_RATE_PARENT,

Thanks!
Marijn
