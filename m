Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD25C433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 01:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AA116112E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 01:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbhDBBTM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 21:19:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11228 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234150AbhDBBTM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Apr 2021 21:19:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617326352; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8rfEOB/93o5jqp2omhqCmbYItYN5Pc45IpBWOUL2uso=; b=bjvpAHzGe3cpvow2DaqalU80oBetxqrWl5PeQdnDrHNkyp/UX3nfi3nyQ/OBMw2wfT6tE6Hm
 ClprLwcMEtjU8YRUlAq8fYsKG1yxbwxxTXscIN6VZ07Ir0mklqxWrwsUq1Eii/QA9CFKyaaY
 V4tz0yxwhu6E1e1/xe75e6YRq4k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6066710ff34440a9d4466bf8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:19:11
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8AFFEC433ED; Fri,  2 Apr 2021 01:19:11 +0000 (UTC)
Received: from [192.168.0.103] (unknown [49.204.182.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F043DC433CA;
        Fri,  2 Apr 2021 01:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F043DC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 01/15] clk: qcom: dispcc-sc7180: drop unused enum
 entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-2-dmitry.baryshkov@linaro.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <9fee6740-feba-75bd-6504-03010bb703bb@codeaurora.org>
Date:   Fri, 2 Apr 2021 06:49:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325111144.2852594-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reviewed-by: Taniya Das <tdas@codeaurora.org>

On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> Drop unused enum entries from the list of parent enums.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sc7180.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> index f487515701e3..3334bf9cfb94 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -19,8 +19,6 @@
>   
>   enum {
>   	P_BI_TCXO,
> -	P_CHIP_SLEEP_CLK,
> -	P_CORE_BI_PLL_TEST_SE,
>   	P_DISP_CC_PLL0_OUT_EVEN,
>   	P_DISP_CC_PLL0_OUT_MAIN,
>   	P_DP_PHY_PLL_LINK_CLK,
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
