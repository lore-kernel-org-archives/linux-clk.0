Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09217C76196
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 17:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239681AbjDFRX3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 13:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbjDFRXY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 13:23:24 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F3FAD0A
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 10:22:53 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-93db98f7b33so111784466b.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=145yGzODgxY+rJbwAEpe0vSJYcWx7FkVo4x57vw/2Ds=;
        b=J3QonWmOAxHMqJ1EOSUj4Rs4updaQcuUihcgcTFNhvmsCy6vBtmalIIUSokDtx0F3o
         6nHdCIpzrLSH+VxgApjJ8P2UKckkNOkxX/fwqeuvB1cGopdBPEPwOnwC0KJ3GsZyHB2W
         lszpadIv4hDgi03TskBGJpV3t+bDZsTEL0pGZgx1pl2e+DHeJwKaUvIFHVjPHSxHNkqP
         jZtZPk3HiuFjSs3/9EMd2Q1h/dPqJqn3uopp1XusIxh+cfVVyR84rP6A1HeFr3Huklb5
         JjnpiK3qXY8wlTF4ziKCllgSkJV7EMH3nOtGeRVKFnwORSESnC2LfbhneG+9pO1Bz2WS
         sPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=145yGzODgxY+rJbwAEpe0vSJYcWx7FkVo4x57vw/2Ds=;
        b=USM/bGi2pPv9ZbZ+L3s9jEXMkuPmNWp9YIBP+dhn+rnhO/LbgsYGUAXysDtbd4/olI
         u8ZFlgAczu3/YRtyFcQ2HutV3fR6W6sC2DB4+So77qpzf97ChBvxpgnm6iNrcoMAR+6h
         WcwY+e4X6VbsSF3g0nYePBbzzJsxFFMqWLvwHoqpkik9rrqB6a1KE5m3dA2DHGcP35yJ
         dc22hnTRV+TESfE6OnYY3NeGGoLWaYggNIBhIiq6AGRRUhub6WrXvc2GR7gDcOwZa32X
         0aQQl0ZT843isLVhiKJQ2oBrpW33+K/r2UOqaIZKnmOM3tzm9kafHmU2E2GI6Ex3Q50U
         H1iQ==
X-Gm-Message-State: AAQBX9eHQBRUzbecPQr1JzZZkPq0jp2watQr1XqImquVVe0a9sTOay/c
        LCdLehzmvdTKbT5A4oinfflHHA==
X-Google-Smtp-Source: AKy350YRBx7KoZyPvNoeZ4w8rpaupgS8OEN5BdZpbF0ZP0CslF/6SZi49GUb5ys+HM8ofDMXceerJw==
X-Received: by 2002:a05:6402:344:b0:502:246e:6739 with SMTP id r4-20020a056402034400b00502246e6739mr235993edw.27.1680801707878;
        Thu, 06 Apr 2023 10:21:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id jr3-20020a170906a98300b00933356c681esm1046545ejb.150.2023.04.06.10.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:21:47 -0700 (PDT)
Message-ID: <c79ca1c4-d7d7-50f5-ee2c-1c1ff459c429@linaro.org>
Date:   Thu, 6 Apr 2023 19:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] dt-bindings: Add Blaize vendor prefix
Content-Language: en-US
To:     Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "soc@kernel.org" <soc@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-2-nikolaos.pasaloukos@blaize.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-2-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Blaize, Inc. (www.blaize.com) is a SoC manufacturer with integrated
> programmable Graph-Streaming-Processors for AI and ML.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Four people were working on one pattern in vendor prefixes? I have
doubts, because this is very trivial patch.



Best regards,
Krzysztof

