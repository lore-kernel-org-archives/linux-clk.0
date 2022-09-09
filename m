Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ABDECAAA1
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 07:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiIIHOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiIIHOv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 03:14:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACB41CB0A
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 00:14:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w8so1164082lft.12
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4nbvtgapf/DbnFmqi93Nv0OlYIMtttn1cU2cr0YoWgA=;
        b=pZmjtcSBZ/2Ynrvacs3Oqiei4FzLWDJeSha22/DQU4noEPcMCqpy8CXFLfC/Ng2Cy8
         awj7MaL6B+YJZjrWN3If0VRa5E/HNwAu3E4qZMzvzCXyJSM8ZG14DPLxPQVqZPq/Uvwk
         Wol72ZRvRJ/f1ezLjWymXAIqMagEk6UbfjwN4NJeBi9wD/l9GhCVRuEOBKeJQQiIzedg
         bEdA786eyCAv/QUpvJM17ZNm4cq/lSbDGGs5untedAT7S9xDxSAEC7Sw5THCagVn75fx
         c82HXjpHSubUy6P9UME7nBv1PBaA2H4IEv4lVy4IabEn4NqCANeSyLfoJeMx0bep/GD6
         +9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4nbvtgapf/DbnFmqi93Nv0OlYIMtttn1cU2cr0YoWgA=;
        b=v+6iDoq5AkQHI9GOFqabN7UTYlqj/N41yU5hQca0bKGhD57GIiefZEYS6ZMj2eMzmb
         FvHo5j4S/dvLTsX3SYxIPznNehFME9dochJctrgUMZXuPRKYDijpR50jK0DB472t84wY
         T5c1jL2clNdnS/xPnPnkK81VXapd5jEE0udjTQO/jlh4F2qsZenvuwEmGi97rKaeIuxe
         O7v+Iqm4KfWOlsOaC5Gh1Ep545IqWg9mIfh5FPdEoJDnkreebY+lRPbM2sg3DGcX87gb
         RTHbflM4BFGUc9SUy3fekPIhAEXik+ziQ/k+WFw+ng/DlXLs4KMUNXBvln2A7fVkvCdt
         Nmbg==
X-Gm-Message-State: ACgBeo069XUZkmWIwyPr24UQhQiAcg7IzvF7VBmQhBWLNzRWkwDlT4bG
        hnwA3tMfHvquDTghzgOzIqEarE0TNIZ64A==
X-Google-Smtp-Source: AA6agR5SXJnle1aJY2acpppvmoi8PC0XcNOeUomBn3MgCIawLIpELv7rrrjZfDGElv6mDGyChsAc3w==
X-Received: by 2002:a05:6512:c0c:b0:48d:1e9d:aa14 with SMTP id z12-20020a0565120c0c00b0048d1e9daa14mr4180975lfu.322.1662707685119;
        Fri, 09 Sep 2022 00:14:45 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a2ea4a6000000b0026be23f24efsm170485ljm.18.2022.09.09.00.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:14:44 -0700 (PDT)
Message-ID: <9b009a58-5a2b-1276-49de-3c4f93b2f356@linaro.org>
Date:   Fri, 9 Sep 2022 09:14:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gcc-sdm845: add sdm670 global
 clocks
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tdas@codeaurora.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, caleb@connolly.tech,
        jo@jsfamily.in
References: <2d4de63a-c536-669d-b90d-21f60bc6b6fb@linaro.org>
 <20220908230102.207682-1-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908230102.207682-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/09/2022 01:01, Richard Acayan wrote:
>>> +        clock-names:
>>> +          items:
>>> +            - const: bi_tcxo
>>> +            - const: bi_tcxo_ao
>>> +            - const: sleep_clk
>>> +            - const: pcie_0_pipe_clk
>>> +            - const: pcie_1_pipe_clk
>>
>> Blank line here.
>>
>> With this:
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for reviewing. While I'm at it, I might as well swap sdm670 and
> sdm845 if statements so they're at least in the same order as in the enum
> (I don't know what order to put them in).

Put them in alphabetical order.

Best regards,
Krzysztof
