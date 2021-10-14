Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FC4C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 09:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A80D46101E
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 09:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhJNJzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 05:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhJNJzt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Oct 2021 05:55:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4AEC06174E
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 02:53:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x27so24610832lfu.5
        for <linux-clk@vger.kernel.org>; Thu, 14 Oct 2021 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/KsJRdiob87Ja5PgF5X/ti+BR7dI5FBOZcD9kz6Ozto=;
        b=h9409aXB6YV05xq/pABEkmxSxFhTfpqrruXdlc5z7R9nLrph5NnzM/EBjSxJ9VBEd1
         6NMrB5sswM/Ks9ujE5TeT+LdGjhG5OW/Sthv0VyCQ+5TDGCWjs3BSdQpHqLJR32u/IVy
         3yA7DnbG9F5PlUNRf80NI+u/iJrs96xdUBoYX07isyy2y2gEVggGj6uEw2GiV0+H3vCm
         DLkuhQVpOZ2Epai5CX0uonVB6S/iAKC0NtfkPPQdQlX2OHtmG+crZfWual8sefpN/EVe
         CILMtmLbkDVMdRNOJKLfW1mb3VJ5MpatvmEAXlRj9OHXTVA9YNMAOi0HLak+NWmk/Vjg
         WwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KsJRdiob87Ja5PgF5X/ti+BR7dI5FBOZcD9kz6Ozto=;
        b=2aaTJJu/ZbGq00HnfqTkYjmwC/It6nGxLTDcGCVmTrrlWEsnKi08eoYZvk1yx2HpL2
         +xqrCZfi9PvKDc+t2boxe77B+kOsaGegcNSapedTNUpiNve78ZdNQFWFwN6pQa+p9qid
         gAHqJHtvSzlVWjV9Ul3jMbsX3rd6cgq7Ubw5qVf2NmdggcGalPjXkI5qtp1XP3FBDLmE
         0e0K/O4CoSzxDPiUfVPU3gPnIfyajd9spGQm0ocpMkFeTpdgKIuKnQF05ZvTL+4BEU0A
         OM3ApJf3OvH0PqQr4GrysgwMFKzVAJ5becSmQm33tW2QQXZCebAatnDRfz6jB33M1+VY
         s/nQ==
X-Gm-Message-State: AOAM533b9Cj8gIvXsm+vHKPN/h4o3vozZmODtwLpIS+BC4yHv5RHLG74
        GfQSN+v31klortq4MA3EZwHP1g==
X-Google-Smtp-Source: ABdhPJyyYEu0EPxRrb37K9hW8OcK5o+4Jwzf2jK9MJng9VLqg4T97Er87U0t4/FYgeISUNHmm0nAUw==
X-Received: by 2002:a05:6512:b08:: with SMTP id w8mr4024902lfu.505.1634205223215;
        Thu, 14 Oct 2021 02:53:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s11sm181297lfd.262.2021.10.14.02.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:53:42 -0700 (PDT)
Subject: Re: [PATCH v7 7/8] clk: qcom: dispcc-sm8250: stop using mmcx
 regulator
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-8-dmitry.baryshkov@linaro.org>
 <YV8WsQb9H7+CaLjP@ripper> <4614587c-b87a-4375-cb6a-6af6f5462c6b@linaro.org>
 <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <070b1b25-3718-5f3a-869b-a3954fdcc7c5@linaro.org>
Date:   Thu, 14 Oct 2021 12:53:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <163415465484.936110.9292145029740247591@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/10/2021 22:50, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2021-10-07 09:16:13)
>> On 07/10/2021 18:48, Bjorn Andersson wrote:
>>> On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:
>>>
>>>> Now as the common qcom clock controller code has been taught about power
>>>> domains, stop mentioning mmcx supply as a way to power up the clock
>>>> controller's gdsc.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>
>>> Once we merge these, I expect that the boards will start crashing if
>>> the kernel is booted using an existing DTB?
>>>
>>> Is it okay to just merge the first 6 patches in the series now and
>>> postpone these two until we've had the dts change sitting for a while?
>>
>> Sure it is.
>>
> 
> What's the merge strategy? It goes through arm-soc?

I think this should go through the clk tree. There is little chance of 
conflicts.


-- 
With best wishes
Dmitry
