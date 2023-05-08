Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B9FC77B7F
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 20:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjEHUpP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 16:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjEHUpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 16:45:12 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D9F5598;
        Mon,  8 May 2023 13:45:11 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 842E1C6FC8;
        Mon,  8 May 2023 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683578709; bh=Mo5AKMAQFcJFxVfmI+EQBz82R/aLkXwA90cLbBSaJjk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xO5hHgkINsadZNreQsKI8jDb2ezLDY/dZ/+A7uFvPDYFzvizw4o5XFgabWIR/NASy
         e9NSHSk+uEIOCyY0evx/0jew7CiuXqMwp1m7OGWSrcPSNaa40K0SM2NWfnMdLwC9dk
         IAf0bkUavbruJhqk/mjNEyEICKagAVr/z9mC33nM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for
 mdp_clk_src clock
Date:   Mon, 08 May 2023 22:45:08 +0200
Message-ID: <3278412.mvXUDI8C0e@z3ntu.xyz>
In-Reply-To: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sonntag, 7. Mai 2023 19:53:34 CEST Dmitry Baryshkov wrote:
> The mdp_clk_src clock should not be turned off. Instead it should be
> 'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
> using the clk_rcg2_shared_ops.

While I don't recall seeing problems with this clock before, with this change 
it also seems to be work fine on FP2.

Tested-by: Luca Weiss <luca@z3ntu.xyz>

> 
> Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock
> controller (MMCC)") Signed-off-by: Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c
> b/drivers/clk/qcom/mmcc-msm8974.c index 4273fce9a4a4..aa29c79fcd55 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -485,7 +485,7 @@ static struct clk_rcg2 mdp_clk_src = {
>  		.name = "mdp_clk_src",
>  		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
>  		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };




