Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA69C43460
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 09:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46C2A613C3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 09:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbhD0JtZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Apr 2021 05:49:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20117 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235254AbhD0JtY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Apr 2021 05:49:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619516921; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8AsmZyBIhvhaE3uaf1AcLPrkdQJjpoWFs7gTSVdvoi0=; b=hWvZ+xfWRhBOTpIhso6iM9iNAhASRMyzJxBdv7vh2MwR0svayzVh+V2HpZE9TBSPKMysw4zL
 GvRjcOZy16hLs69A1lsobxZJAJ0Tz96YXS1407NMQ7rgw28T8v5cW6I7QZOIBVHm/U3BON2g
 BHGeZPzmN9E18gMYqldHS5goWy8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6087ddea2cc44d3aeac4ddfa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 09:48:26
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B28D0C4338A; Tue, 27 Apr 2021 09:48:26 +0000 (UTC)
Received: from [192.168.0.102] (unknown [49.204.181.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 666EDC433D3;
        Tue, 27 Apr 2021 09:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 666EDC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 4/6] clk: qcom: Add graphics clock controller driver
 for SC7280
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
 <1615944142-12171-5-git-send-email-tdas@codeaurora.org>
 <161786654585.3790633.12597782416303763853@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <575a9235-7753-d589-2173-050a16063b71@codeaurora.org>
Date:   Tue, 27 Apr 2021 15:18:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <161786654585.3790633.12597782416303763853@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

Thank you for your review.

On 4/8/2021 12:52 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-03-16 18:22:20)
>> +static struct clk_regmap_div gpu_cc_hub_ahb_div_clk_src = {
>> +       .reg = 0x11c0,
>> +       .shift = 0,
>> +       .width = 4,
>> +       .clkr.hw.init = &(struct clk_init_data) {
>> +               .name = "gpu_cc_hub_ahb_div_clk_src",
>> +               .parent_data = &(const struct clk_parent_data){
>> +                       .hw = &gpu_cc_hub_clk_src.clkr.hw,
> 
> Can you follow what Dmitry has done and use .hws instead of
> clk_parent_data when the whole array is clk_hw pointers?
> 

Will update them in the next patch.

>> +               },
>> +               .num_parents = 1,
>> +               .flags = CLK_SET_RATE_PARENT,
>> +               .ops = &clk_regmap_div_ro_ops,
>> +       },
>> +};
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
