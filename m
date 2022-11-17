Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14824C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 11:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239674AbiKQLAj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239322AbiKQLAB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 06:00:01 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F48AE4B;
        Thu, 17 Nov 2022 02:57:29 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id fz10so814788qtb.3;
        Thu, 17 Nov 2022 02:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caoh7PtTsDMq2hTmo+2WH4i1lSrvHnWeG1MPfrjXBCc=;
        b=Fj4n6vvbAPjlGd0kLgW1sknzhopZ2Q2EZj5SV/UFOY1R0gg5efXL0mGXr6itfEOUqe
         onxbMxfukY6Zah1a8fgK5KxuR/FcBd/dSJdCenm7qxoxNiocSBkou/JDr3OZyp2pzFFB
         6bHrMIhbWHeDoOxapbQR/I+DGfhHEaFDx50pgpvJxX72EIZKZa9F1O6xOVY741xalYyS
         Zr5/mhB5dW/1p3TZQRbS7ZD4pWtiWO9Lx3QqeKgUQ6yg5KplAviKlh/UCwx/hUAxnCUW
         9G9zv9VDoK1uOPqGUJR5dcRR0401YzVoBvSyNbJwJBel9X/uJ1KN2lNbJhTpFIr34EPa
         m90A==
X-Gm-Message-State: ANoB5pmCfcGfbfupsErpG+aKgc9NbfugcNHoF+J7hOcqXhl0iIbn8/hD
        saQ/mQnct0U6fFxRV67VKJzkNyGYbIWhEQ==
X-Google-Smtp-Source: AA0mqf5YMPNR/PZY5dMyjg4VQiNOnixdDmBKtxVeBSHp3u2RirIYUf//SKvORs99EcTk+hglSjjZ0A==
X-Received: by 2002:ac8:7457:0:b0:3a5:2e28:b57b with SMTP id h23-20020ac87457000000b003a52e28b57bmr1705455qtr.106.1668682648074;
        Thu, 17 Nov 2022 02:57:28 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id bi40-20020a05620a31a800b006f7ee901674sm256648qkb.2.2022.11.17.02.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 02:57:27 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id b131so1400194yba.11;
        Thu, 17 Nov 2022 02:57:27 -0800 (PST)
X-Received: by 2002:a25:8249:0:b0:6dd:b521:a8f2 with SMTP id
 d9-20020a258249000000b006ddb521a8f2mr1439247ybn.380.1668682647179; Thu, 17
 Nov 2022 02:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20221115192625.9410-1-alexander.helms.jy@renesas.com>
 <20221115192625.9410-2-alexander.helms.jy@renesas.com> <e9fd112f-0fd2-e833-8687-9a256c307842@linaro.org>
 <9231404a-85b2-9a9f-f040-f97615bf8ec0@renesas.com> <6dc67c30-d9c3-5906-a2bc-263ac83df051@linaro.org>
 <CAMuHMdVoCVz7zyWvAbCydSGQ6RnRxH2kBFDyu-M-Fn8h_XicLQ@mail.gmail.com> <5a986cd4-12fe-a9f9-51f2-844fa6989bc8@linaro.org>
In-Reply-To: <5a986cd4-12fe-a9f9-51f2-844fa6989bc8@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Nov 2022 11:57:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG9ojeSYqiz6fuuFkFsCBk7S8k3j3qurfutorLFpK2Uw@mail.gmail.com>
Message-ID: <CAMuHMdUG9ojeSYqiz6fuuFkFsCBk7S8k3j3qurfutorLFpK2Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dtbindings: clock: Add bindings for Renesas PhiClock
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alex Helms <alexander.helms.jy@renesas.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

On Thu, Nov 17, 2022 at 11:41 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 17/11/2022 09:11, Geert Uytterhoeven wrote:
> >>>>> +  renesas,ss-amount-percent:
> >>>>> +    description: Spread spectrum absolute amount as hundredths of a percent, e.g. 150 is 1.50%.
> >>>>
> >>>> What? If this is percent then it cannot be hundreds of percent. Percent
> >>>> is percent. Use appropriate units.
> >>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Fdt-schema%2Fblob%2Fmain%2Fdtschema%2Fschemas%2Fproperty-units.yaml&amp;data=05%7C01%7Calexander.helms.jy%40renesas.com%7C9c13a32848f3434e217108dac7ab69f6%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638041836281252737%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=6MULpJhPyyjWSo1SvPCrz6KidE1VEtiiNYk1O5wS1vI%3D&amp;reserved=0
> >>>>
> >>>
> >>> Values like 0.5% or 2.5% must be representable which is why this
> >>> property is an integer of hundredths of percent. How else would you
> >>> represent a non-integer percent?
> >>
> >> With an appropriate unit.
> >
> > Krzysztof really means the property should be named e.g.
> > "renesas,ss-amount-centipercent" instead.
>
> I provided an URL to document with units, so I was hoping Alex will take
> a bit of effort to open it. Hundredths of percent sounds like basis
> point... If it is not basis point, maybe it could be made such?

Thank you, I didn't know about basis points. TIL ;-)

(and I didn't dare to click on the safelink-converted quoted link)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
