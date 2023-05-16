Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86F9C77B7F
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 09:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbjEPJbo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 05:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjEPJbn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 05:31:43 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875C71997
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:31:41 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-965c3f9af2aso2129536566b.0
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684229500; x=1686821500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nihm3Do/jYZpk5hTKjhQtOwCyKKzOg7ffIDGvfFkZDY=;
        b=E2OQ4sV77vnvS3oG+lICbJM8PRrM0Is0aTrjTci7hnYWEF03LsA5F3vzNIkclaoSoF
         uDpC1BvLXFrx6JJvnNO/wuUExwsdcxdGyGdwAhfH8KvAkMenO+qGftPHZsbuDM0y0Qmj
         rMMkDbQ+buTOrmNHEraj4COZs1ZOCm30l59N4HAZ+fHC8ymVp5T6a/kQWZZwKFRkqcm/
         +exwEJf+5Zb1lqYVmH5SiP3A5PKeN1lwvxBk+TIZqjeR9hio957ljYRWCZPutYVsK0a1
         SeWa7/PfZnJhqFvSCpg2KfZa992P9QzcD4XqHUQ1/D6w1Jg7L43zuTf21eBYXYgE3f35
         B8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684229500; x=1686821500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nihm3Do/jYZpk5hTKjhQtOwCyKKzOg7ffIDGvfFkZDY=;
        b=I7G2N8KjGgmPMWYmXSbjjupKQZ/DKqzvcH+7PVdTgRaMwPTdIk27NXuaY8MjRcS+Av
         Aoh+X2bbqCmlJZuJWVZBCKl0qSH/JTL9k0xJLnHEHPeIqnr41S6jr6Z4DghQ/qSZgsrS
         p5WdEJRVljTRFB1BDqT9y08Nn3k40ViZ+YH+ZwTTo1FGBfM/WiWR06Nk4TbjE+p4Wl01
         rHeOsXnY1GxyF0e9i/46bUp5ngydHxb7eGUou2w1oHTGpsWsTgxU4d+eMDbqSB7Q13yn
         J/r63QbiKgcrcU1Ime8zPZzHwAL6H201d3EB2qSQq8FSWshVDd2PAVjkjk3UttKKuYxr
         QMew==
X-Gm-Message-State: AC+VfDw2VKUf7GaKGUA4blmtzrZErOvYhSjlBMJmRWWfIHsY/aXwwexd
        ccJs/Vmk64Cp1Fvjw2pAAAcfrw==
X-Google-Smtp-Source: ACHHUZ5S7lHC9GBB63RVot5UzBveUyGBIm2S66/kFGOsCzwp9dmxU9oMaB3+0GcTywB8/5fNKb3Bcg==
X-Received: by 2002:a17:907:2d91:b0:969:f3b4:83 with SMTP id gt17-20020a1709072d9100b00969f3b40083mr22191059ejc.71.1684229499757;
        Tue, 16 May 2023 02:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906c21500b00965fdb90801sm10804120ejz.153.2023.05.16.02.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:31:39 -0700 (PDT)
Message-ID: <0aa96881-73ee-0aa5-efc7-7fa94248789d@linaro.org>
Date:   Tue, 16 May 2023 11:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 0/4] Add S4 SoC PLL and Peripheral clock
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230516064736.10270-1-yu.tu@amlogic.com>
 <c4d30304-08d8-6a31-8f91-7840fe2922fb@linaro.org>
 <bfc27a11-9be1-2391-3d26-62aa29fac190@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bfc27a11-9be1-2391-3d26-62aa29fac190@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 11:25, Yu Tu wrote:
> 
> 
> On 2023/5/16 17:20, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 16/05/2023 08:47, Yu Tu wrote:
>>> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
>>> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>>>
>>> Yu Tu (4):
>>>    dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>>>    dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>>>      controller
>>>    clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>>>    clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>>>      controller
>>>
>>> V7 -> V8:
>>> 1. Change patch 0001/0002 dt-bindings title description, remove "meson".
>>> Suggested by Dmitry, Neil.
>>
>> So you only removed one word from title and description? This does not
>> justify dropping review tag.
> 
> Yes. I just remove one work.
> 
>>
>> You already got a comment for this - add the tag.
> 
> I wonder what I should do next?
> Add the tag and RESEND it again?

I cannot add other people tags, e.g. b4 ignores them.

Best regards,
Krzysztof

