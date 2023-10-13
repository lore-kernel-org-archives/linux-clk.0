Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2227ECDB47E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 05:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjJMFzT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 01:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjJMFzS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 01:55:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B780AC0
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:55:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e0d21a4easo2389558a12.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697176514; x=1697781314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYHZdMFA6OQbagkrLvPrbN3TwwM9BrhoqWPjC6tbAtk=;
        b=NqjM2d63W9cMlsFqB+kwBGI6Zdb5Et0SdPJnSI74XlYSl7xneWpEc4G6feGNJB7cMJ
         gKD4EhWJkN7wKmiElaKZ7tBxCNiOGLLlOuYK+B976HEEkHDzVr9jK836VarI+NzaZtek
         TWDEHpVrXcfzczy67VqAzvlkc48jR6zicuRARqjJJ6rSFyQtPZ5FpiEBlMtIT577MD2J
         sXZVAicVnmFVsUtsYCX/+HTbEx8No4p1GAJMhq/YbqHdzEjmDP/Kmp4mKO8d+yjcCRXo
         TkY2PCM1efcj/XQ4PDvQxhichr7TEGaLtsHMWfyBaA68MN/ZGeZbkH9jwLdhSQG0i9fO
         Hdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697176514; x=1697781314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYHZdMFA6OQbagkrLvPrbN3TwwM9BrhoqWPjC6tbAtk=;
        b=C0APDNBJio8el1nnXm134sUVX5c9aKjmTKFD40Si1cMGtiCzuSP1Rr8VK8xWExHb7X
         3hX1iJ1iyStvTb5lCDKIyKxqAx/jFhE2pEgaeDRZ/CZLZeEVThJAmcqO0RWhg37kT7AP
         tveMNs9S/W1rR2q6lu0xiAwbEnESemzbOlRjYsFXPvGb1hhrYa7MkQZ6tcmXODr4IK8u
         arKRYC/jitk8Q70csAK67gbe8yVewtRPR6WnzWvUlSPnTlaxrbdKVfGaFVZfXXNE6Ca8
         wU4+AQac0VDD7JupHLsH3blASYfgYu1ePZdbkDtZQ6v/EiiVPWL4LyucE0PrAw6e05D8
         oQpg==
X-Gm-Message-State: AOJu0YwJWAa3yi2PA5Qw1SYdfwOutPlIGfXWxJh4V6+QMBeiTgUNhe8B
        su7G2vQ8fCd12w84DztlUIB8fA==
X-Google-Smtp-Source: AGHT+IFFh3iNNCKrv7qa7ps1KepqR4A5yjCxBztpy/J6r0rr1ZsGCqYF7OpwdshOCE+3/c95sGEksA==
X-Received: by 2002:aa7:d947:0:b0:531:9c1:8271 with SMTP id l7-20020aa7d947000000b0053109c18271mr23383511eds.14.1697176514187;
        Thu, 12 Oct 2023 22:55:14 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.133])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b0052e1783ab25sm11073824edr.70.2023.10.12.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 22:55:13 -0700 (PDT)
Message-ID: <acc14d48-7b9c-4d7e-a642-077c3841b937@tuxon.dev>
Date:   Fri, 13 Oct 2023 08:55:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: renesas: rzg3s: Fix dtbs_check
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVwO--GrdDP8pUHq-k5cVR31dGdvEM73z2E+NLEbD8GRw@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVwO--GrdDP8pUHq-k5cVR31dGdvEM73z2E+NLEbD8GRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Geert,

On 12.10.2023 17:49, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Oct 10, 2023 at 3:27 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Fix the following DTBS check warnings:
>>
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dt: /: memory@48000000: 'device-type' does not match any of the regexes: 'pinctrl-[0-9]+'
>>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device_type' is a required property
>>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
>>         from schema $id: http://devicetree.org/schemas/cache.yaml#
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi       | 1 +
>>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 2 +-
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.7, split in two parts.

I see you already did the split and applied, thank you for that. I was in
between choosing to split it or to have it like a bulk patch.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
