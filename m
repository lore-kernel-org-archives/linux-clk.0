Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1635FC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E925660E0B
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 15:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235577AbhJZPcO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:32:14 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56440
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235548AbhJZPcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Oct 2021 11:32:13 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5CFDA3F176
        for <linux-clk@vger.kernel.org>; Tue, 26 Oct 2021 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635262188;
        bh=WSJF9KCqXo5B633RP/TS84McxX2RgkL3V5mZBciirmg=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SpFEJpiCSMyUIFGSrjANcYREQx3NFW09vYCzAsM89Vcql+U/oItlal9xkoJ+BCUcP
         6eK8IppgrvYjQC/u/rU54jp6NUdxFqSwHS7UqSR2UA3pP3T7sv4POaKPdUaMcnDt6T
         8J2ePsZb8+TsFgcrZ925i7ZhZjrCEaLKACCojaJ21AVc34T6chtWZ46gboME0N5ONM
         SmoZ7eUlSW8witUuAj3sMe8rvovxRKuN9A91rB8zLx/dRzY/z0teb3JkbNLtVrtAvi
         hje9ubp12df/bTwvfe7t7v0u81yK5Dk8uM9jmFHnzoWY+rSekSzlOtud8MLVzmqcNC
         hoVOej4tIG7dA==
Received: by mail-lf1-f71.google.com with SMTP id f21-20020a056512229500b003ffaa744cddso2317486lfu.1
        for <linux-clk@vger.kernel.org>; Tue, 26 Oct 2021 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WSJF9KCqXo5B633RP/TS84McxX2RgkL3V5mZBciirmg=;
        b=YEKMv1rHBjDM4Qsx0JEHQoBDo+nplfDKGEqmRr8G4bYPLs4kQosPNVJqJr6kA7qlp8
         7Zc5HX7k9cc+mXUwTyqnrSHgS9NG1QUK7V+ZLVcvhjeHU1MG+C7GGSmc//2XDeDfeb8g
         CooIZSNcjh1MJRpLvKTytCrLjXVERP+0tNkfNYTk8muOrYaELK3+hdZusDRYyHYxxHsT
         puzkobMwCWVAnkCW8ykw9haoEMVcxVGSpZfH5/saBfPF85h7/dhv86o8yCAesPASoz9X
         pQ73Ck6dEE8+NcBQkVIn7T2siF+iZTNUI3OTbba+B7LiogRftjMe8b+PRzyrK4MxKss4
         8EeA==
X-Gm-Message-State: AOAM530ezIjMVgL6rPbFJY/bKVURF0DdX1Srvrh+rNIx9dzRh/iy2AJ8
        LQFNS0qre+twcig1tmUQFOqa4VKb46hPNKEq9DzGNuNydLQl95xcmzFoz7Mx2bxbSZIi1BtLebL
        qwr3ESck8TrhDP9a/lG+2WYe+J1mQvSOX33KuWA==
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr26414046ljb.467.1635262187755;
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk7sNJbWjdv3xhjfE+UFgqNsGbUUen1K1mx8YhCM7+SWcWNWstn2HGR1lnvG7kYqDxBpr9RA==
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr26414022ljb.467.1635262187572;
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bp40sm441461lfb.78.2021.10.26.08.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 08:29:47 -0700 (PDT)
To:     Will McVicker <willmcvicker@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20211015190515.3760577-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1] clk: samsung: update CPU clk registration
Message-ID: <cbdbf565-6403-39d3-a4cd-817e515d89a0@canonical.com>
Date:   Tue, 26 Oct 2021 17:29:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015190515.3760577-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/10/2021 21:05, Will McVicker wrote:
> Convert the remaining exynos clock drivers to use
> samsung_clk_register_cpu() or if possible use
> samsung_cmu_register_one(). With this we can now make
> exynos_register_cpu_clock() a static function so that future CPU clock
> registration changes will use the samsung common clock driver.
> 
> The main benefit of this change is that it standardizes the CPU clock
> registration for the samsung clock drivers.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clk/samsung/clk-cpu.c        |  2 +-
>  drivers/clk/samsung/clk-cpu.h        |  7 ----
>  drivers/clk/samsung/clk-exynos3250.c | 54 ++++++++++++++--------------
>  drivers/clk/samsung/clk-exynos4.c    | 25 +++++++------
>  drivers/clk/samsung/clk-exynos5250.c | 13 +++----
>  drivers/clk/samsung/clk-exynos5420.c | 27 +++++++++-----
>  6 files changed, 67 insertions(+), 61 deletions(-)
> 

Looks good. Tested also on Exynos5422 board:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
