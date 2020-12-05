Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D0FC433FE
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 09:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1130C22D2A
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 09:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbgLEJoe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Dec 2020 04:44:34 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35541 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgLEJnC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Dec 2020 04:43:02 -0500
Received: by mail-oi1-f193.google.com with SMTP id t9so9280524oic.2;
        Sat, 05 Dec 2020 01:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGdaUmtB30TVsj7alwm/cJhVAoMWhBl+L16TLVJy0GU=;
        b=MbRY9jP8BPa0TwKsYZZ+KmjhZluzLMGj2+QIdJPJQVmbQb2NZjZjF1yzZUsuI9Pr7Y
         3YRyCgFuWkW1MH6NEe6dnkhheq6W0+TsdZpS+KVdeiyfjfZ0kgLH88mimBBgoGjXEqLe
         Gpe4ojV3U3kz4Lwlzx2JbiF0LZ5LieMD6aX3b4pgQvoIM2dwSp5G/Of/vCX5kQ00Da04
         j+NWypgGCxUcrElQg3diex5IPmn2IkLwZ6Aib2CpIi6aH0wCbEIt72bFl61seUq5LpXw
         Fy2GmRNxtrylm5aH8EtBwPoqQVlOAHj9v0E0xxz5cfqKg1Eq2SGX9HODRfQvWeiD8ffg
         MGEQ==
X-Gm-Message-State: AOAM531AdNu7ldV73vYQs5OkyxzNiVyADAasocwNrNBhtKwNuzfxYgHQ
        Mhtn0OUXi9qhJB+QNI4EVS8aSiu2uzMd9yB1jOFmF0rVkHY=
X-Google-Smtp-Source: ABdhPJwLYvltQQGfaxz5Cw2w/zv1Y+C9MgjWhLpZYxRx4VvMLhZqNWb3xLk+V7UCvmYR02UJOryygCbm26eslneYzJA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr5872940oih.153.1607159141323;
 Sat, 05 Dec 2020 01:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130085743.1656317-1-geert+renesas@glider.be> <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
In-Reply-To: <160714944657.1580929.4595234852977229885@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 5 Dec 2020 10:05:29 +0100
Message-ID: <CAMuHMdWJhiO5A7b3B8CH2YpURe_G0dEPEmES6R8n_8D-Z+Q65A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Mackerras <paulus@samba.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Sat, Dec 5, 2020 at 7:24 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-11-30 00:57:43)
> > The R9A06G032 clock driver uses an array of packed structures to reduce
> > kernel size.  However, this array contains pointers, which are no longer
> > aligned naturally, and cannot be relocated on PPC64.  Hence when
> > compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
> > PowerPC allyesconfig), the following warnings are produced:
> >
> >     WARNING: 136 bad relocations
> >     c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
> >     c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
> >     ...
> >
> > Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
> > definition, trading a small size increase for portability.
> >
> > This increases the 156-entry clock table by 1 byte per entry, but due to
> > the compiler generating more efficient code for unpacked accesses, the
> > net size increase is only 76 bytes (gcc 9.3.0 on arm32).
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
>
> Unless you want me to pick this up for clk-fixes?

Yes please. Forgot to retain this comment for v2:

   "Please take directly (ppc or clk), as this is a build fix.
    https://lore.kernel.org/linux-clk/20201128122819.32187696@canb.auug.org.au/"

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
