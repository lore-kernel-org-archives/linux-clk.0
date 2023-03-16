Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDBEC7618D
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 14:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbjCPOKR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjCPOKQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 10:10:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E04E497E6
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 07:09:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w9so8273009edc.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678975794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qSYTF1gzbLXc9mIXUhT70b2BxBvwCOTXpLGkfOxxmec=;
        b=cM9RxICbPcmQVtqktPjzYGl3wLcA0d85RKIFxu5WIB1G56o138Z0qHPLPAVC1XHruZ
         iXb3ZTIONF92viWgBDIOHftD0wR9nFVXzvH38ZH8fSHonstccxExM8A9d4KtRATZ4jds
         JL3LUxYNtIWgjRRKDSagN2kSnv3uHsfks3szO+w/etoxhOjRNQMt9/NB7V8xIxnnvmA1
         P6uX2gdN0x9faCQpQ3uPXOQyU7uJT4mr8RKgaUbD3gC1vMaOdesfNIu33lrF7xfCHIXb
         I1KYXTQq1fLjJFSrgpLjJODCSTlmeFEk++eFjWKU2fONeUKe+Bc251xEcTyfPm+ym8xq
         aPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678975794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSYTF1gzbLXc9mIXUhT70b2BxBvwCOTXpLGkfOxxmec=;
        b=NcVThc1HJE/tiSQFtAa9loekQvvWgagCrOd/khU7imQ9w8QzCGOanUQmFuhqodYi6P
         bD5JHhyuywwQ0KEBcVy89iFoyV2irwsxcHgaIG5+srI5Pd3eYMwvZLGUGubpHg85BccN
         K6wpB9eqNqyX9hb7DetyeJ6jYj+uxJ0ZWJmeA/YbcaOrGnR4ooo/GPxQGHFCDgX7tEwd
         FJ20XNsbH8g0epBLYsyOi8+iSE3G63imlJfcBs8AJ6tSASOCp1RNQHmVP/rZjE9PM9l1
         3CtxPmyp+O4kHgq0d4PMs0iIRr/hQ1iAOqMzjkFdF7ikPf1VbAb0k4NmXy0/k/ewOmZk
         TDuQ==
X-Gm-Message-State: AO0yUKWt3aY6BUZZ5cD+449YsWMgoZtje39Mc3H32YZ3OCyUUlHBq0Ef
        eVs2kwPxKIQ/BKC93GBUldXYhg==
X-Google-Smtp-Source: AK7set/lq61jyQAMsfgKe5eGKonfgJx8sh6sYalKy1N1OZp2WLwyjzWvUd/2MxH1VCw2f7GRuoFwHA==
X-Received: by 2002:a17:907:8d1b:b0:889:1eb1:7517 with SMTP id tc27-20020a1709078d1b00b008891eb17517mr11048600ejc.30.1678975794656;
        Thu, 16 Mar 2023 07:09:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id si16-20020a170906ced000b008e1509dde19sm3866687ejb.205.2023.03.16.07.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:09:54 -0700 (PDT)
Message-ID: <ac27570c-73ab-ff58-d8f8-c6c5d0fa751b@linaro.org>
Date:   Thu, 16 Mar 2023 15:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/15] dt-bindings: clock: nuvoton: add binding for ma35d1
 clock controller
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230315072902.9298-1-ychuang570808@gmail.com>
 <20230315072902.9298-5-ychuang570808@gmail.com>
 <a64bbd77-cd5c-8149-51e6-262122fe954e@linaro.org>
 <fd60a5af-8831-3d58-41b0-b220130c9e05@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fd60a5af-8831-3d58-41b0-b220130c9e05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 14:35, Jacky Huang wrote:
> 
> Dear Krzysztof,
> 
> 
> 
> On 2023/3/16 下午 03:31, Krzysztof Kozlowski wrote:
>> On 15/03/2023 08:28, Jacky Huang wrote:
>>> From: Jacky Huang <ychuang3@nuvoton.com>
>>>
>>> Add the dt-bindings header for Nuvoton ma35d1, that gets shared
>>> between the clock controller and clock references in the dts.
>> I don't see the device binding. They come together.
> 
> I should move 
> Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
> into this patch, right?

Yes.



Best regards,
Krzysztof

