Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1112CFA3742
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 19:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbiJ0Tfn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 15:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiJ0Tfm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 15:35:42 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5822233429
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 12:35:38 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id j21so1848157qkk.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbyRCm0Gd+FdmeUyOk0cfhcPZPMWQsesg2OqEvdkBMY=;
        b=j3vz6sFcbQSd0afRiCWntxVUNamj7BKNT3CG8p8boI8cNle6Sh4PTVw09VO/JZIErd
         qBccPwh1v+Q5HW37rBDQAuwGRAv1vEgzVeoBMKLuadehHckfiIHJfOasJpcR1+21wWuX
         U+p0QMSok2HhlUGZ/xCVNh7OIyrU4IuHFiURIQv3CvvFq3wTCgVdDYM8f7ay/kuDO6jR
         bSrg0zapIplvURWvdTahisCfIqmQHQEWCItRR0vsyGT7Vnvf5S+pM8jBX07H8+TcV/XU
         gtQemTMj9BrnbiDL07902TW5n5/uhthi+fvDAbvCObapTCROmBcHeUXNYa3nF+mn9kE/
         T/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbyRCm0Gd+FdmeUyOk0cfhcPZPMWQsesg2OqEvdkBMY=;
        b=pBL89sILLEW7U5M16k9mVBwbYxGnEpQyTVqgeWOwnMu2FSXvgSqV9S/7MDlZ/tXY1o
         GltGTTAxdtD1aU0oFTfTZKSRrjFeCV36n1k/PzTUUDS6WWvMaUAZwTgNGlBwRROVgUNj
         tIOoCUp3Jk4I17EUq7ui3aVTJuJZh9voqtlXtbNX+JWHURyADMenpqhrhKTeN1OBmB2h
         v9I4ZNj6CHV9ItSDEo2r+xxRGhc4yZxxTg79mi3ainVyfaKDC03IM1d4thAeILqrL7zY
         roIxWoRtmfUigoNCZVlBUMEwgFH+KxSM+RS4JeAbSr8RxlLG0BMax5q+uqxT4xtkX2K4
         MUaQ==
X-Gm-Message-State: ACrzQf2QE/OYtyFejSkq3MLxFXtZFB1kC2COkvi8hy4iD95v32bAE8Ge
        9ix1ezAPpNDeW+ihqRCbZ7NKt85cXcBlNA==
X-Google-Smtp-Source: AMsMyM7UyL6+b/aQPAI3CY+Xvkdme18kpF4TO6jo+zW0vg83EZsyIQlHiR3SangdxR7Abxx6CvOWCA==
X-Received: by 2002:a37:48c:0:b0:6f8:70d5:9a41 with SMTP id 134-20020a37048c000000b006f870d59a41mr9781062qke.676.1666899337987;
        Thu, 27 Oct 2022 12:35:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8480b000000b0039cc665d60fsm1289355qtq.64.2022.10.27.12.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 12:35:37 -0700 (PDT)
Message-ID: <cb9a2732-0904-4a2b-61a5-a6d65cad58ae@linaro.org>
Date:   Thu, 27 Oct 2022 15:35:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Add QDU1000 and QRU1000 GCC
 clock bindings
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221026190441.4002212-1-quic_molvera@quicinc.com>
 <20221026190441.4002212-2-quic_molvera@quicinc.com>
 <e5009a33-1f71-1fe3-3a06-98bba031fdf0@linaro.org>
 <20221027182449.366AEC433D6@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027182449.366AEC433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 14:24, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-10-27 08:54:51)
>> On 26/10/2022 15:04, Melody Olvera wrote:
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on QDU1000 and QRU1000
>>> +
>>> +  See also:
>>> +  - include/dt-bindings/clock/qcom,gcc-qdu1000.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,gcc-qdu1000
>>> +      - const: syscon
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source
>>> +      - description: PCIE 0 Phy Auxiliary clock source
>>> +      - description: USB3 Phy wrapper pipe clock source
>>> +    minItems: 2
>>
>> Why the clocks are optional?
> 
> They should not be optional. They're always there.

Just to be sure - I refer to last three clocks here as indicated by
minItems:2.

DTS does not define them, so something here is not complete or correct.

Best regards,
Krzysztof

