Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9652C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C8C960E78
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbhJOKOR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 06:14:17 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46164
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237753AbhJOKON (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 06:14:13 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9A1FE3FFFE
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634292726;
        bh=Ea8e8thFl0tEECq210hP9qZc5N7l2DiedvTexkIRuWQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=oU5lu97v+uPwl6JNH7k4dvE77N87Wm07aTdHlDdDNnFnXs8qE1mTJB2TWKMKT7wZh
         I0Ws2CWSwEXace32V5Rzf0C3gSlsumIim7+s6Y6IYEsymFNCY2nXqC6E3fEYCke9OD
         Bk87I3C/ZkyGU1Xl+lmsEFif2+5QNSea4iCZ29CkHBN7Wzqx+y0DF2uqCVQPbqChmX
         HdCPSTqpU6nQEYNMy1GD5M1W35/CGemxXGnqow9PZx139oWag7YcCbeZruuScW9WiV
         2iYiITmdcG1e1wO7iqmea0yD6duwio+wq22sYkg4oRQ6wyVUJ76KQWgvClZBTRlwZH
         +zzFTl8pYrI+A==
Received: by mail-lf1-f70.google.com with SMTP id bq35-20020a056512152300b003fd45087a72so6332603lfb.9
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ea8e8thFl0tEECq210hP9qZc5N7l2DiedvTexkIRuWQ=;
        b=6z3kv9HMXPEoAwnj+ElxzFX9FHui/LnWlnRo6gogg9rI+dLpCCUyzYrnvKs6uKTiKv
         NZ2+QLcadPBmJOtThN2nteHrikmOrK/iZnlffrlabqxpAvjDpY1asprmZbBBDNu5W9LJ
         n6vsgUmNVPbnFzPw2Tm66+WK4MF72Ao0YXL9DyEqFgDXYRGhRs7n/ek25wGkoLye+NJU
         gzLdIy8IsCHLJsWdQ1QbI07quigMcdURvW0xroSXNwcYIdW0nN+V5biaiVxwhV7AnYqP
         Pv8OwJ0sAAi8KhFm8V7pkw+5OMiJkWs1FL892D4Lt2+VkJpFKc0SFWd0RvQkn/8iKY9I
         Lxrg==
X-Gm-Message-State: AOAM531NEqGME/FD44CWA1zdCS6J1kumUofOmoKKygS/rXfpQHj+9PrX
        nqrp8a9sLeAaXT9A3SILmJHLupF2vt3QVwebQiT6PwjoTk+n+mjiW9oaG1Rs1mv5UhdyMUILeHx
        g8ndc7nDmWErMd65AdftkQnY81sv3uaSTr8uh0Q==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr12056797ljj.149.1634292725883;
        Fri, 15 Oct 2021 03:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6ShsG1DDBPtFjYKMakvdXDTli09e2pz3u1eQJMvHgpiGajLgSBlYZLAe0ctlX9V6n4CumFQ==
X-Received: by 2002:a2e:9a44:: with SMTP id k4mr12056783ljj.149.1634292725711;
        Fri, 15 Oct 2021 03:12:05 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v12sm505285ljp.124.2021.10.15.03.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 03:12:05 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: remove __clk_lookup() usage
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <CGME20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3@eucas1p2.samsung.com>
 <20211015093931.28086-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <89daadd5-7870-2863-a020-97cfc65f5757@canonical.com>
Date:   Fri, 15 Oct 2021 12:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015093931.28086-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/10/2021 11:39, Marek Szyprowski wrote:
> __clk_lookup() interface is obsolete, so remove it from the Samsung clock
> drivers. This has been achieved by getting rid of custom _get_rate()
> helper and replacing it with clk_hw_get_rate().
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This patch is based on top of the "[RFT PATCH v4 0/2] clk: samsung: add
> common support for CPU clocks" patchset:
> https://lore.kernel.org/linux-samsung-soc/20211014195347.3635601-1-willmcvicker@google.com/
> 
> Tested on the following Exynos SoC based boards: 4210, 4412, 5250 and
> 5422. S3C2410, S3C64XX and S5PV210 are only compile-tested.
> ---
>  drivers/clk/samsung/clk-exynos4.c      | 18 ++++++++++--------
>  drivers/clk/samsung/clk-exynos5250.c   | 10 +++++-----
>  drivers/clk/samsung/clk-exynos5420.c   |  2 +-
>  drivers/clk/samsung/clk-s3c2410.c      |  6 ++++--
>  drivers/clk/samsung/clk-s3c64xx.c      |  8 ++++++--
>  drivers/clk/samsung/clk-s5pv210.c      |  8 ++++++--
>  drivers/clk/samsung/clk.c              | 14 --------------
>  drivers/clk/samsung/clk.h              |  2 --
>  include/dt-bindings/clock/exynos4.h    |  4 +++-
>  include/dt-bindings/clock/exynos5250.h |  4 +++-
>  10 files changed, 38 insertions(+), 38 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
