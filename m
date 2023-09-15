Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E27EE3F06
	for <linux-clk@archiver.kernel.org>; Fri, 15 Sep 2023 05:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbjIOFsN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Sep 2023 01:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbjIOFsM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Sep 2023 01:48:12 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894412D5F
        for <linux-clk@vger.kernel.org>; Thu, 14 Sep 2023 22:47:47 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ad8a822508so218201766b.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Sep 2023 22:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694756866; x=1695361666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mClZXEGSNnJrMU5yPF0CrbEDF0lrJX5nJWaXZOJ3BUU=;
        b=DvW/ksLHY7MnOj0pAEb1t1YI/9qJK8E1UmLGDS4Iiz6fuhRE6+KCGXlySorsn3T/BZ
         0G7AJGGazd+k37SJg/0IxXJvjcykzNosgwOgsygvydsEsiZLbw/f/vMMRbMVJnqrF5QV
         bHHFrr/1/HpKk0lckp9gzrJi2CDFPognvNY7sWJndYskxko1XXYKo+94CFRmevkCK1Tc
         1O98iLzmTUSV7Bz1260UUG/NMqhee2yyloyy7Ww+n3dZvQED02QjpO7lT4B5GnpPvkSx
         X3Qlbcpw9vzD69UlGzXCjnMC3PjO48nNLRUPrZJX7eRmnYUitzENSGIrqv9v0/J8zGiI
         2gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694756866; x=1695361666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mClZXEGSNnJrMU5yPF0CrbEDF0lrJX5nJWaXZOJ3BUU=;
        b=shYysfHpeskTJD+3azZl/Hq/P4OlIqLSb574lo3qnozxga3Cg6z0vDcRQW7Gtm4ZS6
         3Pttt/xgwDSesDrq7Ic6fKV4iln24QTHZAWFc1IGGLso+jNtkNOjaB0I/f8xti9aq64U
         ZkCDYQVAxtaNlT5gHkmLgHKsuVAPhM9Y98IQ9TkZRLjh4aMRC7k6aIAhkPoUXR73xupR
         i10kO8ipt6r07p7hN2T9QWyAboklPLLdaPfCu6LzMVB7Tv26Xns9k6jnQuyJpc2NEz+d
         3vWe4b9C4ngHcbUrG8TP7mvF84F5Ezpc9vE6QSX3r/L/7n2l3MiyA7Nc+2xOjcoTWifG
         TzEA==
X-Gm-Message-State: AOJu0YxYUfCBp7VDAkpndnBkozNu6KKn6EI18Mdrdg38F+Vl5fUStAaz
        nqtJAvHEExntN0bHvEiVTIqtCA==
X-Google-Smtp-Source: AGHT+IEWyeCL57OiTdtKjnW1JuwK01GRM8ZngJ1bXmSbU/Ry+SkKEz1+OxX0DHA+bCIRCpJqJ8Y/9A==
X-Received: by 2002:a17:906:220e:b0:9a1:beb2:1cb8 with SMTP id s14-20020a170906220e00b009a1beb21cb8mr484383ejs.39.1694756865698;
        Thu, 14 Sep 2023 22:47:45 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906350b00b009a5f1d1564dsm1893684eja.126.2023.09.14.22.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 22:47:45 -0700 (PDT)
Message-ID: <d54e14b2-9897-fbd4-7f5f-f5dd44c40f5e@tuxon.dev>
Date:   Fri, 15 Sep 2023 08:47:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 10/37] clk: renesas: rzg2l: use core->name for clock name
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV+54heFxPGmN53OMmP0cu4+3-t0ARZWH0c+qgZA_G73g@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV+54heFxPGmN53OMmP0cu4+3-t0ARZWH0c+qgZA_G73g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 14.09.2023 16:04, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Sep 12, 2023 at 6:52 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> core->name already contains the clock name thus, there is no
>> need to check the GET_SHIFT(core->conf) to decide on it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -266,7 +266,7 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>>         clk_hw_data->priv = priv;
>>         clk_hw_data->conf = core->conf;
>>
>> -       init.name = GET_SHIFT(core->conf) ? "sd1" : "sd0";
>> +       init.name = core->name;
> 
> Note that this does change the case of the names (e.g. "SD0" => "sd0").
> I guess no one cares...

As of my experiments and investigation we should be good with it.

> 
>>         init.ops = &rzg2l_cpg_sd_clk_mux_ops;
>>         init.flags = 0;
>>         init.num_parents = core->num_parents;
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
