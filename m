Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED78C4707A
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74D52613EE
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhEUVYp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 May 2021 17:24:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56528 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhEUVYi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 May 2021 17:24:38 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lkCbw-00019O-Sr
        for linux-clk@vger.kernel.org; Fri, 21 May 2021 21:23:13 +0000
Received: by mail-ua1-f72.google.com with SMTP id o4-20020ab037640000b0290218107a4549so1714208uat.14
        for <linux-clk@vger.kernel.org>; Fri, 21 May 2021 14:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fROMD6BYmf3h06oRhpwPZGf5qSe1v9Tji/Vc0NCzaJs=;
        b=WKqwc0E8gbMUYWxJTebykkzz1ClTlVlrb9LxLDmyRLKC4uhd86lYGHhTEXfyhtbvpM
         wNlA1k5XjqTnqtnx/cURhjA6737aMJJ8at3I+ebFzxEgE6+E1rZWNf1zxErMj32G0ULF
         ZrRvPyI+3wHM78QLvx7UP6UaOLXAmHxuJ0t6CFRgBt+isEf14BAcXikRzPSJmgjX91Xu
         EGRSUKaMQuc6lN8izu1j7B1w1UkByUNkcScJfgLEli55DQ+Y4Q+gUK53/OmRCNKrk6Od
         25mAbrPzGFul/202/t8tTbjcIv17It+f1Pks3Dshc9ebBv0ELYV6r9zfP/cR2G2q7ism
         23dg==
X-Gm-Message-State: AOAM530PGvTRvnBwnpql+zlcGw1QiDw+TaQMgItIqEX0f46CuoMc1nRY
        HZhQwmwHRRpr5WaCVfjM9S7/IElerRhQG86wAIIxI/WRI1QO8T9Ka3L95O8pcAixgc2NytVM4al
        4dJe5a0TygYUK1EfhaMIxVbpv+NFQNTE8BA49kg==
X-Received: by 2002:a67:2c57:: with SMTP id s84mr13304960vss.32.1621632191789;
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAkzP0vI6cvbwXWhDnOK8BKrtLOqAAl/3T8yacV2iIbe5gMjJbANDaWCWgPJfJiZWzKX/R1Q==
X-Received: by 2002:a67:2c57:: with SMTP id s84mr13304943vss.32.1621632191648;
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id r12sm825043uao.6.2021.05.21.14.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:23:11 -0700 (PDT)
Subject: Re: [PATCH v1 10/13] memory: tegra30-emc: Use
 devm_tegra_core_dev_init_opp_table()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        =?UTF-8?Q?Nikola_Milosavljevi=c4=87?= <mnidza@outlook.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        linux-clk@vger.kernel.org
References: <20210520230751.26848-1-digetx@gmail.com>
 <20210520230751.26848-11-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <670d0d27-867a-7a1a-db58-692429ec30d6@canonical.com>
Date:   Fri, 21 May 2021 17:23:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520230751.26848-11-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2021 19:07, Dmitry Osipenko wrote:
> Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
> initialization.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 48 +++---------------------------
>  1 file changed, 4 insertions(+), 44 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
