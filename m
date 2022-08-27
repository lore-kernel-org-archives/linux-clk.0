Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F90ECAAD1
	for <linux-clk@archiver.kernel.org>; Sat, 27 Aug 2022 17:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbiH0RXs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 27 Aug 2022 13:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiH0RXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 27 Aug 2022 13:23:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EE42A72C
        for <linux-clk@vger.kernel.org>; Sat, 27 Aug 2022 10:23:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m5so5850026lfj.4
        for <linux-clk@vger.kernel.org>; Sat, 27 Aug 2022 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0Mev3wBjKkNkiFX8lECGnY4J/j2vehNJSt2NBjpTkII=;
        b=zwgU9H9OFoS/MCha3D3T74FztIUntYk0w7GricFMydQ02R6PZaY8fSgXHfEIYrzsq4
         CwTKGebSWniXKRREJn0FUhXjQ8Wbw5DhcHw2mk3L+vNbM7ts8O08TKtMdlaV5XiWCR9Y
         dY3BvvTqZCyh1WNsfZGmx04UoSPWI9AmWd6LvU2K2kDpsJ9Rik3rsiJhkOS6ZjPjD8k1
         XaWrUpw3T0sq3IYZpC3uyN5kfekE9FjtXYqo64ob2x9SRHVDgcucxUzooaPFiqFIAPh9
         Yi1mbp1xuzWpFpwYXGUZOLQ+axT0p3hWsK71/j4+ub+MBZp1nCdro/4gajyMbobFlklY
         WR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0Mev3wBjKkNkiFX8lECGnY4J/j2vehNJSt2NBjpTkII=;
        b=umu1nW2SXBYPc6uOsdSLy+XiVg0650luXgeAhzZdKGDq0xxBlLHKMfJUq92s5O5JAz
         5mrumAzBmGKgzIvWA4LuVsRNoORKl3q9ZBTFJbOU9NVkM0rZW5Gswa9HxhtJ12n77cp0
         f47i7Spic7Hd7R4Uea24GGe7XRqG8zW6rJZglxQkNNedFZc/C8DDQRN3hjy1FTkbsqOJ
         zBlmUVYB1P93JuHNO6xqk4n1SkTsOp/kSQRS0Kbh+24yxu8msLDgqRyf6ywOCAnY7dsd
         CfO/DuFu5VwyqOU3EWzdxC84DO048skpdoO9ZYzlxUW+lqtcu2YAVu7ygWF0ksgN8h4o
         PhtA==
X-Gm-Message-State: ACgBeo1GweZoSzAVcQYvJeb2RyGtRsXUozl1le+TYbLMPmKLbuBs0wK6
        0YyfPStmuxpk6oN4g5Sx2CIxRw==
X-Google-Smtp-Source: AA6agR4bp19iDkCA8mqVi96q7/mlsslLYUFbkHAqosVaZwo7xhtLr4GTcc2/bXIfPNJA5sfm6qM2jQ==
X-Received: by 2002:a05:6512:3b90:b0:494:256d:943f with SMTP id g16-20020a0565123b9000b00494256d943fmr2441662lfv.497.1661621023972;
        Sat, 27 Aug 2022 10:23:43 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id q16-20020a0565123a9000b00492a0f02758sm725059lfu.28.2022.08.27.10.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 10:23:43 -0700 (PDT)
Message-ID: <a73e509a-5260-41ff-2fb4-54b975ea59e9@linaro.org>
Date:   Sat, 27 Aug 2022 20:23:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 5/5] dt-bindings: imx8ulp: clock: no spaces before tabs
Content-Language: en-US
To:     Marcel Ziswiler <marcel@ziswiler.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220826192252.794651-1-marcel@ziswiler.com>
 <20220826192252.794651-6-marcel@ziswiler.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220826192252.794651-6-marcel@ziswiler.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/08/2022 22:22, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following warnings:
> 
> include/dt-bindings/clock/imx8ulp-clock.h:204: warning: please, no space
>  before tabs
> include/dt-bindings/clock/imx8ulp-clock.h:215: warning: please, no space
>  before tabs
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
