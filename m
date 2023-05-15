Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B883C7EE2D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 16:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242879AbjEOQmM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 12:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242612AbjEOQmL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 12:42:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4060B44A6
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 09:42:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50b9ef67f35so23075305a12.2
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684168929; x=1686760929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGn8HAuIocxoHajMCSRRfoguprnK9ZSWlAhG7ClLNxU=;
        b=ntSUivjlQsSveCo7qvqN4hvYLt8/4YSecdN3T8kf9zGq+Yc6ZGkxC3iSAbw7l0ol/J
         p8Y3Fv1b/fXPs8S6bWHfgdBVHc+6f8dC3qXxlEjweK0Dr+BbPMgnTtPsoWsd+7sigaz6
         P2tI2n8ChAvwCCsm8Ih3MzBzbdX8dufLrMLfasxGZCKS6GwB8edWSB3kMyPnEZvffz38
         yZuSueXFekNmMyd606fbEUpjGYy/eIEPkIZQfBquwUJNOhU+qXiTycmEaIVG6xV0A25g
         UhM09eopARPRGIzugkU1Rh6GCT6oy2f+VufN3WG0Ln7+XJHuZ5hlikXTl0kYRaS864d1
         tuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684168929; x=1686760929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGn8HAuIocxoHajMCSRRfoguprnK9ZSWlAhG7ClLNxU=;
        b=CJtWwCe5DbUOKS3sqE2qDWR+oPfxp3XBeMEp0QHrH7Slwacb33UQPB5tJdeGtHVUSY
         8dZ2Ndb3NS/RJ1LOIJB6MEIzEpd69APycPUUt2uHMh6wRxPB0XDq4ZXVN00ZmPzFR2fR
         Ow6m1CdzLIZ0ZoYDhlCGZYm3DATqMk/8DKF76L9Wuc8ED0H16PM8caWhcZbBx0TSLfS1
         ZRKuP9hGDaD3Pn09YQv+tIPqP/yOVJrgVk9m9AHBoEppUABf3qJRMVRyVErpOZzGVqmW
         W1cUe06vJtMQG99d431A0IfNhQ6UQzLxfJ8nx/V8GyHXpJvo/MxJUnJODAsXVTkyoysS
         Vvkw==
X-Gm-Message-State: AC+VfDwww5jUCNWyxLIE7G8Vye/+xFkDOd0GAA7mwd5npbZ/sPsKRkxN
        5w6fSLZCGOA1p69z/gsLxwStkw==
X-Google-Smtp-Source: ACHHUZ7QficGch3Sl9q7M8rHIXIEkBIuRgf/Sni/Jw1SxXmU9/+Vxw6610XGNRBN7zoz6cqyNfYj6A==
X-Received: by 2002:a17:907:d86:b0:94a:9c4e:d2e9 with SMTP id go6-20020a1709070d8600b0094a9c4ed2e9mr31118316ejc.0.1684168928739;
        Mon, 15 May 2023 09:42:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id n8-20020a056402514800b0050d8aac0a1esm7408463edd.19.2023.05.15.09.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:42:08 -0700 (PDT)
Message-ID: <5f41d497-8b3c-42b4-22ba-b24772abb3a5@linaro.org>
Date:   Mon, 15 May 2023 18:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 04/13] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Content-Language: en-US
To:     neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-4-2592c29ea263@linaro.org>
 <fe2f22c7-8c39-faf3-bc65-a7c089200134@linaro.org>
 <eaa3ecd0-dcf0-01d8-b3ea-9dd900215839@linaro.org>
 <80da6b9e-ba82-d2c9-2854-b444635150fd@linaro.org>
 <14405799-9b56-6767-4a35-51ab8ae636a9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <14405799-9b56-6767-4a35-51ab8ae636a9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2023 18:28, neil.armstrong@linaro.org wrote:
>> It's just a link stored in automated responses, what's here childish?
>> It's still valid in current cycle! Look:
>>
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
>> What's the difference? Srsly, I can point you to submitting patches
>> without reference to specific line if you wish... Or you can check by
>> yourself.
>>
>> I give the same reviews to so many people that have templates and Elixir
>> happens to be the only place allowing bookmarking specific line. Which
>> is helpful for beginners because the entire doc is huge.
>>
>> I can make an exception for you and never paste direct links.
> 
> I value those kind of links for beginners and newcomers, really, it's a good
> thing to do and we should all do the same.

Hm, if I understand correctly, you felt being patronized by my link? I
apologize for that. It was not my intention and there is really no need
to feel like that. Look, I have many, many templates so I can speed up
review. This one I gave to many:

https://lore.kernel.org/all/?q=f%3Akrzysztof+%22Please+wrap+commit+message+according+to+Linux+coding+style%22

Writing same review every damn time is a boring, absolutely huge waste
of time. People just make too many same mistakes. Better to hit key
shortcut.

Over the time most of my templates grew a bit, because when I wrote
"Please wrap to 75" submitter did not know what to wrap or why. To save
myself work I extend the template to something more. The entire text and
link is for the beginner, not for you.

Best regards,
Krzysztof

