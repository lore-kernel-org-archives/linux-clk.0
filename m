Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB64DC433C1
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 01:49:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C57A61A10
	for <linux-clk@archiver.kernel.org>; Sat, 27 Mar 2021 01:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhC0BtO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 21:49:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38207 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhC0BtK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 21:49:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616809749; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=p/wjTkYrQKO9Cl79VGlFhtygqv5a4wQQ/rNreMPhTlI=; b=s5SWczm4J6ioFgvrFzcF06SY2NaAYEjx+618K8tAJBGjTFvlKytTSl1ncQtI2K5iUKEFaAsq
 ftlVjLKzDd0nr3xpoZwCH95QDcr1CK78j5GyzOQ6Pi0ijmz036QFAQ29sGXeW+kjbMx+BSmn
 eWSPpIIC5faI7kR33nKQfLIhJ38=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 605e8f11876af85fc4c1f8f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 27 Mar 2021 01:49:05
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 960C3C43462; Sat, 27 Mar 2021 01:49:05 +0000 (UTC)
Received: from [192.168.0.101] (unknown [49.204.180.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AAC7AC433CA;
        Sat, 27 Mar 2021 01:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AAC7AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 06/15] clk: qcom: videocc-sc7180: drop unused enum
 entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-7-dmitry.baryshkov@linaro.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <4217c4a2-cb15-ef08-8c39-9a5f164d2b41@codeaurora.org>
Date:   Sat, 27 Mar 2021 07:18:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325111144.2852594-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

Thanks for the patch for cleanup.
It is okay to remove TEST source, but you can still keep the sleep clock 
source as it could be still connected to certain RCGs and could be used 
to derive low frequencies if required.

As these sources are generated from the HW plans it would be good if we 
keep them as they are except the TEST source.

On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> Drop unused enum entries from the list of parent enums.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/videocc-sc7180.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> index 276e5ecd4840..f5d04791a3cd 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -19,8 +19,6 @@
>   
>   enum {
>   	P_BI_TCXO,
> -	P_CHIP_SLEEP_CLK,
> -	P_CORE_BI_PLL_TEST_SE,
>   	P_VIDEO_PLL0_OUT_EVEN,
>   	P_VIDEO_PLL0_OUT_MAIN,
>   	P_VIDEO_PLL0_OUT_ODD,
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
