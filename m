Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B79C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 01:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88F1D61269
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 01:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237172AbhJFBlW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Oct 2021 21:41:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45829 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237148AbhJFBlW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Oct 2021 21:41:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633484370; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=MYewXAEAIhV2SBLO53S+LDEf9A7aLyAlFA2tzlLxJkE=; b=HjcmXgjGqIl2qHTk5kxQFzo8y9AY3uKGiut6VdUxNDmqz+Mit358yiZFWRikcEjqSXIws85X
 KJMNxY/Ef+no9s0dfAcMSuxPP7mxYSnqyk3ugYO6FS4b4d/17WetkapUQt3RyeeTdGwhJhTq
 TTbnRBpXhHogw8imYiI/hQUyeEY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615cfe469ebaf35aaae54c39 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 01:39:18
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 02CA8C4338F; Wed,  6 Oct 2021 01:39:18 +0000 (UTC)
Received: from [192.168.0.102] (unknown [49.204.180.16])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D8C5C43460;
        Wed,  6 Oct 2021 01:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1D8C5C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <8ec18abf-0ab4-a033-c7ad-6819bf506b61@codeaurora.org>
Date:   Wed, 6 Oct 2021 07:09:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v1 2/2] clk: qcom: Add lpass clock controller driver for
 SC7280
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1630406202-3919-1-git-send-email-tdas@codeaurora.org>
 <1630406202-3919-2-git-send-email-tdas@codeaurora.org>
 <163047470651.42057.13433048930627060805@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
In-Reply-To: <163047470651.42057.13433048930627060805@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

Thanks for your review.

On 9/1/2021 11:08 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-08-31 03:36:42)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 0a55967..cd7a5a1 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -394,6 +394,14 @@ config SC_LPASS_CORECC_7180
>>            Say Y if you want to use LPASS clocks and power domains of the LPASS
>>            core clock controller.
>>   
>> +config SC_LPASSCC_7280
>> +       tristate "SC7280 Low Power Audio Subsystem (LPAAS) Clock Controller"
>> +       select SC_GCC_7280
>> +       help
>> +         Support for the LPASS clock controller on SC7280 devices.
>> +         Say Y if you want to use the LPASS branch clocks of the LPASS clock
>> +         controller to reset the LPASS subsystem.
>> +
> 
> Can you send another patch to move SC_LPASS_CORECC_7180 under
> SC_GPUCC_7180? This file should be sorted on Kconfig symbol
> alphabetically.
> 

Yes, will send a patch to fix.

>>   config SC_GPUCC_7180
>>          tristate "SC7180 Graphics Clock Controller"
>>          select SC_GCC_7180
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 9825ef8..1b33f49 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_SC_GCC_8180X) += gcc-sc8180x.o
>>   obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
>>   obj-$(CONFIG_SC_GPUCC_7280) += gpucc-sc7280.o
>>   obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
>> +obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
> 
> This one got it right, almost. LPASSCC comes before LPASS_CORECC though.
> 
Next patch will fix.

>>   obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
>>   obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
>>   obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
