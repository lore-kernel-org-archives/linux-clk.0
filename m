Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9042C43217
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 16:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJKQjO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 12:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJKQjM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 12:39:12 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1882562A8E
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 09:39:12 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d13so2507945qko.5
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuWUVhopp7w1rlsLDhtgvEXeVzs7gJGXSD5NcebEbwg=;
        b=kS5ZhxV6jSkJw+pv31j1/TIl9ctrk5SG7GZG7tHexzmdIbG4Y5E/x0HBeOfkAYRWJr
         QpUPUoAt7MShByXTfaa6aAGrby1OAHj0g9VSiH9RrxmicpnA5/x0O4AiWViUzzs2/eSD
         OyppQqSuuw+uA9Guk6FWu6vgUBRSi/i1nfMWRPhbotuKBMhT2CMcNyo0gDlugcfvQnik
         Kl4G4bLxtyqoCj/dTmMtzxZYNfF89sHzY5U5RGvItswyeDwl0FKpGnagtj29Z3SE2ziE
         TfBCU/QPNySh2jOLNx+lecvU/nCDGhtW4E73VOVXgAZrGlz6UEZcsUSS4X7OIKpw2/vI
         Rgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuWUVhopp7w1rlsLDhtgvEXeVzs7gJGXSD5NcebEbwg=;
        b=xxYu8fBQkAJ5z2F3UX5sx0H4Aeu/tU3Y23cMeEJMKijbGoursbGnXK6IHVQZsnH2uw
         ewb3I4ke7MoW0kaulvvhwIXnG05geqR7BmPVulyppSkmd0UzeTv9uIfTaFw8vbsv28LU
         BlQzKCjH1+tjgkLqF+9rQCgDFwA3Q44fg6xrRtTT8hxpH9b/zM4kh5M+Ky9nXdxuaLI2
         3O7Szt2cMByORtWpSWrFbo+xvGcnkWCjSZZRurnOv4H7lCiQxsZJebEsrTTIDTE9u2ij
         GM/G9tPeEJhlnpu344XHwM7eVzbeq2hP8aTKX7HOUITPM41enouAOij6i2pQyqk0HUIf
         9LEQ==
X-Gm-Message-State: ACrzQf2k2tXsaNDFp+axbgNjFIVZBuvAkp1pwVv/qBwh2rWXYaJObGOi
        dZAcLmGgTSL4ckDfdHjrV2rIHA==
X-Google-Smtp-Source: AMsMyM5eUUP9Kn/jICoQTvLX+b7FO0kcDg58IhSnVXtMaIvOXcEvxcseytcthL1bRFp7xH7pzdc5tA==
X-Received: by 2002:a05:620a:10a1:b0:6ed:3b23:6991 with SMTP id h1-20020a05620a10a100b006ed3b236991mr6643163qkk.683.1665506351271;
        Tue, 11 Oct 2022 09:39:11 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id x8-20020a05620a258800b006ce0733caebsm13275988qko.14.2022.10.11.09.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 09:39:10 -0700 (PDT)
Message-ID: <d1226efc-ccd1-38ce-77f5-53e2dc30f51f@linaro.org>
Date:   Tue, 11 Oct 2022 12:36:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: clock: Convert pwm-clock to DT schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221011162919.3025038-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011162919.3025038-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/10/2022 12:29, Rob Herring wrote:
> Convert the pwm-clock binding to DT schema format. A straight-forward
> conversion.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

