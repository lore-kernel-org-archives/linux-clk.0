Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18BEC47080
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 830FC613F3
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 21:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhEUVVL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 May 2021 17:21:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56384 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhEUVVK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 May 2021 17:21:10 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lkCYc-0000m5-64
        for linux-clk@vger.kernel.org; Fri, 21 May 2021 21:19:46 +0000
Received: by mail-vs1-f72.google.com with SMTP id f20-20020a67d8940000b029022a675e6e86so7421710vsj.2
        for <linux-clk@vger.kernel.org>; Fri, 21 May 2021 14:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6XBMA+HgnOtwY23bMWATi+tkzjIBgQg4ublZMIjdwFo=;
        b=lsPGu7LyScLXvGdzvtlNXwBpffsAjIs0Ua5PNzFZahREDGr34wpUZZzpUPaLihBWeX
         ttnEchoBVzH4MmVLhUTjwerHETii3bf+QVvDwxB/pDJU5q6z7ArAWYuuS65v4GvLwwPo
         XA/1zFY4SxMzqebFV5anG5ni0rxi5y3lbVX9P6+dcTf9DTAFWnSb/hpKw6kWX+ExwKsO
         Pn3h295pJLamqw7bXPMFbi8o6sZV61QFwZ4KoP046Pkpt4KGzVCooV8VCiEZjN9RotGM
         9FQBgDHVxf+Av6To6Gf04d2/opzxo06oqJlbQLNRVFKOr+YRH7YmAlGHrkgdVqFaVf7D
         b3tg==
X-Gm-Message-State: AOAM533rLItSRM73V41g5SKINKOCmke+Rlea0Y/a83CE/k928VsrTBSM
        fkuKpW88E0dlFaBj+Rq1a+pUt3f8yj1Yx5R1OgWLYuKsWi9nICP7mNu6avdrUMWhKKxJHZX7O1b
        5M2yIvYhUtsQ89bGarLnyX+LfDxAni7bAsyNBSw==
X-Received: by 2002:a05:6122:885:: with SMTP id 5mr12803012vkf.5.1621631984637;
        Fri, 21 May 2021 14:19:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhv1QL8qHnMj7beq1hVR/DBdqFRV/8WccGKOBWL6eMnDKVdIK/gtYPulvL1hnnq+STEvvfRQ==
X-Received: by 2002:a05:6122:885:: with SMTP id 5mr12802995vkf.5.1621631984486;
        Fri, 21 May 2021 14:19:44 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id t2sm100467vkk.17.2021.05.21.14.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 14:19:43 -0700 (PDT)
Subject: Re: [PATCH v1 07/13] memory: tegra: Fix compilation warnings on 64bit
 platforms
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
 <20210520230751.26848-8-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <28c84274-b9a9-86a5-5b39-5aa07a87626e@canonical.com>
Date:   Fri, 21 May 2021 17:19:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520230751.26848-8-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/05/2021 19:07, Dmitry Osipenko wrote:
> Fix compilation warning on 64bit platforms caused by implicit promotion
> of 32bit signed integer to a 64bit unsigned value which happens after
> enabling compile-testing of the EMC drivers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 4 ++--
>  drivers/memory/tegra/tegra30-emc.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Let me know if I should take the memory part.

Best regards,
Krzysztof
