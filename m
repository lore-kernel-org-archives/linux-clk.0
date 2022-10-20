Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC32C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 18:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiJTShg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiJTShf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 14:37:35 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026131A1B1B
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 11:37:34 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id j21so502123qkk.9
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1hBLD4lH/XELJE0KWPJAlY/VEp51da8IvgbYfbE9SM=;
        b=m1MqjUsqQL2MbyAa48c2CVvgvq8u1I50bHLNDjMG1UmYjQuTXWEYox4FXqL9j3G6jR
         woCALKrlvanJEaLbeFrJ84/u56hESDulrFNddmwy58SGRhj3EiEzGT1LtoYHEzYnfJ05
         OCYYNp5ngLSolI5T5FcWxlKqd/KSyMNiJUnTMpq3gUeAc9Hjvb/jbahFh7g0fh8gk8AV
         1oMihPlKcs5XeUd3aha6KF8t9Odich8mjDh2Jd+E/9n1hNCcQDYOey8QxfFMnA/XxlfD
         9mvOHqsQCQHtgaAPmTHWtvv1lyTJ1pEulV28hR3143JLdTg1aVfqv/1MFufOVmRV1lEW
         aEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1hBLD4lH/XELJE0KWPJAlY/VEp51da8IvgbYfbE9SM=;
        b=BxZGnk0yJjJe+8LrfbBLI3XwrSEVm5FsF06eMvWk6zKIM57Mf70GhLZF1W5z0dXWH8
         LZ+nzQaRL/T9b6QqWkR+gPFxnWydm8InD90nd5Xacrz1R2sOBTBTt0Ys2HKrwKbDxL1I
         KgSxWrdBIY4/ysV3UJnxmaPCkuo99psIRp3yysUYY6NqnTHKxTfZ405Zev1f0DkZ9qLI
         ARWaWACt4dWVmsyl1/V61vT2UMu3uNiBSPFWOLvV3Kkg6csiPu4e2QlHyavdKpPQ+fhX
         iCvQcLcCzcyzxTHsvE2KD5NKEsnHMxg0hImR2O4zdMk9+Z7Ij5BAsYaz7cE8Q7mY/J7i
         IOnA==
X-Gm-Message-State: ACrzQf2/RSljewpH0iqEwbQzT+L7ZRm04Qhyy8aVkbFNRcmU3+rO0XWQ
        +iBjqPrczz3OMnWfnnDtjYUI1Q==
X-Google-Smtp-Source: AMsMyM6K0N51sGcqCNzQyBHqlKAxnwAGBccxXvK+t7f/OxW1GPu+nee4zPGTsttzdLGjy5sQo7B1IQ==
X-Received: by 2002:a37:5803:0:b0:6ee:834c:b605 with SMTP id m3-20020a375803000000b006ee834cb605mr10465392qkb.643.1666291053184;
        Thu, 20 Oct 2022 11:37:33 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id d4-20020ac81184000000b00359961365f1sm6400070qtj.68.2022.10.20.11.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 11:37:31 -0700 (PDT)
Message-ID: <fc302fb5-740a-41d6-2610-dde3cce604cc@linaro.org>
Date:   Thu, 20 Oct 2022 14:37:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: add loongson2 clock
Content-Language: en-US
To:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20221020063624.17548-1-zhuyinbo@loongson.cn>
 <20221020063624.17548-3-zhuyinbo@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221020063624.17548-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/10/2022 02:36, Yinbo Zhu wrote:
> Add the loongson2 clock binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

