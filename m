Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD118C6379F
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 11:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234212AbjBULiz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 06:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234203AbjBULiv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 06:38:51 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD0CB777
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:38:48 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id h16so16094328edz.10
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tq51gAJIQj2Xs1ZKNGqnu4NrUprTsJTQmSC0ttvYNI=;
        b=K2xiRBkU6h0mnBM8imm/VCEbhvLY/ceuXzgd14FpbsVy0S3mv6rsKv3gJBSV8yB1xw
         snQXZsLf/yLPCLdeWUkY8GKMzivAvGnCroU1GodSQ18ZKIGfMfwzU7tnoJRxj93qykbY
         WQAFgcT/x3hJIPTx88Bjc+BbZDK7stwk7udrkieVBM7wukU4ki+ksjHqT8ua0u0whs6N
         mYnuTGmVBEQT2GKu8Vud0p4X5B/7gvnBOu7FvCj3GOytHEYr8kESWejcP2tvYuO9IyvI
         PgMH9egv5fQJ90Jy43/FFzeZKGMluW16mAucPJp++5Cs/bVQP2jzdLmXkHKa5Kp7I2qO
         BwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tq51gAJIQj2Xs1ZKNGqnu4NrUprTsJTQmSC0ttvYNI=;
        b=7DdGgc8wDUw7hQl17tJFAMOHvLipGHW7QdrXA6yaPGzrk/zWJDcBm4Mb+z3nZeLXda
         vdrkhe32xCWfwDpjI9epjx3vs3GlJ62RvihDWJYIczosHot/Jb7zqzs+WRV/E0TLgfC1
         Q6qFgniraevZrSsE+1V+aj7s8u/zETWdSbN4AvtWmYA3KwFbIZtFrPwj7X9mcvNCu8G7
         MCsWntfLsNS/mtquS2c55mrSJBVo82Z5ekBYSB/F39/0EBwak7w2ETk7yFohWXIVQxrr
         W+xW+PHGNjRLZ3ZoZJK9MPORh/wPvpG9b3Pm1541ljIe9H4a+ioXaUazhoyQiDbJNz93
         MZdA==
X-Gm-Message-State: AO0yUKUgR4SSucZukve2FYRCEqs3Ld9NECu2WVGZjI4PKVfX+kdhdII4
        EfGDvFlPMXGxwcOHDI3kve+gwg==
X-Google-Smtp-Source: AK7set/3gIbpZCbGX8KRPqHk4leYzTL0UBaiSORTZuYQavAfonAT7E7VUPDVMnim+cH7HYssAsE26Q==
X-Received: by 2002:a05:6402:1203:b0:4ac:c1bf:2a26 with SMTP id c3-20020a056402120300b004acc1bf2a26mr5378277edw.12.1676979527040;
        Tue, 21 Feb 2023 03:38:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b004ad601533a3sm1483381edb.55.2023.02.21.03.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 03:38:46 -0800 (PST)
Message-ID: <f21e19d9-206e-31b5-0287-0dff6ccd6c6d@linaro.org>
Date:   Tue, 21 Feb 2023 12:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 16/19] dt-bindings: riscv: Add SiFive S7 compatible
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-17-hal.feng@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221024645.127922-17-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 03:46, Hal Feng wrote:
> Add a new compatible string in cpu.yaml for SiFive S7 CPU
> core which is used on SiFive U74-MC core complex etc.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

