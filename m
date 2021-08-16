Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001AAC4320A
	for <linux-clk@archiver.kernel.org>; Mon, 16 Aug 2021 17:09:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D011360F35
	for <linux-clk@archiver.kernel.org>; Mon, 16 Aug 2021 17:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhHPRKB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Aug 2021 13:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhHPRJS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Aug 2021 13:09:18 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FB3C06179A
        for <linux-clk@vger.kernel.org>; Mon, 16 Aug 2021 10:08:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g13so35790131lfj.12
        for <linux-clk@vger.kernel.org>; Mon, 16 Aug 2021 10:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1H74w19usAiEiMxJXIrSteXyU7M5waeG7A1ewZ7Xfho=;
        b=wAckAHThXf56w5CDLj9ZXlr7hkoIw90UPR9ZZ/ph91R441/dNo7WjOPs4cSE/Rrzp+
         DHD0IS4/tAJAq4WBCTr9nDu27ivxB9HnvTZrl3B2Lpq2NYiG3IDLKqdHPGX2u7aBZnbh
         Fqu9p/aWzSE+eX9YFGS663KhT13kN5Y3gg8LQ6nkdS74En3QEpKx+hlBY+qa3SZ7g5PC
         cCZBzCAFAeYiJkabUuy2fGlbxcZ92mh2+SAcFZBOI0IaFEpzwX1o1bzIFWOqNaKXj/V7
         ZzXNlm9C1WV8hN7Qcu5JqWqpq67NZRRvwpxv1clwWW9ubyyaVLvY+ZP4KFfYeka4yZRQ
         PxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1H74w19usAiEiMxJXIrSteXyU7M5waeG7A1ewZ7Xfho=;
        b=tM3ew6m1y+k511UopQR8SIRtjEWegBoCm0+fSyDafC5pbXlIzGUFcph+9mtGoAxdIM
         +YiNuDpDfy1uR55aIRzVjC6fHyBckMGcTjXhpXG8SrC0oJacCk+uqahELch4caHtYgbA
         2u5vEWZoZWC/r+DIHhSaGVb5Y7F+pkxA1AoyflcFcHqgRWkqne3fv6ymx5FU1bRBS3xM
         KpoCgd6/7FFO43Dbibw3O0H+pKKtUTrD3UR8re/cu3h6fQdj0ohWd60GU4WcABICcEFA
         7IiH49wwzvP4j44nQLku+qDiy0l3F4/bZ8mQOZeT3wQGcpR+rvO7DMNYu9JWI/qVD2FL
         ZQlw==
X-Gm-Message-State: AOAM532mhaee/e7xJPnC9lMuNnt4BuQFS0MPpViEgYkDiXhObZLGwoja
        bgFT3bN7XXNNuRhh4qFTAapQxg==
X-Google-Smtp-Source: ABdhPJx/isfH0IafEhHRSHd+kPwEa9/jgEAO+r18P4mBet7LtD+AryXOaypqVOR2i1zQJidm08Jxcg==
X-Received: by 2002:a05:6512:a90:: with SMTP id m16mr2868826lfu.349.1629133720731;
        Mon, 16 Aug 2021 10:08:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm1174750ljj.101.2021.08.16.10.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 10:08:40 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] PM: add two devres helpers and use them in qcom cc
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Taniya Das <tdas@codeaurora.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
References: <20210731195034.979084-1-dmitry.baryshkov@linaro.org>
 <162820760640.19113.2386978922035728014@swboyd.mtv.corp.google.com>
 <CAA8EJppSVotv-O=2h3BVqAC6f7xG+2BvUREesKs9v7RJkLORrQ@mail.gmail.com>
Message-ID: <95acab94-ae80-b43c-673c-9dfc82f3b40b@linaro.org>
Date:   Mon, 16 Aug 2021 20:08:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJppSVotv-O=2h3BVqAC6f7xG+2BvUREesKs9v7RJkLORrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/08/2021 10:08, Dmitry Baryshkov wrote:
> On Fri, 6 Aug 2021 at 02:53, Stephen Boyd <sboyd@kernel.org> wrote:
>>
>> Quoting Dmitry Baryshkov (2021-07-31 12:50:31)
>>> Most of the drivers using using pm_runtime_enable() or pm_clk_create()
>>> follow the same pattern: call the function in the probe() path and call
>>> correspondingly pm_runtime_disable() or pm_clk_destroy() from the
>>> probe()'s error path and from the remove() function. This common code
>>> pattern has several drawbacks. I.e. driver authors have to ensure that
>>> the disable/destroy call in the error path really corresponds to the
>>> proper error clause. Or that the disable/destroy call is not missed in
>>> the remove() callback.
>>>
>>> Add two devres helpers replacing these code patterns with relevant devm
>>> function call, removing the need to call corresponding disable/destroy
>>> functions. As an example modify Qualcomm clock controller code to use
>>> new helpers. In this case we are able to drop error path and remove
>>> functions completely, simplifying the drivers in question.
>>
>> There are lots of folks on the To: line so I'm not sure who is supposed
>> to apply this. Please indicate which maintainer tree you're planning to
>> land a series through if it touches different areas of the tree.
> 
> I'd prefer for them to go through the clock tree.

Stephen, since Rafael has acked the patched, could you please take a 
look and hopefully merge them?


-- 
With best wishes
Dmitry
