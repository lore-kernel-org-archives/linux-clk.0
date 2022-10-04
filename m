Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D64AC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 06:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJDGzb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 02:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiJDGza (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 02:55:30 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039002D742
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 23:55:29 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x40so3593732ljq.9
        for <linux-clk@vger.kernel.org>; Mon, 03 Oct 2022 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zhHds6t7Vj2FDDurokeQYOjyq3ixp4u5MQEpu4pX2fo=;
        b=jqU8ttcDaBtmie0K269Urd3CH8YJ7NXFekdMHkTc2TeN75GnwJt5MmzKPlO9WLL47H
         I7NSu3iT54Qym5w7mY3O9HXPmv1d0QooYq6/itirOiGpqZVaX4jyigKaYDVMdLwpwpnT
         3ng9QbG0UoWbis1inKt5gej06nJZJHdn+zkC44X+bhHTuCZWvmuOVjQsgBvgUHgCKFaK
         fdZeBYW8grP6awCdmGIn/Ox4rG8SfxPfM5OEAi8yVCBlFCTOfnxnms5wBETyeB9vCx0w
         c7QePxmaK9bKMt5FmrSCrgsPX1TBCPZZyFaQj4QfvAGCCnKOKY3sFmqDsJPS7FiZR3Dy
         TkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zhHds6t7Vj2FDDurokeQYOjyq3ixp4u5MQEpu4pX2fo=;
        b=zGib3EFmtwFz2MgF47M9xJhPjqf/Ij0GCuQjjR6zV4/DOBIM46ne4ipIXI5fEsgFkL
         UCKoGlEBwFf7hC3Z7PdsEMYwUDXpEWA9++J6BPnU3BlEm3WCYKq/gIAMFyd9Yd3phw57
         a/wuhUdtogQdFmRl2uUwMl4YkzkCR4f5+Vqnib+DNjBk9q5cbX4j4yS96498t1gidxHF
         Nl7tXE5ykC+MOREMGDi7r6EWJKmUNH1VczZWmsirLfsb9m0a4vEJohqqOloPlYHgzlte
         LEYcygU2P3p5ez4ZHjgu1B7+aWYvU2Ee8kbJMeNrWjDkzCKtUN5k3TNSDKMgLySCH4Q+
         maOw==
X-Gm-Message-State: ACrzQf3DAOX0X7QdQ7D9eBnaVKhskpDdBsHpMm6YgUSNxou0bPJjwL8u
        Apqxs/XOQXjmdvOjJwtEvnKdtA==
X-Google-Smtp-Source: AMsMyM5UcCi5dSdpAFBr/Bo/JWakaU2nYEVHh4ZqL6y4akCm2leA7Ow6PmtEqp5ck2DJA+3U5upVww==
X-Received: by 2002:a05:651c:232:b0:26d:b4b3:a78e with SMTP id z18-20020a05651c023200b0026db4b3a78emr8120186ljn.38.1664866526886;
        Mon, 03 Oct 2022 23:55:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y9-20020a05651c106900b00261df847ab0sm1142746ljm.21.2022.10.03.23.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 23:55:26 -0700 (PDT)
Message-ID: <f612098f-e7e1-b3b3-a738-cabccec43bf2@linaro.org>
Date:   Tue, 4 Oct 2022 08:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add QDU1000 and QRU1000 GCC clock
 bindings
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221001030403.27659-1-quic_molvera@quicinc.com>
 <20221001030403.27659-2-quic_molvera@quicinc.com>
 <37926f0f-e176-929e-939a-cd43a031e224@linaro.org>
 <bb241d46-6f90-8604-e79d-30a1f3527ce4@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb241d46-6f90-8604-e79d-30a1f3527ce4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/10/2022 20:47, Melody Olvera wrote:

>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source (Optional clock)
>> Skip "Optional clock"
>>
>>> +      - description: PCIE 0 Phy Auxiliary clock source (Optional clock)
>>> +      - description: USB3 Phy wrapper pipe clock source (Optional clock)
>>> +    minItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: bi_tcxo
>>> +      - const: sleep_clk
>>> +      - const: pcie_0_pipe_clk # Optional clock
>> Skip "Optional clock"
> 
> Will remove all optional clock instances.

Not the instances of clocks, just the wording, comment. Whether clock is
optional is quite visible from minItems: 2.

Best regards,
Krzysztof

