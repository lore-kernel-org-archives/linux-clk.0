Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06A4C43381
	for <linux-clk@archiver.kernel.org>; Mon,  1 Mar 2021 17:18:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A94A6504B
	for <linux-clk@archiver.kernel.org>; Mon,  1 Mar 2021 17:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237696AbhCARRe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Mar 2021 12:17:34 -0500
Received: from z11.mailgun.us ([104.130.96.11]:55824 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234736AbhCAROr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 1 Mar 2021 12:14:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614618827; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BfVrcOWVRzGvz+Dbm8uCXcC2vuzUg8HrSEaSSdN8Zi8=; b=YRteEqYpoRlHorrxxSbgrNOz1friekH3BgpFNneyZ2w0RAJ2NPxh5CAMiJzKGnXIXy8+vyIV
 EQqFRZUylB85vjGV2bU2JVIrrbM5DN77+TnFJ1+5j6NfaJ7+fhDmDoUl7ANPIDsez1bqGy+t
 /pJKg7IPFqYpb7CI1JgXlfWoHyI=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 603d1db6832f19b9ef925434 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 17:00:38
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 954D6C43465; Mon,  1 Mar 2021 17:00:38 +0000 (UTC)
Received: from [192.168.0.110] (unknown [49.204.182.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4055C433CA;
        Mon,  1 Mar 2021 17:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4055C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gcc-sc7180: Use floor ops for the correct
 sdcc1 clk
To:     Douglas Anderson <dianders@chromium.org>, sboyd@kernel.org
Cc:     vbadigan@codeaurora.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <3b972d6d-15df-ddf6-c57f-9e1ad08564db@codeaurora.org>
Date:   Mon, 1 Mar 2021 22:30:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 2/24/2021 11:20 PM, Douglas Anderson wrote:
> While picking commit a8cd989e1a57 ("mmc: sdhci-msm: Warn about
> overclocking SD/MMC") back to my tree I was surprised that it was
> reporting warnings.  I thought I fixed those!  Looking closer at the
> fix, I see that I totally bungled it (or at least I halfway bungled
> it).  The SD card clock got fixed (and that was the one I was really
> focused on fixing), but I totally adjusted the wrong clock for eMMC.
> Sigh.  Let's fix my dumb mistake.
> 
> Now both SD and eMMC have floor for the "apps" clock.
> 
> This doesn't matter a lot for the final clock rate for HS400 eMMC but
> could matter if someone happens to put some slower eMMC on a sc7180.
> We also transition through some of these lower rates sometimes and
> having them wrong could cause problems during these transitions.
> These were the messages I was seeing at boot:
>    mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
>    mmc1: Card appears overclocked; req 52000000 Hz, actual 100000000 Hz
>    mmc1: Card appears overclocked; req 104000000 Hz, actual 192000000 Hz
> 
> Fixes: 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops for sdcc clks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/clk/qcom/gcc-sc7180.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index c5c2e93bda8e..5cacd20a31b3 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -620,7 +620,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>   		.name = "gcc_sdcc1_apps_clk_src",
>   		.parent_data = gcc_parent_data_1,
>   		.num_parents = 5,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>   	},
>   };
>   
> @@ -642,7 +642,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>   		.name = "gcc_sdcc1_ice_core_clk_src",
>   		.parent_data = gcc_parent_data_0,
>   		.num_parents = 4,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_ops,
>   	},
>   };
>   
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
