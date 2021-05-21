Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0F3C04FF3
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39470613EE
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhEUV05 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 May 2021 17:26:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56571 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhEUV0z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 May 2021 17:26:55 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lkCbZ-00015J-6O
        for linux-clk@vger.kernel.org; Fri, 21 May 2021 21:22:49 +0000
Received: by mail-vs1-f70.google.com with SMTP id s22-20020a67c3960000b02902364d2f502bso6629470vsj.13
        for <linux-clk@vger.kernel.org>; Fri, 21 May 2021 14:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSKiGkFsHm8qeUwaLdynXEY7fptjk7YiH8pCxN+OTOM=;
        b=k386B4QGWfKHX+SUqWZl/AEzR3MXYa6lkjJjKn2P2DGmoPFySKJzGpk3T0L+iYmUY6
         iVXU2Yb2QgSYpNM5ewu+WgaviL8n+Am1gbV/ourhhxf1Y93K5sDCbQH7go8Skmt6bQA/
         Inov4vChBYt82YfdoKRdg3FXMVvNl+G93kXd5p14yJx7aThWNcVnI4d5GCiSuKHe+LQ+
         PLfjPCnruDBWOzBbCBYe76cfA4epOkI8ku7bpZsgp7yLEnWbAzjFZB1F40Hb+BX9BNDg
         yVu8Db6Abn8XFMnI85jiNmqZMVW9RpUILfCaWH7qttAf/PZt86fdl5ZrOAp6CJ5vyMkb
         XDYw==
X-Gm-Message-State: AOAM533PsVwObWF8/l0ZuYKF5fLuLGMTwj5HdzcbmR1QSCn2u/WeOasz
        9wrIP5sujn9YvqVtgj4b07cMhj6HsrbZwDUhXpuHnwPU43p2sC6923aTW45LpUkphT+oOFpzLfM
        T3VDV1LHwbBrrbDkqpMDp6wMaPgXJiBP0NlLJmg==
X-Received: by 2002:ab0:63d4:: with SMTP id i20mr11750982uap.21.1621632167734;
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvQ2l1U8szglgOD1N+hyDpgNDWEMA/0qq5+dQBkcYT64fZxhNQR94GbFgCi0ec6pzhy1FOKA==
X-Received: by 2002:ab0:63d4:: with SMTP id i20mr11750968uap.21.1621632167595;
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id 39sm798548uaq.5.2021.05.21.14.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:22:47 -0700 (PDT)
Subject: Re: [PATCH v1 09/13] memory: tegra20-emc: Use
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
 <20210520230751.26848-10-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f24704bf-c9aa-1552-659f-a3eff9086ecc@canonical.com>
Date:   Fri, 21 May 2021 17:22:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520230751.26848-10-digetx@gmail.com>
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
> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 48 +++---------------------------
>  1 file changed, 4 insertions(+), 44 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
