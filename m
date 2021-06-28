Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE50C2B9F4
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 10:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BE8361C6C
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 10:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbhF1K6Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jun 2021 06:58:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43780 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbhF1K6Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jun 2021 06:58:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624877759; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=nm0+siEs0uMQKrZMDepigczJyhMos3PVowqem21T4wU=; b=Iu7qCo3Z05sXB4ap1+luio1+V/StYlRFct/v1zU6rNr3e9OZZH0JVl4LFIUcHmx5c4NacekP
 VKYZK42AxjxD4OcOpj5Hjmx1ty0DJ2sZIS0ENNhx4eMzs0oREClsS0pMAfgyZhf+nfgFdTpm
 6EImtVrbXCF3Who+BC3XZq88PJY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60d9aabdd2559fe3920b9b78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Jun 2021 10:55:57
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EAA50C4323A; Mon, 28 Jun 2021 10:55:56 +0000 (UTC)
Received: from [192.168.0.101] (unknown [49.204.180.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00D7BC433F1;
        Mon, 28 Jun 2021 10:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00D7BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2] clk: qcom: clk-alpha-pll: fix CAL_L write in
 alpha_pll_fabia_prepare
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210609022852.4151-1-jonathan@marek.ca>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <bc6bd251-bd17-1f21-d205-ef343232993b@codeaurora.org>
Date:   Mon, 28 Jun 2021 16:25:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609022852.4151-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 6/9/2021 7:58 AM, Jonathan Marek wrote:
> Caught this when looking at alpha-pll code. Untested but it is clear that
> this was intended to write to PLL_CAL_L_VAL and not PLL_ALPHA_VAL.
> 
> Fixes: 691865bad627 ("clk: qcom: clk-alpha-pll: Add support for Fabia PLL calibration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 94b53c7db2f7f..eaedcceb766f9 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1255,7 +1255,7 @@ static int alpha_pll_fabia_prepare(struct clk_hw *hw)
>   		return ret;
>   
>   	/* Setup PLL for calibration frequency */
> -	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
> +	regmap_write(pll->clkr.regmap, PLL_CAL_L_VAL(pll), cal_l);
>   
>   	/* Bringup the PLL at calibration frequency */
>   	ret = clk_alpha_pll_enable(hw);
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
