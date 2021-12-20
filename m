Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA33C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhLTJir (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:38:47 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59604
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229787AbhLTJir (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:38:47 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6171B3F163
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993126;
        bh=dz6QFkxil+mKwYeYNiGaZzN1by93ig0Nsk5mlfTqUe4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pvhA2hKWL5qSje/hmnUptD2wCMr2TWtIbv0XHQ2tBnJLtmhGE1Jr9Eq7sKYD0iu97
         bN3XVTJSKTEshUcvp6Jad0FNpM3g0Wbe502m+J3KqZfIZpVLF0pUyNfdXA0lr3ovw0
         shmyAGpldSYRMdL0iSznmETIqmaVVECkLnBlyGLS2triOIBDsHDo7yw/VLrz8tpDyB
         gYfjqmz4dIKElEVOFb3vXrNzEIB+XwRvzMhYfMSoZ80mtpPwWFVOR+9wQgT4DB/Slw
         L4k+Rh2gMpMMC7CCbAOm16eVF5nvKqLyR2akANGqoKVAicrj9asbIC8uE1pIbjdeQZ
         AKdAnW4habdbw==
Received: by mail-lf1-f69.google.com with SMTP id 28-20020ac24d5c000000b00425c507cfc0so1426261lfp.20
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dz6QFkxil+mKwYeYNiGaZzN1by93ig0Nsk5mlfTqUe4=;
        b=mVsRsHz1qb5zpS+2FdG5wdXKJ6w4A17dCx4QzDdWYILe1QhO10pE1flK8ksxLPLv4t
         0jtSctqLoHxBJU83JMwZRs2SepmgqUsu3KU1tsiXzSvpdtMUUfSmRsaog/l5IpIY6BPM
         7M8j7x0ft5A6Ebpi0n3CScFVLLZkEbnhCl9cm4crkcBmG9OgCHyhUOSNSFhUwh7oLwyV
         TIw1tCRTuh/Mmimo3QJt/uZrhgR3yNfKhlehtBJYKDXn/3fYLaDicAT8HHOJ1l0/trsj
         dGd/9Z+DoCoLkbudF+ksQ6xuJELlO1lla7jlkHJMUQqGbdv3rdl7d2M38iGMmD/YmbnF
         l1Ag==
X-Gm-Message-State: AOAM530wvBvSOkZ6Ofu4mG38X+8ATn6ApWmQdhQ1EwSaqHT7FBPR1WPJ
        NPrdZqWSVDzeU9qe4hlXvtgw0tOfRcO+bmqb33ydF4mS9L5gEQCVzoX5tO0h1VnrZ6+Yb+qMIry
        8EDNEIHsyuxWfhP++cmZhbHeozYyjoNyf7Wo8OQ==
X-Received: by 2002:a05:6512:682:: with SMTP id t2mr14515144lfe.503.1639993125879;
        Mon, 20 Dec 2021 01:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkAX81uYsA9KWyRerkrAl1PymORECC6YyMtRfMeEg50dsgMQ9YoDfBCysp1P+YA4xQKOVwow==
X-Received: by 2002:a05:6512:682:: with SMTP id t2mr14515124lfe.503.1639993125721;
        Mon, 20 Dec 2021 01:38:45 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id n10sm651478lfk.246.2021.12.20.01.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:38:45 -0800 (PST)
Message-ID: <b5ff4ca4-30fe-200b-77ee-1f1831329a99@canonical.com>
Date:   Mon, 20 Dec 2021 10:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: (subset) [PATCH v4 3/7] dt-bindings: arm: samsung: document
 jackpotlte board binding
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-4-virag.david003@gmail.com>
 <163958527260.183299.17749602272220762675.b4-ty@canonical.com>
 <b244735f83010fe198ead3b818ee0718dc654879.camel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <b244735f83010fe198ead3b818ee0718dc654879.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/12/2021 15:53, David Virag wrote:
> On Wed, 2021-12-15 at 17:21 +0100, Krzysztof Kozlowski wrote:
>> On Mon, 6 Dec 2021 16:31:17 +0100, David Virag wrote:
>>> Add binding for the jackpotlte board (Samsung Galaxy A8 (2018)).
>>>
>>>
>>
>> Applied, thanks!
>>
>> [3/7] dt-bindings: arm: samsung: document jackpotlte board binding
>>       commit: c96ebc5fde274edcc02543dcfb6a1ee097f98070
>>
>> Best regards,
> 
> Hi Krzysztof!
> 
> Thanks! As I'll be sending v5 of this series soon (only really adding
> r-by, acked-by tags and only real changes in dts/dtsi patch), should I
> omit this patch from it since it has been applied? Or should I really
> only send the dts/dtsi patch at this point? Sorry if this is obvious, I
> just haven't sent that many patches before to know this.

Skip this one, please.


Best regards,
Krzysztof
