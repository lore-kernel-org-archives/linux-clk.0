Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA0BC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 09:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiECJSv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 05:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbiECJSu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 05:18:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647C7186EB
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 02:15:17 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z99so19158221ede.5
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QpzTwMUaWkvlXq76pCPAlQdzdqzU4LTimjtHp3aqBQY=;
        b=RJhRAcUARvfPjXFa8qUwSrQz26rstyXRnCVw2SNoSMQBVQUIC0eLJOi1aXS5P3j122
         QmV3XzQlcYIrcGMuxBDZgVB7li+XsNOQVhjGVy9AsveFRwbVcIZz7w4p96JpfFQOwOyo
         KQ73XOgHl8KTRwoi4lTYY5njKchTPf8VrYhD5MhJphht+LCVFEkXyOesBWa0+KKgvxOQ
         95wpG3+y/Nd3DcTfp+ndnoXw1i6xF6WDOOztNYn9fq0aUnOSeSOsF7rYIFV9/IU8UL7C
         WHSyrJ08qw6PvTRDNWLlJXMHsI6JQ+7Lbh602X7aAauRuv7mvJgLL6M5KE/3/ZPnxe//
         CU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QpzTwMUaWkvlXq76pCPAlQdzdqzU4LTimjtHp3aqBQY=;
        b=4yiGRj5tIwQefBF13sLPC3cf9Dv4suQjT6VWeHtpgQirzkENDAbaaIXhMFOhCKHFDV
         o3E9b7Wk1nYWcQkLj00VB0507SMmecUIuJE3r3kdZGVwLiL9YKktBczjxTbg6Mhnv0qb
         WkdV9HnWUQJa4xu7Lnj1xqeOW7+5hXx1p9M+MY5PhIKkqdDWScmEmjOHYQGGgVfyeTYX
         stKZ2+zmK+7eOyHvgqX8p1M8QXc/DA3GL2hLqgXpp1sSjkAdVFCUR39b6PW2svF3uQab
         EuE4ej4Be6MIjpv8B2mR+VeBJjPudpK5oBApPHYk5RbilNV0ErZK1Te76XEQtQ0v1k6j
         mScA==
X-Gm-Message-State: AOAM533/DTa49CmX1u55A0sFIdvv09nlI917n0KeRA0DwVhp0cVaem4N
        mNILBLiC23OuNesmf99SguPtzg==
X-Google-Smtp-Source: ABdhPJyPXvVLQNx0vUMkuxWFGiSM6rBjqEZOcKCh3rSZ08GHSfvDUi2ot5KyWsyIUnQQZRYVgIEi5g==
X-Received: by 2002:a05:6402:849:b0:427:edfe:1b7e with SMTP id b9-20020a056402084900b00427edfe1b7emr1055462edz.355.1651569315965;
        Tue, 03 May 2022 02:15:15 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fb0c000000b0042617ba6399sm7585059edq.35.2022.05.03.02.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:15:15 -0700 (PDT)
Message-ID: <e82f3b13-7265-3ee8-58ca-475e3c079913@linaro.org>
Date:   Tue, 3 May 2022 11:15:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/12] clk: samsung: exynosautov9: add cmu_peris clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090100epcas2p283ed86d6bf1774cd596aff53267e84b8@epcas2p2.samsung.com>
 <20220502090230.12853-6-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> CMU_PERIS is responsible to control clocks of BLK_PERIS which has
> OPT/MCT/WDT and TMU. This patch only supports WDT gate clocks and all
> other clocks except WDT will be supported later.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
