Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1B6EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 17:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbjFMRxF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbjFMRxE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 13:53:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD84173E;
        Tue, 13 Jun 2023 10:53:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9FB2A62BBA;
        Tue, 13 Jun 2023 17:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661C8C433F0;
        Tue, 13 Jun 2023 17:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686678783;
        bh=hOJkNt/HUS2Sl/TAnLkqJ+vyDEQMTGQ3jz3L8YGyuAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4a1E+MHv0xsUA9IBgPikrv3NWmMdqncwMfaPwd/VE9kl1aI5/s3bzPbzpStGUJxM
         ypdjZZogMt91+e64NZw5i48kouTAvqaUKO2yk80UqTOUed6rEiZKvSM6ZUHmN6wSoH
         l7pTNcSd026jxETBOPedfxlGfkTA6EscZUBzCMcnnyXacZZ+5dmQ6aeA72Vqq7AGx3
         1voyVKcDvNuWYJd8dIcLMQAHtiJiK11/JBZGS64M+LsgQYM0qP9REXhmy62AxL0+QH
         t3eLtwA/sdbYtGe7nAkO0H+uMFZewpKZvAJL2f45BfxLw8LU2bRBP6fVwpffwqnW6/
         8k9fDNZZyb+fA==
Date:   Tue, 13 Jun 2023 10:56:26 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for
 RPM bus clocks
Message-ID: <20230613175626.aesimqz2alcqjtok@ripper>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
 <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 12, 2023 at 11:22:48AM +0200, Konrad Dybcio wrote:
> The config/periph/system NoC clocks are wholly controlled by the
> RPM firmware and Linux should never ever alter their configuration.
> 

Does Linux need to know about them?

Regards,
Bjorn

> Switch them over to read-only ops to avoid that.
> 
> Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 5e44d1bcca9e..588e3b67657a 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -264,7 +264,7 @@ static struct clk_rcg2 system_noc_clk_src = {
>  		.name = "system_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0_gpll0_early_div,
>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_ro_ops,
>  	},
>  };
>  
> @@ -284,7 +284,7 @@ static struct clk_rcg2 config_noc_clk_src = {
>  		.name = "config_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0,
>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_ro_ops,
>  	},
>  };
>  
> @@ -306,7 +306,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
>  		.name = "periph_noc_clk_src",
>  		.parent_data = gcc_xo_gpll0,
>  		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_ro_ops,
>  	},
>  };
>  
> 
> -- 
> 2.41.0
> 
