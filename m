Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD336C48BE5
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 12:18:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C4D613DD
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 12:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbhFKMUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:20:17 -0400
Received: from mail-vk1-f174.google.com ([209.85.221.174]:38637 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhFKMUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 08:20:17 -0400
Received: by mail-vk1-f174.google.com with SMTP id 27so2478202vkl.5;
        Fri, 11 Jun 2021 05:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2H92W+hizK8eMcWXk2Y8eWMITPk9xnALpSRvGPnaNkM=;
        b=Lrh56rJszvl5AgsB/DiUPZ/kf82FVgfsNn2isT9n15WtgTrcPsXeDIkS+V6FBRIgnx
         HOrDV8OcN1zb/ST76jY+CITY3ZakkhUqXwRt+ud7kN5deWaqjThKC1hS+1COPqVOZqXC
         Pji/AUJL3W1M4nRrklQeuFpHvp3MvtBkWgN/DjpCE7v1+lbclgBG4q+2Qdrk4gAjbHYl
         Ibjct2H5RhZy6INeWWYBmS+D9B9fNhPKeXSWiWFw2D5D8wgths13kxl7x2ybWhQLJa83
         jjs51dLGsbAUDAX9TyYYGZ7a1zF5u2jeZVD97VroAMwZRZzgm05iET+B7RS+pjEl4Db4
         rHEw==
X-Gm-Message-State: AOAM5330Zxs1/bhyAAI+SjnDb2ALhQ3BGk3PVhziogvM0Mt1+UysfHNS
        cpoGcw9SiiFQa7BDbqmdqJXjTbvzKWJ+ZKI8zko=
X-Google-Smtp-Source: ABdhPJwz6Me+KM54mXk3hIXczz496UPhe+43FmIyojKlLNDvp3KjYmbSrLmfcsB+iEA1piGZptQOdvkHKL8skQ1N3pE=
X-Received: by 2002:ac5:cb6b:: with SMTP id l11mr8169784vkn.2.1623413899073;
 Fri, 11 Jun 2021 05:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210519201551.690654-1-daniel@zonque.org> <20210519201551.690654-3-daniel@zonque.org>
In-Reply-To: <20210519201551.690654-3-daniel@zonque.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 14:18:08 +0200
Message-ID: <CAMuHMdUmEWNCj6J43jwxE67K=ksRy53Eb9B82HjDfC++-YLw9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document aux-output-source
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Daniel,

On Wed, May 19, 2021 at 10:23 PM Daniel Mack <daniel@zonque.org> wrote:
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -37,6 +37,16 @@ properties:
>    reg:
>      maxItems: 1
>
> +  cirrus,aux-output-source:
> +    description:
> +      Specfies the function of the auxililary clock output pin

Specifies ... auxiliary

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # CS2000CP_AUX_OUTPUT_REF_CLK:  ref_clk input
> +      - 1 # CS2000CP_AUX_OUTPUT_CLK_IN:   clk_in input
> +      - 2 # CS2000CP_AUX_OUTPUT_CLK_OUT:  clk_out output
> +      - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status

Should the default be documented? "default: 0"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
