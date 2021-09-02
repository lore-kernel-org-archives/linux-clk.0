Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A919C43216
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 07:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2439610CD
	for <linux-clk@archiver.kernel.org>; Thu,  2 Sep 2021 07:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbhIBH3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Sep 2021 03:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243453AbhIBH3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Sep 2021 03:29:05 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73837C061575
        for <linux-clk@vger.kernel.org>; Thu,  2 Sep 2021 00:28:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2D5323F35F;
        Thu,  2 Sep 2021 09:28:03 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global
 "xo" clock
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-3-marijn.suijten@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <8d2719c9-16e6-5915-5c40-98a76d87f042@somainline.org>
Date:   Thu, 2 Sep 2021 09:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210830182445.167527-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 30/08/21 20:24, Marijn Suijten ha scritto:
> The DSI PHY/PLL was relying on a global "xo" clock to be found, but the
> real clock is named "xo_board" in the DT.  The standard nowadays is to
> never use global clock names anymore but require the firmware (DT) to
> provide every clock binding explicitly with .fw_name.  The DSI PLLs have
> since been converted to this mechanism (specifically 14nm for SDM660)
> and this transient clock can now be removed.
> 
> This issue was originally discovered in:
> https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
> and prevented the removal of "xo" at that time.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

> ---
>   drivers/clk/qcom/gcc-sdm660.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
> index 9b97425008ce..16fd16351f95 100644
> --- a/drivers/clk/qcom/gcc-sdm660.c
> +++ b/drivers/clk/qcom/gcc-sdm660.c
> @@ -37,19 +37,6 @@ enum {
>   	P_GPLL1_EARLY_DIV,
>   };
>   
> -static struct clk_fixed_factor xo = {
> -	.mult = 1,
> -	.div = 1,
> -	.hw.init = &(struct clk_init_data){
> -		.name = "xo",
> -		.parent_data = &(const struct clk_parent_data) {
> -			.fw_name = "xo"
> -		},
> -		.num_parents = 1,
> -		.ops = &clk_fixed_factor_ops,
> -	},
> -};
> -
>   static struct clk_alpha_pll gpll0_early = {
>   	.offset = 0x0,
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> @@ -2281,7 +2268,6 @@ static struct gdsc pcie_0_gdsc = {
>   };
>   
>   static struct clk_hw *gcc_sdm660_hws[] = {
> -	&xo.hw,
>   	&gpll0_early_div.hw,
>   	&gpll1_early_div.hw,
>   };
> 

