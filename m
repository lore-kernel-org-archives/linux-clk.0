Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DDFC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8378F61416
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 07:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhGBHRJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 03:17:09 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:45941 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhGBHRJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 03:17:09 -0400
Received: by mail-ua1-f48.google.com with SMTP id c20so3453211uar.12;
        Fri, 02 Jul 2021 00:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tSIgvkvDcUupexuTNEQVMspADGvU8xJ022kG+/svdWo=;
        b=R+QR2prroDIFH0MnmIx1Adbcmz55QTfHZpkBaXHvOGaIuNv+pto31fglBVGFOxLvon
         lK/WGNJrzqJfUnQDzZ6mevVC6q6rHa8pOf+U+9+V3p5NOnB2+Ii36AWEJG6xMMTRR9Nh
         cFc+rJcdqduQ+mp9Sf958ed8EWrTY5FRm6g5pWT00lQYy3Z+q4072QVUyg8+Xiic020e
         pc9XHk5zc18b7N2LULcceKhmyob9jschWkLIVMlAPnpw5vGPfEVN3qFYjhI4TV3Xqc/G
         8Zy7/f2sEBU/dhrmAunLwrHABZdNLdhMbieetSULXR7zffvsfvM6ouMVGGdSg99oGtqw
         SiXw==
X-Gm-Message-State: AOAM530kqr1l2RzZNBkECZU4JttlcPbRm9mYeaV81Fsi1ZBinhclIjQQ
        8SQ4pL2N+2T91RHBLh1/A8NXpmeDamciHIdgAz0=
X-Google-Smtp-Source: ABdhPJx5kNzFmQ0ZJLyH+sDvB8lvsnYC9sOXDRO7th11YqW9h9r86wgL3rF1DNy8l6xdnfi/yDbk5De6bE0SitOFFgI=
X-Received: by 2002:ab0:647:: with SMTP id f65mr5076293uaf.4.1625210077134;
 Fri, 02 Jul 2021 00:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210701182012.3421679-1-sean.anderson@seco.com>
In-Reply-To: <20210701182012.3421679-1-sean.anderson@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Jul 2021 09:14:25 +0200
Message-ID: <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
>
> Changes in v4:
> - Specify that bindings should specify these properties, but don't make
>   any guarantees about the driver's behavior when they are not present.
> - Clarify description of idt,(en|dis)able-shutdown properties.
> - Make opposing properties mutually exclusive.
> - Add these properties to the example.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

> @@ -109,6 +152,22 @@ allOf:
>        required:
>          - clock-names
>          - clocks
> +  - if:
> +      true
> +    then:
> +      oneOf:
> +        - required:
> +            - idt,enable-shutdown
> +        - required:
> +            - idt,disable-shutdown
> +  - if:
> +      true
> +    then:
> +      oneOf:
> +        - required:
> +            - idt,output-enable-active-high
> +        - required:
> +            - idt,output-enable-active-low

Do you really need the "if: true then:"?
Just the "oneOf: ..." worked fine for me in another binding, but then I
didn't have a surrounding "allOf" to interfere...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
