Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD85C7618A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 18:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjCTSJb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 14:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjCTSJJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 14:09:09 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3172FCF9
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 11:02:57 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so50071374edb.12
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679335370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0eoWfmO41fcTesmFbumMelX1mm4aMPERyhh0espiXY=;
        b=qmP95LEReUwzh5aFhObeTYcZF8mkRX+F2NKB82E7CMqOUN2qq7XLyh8EJXDIKkvQ9M
         iRMAPlV3qmDQl46VrmXFD9r16xGdGc3riIb3SX5cjcxqca9Ixlf95ni69oIUH9yfMHPj
         ya6DT8n8KRcHpeIZ8EaCGlaOlDPu+h6b1PvZCW/1ZnwJSe+cxxA4RNuPd6I964iA7un5
         PKDxsMcZIbVOtW5IHFoJcXGK/Hb5N4WV8jtUOWRWQ0WzGbkuWtW+qPzLRYVZ9J8rR1yZ
         jZxLhkTneuUUVn/AlSD3jYviJfqOdXocoPv/ztf0jF1GLiOiYxY6NwhNb7uAkrtM5Qfs
         +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0eoWfmO41fcTesmFbumMelX1mm4aMPERyhh0espiXY=;
        b=O+hCS9xZKDGhJ88uvDIiPLT32p7oBzJ5vSIWZcehHGkOJyVJeto1Mbuxocu2k5k6x+
         ZW8QjG124O5AQ+R8LQeePQf4KpSXB7VK+2YBoLd51q3UJMeXp+fIeQJBikpvdibcP7BS
         hqUYS/Nx3BwphOKp9QcKyJNddkgklIwmLMu/beE5V1QXqIXvragn4BBZJ9+T7RAsFPYO
         pHmiY098Q4HwTm7CHoigeNcY+G1UDSpubu+S05nLyP3K7a61/rsEz9qgCYYpwbSxcjtr
         H0tDzLwyuuiMIx/c0V0oOORfe1oRDWAXt2sx82GKUSjt4aayF5bOwR1fJPI18LbEokqO
         kHPQ==
X-Gm-Message-State: AO0yUKWW625samAdGdFrfOTFfp7BLRyvqYucoVQitlTK8SyX6dLbBG6A
        oNzz+Y2GOmCabdBqXmtapQm4Bg==
X-Google-Smtp-Source: AK7set+X8Ws3lSJorXAGlLHIxDKllor1Be8KbnrGdbc3YDiOHCp60p/e04Sg1zXSgKAnrXNGG2uQuw==
X-Received: by 2002:a17:906:2b15:b0:922:8fc9:d235 with SMTP id a21-20020a1709062b1500b009228fc9d235mr533372ejg.9.1679335370626;
        Mon, 20 Mar 2023 11:02:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0? ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id gv27-20020a1709072bdb00b008b9b4ab6ad1sm4705102ejc.102.2023.03.20.11.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:02:50 -0700 (PDT)
Message-ID: <21a90597-78c9-4d46-7b01-257702e7afca@linaro.org>
Date:   Mon, 20 Mar 2023 19:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] dt: bindings: clock: add mtmips SoCs clock device
 tree binding documentation
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org
References: <20230320161823.1424278-1-sergio.paracuellos@gmail.com>
 <20230320161823.1424278-2-sergio.paracuellos@gmail.com>
 <1e2f67b4-3bfb-d394-4f60-e6f63ce6a2fd@linaro.org>
 <CAMhs-H8OQ9gJLsifLuHD2GN8rYwnY=Zmdb0kMEfX4UUHhjMUyQ@mail.gmail.com>
 <d0f74721-bf5a-62de-53dc-62e7e735e2dc@linaro.org>
 <bdc82b4a-f1a9-0372-5a57-200a422b1b70@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bdc82b4a-f1a9-0372-5a57-200a422b1b70@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/03/2023 18:57, Arınç ÜNAL wrote:
>>> All of these are at the end the
>>> way we can properly match compatible-data to write a proper driver.
>>> The current ralink dtsi files which are in tree now
>>> are totally incomplete and not documented so we are planning to align
>>
>> Nothing like this was said in commit msg, so how can we know?
>>
>>> all of this with openWRT used files and others soon. That's the reason
>>> we are not touching
>>> 'arch/mips/boot/dts' at all now. I don't think anybody is using any of
>>> this but mt7621 which is properly completed and documented.
>>
>> Anyway, none of this explains exception from naming convention - vendor,
>> device or family name.
> 
> Would mediatek,mtmips-clock.yaml make sense?

More, except:
1. This is not clock, but sysc.
2. mips sounds redundant. Do you have rt2xxx and mt7xxx chips which are ARM?

Best regards,
Krzysztof

