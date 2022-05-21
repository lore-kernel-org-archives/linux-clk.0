Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170CCC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 00:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbiEUAie (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 20:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbiEUAid (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 20:38:33 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6593B1ACF97
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:38:16 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g16so11280598lja.3
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sY05XeQBUKvBodoi2Ts7IOsg7MaiAgbTu0UYhoI+qo4=;
        b=T/9sGn/wMERZsyQp0Pl0Jb/zXOmsE5EmzGyGyG55iCNTHjCaiCXwliN18O+/bcXjBC
         sXWcaCOlho7ETeDTCTfmHJiSGgy46kaLQPfmwL709jgjTZPMfdOHsKswmmNYuMfHTSnj
         h229EtmtoCkdYskyABoeBko4q7UrJfIe5/3uGNzIDbcrAJt4ACqVHsHr8vWMllLNi53T
         DqYvY7wRy/EvQH+BFZSCJnYai/svTVvKOz9eNhqtdnafSZq3esL3kMEgG07vz+o5J/GV
         KVtKhdIL5uutwWhED78sHznkq1TKHxZcA2OLhLmUG+e3hRSyU1Qn+Rrv/4bO8wQwqMbq
         /XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sY05XeQBUKvBodoi2Ts7IOsg7MaiAgbTu0UYhoI+qo4=;
        b=T8V4g/5amfZmRi1l1u7ROCUtkB4JGdjnO9ZcG52OC/0Hx3UDUZwV4J779+eg3qvmDH
         iQAoO8BEjs6boT7y6ikY+P9AWM+RGfV/jgyqJCHlahU0+pFtZ14dD2jQZMjUsQL/Mok0
         8Q1HZB8Dxq/ohkKXfiR6v5sfn+INDbaCdz0jx9lN8QbeN5jcj4zgu7vDOjJrNV+QLHgO
         6+szgR/7tt3Bzu8Bh1QmLDAhZe5NE+3D/tDBPvDXioCOm4mJe2HK+26zvmFebGYxc3Qp
         B/xV3l3N2A7HPQcFzjSMLHAREt1vGB1ErqeJDBXIlg/DK842jx5KwjHxjB5N7Wbbf+zE
         I4eQ==
X-Gm-Message-State: AOAM531rJxMKzyd7/NJyV3Hptnc/b5TAPcxuEJPLRUwLyTOLMrbQk37J
        s/AAuVA2o5QiNMq8szDL+rdSjg==
X-Google-Smtp-Source: ABdhPJxqggudcpc5cSsFYvW5UEYCuyajHF2zHMowwZvAlZJ2RkyOXgz2BE00aI7qAjSY+Bhf88dRLQ==
X-Received: by 2002:a2e:aa94:0:b0:253:b262:6026 with SMTP id bj20-20020a2eaa94000000b00253b2626026mr6779845ljb.343.1653093494690;
        Fri, 20 May 2022 17:38:14 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id p26-20020a2e9a9a000000b00250a7bce0fdsm487245lji.95.2022.05.20.17.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 17:38:13 -0700 (PDT)
Message-ID: <7893eb9d-a4ff-ae08-2996-f5a5adf6f53d@linaro.org>
Date:   Sat, 21 May 2022 03:38:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 2/5] clk: qcom: regmap: add PHY clock source
 implementation
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220513175339.2981959-1-dmitry.baryshkov@linaro.org>
 <20220513175339.2981959-3-dmitry.baryshkov@linaro.org>
 <20220518175808.EC29AC385A5@smtp.kernel.org>
 <fa94b8f3-a88d-5d9c-9d8a-7c0316f15cfa@linaro.org>
 <20220520224916.56AA5C385A9@smtp.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220520224916.56AA5C385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/05/2022 01:49, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-19 04:16:19)
>> On 18/05/2022 20:58, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-05-13 10:53:36)
>>>> diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.c b/drivers/clk/qcom/clk-regmap-phy-mux.c
>>>> new file mode 100644
>>>> index 000000000000..d7a45f7fa1aa
>>>> --- /dev/null
>>>> +++ b/drivers/clk/qcom/clk-regmap-phy-mux.c
> [...]
>>>> +
>>>> +#include "clk-regmap-phy-mux.h"
>>>
>>> Same for clk-regmap.h, avoid include hell.
>>
>> I couldn't catch this comment. I think we need clk-regmap.h in
>> clk-regmap-phy-mux.h as clk_regmap is a part of defined structure.
>>
> 
> Don't rely on implicit includes. It makes changing header files error
> prone. Also, please trim replies.

Ack. Will change this in v8.


-- 
With best wishes
Dmitry
