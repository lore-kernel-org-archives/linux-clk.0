Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9311FCDB483
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 05:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjJMFqF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 01:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJMFqE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 01:46:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05786BE
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:45:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ba081173a3so281707266b.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697175957; x=1697780757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxZEgbxCg5FDJLZd0opb0NR1i2vaQaa75X9YgsS3o4g=;
        b=fc2PHm0IL2c6Zhq39zqnqxfE8WqxyzCVBMBy6I9C0VQuIx5H5qIISsxvu0TSNcjIbX
         uNTqDzPMLgiboajiuQ8yf6oFWqFJgj2B7asTxI0nKYXQILVCX79M1xrtOx8YkFTguO0I
         26W3Pecp6YCyq+zdWNbfn2QKoZH5cOHPC9aOwKkVlY19xgI3ftrB4p2levQhxhSlGV2F
         5Ps7G90XLcHSArTX5iZufZf5MiT7E4gYO1ZYLvaIlrdLaxTnT8Lx998MGJ2maaPAa1A0
         TcwDAzGDSXl9z92LeEwnXEOXG8bkKDghevgPsqM57qzBkbhpqKp1HcNLFDXmnqzaGS8P
         12ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697175957; x=1697780757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxZEgbxCg5FDJLZd0opb0NR1i2vaQaa75X9YgsS3o4g=;
        b=RnGshGf9wRw0j7AgDsJMqFH4tobJ6bU+9MwERxm+BFxpyp37KEhr5ATGfDJmNFVTPw
         31gxsyNsfOjTt/24TdpT4NwXyuTCPG7SoqKBMgo8eT+U6kXQ+g5E1hPQ8MmZkB6dTEP0
         uoBlCmPJRjighzbr57N+OEiwGKv5FkNM6nWYWka6tku5D0wXvMfIOtwymsTEqxFlpmdk
         78RvR4qHjgaLCBXjS1c+yMnsAU9UevylVJjqJ6qy7jaHenb41X3joq35cjIGJnBKmRjD
         Ero2OmScxhxtb2Aw0sVz9Z+nG102e7YkxUIOnJUaTrBqGGsf9YnqKXplAIonZF+dJkNu
         Q53A==
X-Gm-Message-State: AOJu0Yx90V5iFl+0bHoYniPnXRUuffQv2y/O5wcRW6uBJs63qIW7Xhvy
        MHIvjSPov6jZnJD31hS3E34CkQ==
X-Google-Smtp-Source: AGHT+IEU1XyeStB/aWD0WH+ornRlse4gB07KLRSG9FvBu7tXwdQTee0owSG7ClQpIarIJaHs7bVU0A==
X-Received: by 2002:a17:906:3086:b0:9b2:765b:273b with SMTP id 6-20020a170906308600b009b2765b273bmr25027063ejv.70.1697175957346;
        Thu, 12 Oct 2023 22:45:57 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.133])
        by smtp.gmail.com with ESMTPSA id kt13-20020a170906aacd00b009a5f1d15644sm11761505ejb.119.2023.10.12.22.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 22:45:56 -0700 (PDT)
Message-ID: <a007c3a9-0a68-4f4c-bcea-4ffc111939a1@tuxon.dev>
Date:   Fri, 13 Oct 2023 08:45:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW-m+ikzOiCqGaiofd0QG5BVuoMK+z6G7u2JboGTw3xhQ@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW-m+ikzOiCqGaiofd0QG5BVuoMK+z6G7u2JboGTw3xhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Geert,

Thanks for reviewing!

On 12.10.2023 17:36, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for your patch!
> 
> On Tue, Oct 10, 2023 at 3:27 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add SDHI2 to RZ/G3S Smarc SoM. SDHI2 pins are multiplexed with SCIF1, SSI3,
> 
> SSI0
> 
>> IRQ0. The selection b/w SDHI2 and SCIF1, SSI3, IRQ0 is done with a switch
> 
> and IRQ1 (twice). Or just say "The selection is done ...".
> 
>> button. To be able to select b/w these a compilation flag has been added
>> (SW_SD2_EN) at the moment being instantiated to select SDHI2.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -13,14 +13,21 @@
>>   * @SW_SD0_DEV_SEL:
>>   *     0 - SD0 is connected to eMMC
>>   *     1 - SD0 is connected to uSD0 card
>> + * @SW_SD2_EN:
>> + *     0 - SCIF1, SSI3, IRQ0, IRQ1 connected to SoC
> 
> SSI0
> 
>> + *     1 - SD2 is connected to SoC
>>   */
>>  #define SW_SD0_DEV_SEL 1
>> +#define SW_SD2_EN      1
> 
>> @@ -100,6 +125,19 @@ &sdhi0 {
>>  };
>>  #endif
>>
>> +#if SW_SD2_EN
>> +&sdhi2 {
>> +       pinctrl-0 = <&sdhi2_pins>;
>> +       pinctrl-1 = <&sdhi2_pins>;
>> +       pinctrl-names = "default", "state_uhs";
> 
> Do you need two states if there is only a single voltage?
> AFAIK, UHS needs 1.8V.

I had the impression that driver needs them both anyway. I double checked
now and it seems it is not the case. I'll update it in the next version.

Thank you,
Claudiu Beznea

> 
>> +       vmmc-supply = <&vcc_sdhi2>;
>> +       vqmmc-supply = <&reg_3p3v>;
>> +       bus-width = <4>;
>> +       max-frequency = <50000000>;
>> +       status = "okay";
>> +};
>> +#endif
>> +
>>  &pinctrl {
>>         sdhi0_pins: sd0 {
>>                 data {
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
