Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410ACC64EC5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Feb 2023 09:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjBIJcP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Feb 2023 04:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjBIJcL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Feb 2023 04:32:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FB1611FA
        for <linux-clk@vger.kernel.org>; Thu,  9 Feb 2023 01:32:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1012942wms.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Feb 2023 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FM/LdjIE+BK9yrqTkrCHMJMpaRv/ioCSi0KOvlCQF0M=;
        b=Ab5Rk0IPhDRT3p3+6b6/XqYQFBMnsyXnqWcyU3Fc0ETszZm8HjzAVBZXr76NL6ysc+
         nVTzZ0DXhRS/Vwg16kt0lkoCZjVyppxM2jLitI+Yd8yh60POFC7m7CTrhYT3Z279M5AI
         DLJ+YVVvVOWKSoCrxitDL3cDY9IM4RgMwNja8G0tuOzUWDhEPGL227pvIpsgmJPgJvIk
         +ZaCGMxQKRWv7lzvZsSDUUHO2NxahRLY82QF5caZMgG659Nsx1Qjwh3tDC1tI3W2A593
         6YrG5ESGvUvi8bj8Y7Yy1xvhUO9ESfwU/sB3p3NVR2ADTxj6vh+cTamvKgwRhCYZZ7n3
         E3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FM/LdjIE+BK9yrqTkrCHMJMpaRv/ioCSi0KOvlCQF0M=;
        b=U+Y/kWOUAR5RqJxnxSN4xRxYfgZmO8y3AmJ7hBqiUeT3qHrQE+4D4r7ixXrsP3yd0A
         fT0eZUEqF3rs7Z9CUYlloXA0j6lyru6KS4C+sDYx40NHd+RpejmPMRejSbCHIS2peF2x
         ileCXKcAG7lgAvNDX7D+VVry09CzDkBIIPM9uWxLCmgQw4f+x9ysYJzlaGHMBhfKmA8l
         fHFmfimQ8w2o6EC58KyjZdB9e8+PWcNv67a9BA0rE/iJtdEKG2v3+lFD+y9A64SEeY0h
         m2yB2UPk2BoluYsVB1jd55Xt9hAa/NuN6oUoAt0wQYWbebr7UGL0eiBO7vvdVjrc3tj5
         7O2w==
X-Gm-Message-State: AO0yUKVPXTnM5i4Dnlb1b542lRDJK8UMTHPNEa+aHes8FtSW/xXgUJYn
        0hXgzEXDK8mJ50vvH3ftEi47+w==
X-Google-Smtp-Source: AK7set/bb5JZ/smFZZcz/mFj0FHilPsYO6yLjt7ARyOcT3vLv3AYvtmm5BO7UJGXBKpMQrZgcE65gQ==
X-Received: by 2002:a05:600c:4386:b0:3df:94c3:4725 with SMTP id e6-20020a05600c438600b003df94c34725mr9409250wmn.38.1675935127999;
        Thu, 09 Feb 2023 01:32:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c4fd300b003dc59d6f2f8sm1302911wmq.17.2023.02.09.01.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:32:07 -0800 (PST)
Message-ID: <a7bbc64d-1b16-490a-5424-4a2f08aba111@linaro.org>
Date:   Thu, 9 Feb 2023 10:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] dt-bindings: reset: remove stih415/stih416 reset
 bindings
Content-Language: en-US
To:     Alain Volmat <avolmat@me.com>, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209091659.1409-1-avolmat@me.com>
 <20230209091659.1409-10-avolmat@me.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209091659.1409-10-avolmat@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/02/2023 10:16, Alain Volmat wrote:
> Remove the stih415 and stih416 reset dt-bindings since those
> two platforms are no more supported.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

This applies to your other patches as well.

> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  include/dt-bindings/reset/stih415-resets.h | 28 ------------
>  include/dt-bindings/reset/stih416-resets.h | 52 ----------------------
>  2 files changed, 80 deletions(-)
>  delete mode 100644 include/dt-bindings/reset/stih415-resets.h


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

