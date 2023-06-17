Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FD6C3DA40
	for <linux-clk@archiver.kernel.org>; Sat, 17 Jun 2023 17:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346334AbjFQR1N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Jun 2023 13:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbjFQR1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Jun 2023 13:27:12 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E58189
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 10:27:09 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a4088c4ebso1805970a12.1
        for <linux-clk@vger.kernel.org>; Sat, 17 Jun 2023 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687022828; x=1689614828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5T+EGK226eOs1uvd8FU4XjimHmNEnziSAMgt6UX6BMM=;
        b=dWhVoGKAvkEzL0WoeGaVYwK1JnZdYCKoswGm9iBoaYB6YKg32fAXSLjN2US6Dl49Yw
         rW6KgqAY+QayVQjRVk7VepwGnZ0sU3A/BuN5BcRP1hLfk4HWivSlLV52O/Nt2DNPnO3e
         nourwR54lKlUj+QDRQ+AVUVeHjtpmeeBY9TDioQ0oP9jh+zKERTs7MdAeE+1qWY6UGCl
         9dVVUY6x34Xp0PwTz/AWbGfkW6tdVghwY7lRVeV0Y6XnnvCFofCofzbLUio86iNwynIB
         RCsrSRfmSTib/wTGXAaAcxJEIPEKSK/Tqx1AsqxNDkhsxms9qsr0UXDWQ/56EOeUqeJU
         T+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022828; x=1689614828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T+EGK226eOs1uvd8FU4XjimHmNEnziSAMgt6UX6BMM=;
        b=QqnrTe2XWIzA8gYqXS3WQmBBYzOvSfYWdLXmQBePsACD52N8xjOS6mv8fgtuCUIcEP
         ejcwxM/6GsiZ3jTIomT02JRRV7XkccMueYZQN/AnjITqzZCp92Erl+x1D00mjiZR6twn
         LPMoTEBrmztZmxvaU9O4kgRmm0/Tylw2YNq0N34epIvV5JDUD+8Cbg0XiPymJtDN1x0O
         SsKGnz8VVr19tdH3DsK0o4EfFIRX6mNo4rBNOBC+4gpjRZrKAipAgnuCayKivxwSXyu0
         c5jTtfU+eWOIpYaXqwxIHW5dA9Gg72ivrHkHUzaQfemGPnzmd9kwdC7aaMcv/BDujfeH
         Mcog==
X-Gm-Message-State: AC+VfDw8DqaelVH1/PTXBHif7CaUnZ31HKjtTBZpy9nDgtFX5A+Uqwd2
        SEPZs/20Qm/gOzxVQg9tZxTDXEuUZj0bKYSUVrc=
X-Google-Smtp-Source: ACHHUZ65DsKf1sDpxsHVVDWKYW/iErpSizRIN4Gt9KVqxf8XEweMpqFguDQToNmnZonPrlHceusN/g==
X-Received: by 2002:a17:907:9281:b0:982:caf9:126 with SMTP id bw1-20020a170907928100b00982caf90126mr5454986ejc.42.1687022827931;
        Sat, 17 Jun 2023 10:27:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qn4-20020a170907210400b009875a6d28b0sm1092554ejb.51.2023.06.17.10.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:27:07 -0700 (PDT)
Message-ID: <b995dead-5cca-de05-5840-bed882d2c4ff@linaro.org>
Date:   Sat, 17 Jun 2023 19:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 8/9] mips: ralink: get cpu rate from new driver code
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org, arinc.unal@arinc9.com
References: <20230617052435.359177-1-sergio.paracuellos@gmail.com>
 <20230617052435.359177-9-sergio.paracuellos@gmail.com>
 <c1a69db7-96c2-f3ad-3ef2-9a655b10bfb5@linaro.org>
 <CAMhs-H_HjsT2om2CZpMmVDYao=M5FoZwyy0Te1QB9MLj6mAxnw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_HjsT2om2CZpMmVDYao=M5FoZwyy0Te1QB9MLj6mAxnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/06/2023 17:35, Sergio Paracuellos wrote:
> On Sat, Jun 17, 2023 at 4:48 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/06/2023 07:24, Sergio Paracuellos wrote:
>>> At very early stage on boot, there is a need to set 'mips_hpt_frequency'.
>>> This timer frequency is a half of the CPU frequency. To get clocks properly
>>> set we need to call to 'of_clk_init()' and properly get cpu clock frequency
>>> afterwards. Depending on the SoC, CPU clock index in the clock provider is
>>> different being two for MT7620 SoC and one for the rest. Hence, adapt code
>>> to be aligned with new clock driver.
>>
>>
>>>  void __init plat_time_init(void)
>>>  {
>>> +     struct of_phandle_args clkspec;
>>>       struct clk *clk;
>>> +     int cpu_clk_idx;
>>>
>>>       ralink_of_remap();
>>>
>>> -     ralink_clk_init();
>>> -     clk = clk_get_sys("cpu", NULL);
>>> +     cpu_clk_idx = clk_cpu_index();
>>> +     if (cpu_clk_idx == -1)
>>> +             panic("unable to get CPU clock index");
>>> +
>>> +     of_clk_init(NULL);
>>> +     clkspec.np = of_find_node_by_name(NULL, "sysc");
>>> +     clkspec.args_count = 1;
>>> +     clkspec.args[0] = cpu_clk_idx;
>>> +     clk = of_clk_get_from_provider(&clkspec);
>>
>> This is very obfuscated way of getting clock. Why can't you get it from
>> "clocks" property of "cpu", like every other recent platform?
> 
> I did not find any other approach that works for me. So I ended up in this one.
> Can you point me out in a sample of code doing the same so I can check
> if it works for me then?

You mean bindings?
git grep cpus.yaml

Driver?
git grep clk_get_rate
clk_get
eventually of_clk_get

It all depends on the context.

Anyway, it is very easy to find existing solutions not using
of_find_node_by_name for your platform:

git grep mips_hpt_frequency

First result.


Best regards,
Krzysztof

