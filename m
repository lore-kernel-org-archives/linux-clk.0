Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7461AC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 14:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CF3661105
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 14:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhDIODY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 10:03:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232796AbhDIODX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Apr 2021 10:03:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B5B610F7;
        Fri,  9 Apr 2021 14:03:07 +0000 (UTC)
Date:   Fri, 9 Apr 2021 19:33:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SDX55 rpmh IPA clock
Message-ID: <20210409140304.GF31856@work>
References: <20210409134407.841137-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409134407.841137-1-elder@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 09, 2021 at 08:44:07AM -0500, Alex Elder wrote:
> The IPA core clock is required for SDX55.  Define it.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

I tested this patch on couple of SDX55 based boards like Telit FN980 and
Thundercomm T55. Hence,

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Also cross checked the IPA clock definition using QC internal docs, so

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/clk-rpmh.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c623ce9004063..552d1cbfea4c0 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -380,6 +380,7 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>  DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
>  DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
>  DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
>  
>  static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> @@ -389,6 +390,7 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
>  	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
>  	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
>  	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> +	[RPMH_IPA_CLK]		= &sdx55_ipa.hw,
>  };
>  
>  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> -- 
> 2.27.0
> 
