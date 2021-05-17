Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168CEC433ED
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 14:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB14761359
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 14:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbhEQOGR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 10:06:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41271 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237865AbhEQOFm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 May 2021 10:05:42 -0400
Received: from mail-qk1-f198.google.com ([209.85.222.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lidr7-0004TU-1p
        for linux-clk@vger.kernel.org; Mon, 17 May 2021 14:04:25 +0000
Received: by mail-qk1-f198.google.com with SMTP id n142-20020a3727940000b02902fa8eadfa9eso4804566qkn.7
        for <linux-clk@vger.kernel.org>; Mon, 17 May 2021 07:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8nNt7p8/XpkMjdfYomnfwPohk68DN8/DKf++9T5aVd0=;
        b=UwvwWCNcmME1P9nmSPZ0DrcbxenIC2GgzAGz3iCuS+7hIIpq9QW6Fa62yXYjQi3Nx7
         YRD034meA4Di0RicHxTSiGV6gwhaJqQy5yRwA4Q4ayw9tmBjU01FtpYeT7qAM+Y0Ab8y
         fwNqwqBYUq7JUBhwkp3pKH/2TKw8hi1g++w/rK/eSqJ2z9G+QM7KKt4u3XCYTm5JfqZB
         VqF2Mf+0y0K/pNvPTOK47Fv8LtWDrCDyMvn+7jyBzUUhoXumXACS0VWh6tihvKd8RuaF
         scuRF9dGxjWwFrKIKNdF7YUdrX4lE4OOqFbJxCWk3g9GYke/IXqexNAM4aVJER4JLhxv
         stxg==
X-Gm-Message-State: AOAM5331cOasMUK0C0b7bEqhpFZTKI/6rrh9AI1RcPGiZuSFFqC6QdZQ
        o2JdvzPqHXua5kmGtczES9gNveoNzaxfUjZ7Ce0AlBXW2/cifXtNWNwIcxFJdhBBxEBpwQ3cgBn
        1wEuEW/wp+OfT6pIcnXB6jQzeihBgPL92eOzRYQ==
X-Received: by 2002:ac8:4319:: with SMTP id z25mr58437001qtm.262.1621260263528;
        Mon, 17 May 2021 07:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWt/qyHrHTiRrV9XefovdlniWXO+Q/V4ZIQpCKkD+hCnqGqyLmKZ5nKHMU30KlJqDxYO14Ug==
X-Received: by 2002:ac8:4319:: with SMTP id z25mr58436977qtm.262.1621260263312;
        Mon, 17 May 2021 07:04:23 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id i129sm10505301qke.103.2021.05.17.07.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:04:22 -0700 (PDT)
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
 <936cfc7d-737e-a582-ea60-ad2ba5b4ca72@canonical.com>
 <1d80ee0f-de4c-24d0-154f-20841874bf20@gmail.com>
 <4ea1bf29-c353-6fcf-5248-bfee67d5c361@canonical.com>
 <c120ecf5-7202-9f1d-6e70-a99db2f5335f@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1cde1d43-f139-cb90-395e-8f8fceb41bce@canonical.com>
Date:   Mon, 17 May 2021 10:04:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c120ecf5-7202-9f1d-6e70-a99db2f5335f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2021 09:47, Dmitry Osipenko wrote:
> 17.05.2021 16:39, Krzysztof Kozlowski пишет:
>>>>>  #define DRAM_DEV_SEL_ALL			0
>>>>> -#define DRAM_DEV_SEL_0				(2 << 30)
>>>>> -#define DRAM_DEV_SEL_1				(1 << 30)
>>>>> +#define DRAM_DEV_SEL_0				(2u << 30)
>>>>> +#define DRAM_DEV_SEL_1				(1u << 30)
>>>>
>>>> Why not using BIT()? This would make even this 2<<30 less awkard...
>>>
>>> The bitfield 31:30 is a enum, 3 is a wrong value. Formally it's
>>> incorrect to use the BIT() macro here.
>>
>> Why "3"? BIT(31) is the same as 2<<30.
> 
> By 3 I meant BIT(31)|BIT(30). This bitfield is explicitly designated as
> a enum in the hardware documentation.

I understand it and using BIT() here does not mean someone has to set
both of them. BIT() is a helper pointing out that you want to toggle one
bit. It does not mean that it is allowed to do so always!

> 
>> It's common to use BIT for
>> register fields which do not accept all possible values. Now you
>> basically reimplement BIT() which is error-prone.
> 
> Could you please show couple examples? The common practice today is to
> use FIELD_PREP helpers, but this driver was written before these helpers
> existed.


There are plenty of such examples so I guess it would be easier to ask
you to provide counter ones. Few IT for enum-like registers found within 2 minutes:

https://elixir.bootlin.com/linux/latest/C/ident/MAX77620_CNFG_GPIO_INT_MASK
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/max77650-regulator.c#L18
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/tps6524x-regulator.c#L62
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/tps80031-regulator.c#L39
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/da9121-regulator.h#L200
https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/regulator/da9121-regulator.h#L231

Best regards,
Krzysztof
