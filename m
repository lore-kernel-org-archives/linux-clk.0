Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6465C43460
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 11:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB9561241
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 11:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236834AbhEQL37 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 07:29:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37162 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236851AbhEQL3w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 May 2021 07:29:52 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1libQJ-0000z6-Mw
        for linux-clk@vger.kernel.org; Mon, 17 May 2021 11:28:35 +0000
Received: by mail-ua1-f72.google.com with SMTP id u3-20020ab069c30000b02901ebe1c8da33so3360531uaq.7
        for <linux-clk@vger.kernel.org>; Mon, 17 May 2021 04:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=esNX7fYr4zGWw4UHT7I+6MGEmlUq84SLXsDfE2Xa3Xk=;
        b=E3DS+UI/g2Xey94vJvq9nTwZWVpfVQuRXii4t6Zgt32t7VExv2AQUygv5JsvBGCbHL
         LZXPgV1ABS48483Sl6F1j5JGuy6mCDW6bFcZV9ausoDlerPNINhAKHhI0zX76UKXIgZg
         QUKBeNkvkfJUgpfSVfa2IC+Yzb/Xlsc964ebX9Kq71pVBe4y3JFcJKWa6OP4yvKsjFmG
         wAQGowdvB7aaynFhxU1OgCAKRsu6WFfxVIyAeVmVkKy6n96I6+XNOAVAqw/Ag/setnRB
         qgIpq0Q7Jz8jWnnh2bsv/KK467BALeuaMqPwAvUDCW8WoZeXUflIrU/ci2SAO5oIfc5x
         yRXw==
X-Gm-Message-State: AOAM533ULJ2xp1FiDHojLzuhY1SkPicYQgSB2Nmw9DQAcwWgQPzHaJhC
        UWEENK32yqOSLPwKrjNWf6t2vVpAgxLYGwkcOAk+8bm4b/MMTMNoZilT1e4U0AVS9zKPS8AGZOY
        TiR0PpQJGZNrQ7RTCsmBzAyjwXqWW8WtFP2Bm1g==
X-Received: by 2002:a67:d11d:: with SMTP id u29mr51137828vsi.53.1621250914185;
        Mon, 17 May 2021 04:28:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyEUoip1vAtYB4Aouqa7f3RS7fz7TyAZiT6gOnYqGGai+Ao94jeqvyUi+347N5b1UOoQVndw==
X-Received: by 2002:a67:d11d:: with SMTP id u29mr51137821vsi.53.1621250914020;
        Mon, 17 May 2021 04:28:34 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id a201sm2224600vke.21.2021.05.17.04.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:28:33 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] memory: tegra124-emc: Fix compilation warnings on
 64bit platforms
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20210516161214.4693-1-digetx@gmail.com>
 <20210516161214.4693-4-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
Date:   Mon, 17 May 2021 07:28:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210516161214.4693-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2021 12:12, Dmitry Osipenko wrote:
> Fix compilation warning on 64bit platforms caused by implicit promotion
> of 32bit signed integer to a 64bit unsigned value which happens after
> enabling compile-testing of the driver.
> 
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 5699d909abc2..c9eb948cf4df 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -272,8 +272,8 @@
>  #define EMC_PUTERM_ADJ				0x574
>  
>  #define DRAM_DEV_SEL_ALL			0
> -#define DRAM_DEV_SEL_0				(2 << 30)
> -#define DRAM_DEV_SEL_1				(1 << 30)
> +#define DRAM_DEV_SEL_0				(2u << 30)
> +#define DRAM_DEV_SEL_1				(1u << 30)

Why not using BIT()? This would make even this 2<<30 less awkard...

Best regards,
Krzysztof
