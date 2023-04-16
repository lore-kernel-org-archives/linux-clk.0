Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347A8C77B61
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 18:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDPS1I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 14:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjDPS1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 14:27:07 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B852210D
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:27:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id vc20so3658248ejc.10
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681669625; x=1684261625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq0Q6wAskItqzcqOpwtpc6JqQ468ZGZvjBNgr8B43M8=;
        b=FkB4FQjiUGtlOfB6x1PlP04HMciKpjnbn2tgyaA5GIJMZum7uH2/qyIELdnmDXi2F8
         GB+3+4z57AAFZDIOgC/EMA5AEAyQ7UMD/Z6p7jZgqBZjlxOlRPPCSzR6EON/EcJG9CRE
         w+XGBN185Pb7bhkd/qI5J0U5YUsXuW32JlHZpA2PjODiu90C8wR1joT12rVMj3czci0R
         E74fuFy+LBqnv7kwWfzCGv6quiJ3OGrFtBw1fH0Tc65MZSYdAODnmGWKcorPZ5onXedd
         VtQdoowp6luL3l7bdAp45kNvxaVE1zIChhz7OQsJP+9PTOpoG9oZEs+0PRKcp29wuurk
         6YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681669625; x=1684261625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hq0Q6wAskItqzcqOpwtpc6JqQ468ZGZvjBNgr8B43M8=;
        b=lwp8744sykt1uSa4QISLnPk+9VSUmu0dOjJXFPsAZqGrfIz6XPUCJCmm5Qs8SsYMoy
         ixlSkkuyRSmUNsz44/g8/pZ0EkGdczzsVOIkzz+MSh9QhYwP3QICNQyIFUg3ysbt54/s
         MTke20a75+0VNXwuDWIwEIXr2mYId0i9kGo38vOXFsfzSqYF4BBCqqbXWiLmKuToLmRX
         hJGZMlYtFrLb25DpCMx7ZUCyDUXUniTlZf/E+jJdKKi57I4BbI8I6MGJK2h+6ESbY3V7
         ZEcJmuvNjyKXop046M1ZdyE+N0d/Jj1RBXbcgFkHVfP+xNYGVZDRLCW61K5I+zfXVTLy
         9w9Q==
X-Gm-Message-State: AAQBX9fzXCE4rW9qsgdNv0XA38kdeIK5XaL9mVvcwU/a2bR6si+uIn/R
        W5Rd4iWNX3LnfdxU6NGtYc03/A==
X-Google-Smtp-Source: AKy350bYpP3jHXdwlV/K/hLgaWhHQ1ZZqrjCWLK9edGDtv0WBGsGSrwuLD9bRyxBEOQJKcdC+ltAog==
X-Received: by 2002:a17:906:71c4:b0:94e:6dc8:7ba7 with SMTP id i4-20020a17090671c400b0094e6dc87ba7mr5656457ejk.34.1681669624962;
        Sun, 16 Apr 2023 11:27:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id x6-20020a170906b08600b0094e6db4d4a1sm5393320ejy.186.2023.04.16.11.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:27:04 -0700 (PDT)
Message-ID: <d221e0fc-5dc2-22d4-c35d-07860b475124@linaro.org>
Date:   Sun, 16 Apr 2023 20:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add simple-clock-controller
Content-Language: en-US
To:     Yangfl <mmyangfl@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230416173302.1185683-1-mmyangfl@gmail.com>
 <20230416173302.1185683-2-mmyangfl@gmail.com>
 <c6571a6d-bf55-14b3-102d-814af6763be7@linaro.org>
 <CAAXyoMO3PXtbc1KxF10+BkMNEKKQuVrHKmR=n8rRPJycbQyxug@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAXyoMO3PXtbc1KxF10+BkMNEKKQuVrHKmR=n8rRPJycbQyxug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 20:22, Yangfl wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 于2023年4月17日周一 01:38写道：
>>
>> On 16/04/2023 19:32, David Yang wrote:
>>> Add DT bindings documentation for simple-clock-controller, mutex
>>> controller for clocks.
>>>
>>> Signed-off-by: David Yang <mmyangfl@gmail.com>
>>> ---
>>>  .../clock/simple-clock-controller.yaml        | 50 +++++++++++++++++++
>>
>> Where is the changelog?
> 
> What changelog? Series changelog already included in series cover.

Changelog of each patch, since there is no cover letter. If you skip
some people from CC, then be sure they get cover letter (if such exists).


Best regards,
Krzysztof

