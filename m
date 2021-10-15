Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394F7C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20E5260F5D
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbhJOKQp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 06:16:45 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60642
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237884AbhJOKQn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 06:16:43 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 535074001A
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634292876;
        bh=CdE6XumrF2NcE/za+fvknc1KEQDwW8iRNC51K+hZP/8=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tAz7uEPHbUf5Sa1SrcMyb2vQoB9hlWRwYcAJDClm1La5Yb1nqBilGWqHnr81RQ4pT
         m+TqlrB8h0Z3I71IW2sfx1Lfayz9N1kXkNZwp54SpmrXUyPIvnQTeBH1ZlSn+yvd4E
         LsfxdthH0BAQ0L2ZLEhixe/Klrx8rV5eZ19gA2HpLn6fQKq4/UReoVroEqAT1DXIG1
         DNdsKzFtGjEkn/sGiU4VxPfQ/p7F/+0ago6GIcOc3jD5NKpOcbawVyS3kj6TH2uDp1
         WxLTBEkAhHBTQD2OY55IGqecLETA7uGZq//H14wCvVAiWCIqBuxP1U6GCxa8eaeSwK
         cZY0TkE/kp8Sw==
Received: by mail-lf1-f70.google.com with SMTP id z18-20020a0565120c1200b003fd76d7ca21so3602650lfu.13
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 03:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CdE6XumrF2NcE/za+fvknc1KEQDwW8iRNC51K+hZP/8=;
        b=iIhdx07wMeT8UnuiCS4dBdrIOZfnUtqxAs2IWnI2mz0LCbqp+aPy7AxjiuVddggDA/
         dsgl3SitswhJCDQvG93QgvXUNKVKWdEmsZfbk0RjaZUTO0UQmoAa+4lX83ZQy1dPoL0F
         Nc69YiAPiasWyRZiG8Tf+H9+cSp7UsmlQ+8kV0LL+7P8lUgyxfhT3wxXE7f6YqhKWgeF
         4ZdFny0ly4F3+Rit8Zle2ni+a179YL77p2q6JFHdvreROPI/JQTFVWO9Klw3bNGeNpoA
         ttW7/2FZ6dZ8z12SW51IsTJI4mv9YqkFvtmFTnpWw1YfCNOEI6rjqoMylJEhPc+e2rX7
         o9rQ==
X-Gm-Message-State: AOAM533i3rct/zrnPu4To6ccvqaky9uq6+gZCbBA9b+1dXYZavDxSCr7
        bZ1a/BWvZVJs51+0ITFIap/98q6rwKLV3TwvAcHqKny9JkMkKJtH/8pgxVNpuisUcLQXuMMKO6T
        aqVjgMgVW9F+df/oEBsU5YPY1xCg/ycHY5W1XJA==
X-Received: by 2002:ac2:5210:: with SMTP id a16mr10411970lfl.279.1634292875712;
        Fri, 15 Oct 2021 03:14:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQgMT9cOGhLuYlrqwp4pUS3jckme2wuIOcB+vqpicsE0eC/dex6Vr1nu/QRypdBcOyi/UfDg==
X-Received: by 2002:ac2:5210:: with SMTP id a16mr10411936lfl.279.1634292875341;
        Fri, 15 Oct 2021 03:14:35 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s23sm463520lfi.139.2021.10.15.03.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 03:14:34 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] [RFT] clk: samsung: add support for CPU clocks
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-team@android.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211014195347.3635601-1-willmcvicker@google.com>
 <20211014195347.3635601-2-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0e256e4e-829d-dd3f-9451-e8c4481edf11@canonical.com>
Date:   Fri, 15 Oct 2021 12:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2021 21:53, Will McVicker wrote:
> Adds 'struct samsung_cpu_clock' and corresponding CPU clock registration
> function to the samsung common clk driver. This allows samsung clock
> drivers to register their CPU clocks with the samsung_cmu_register_one()
> API.
> 
> Currently the exynos5433 apollo and atlas clks have their own custom
> init functions to handle registering their CPU clocks. With this patch
> we can drop their custom CLK_OF_DECLARE functions and directly call
> samsung_cmu_register_one().
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clk/samsung/clk-cpu.c | 18 ++++++++++++++++++
>  drivers/clk/samsung/clk.c     |  2 ++
>  drivers/clk/samsung/clk.h     | 26 ++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
