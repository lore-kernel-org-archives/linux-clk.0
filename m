Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9895C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 03:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjAKDCC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Jan 2023 22:02:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjAKDCB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Jan 2023 22:02:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7CA167FE
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 19:02:00 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f34so21439320lfv.10
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 19:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PncCxYyvcTnAkGz0YWPtK6aiQnP/pdPnzgEOYBMREc0=;
        b=HnxJAXe3BGP4muuFIAjvvqS5Qk8pXgbg/5AIIkgggWS6Nk76RwA43qiBfIaGg8DngE
         rWL77n1EnGYxgkNytK7HwtSC9XlLH0nJEoJjpG7mR4LBcVLwI/Cyb8ND8Z0aTHsoN7Ry
         waoAWRaKZb1caL91QIcQcRBXA+UmQxL94yTBCvPVES6gmEhMl24q+na5ZzCPZmLCAbNK
         RUjTBXkS5ruNwzjz8SW5KIuCOcEemr3S+hnzTVJvj1p4xQS1LuzfBJ6lGTc14ek04liV
         t+e8ZWeovsdl1H0zl6sq/e+iHS51h3s7NGfCd3e1iPEnyAgJcpR7iUeaxFlLHTWUK1w0
         KJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PncCxYyvcTnAkGz0YWPtK6aiQnP/pdPnzgEOYBMREc0=;
        b=mbW0teaz3xcFwETZtdg95KhcXXonsC1FnQbA8LAwPqM7Gvh3QSSLmmdvEFHplQApRF
         YFtlTooLjPOvuPZXxpEzaCRBeIrqysDIPiqys2JDq/50FgaI4G32z9D7Q19fyuf3lFEl
         JRGF04gO2ypcGcBQPoyxiqrl4Ae3QxOnjg+SkuYxBmOELU+ClAN34xbnRle1NykG1HzZ
         5GHQElcuS2nAGke9Zjcx6XpUapqIz5XhY6ZO+gfLVyAn9/DKaXNqE9VrSb3GPu9rqfPJ
         3Zu1nRiBM8gW1Gd/4yHcdvMjOBKi1RY0bWXc7mB6mznzgPS4fGTafUL6TyndmcjNfv1s
         zHLA==
X-Gm-Message-State: AFqh2krEC7tVrOHYZD0K3lo0teK0gm0UyeoHhEKkAmG/Qs2yX15Ufq/8
        Y+FpCfVYQYokby1MYoWiBlgFlw==
X-Google-Smtp-Source: AMrXdXubJKxD8c0aw2OtMg29FOcIE3GbEQ0pGs+GzlvB3Ue2tWimg2Pe743h/7+vWJiGyA8nZ6fwTA==
X-Received: by 2002:a05:6512:398c:b0:4b5:7a91:70f5 with SMTP id j12-20020a056512398c00b004b57a9170f5mr22534607lfu.63.1673406119053;
        Tue, 10 Jan 2023 19:01:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g1-20020a056512118100b004cc84e29d74sm1281373lfr.52.2023.01.10.19.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 19:01:58 -0800 (PST)
Message-ID: <5416b022-9567-1b56-b994-95b037d1f11a@linaro.org>
Date:   Wed, 11 Jan 2023 05:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
 <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
 <CAOCk7Nr4smGnQS-yh1hGKFFXzeUUt86JSdiuoSun7vJ11z9SWQ@mail.gmail.com>
 <e2493080-f7fd-50de-173f-2e46fa846e23@linaro.org>
 <20230110221341.h4wzucm54q27q7he@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230110221341.h4wzucm54q27q7he@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 00:13, Bjorn Andersson wrote:
> On Tue, Jan 03, 2023 at 06:00:28PM +0200, Dmitry Baryshkov wrote:
>> On 03/01/2023 17:08, Jeffrey Hugo wrote:
>>> On Tue, Jan 3, 2023 at 7:56 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> Change several entries of parent_data to use parent_hws instead, which
>>>> results in slightly more ovbious code.
>>>
>>> obvious -> obvious
>>>
>>> Also, you are changing one of two parent_data structs in this file.
>>> That's not "several".  It's really not clear why you are touching one,
>>> but not the other.  Can you be more specific about what is going on in
>>> this particular file?
>>
>> The other struct has .hw and .fw_data entries so it can not be switched to
>> just clk_hw enumeration.
>>
>> I agree, that one is not 'several' (yeah, I was just using template for
>> commit messages), I can change that for v2.
>>
> 
> While I dislike the copy-paste commit message, there's little point in
> spending more effort on it. I fixed the commit message of this one and
> picked the whole series.

Thanks!

-- 
With best wishes
Dmitry

