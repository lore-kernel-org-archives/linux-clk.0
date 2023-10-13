Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC6ACDB47E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 05:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjJMFvc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 01:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjJMFvb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 01:51:31 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C852C9
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:51:30 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9b9a494cc59so260452066b.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697176288; x=1697781088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UAXPkFEVO9NEy1CgnJcKxdErF48Wzyp1pIE8KdvUE5o=;
        b=fDJq079Qcm6+VouFFteEdR81wVhKmMYv+DwLQVlUh/PIuuQ+5lsG68xiay0vQ9yGxC
         hu3eYKfrEgy+FafaqyS3II5Kql0PhwBcoJF2YWXAekviRo9C0qHckPA7aTLMIbzeIHlE
         1fsg/TwYjYDWLFq4wMvkhBy/P0C3oDA3azTYHSryWnpd4RACUUWVMAqiaSP5lkTl8nNJ
         sa0QgOsjrGy0TfFOInvBeLiJ6+tyoQ071WuzoFd2BpTVPoo6ZUZeFvs59WFl908XLlDt
         8aqPqfSwrFYtp7hJEsec9m1N7rNyw4aaPYdu/jMxMo3RsAYf6Unic8ppYu/HuYRM0Nc+
         t+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176288; x=1697781088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAXPkFEVO9NEy1CgnJcKxdErF48Wzyp1pIE8KdvUE5o=;
        b=FmS8yke9zEVCTaKEQD4JpAy/09Zjb2jqMS56Ia89RPHq8yNLwXEf8rJgb0COXMgRUQ
         rMh6TCi4tkrBwjKS7Iupmlopk4RWlosf3JmebcDI2nxHXScFZKTH8l5vGlsJbbKlqEoI
         x7hAMkzujEDZIFeRz4b9mAnYMglFHY671TENzKQFnQ2cbqnr/XutVlbd7kmUYhRNzyRO
         N427Pq6REPbmAJMtBus2ZlGT8UtOlCha2un9V5lsgOAYIOVrJ36NZp5yFoAwQnSvtAi0
         g54jDeZIEXS+4wJVjFveGWD9TSp5/r31Tie1zO7IAS13lpSknQqt5kLWNrhC9GxNCD2z
         CdPQ==
X-Gm-Message-State: AOJu0Yy0Swunmuauc9eFtEt3PO67HkcJCTYcjsJz63CjVZemm4WwkVm+
        VRAYXf6JxXkuxcdzV5PLayVFeA==
X-Google-Smtp-Source: AGHT+IHmc9LtDuylGDF0Uig4QbannJCtiHcJ/b42Sf8kD1VjI0wEyeEWOKYrTIT/FTWC9eedWAgM5A==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id e22-20020a170906315600b009b2b71f83bemr22216827eje.1.1697176288653;
        Thu, 12 Oct 2023 22:51:28 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.133])
        by smtp.gmail.com with ESMTPSA id w13-20020a170906480d00b0098d2d219649sm12086328ejq.174.2023.10.12.22.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 22:51:28 -0700 (PDT)
Message-ID: <e678ef3a-0f84-4ea2-9116-a661b91b2e32@tuxon.dev>
Date:   Fri, 13 Oct 2023 08:51:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: renesas: rzg3s-smarc: Enable SDHI1
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW+5MZXRbDtZtmrMkrCtwqqKUcW_W1_5U_2yO6w6aCa_w@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW+5MZXRbDtZtmrMkrCtwqqKUcW_W1_5U_2yO6w6aCa_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12.10.2023 17:44, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Oct 10, 2023 at 3:27 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add SDHI1 to RZ/G3S Smarc Carrier-II board. This is connected to a uSD
>> interface. Although Vccq doesn't cross the boundary of SoM it has
>> been added to RZ/G3S Smarc Carrier-II dtsi to have all the bits related to
>> SDHI1 in a single place. At the moment SoM is used only with RZ/G3S Smarc
>> Carrier-II board.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
>> @@ -11,6 +11,27 @@
>>  / {
>>         aliases {
>>                 serial0 = &scif0;
>> +               mmc1 = &sdhi1;
>> +       };
>> +
>> +       /* Reserved regulators 0-9 for SoM. */
>> +       vcc_sdhi1: regulator10 {
> 
> You can use sensible names for the regulators to avoid conflicts.
> E.g. "regulator-vcc-sdhi1".

OK, I'm aware of that, I'll use it like this in the next version.

Thank you,
Claudiu Beznea

> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
