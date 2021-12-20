Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86711C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 20 Dec 2021 09:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhLTJgR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:36:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59434
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229459AbhLTJgQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 04:36:16 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D46413FFDB
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639992974;
        bh=IwmUkfQQuaN3okDT7GWPwPvdQQAzqCja/1LenmoCoEo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MFvGnMt8kxRbPVkOOUC7F2diG7d2ocV2uB8bCH5mZdu9FYrjnph0/7Fz0gkFtO/at
         FJxEtA9tDBTUidmuqCTe5pTy13m8dFU0ibMZZtK8vkT4m2+fbhX7iUkDpSfppKt7Up
         bvr+GPQIGn4dFFrDS1CCeWEIgHWJlTQdBwNKpRTDfkEdKOPWqvTGwNYqzMFTU+P9gr
         u29zQImUO7+asClM3s1fjQUQQyMlAQlK3lVIcEz+p13lqnAy2mSmXtbTGyJYPB5TBE
         8GFlHf/uE25RrfRcgK+Ya6OwW+YlTKwYBjdmo2YExF9sFUiN9/YPSLm9+XAOSqWnjA
         LqOGbM5n/OY4Q==
Received: by mail-lf1-f72.google.com with SMTP id w18-20020a194912000000b004254e83978cso3787241lfa.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 01:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IwmUkfQQuaN3okDT7GWPwPvdQQAzqCja/1LenmoCoEo=;
        b=EHMZGq0AGUGYCoqmU5t3mjJK7InNPxKtCr9j0vVBJdN8wq2gZCdAVpmpROWJ2qmpAp
         8GL6P+pmC6+QWQRprCTBjOEbKj8KCkmzhHXNMptetkMHIDT0AtQ1S1+cYA306CicbUyO
         wpGOqna3nkuk1HCzHex+kdoBp3Y8XSq0mmODqL3I38OecKERJqvy6xrGKD5o/SbvctPP
         ZkkeQqxhP4zamdl+2rxMq+IjUzhPBwzbj94cdUuAZ588xaKVhaVQcIrG3T3Rcj9ZlS00
         Ly85M+xQD4025RgOO0YcptSinjtqQKtlxxvMvj+M7ZrNlQSqik5k3PRVz23471+LwDBg
         J2HQ==
X-Gm-Message-State: AOAM532T3VtKI29iw22zX1z+N+gsiuKlyWmz156+lgpeIjNk6tHGpz1E
        79g5h7dy/PatJ51habi24c1ZvQ5U0V3mTxnXbTsOSfcBQh/wDq3m87v99K/0vQpBf8T51YoPDTe
        RIwvWjgcrdwDER1MmsZFSzthAKfzHCWHCMKBurw==
X-Received: by 2002:a05:6512:4028:: with SMTP id br40mr522658lfb.365.1639992972622;
        Mon, 20 Dec 2021 01:36:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT/5JqRisnSYB/tPDmuH5uFX9Zpw1WHoE/0Ws/4gk4AqKHpkLfVxOtQaWkZ1afKZK2oRKW0g==
X-Received: by 2002:a05:6512:4028:: with SMTP id br40mr522641lfb.365.1639992972442;
        Mon, 20 Dec 2021 01:36:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p18sm959112lfc.297.2021.12.20.01.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:36:10 -0800 (PST)
Message-ID: <cc1c2906-60c2-7d4a-78c3-014f6712f9b2@canonical.com>
Date:   Mon, 20 Dec 2021 10:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 3/7] dt-bindings: Add vendor prefix for WinLink
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217161549.24836-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/12/2021 17:15, Sam Protsenko wrote:
> WinLink Co., Ltd is a hardware design and manufacturing company based in
> South Korea. Official web-site: [1].
> 
> [1] http://win-link.net/
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>

Ack goes after your SoB. First you create patch, sign it and then Rob
sees it and acks it.


Best regards,
Krzysztof
