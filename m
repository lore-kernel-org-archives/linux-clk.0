Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9341C6FD1F
	for <linux-clk@archiver.kernel.org>; Sun, 19 Mar 2023 12:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjCSMZP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Mar 2023 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCSMZN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Mar 2023 08:25:13 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CFD12068
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:25:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z21so36920975edb.4
        for <linux-clk@vger.kernel.org>; Sun, 19 Mar 2023 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2ctBh4ChIBF5WYyxX2AuUgLXf3/Rtr+EA5UEX+4mc0=;
        b=lxoheOqvZMAIGC53kvgTC/HcHCS5pajkH7b5BWNZVtEddXubylKUZHH3Z/OAV7jqNZ
         mWunohAgLAQUzqR16416/oNnLaiyKG2Tejpq9UVgXep+rdap+E/VpH4E9IQ+2e/lppiD
         Jzl4leltTZDImsJQta7griGFVTFSRI0O1ZbpBze0I9zO0+UWSHnizjCGXrK4xUWg+Rhu
         nXDxbH4Bt75oLIAILvDBh5vc/wqXFBbWMkttq/c4yVPN9vz6LyzKlT1BDVTSBAZC/Ykx
         pWKbgIkB32veVjNq0hUkMdgLs4GWbU4Vqd1aRaMl4HBoBmWIKE94K+/rJofVrwo7Hxmn
         Dcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2ctBh4ChIBF5WYyxX2AuUgLXf3/Rtr+EA5UEX+4mc0=;
        b=Dlnq8wHSovl50fu5AFSk+VxjhiAoTGBNdzGtr88LsCFUbkOmbNt8Hns8Jrl4dmRT/T
         wfF0nsrnyyb6zB2ic2e8dnEQ32J6IJy+iCSbwrNUNUw87vO8jVPY9E8l8i0Al9cBqOxp
         rK3u1avSQu/Fnd5kZhbsE4lGPjsvfOS46HUCB2BNRKyvnnSOnT6RBbPxBT5EzFOEg5ha
         qzVOn8wouA4oNgIc/OJ7rDQu15YMUtB9/zt+FhA/L4X0PLgRvCwoMjfBDFWWzd2lYEjs
         G8dXG8Kcjlj1Lgzf1if9C2YtmCfWjOQW8zyywtLjalF7UTkTHk4fMrtxyX/KdBJKpfp7
         +bXw==
X-Gm-Message-State: AO0yUKU5lPghguSOCdPFucFY5Z4oZrYnpX91MI6McHRRsEQUkg0bxvgr
        7TK3yrCpBxqtY9zu6c13bzmYQQ==
X-Google-Smtp-Source: AK7set8qgDn3tu70r+zsTJ9r+rEhDtm1GXC//7IxDL8CzckgSnHKYf1kWtKfoQ5k0QYbaLk1eE9ydw==
X-Received: by 2002:a17:906:fca3:b0:92f:43a2:bf7d with SMTP id qw3-20020a170906fca300b0092f43a2bf7dmr5303345ejb.73.1679228709628;
        Sun, 19 Mar 2023 05:25:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b009334edaed98sm943147ejc.50.2023.03.19.05.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:25:09 -0700 (PDT)
Message-ID: <95b1f70d-b7ba-370f-12c4-bf7a518ffe3e@linaro.org>
Date:   Sun, 19 Mar 2023 13:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-2-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/03/2023 04:05, Xingyu Wu wrote:
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>


> +
> +examples:
> +  - |
> +    pllclk: pll-clock-controller {

This should be just "clock-controller" (and drop the label).

With above
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

