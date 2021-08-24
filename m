Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5967CC4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 20:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DAA161357
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 20:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhHXUyr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 16:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhHXUyq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Aug 2021 16:54:46 -0400
X-Greylist: delayed 459 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 24 Aug 2021 13:54:01 PDT
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F320C061757
        for <linux-clk@vger.kernel.org>; Tue, 24 Aug 2021 13:54:00 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9010A1F4F5;
        Tue, 24 Aug 2021 22:46:17 +0200 (CEST)
Subject: Re: [PATCH] clk: qcom: gcc-sdm660: Replace usage of parent_names
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
References: <20210824150606.678666-1-bjorn.andersson@linaro.org>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org>
Date:   Tue, 24 Aug 2021 22:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824150606.678666-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

Thanks for this cleanup, that's needed and much appreciated!

On 8/24/21 5:06 PM, Bjorn Andersson wrote:
> Using parent_data and parent_hws, instead of parent_names, does protect
> against some cases of incompletely defined clock trees. While it turns
> out that the bug being chased this time was totally unrelated, this
> patch converts the SDM660 GCC driver to avoid such issues.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Tested-by: Marijn Suijten <marijn.suijten@somainline.org>

On the Sony Xperia XA2 Ultra, bar the necessary change in the 14NM DSI 
PHY driver commented below.

> [..]
> -
> -static struct clk_fixed_factor xo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "xo",
> -		.parent_names = (const char *[]){ "xo_board" },
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};


Removing the global "xo" clock makes it so that our 14nm DSI PHY does 
not have a parent clock anymore, as the clock is called "xo_board" 
nowadays ("xo" in the position of fw_name is, as you know, only local to 
this driver because it is named that way in the clock-names property). 
We (SoMainline) suffer the same DSI PHY hardcoding issue on many other 
boards and are at this point investigating whether to provide &xo_board 
in DT like any other sane driver.  Do you happen to know if work is 
already underway to tackle this?

>   static struct clk_alpha_pll gpll0_early = {
>   	.offset = 0x0,
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> @@ -158,7 +35,9 @@ static struct clk_alpha_pll gpll0_early = {
>   		.enable_mask = BIT(0),
>   		.hw.init = &(struct clk_init_data){
>   			.name = "gpll0_early",
> -			.parent_names = (const char *[]){ "xo" },
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "xo",
> +			},


I wish we could use .parent_names for a list of .fw_name's too
> [..]
> @@ -265,7 +270,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
>   	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "blsp1_qup1_i2c_apps_clk_src",
> -		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
> +		.parent_data = gcc_parent_data_xo_gpll0_gpll0_early_div,
>   		.num_parents = 3,


How about using ARRAY_SIZE(gcc_parent_data_xo_gpll0_gpll0_early_div) 
now?  Same for every other occurrence of this pattern.

- Marijn
