Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FFAC432BE
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 18:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC0360F9E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 18:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbhG0S3t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 14:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhG0S3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 14:29:48 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71A0C061757
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 11:29:47 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id g15so16323751wrd.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Jul 2021 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rHRF5Z6zV8T8deErhjvinL45ZW5rIgTPGE0mB00ml4s=;
        b=gCZcVysrYiWMN5aPRmyk7hsb9ZBGp/H1b7ahCwB2yq8bWgYzJt3ffNc9AtQ9NbQwKd
         LPwQiuOJ3zVcV9nDogJilvocjFC+jywPs9+oT6Y2cIvQdjieYPVepGFsnQr4Yi9ronca
         6iA0xvVsmfxudjzDVZQraUuHi3XZBIDWS7cfoiTG7px2i29LHVeQFjQGgTy/jxnuSCcr
         jYxrr7F3IT9KTllnK7u5Z9Gxtz9ymq5/8G4VTVpaPZscrwAML+upmlYMy+fmexjd7A7T
         pvkP6iVL4mCWdQkK5lwVTYca/u/m912ZMYfkIhuZJVrykmP7BNNL/Mz8w6J6UBiusE1u
         u70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rHRF5Z6zV8T8deErhjvinL45ZW5rIgTPGE0mB00ml4s=;
        b=J08WWqM9gvfB7ILLPCLYK+U6douBGzID68QYLPdZZokSWuhDNCegljjvUaNzce30OL
         gbbxmcBr4w0WsgYnIvYtsxVOJ1LX74keD6hqjqo6R1xgn6i1ulvIED2xhgPuvbAl84tF
         7IdfvDsNQLok8nL5Tgt2FZGsFeHkIwjPehpgmNxdo74TMuairkXUTkYZrQ7YNUmsPSs9
         MFMDY5t+4cXscsp33Ud+NJKHHVWWb94rohWg1sSXBTmHvT4NVxkOqktkILc9MIQXA7ho
         iC4l7JL1vsRnk1yxvEgCD4drarUDI8A8w2wcIZPwEOmJsfSPOoFE16hsH1YC2anv0F2y
         /KKA==
X-Gm-Message-State: AOAM530uLiMT3BDFFlN9wzzfTHcos+P4q44txrXODASEPWu2xSnVFfI/
        LLJoAI69ApC9Vu1hRL7/SXsK1g==
X-Google-Smtp-Source: ABdhPJyODHtevLdPwHjQgbTFElV3zPUd75YyjAlJrrvtSAZImk6a6O9h1zqZqThsFed9LIxZty0IDg==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr26168601wro.359.1627410586130;
        Tue, 27 Jul 2021 11:29:46 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a8sm3870103wmj.8.2021.07.27.11.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 11:29:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator
 reference
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
 <20210708010839.692242-2-bryan.odonoghue@linaro.org> <YOZ4+ptO+eQbmxal@yoga>
 <162741055915.2368309.10049224467908332702@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ed6e31a9-fb07-458d-e791-d2ebad0b8fb3@linaro.org>
Date:   Tue, 27 Jul 2021 19:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <162741055915.2368309.10049224467908332702@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2021 19:29, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-07-07 21:03:06)
>> On Wed 07 Jul 20:08 CDT 2021, Bryan O'Donoghue wrote:
>>
>>> The current implementation omits the necessary mmcx supply, which means if
>>> you are running the code for this block and a prior clock driver, like say
>>> the videocc hasn't run, then a reset will be generated the first time we
>>> touch these registers.
>>>
>>> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> camcc isn't enabled in the upstream dts yet and I expect that we're
>> going to conclude on defining these GDSCs as subdomains of the cc's
>> power-domain in time for v5.15.
>>
>> I don't mind if Stephen picks this to make sure the driver is
>> functional, but I will hold off on the dts change.
>>
> 
> Seems like this is superseded by the GDSC patches that use subdomains
> instead of a fake supply?
> 
yep
