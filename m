Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79498C433E7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 09:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AF4821527
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 09:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsEk0uQA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgJNJqm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgJNJqm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Oct 2020 05:46:42 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2393DC0613D3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 02:46:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a9so2982663lfc.7
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2020 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+Jr7an/bPNcJoQouoOjXAzOqRnOkKwIrBPsDy4iYiw=;
        b=WsEk0uQAbfipxXpERvDtMhF9W8fXNXhnLJsC0M9nyEVt/ra4OqnpDBX+hxv/3b8ek7
         wHg6ZKnZ2ZnlwTQrXhLs9yLQugb3DlRd1i2PubbvqRNg0xdkSQTfW2TDpbTDNefbqAFp
         OKGGc4tIYOnxbNzVW5CRNwflJYz/7F4El8AI6hP+uORZN8jlqGxwL4w5teUAVXpLkq5l
         YzLATjoOSpferpIGjfg8mj5ptN08fNhcY2aqd4R2SaOOUszR2DlgIr2Rg/Ev/JSs+Bvm
         UW160oC0SEjlGuJiDMtb+bUaWpZE0L5zN3nHSooA7SqDp/QqbiyjMrMvBf6vox1Hz3Sb
         CXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+Jr7an/bPNcJoQouoOjXAzOqRnOkKwIrBPsDy4iYiw=;
        b=ueKxiW84mdzK/XqP0BL3AX73wz3B3TV1BQXNjSPH2gB4vqWxnzAilKf4wrzIYf9wzC
         Oz3JIVybjwnjHNMvovV9cvCSqXAUhzJ7JV4/4aOzbLuvi9x/tDGA/E4FKyJDbqmKwDJj
         RAtCWwGN83y5rsEzJ0bUgeLltbeZkXxEAmkMXnYDynv3eQ7oo/PoTkPPWyTWlFjxYkfq
         zuCoh7CFz29uLudctnDwHEK+ZltVHMuhakq6FByG/1GRAUAqHBHYPF+2HNHeFFYsB8BZ
         nepRANCLWQUrtDDq1c+OuGv+SftuugvjXEDH8iXG15mOorg26Y7C746INPxiYWVwZPGM
         qBFg==
X-Gm-Message-State: AOAM530cq9cT2E9PUaRemvKgG/vWN4XduMuCUc8E0VpvZQoYX9zFZU4v
        yPNhl1JZZMJhPXZ60zW36rImDVaYvj4UrSsM
X-Google-Smtp-Source: ABdhPJzyjzotFJ4/VSS6QdBloBjcRqaMnOCq3r59EFlfvuZyOa9cG/ACiRP2lmKbfb3ZHBHNxumuZQ==
X-Received: by 2002:ac2:4d58:: with SMTP id 24mr1092648lfp.32.1602668800207;
        Wed, 14 Oct 2020 02:46:40 -0700 (PDT)
Received: from [192.168.1.211] ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id y184sm930340lfa.245.2020.10.14.02.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 02:46:39 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] clk: qcom: dispcc-sm8250: handle MMCX power domain
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
 <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
 <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5523b613-c659-45f9-90ce-2c51f3ee8c79@linaro.org>
Date:   Wed, 14 Oct 2020 12:46:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2020 05:16, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2020-10-05 15:59:14)
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index 07a98d3f882d..3941054a7b07 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -963,6 +963,8 @@ static struct gdsc mdss_gdsc = {
>>          },
>>          .pwrsts = PWRSTS_OFF_ON,
>>          .flags = HW_CTRL,
>> +       .domain = "mmcx",
>> +       .perf_idx = 0,
> 
> Does a perf_idx of 0 mean off? Or just "not off"?


It means 'use performance state with index 0 declared in the DTS'.


-- 
With best wishes
Dmitry
