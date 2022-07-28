Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4D4C04A68
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jul 2022 08:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbiG1IUJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jul 2022 04:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234986AbiG1IUI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 04:20:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F475FE
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:20:06 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id q23so1779442lfr.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DKzfCCCnKo3KEpIcC/EIkk48aTnRNunOV51qSF2JIg0=;
        b=K11/htmnd+5P5N6e+/fDuUA5yhnkoDDKjWZWWoVGByVs2g2geIP1E8LLgQd0WDPlFv
         BOd0ICk2MiuKnh6oigxU+LcCtJPOdkHEe5LK9J6SXtAHsHSJf1VHI+pQQOtx47QDJFGK
         6PQCzsyKjjDDAAEfUpFDURAtS5zIKiEoXR82uApJdhQxeIzXoKds77fw+mW2fQqgPR/L
         hAzWH5Aqgr6R6GMS7gij/ZnJJ7A3aSJXdU/7BwXuIsKHAi94O+C6fwCXWtLIP8tG0hN8
         xnXZTfDVm04wBX+6gnpio4o4N81z6EVKRE1iH2LG/V407ObYmCu9aOFBd47LSQycxIyu
         Cjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DKzfCCCnKo3KEpIcC/EIkk48aTnRNunOV51qSF2JIg0=;
        b=OAqXELg5aYM0FNBdYyxRc3zFy9VN9QtncPrrm+++hL1EmOqskKARL4t8fXSH3wgVCI
         +b6Myglg3//9Q4tyS2vvj6u8tYY+eob46VgJQqI+9o3Pl7bkyBcGct02tsdsQfsXfByH
         8KFRBldTs/8rl5W53mvXj0VqnXrrlCoh85XtDFC7tKmeIKo3bUeueuJv8PgUaAnr6wqu
         2WFQgEOYYSG3mgj/h+V3Pql37xWjJ4wsim9uGMX+8+7ZZkazeol6KK9besixS5GtCJXI
         aZNNleWaPCGNLHtcXQhCOpJ2ayxl8ruOUgEQrCXxOJTDK9owxgZaPOJQDUzun7tt3FMS
         jB+Q==
X-Gm-Message-State: AJIora/UyMFxswZobS1aKWDaQeAVspriyVXFi2clha1l4Z/7OiOe7Jhv
        yyzhTkABi1UI8o1Zx5JtigWLkQrNRWvABg==
X-Google-Smtp-Source: AGRyM1tYjlAr/l8HMjRK6lch+iSSPXvv9ggcKMcsJFEUii6FD895YJnlkl/W/UOFIsjL+fWjuSfolg==
X-Received: by 2002:a05:6512:a84:b0:48a:556d:5539 with SMTP id m4-20020a0565120a8400b0048a556d5539mr9947898lfu.6.1658996404853;
        Thu, 28 Jul 2022 01:20:04 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a1-20020a19ca01000000b00488d0e38283sm84816lfg.153.2022.07.28.01.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:20:04 -0700 (PDT)
Message-ID: <9f8bebcc-fc09-cbdf-aa62-3d0012df662a@linaro.org>
Date:   Thu, 28 Jul 2022 10:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] clk: samsung: exynosautov9: add fsys1 clock support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p47e21a2545b686d536de47518f7b5c199@epcas2p4.samsung.com>
 <20220727060146.9228-7-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727060146.9228-7-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/07/2022 08:01, Chanho Park wrote:
> CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1, 2 x USB 2.0) and
> mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also supported as a PLL
> source clock provider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
