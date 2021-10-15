Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7029C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD28661053
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237889AbhJOKRA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 06:17:00 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46282
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237909AbhJOKQ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 06:16:56 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE7A53FFFD
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634292889;
        bh=mNH6ovSrsZzXaFK7GnPEbneieuXh4e/GszJJRRWO4tU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PkpbG5x233bpjz4wrhW0qy1Uk5+8unxT8R5hGo+KOUkyct1yBCnjYaON0iiwB65uK
         tgY9/K7bdxYAe0lVpXah49wlvAU9vHl4k4UpKvY97vzlYPmnVGPGGts0c7v/bKSqGi
         NF0QNr8D4ASc+nKNxEcvOC+juxKOoGoyegBzVtCWkIQsrY9wUULnOeBa4itlkn5ym8
         KknuJ94ZIFmvbiFY6CwKi8G/IAkvLezEkTZH0Ywfd5atELzP3ftNG0qcD1DsvYY/Xx
         UHE/bTpY+5j5ryB6J1f12WJqAKb6NWaffGDguTWjUNOUW3CBW9E9HDyBYg1Wsm6Erg
         IVtWJf42bYxfQ==
Received: by mail-lf1-f71.google.com with SMTP id d12-20020a0565123d0c00b003fdb52f1cdcso4434672lfv.4
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 03:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mNH6ovSrsZzXaFK7GnPEbneieuXh4e/GszJJRRWO4tU=;
        b=UWdNr562eO5kKnB3LCV246JZg+wdociv4ur7vaPY63Bg/NMHyEQBjlQTbOQz6NrhDK
         QMOlqcDEEAhNcL6EHjh5/XSMyzvp5Qno1zq0Faj7BEmAxdzoKm7UIQmgBSB11vsCynvX
         iNIrwRH5Vq+I7m/6XsbGLxosS1Y9PZORcVnKIe7k8AorJwSF4YvsXtJxy1at6Kkrh27x
         CRKMXMmpV0aCG0mBlxIZb6KRpUH3VW7ooG6xTzIxqhPdXMTEhurVjnh0taA5VI34tYlp
         2qyN0HUefQJwMZcQuXDWgXMYyBQu8B+YyI56o3YlPdF5TbwBJHPOXgeJTUJiDAmBMcbP
         7Mrw==
X-Gm-Message-State: AOAM531+iQsFPfeBS3gKnooSSawFjuwvBv8OeYnghC8WITKxAd191MNm
        PzTqt7DTC9ugauM4CtBu6mz34cVJlK23B/fXng4+lPNSW9+LnOIUWf3JQXIGS0bf8WuK+r+BJ6J
        u+2kwP7RJ4YlYirQmZyx29dZ5DBO/3ROPPO99cQ==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr11430713ljl.507.1634292889125;
        Fri, 15 Oct 2021 03:14:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj8pWt+ZNhjXMi79/AJl3fIpOyA6FNnV6Krm2En23aHOzWTdTC/H+JaioClNMPNag6ble8/A==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr11430687ljl.507.1634292888834;
        Fri, 15 Oct 2021 03:14:48 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 15sm465081lfy.86.2021.10.15.03.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 03:14:48 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] [RFT] clk: samsung: exynos5433: update apollo and
 atlas clock probing
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
 <20211014195347.3635601-3-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7cd65a6c-4d6b-a287-9a12-c81eec87e9df@canonical.com>
Date:   Fri, 15 Oct 2021 12:14:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014195347.3635601-3-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2021 21:53, Will McVicker wrote:
> Use the samsung common clk driver to initialize the apollo and atlas
> clocks. This removes their custom init functions and uses the
> samsung_cmu_register_one() instead.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 120 +++++++++++----------------
>  1 file changed, 48 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index f203074d858b..cec66d2a4ee2 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -3675,44 +3675,32 @@ static const struct exynos_cpuclk_cfg_data exynos5433_apolloclk_d[] __initconst
>  	{  0 },
>  };


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
