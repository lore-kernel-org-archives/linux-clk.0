Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E743CC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 08:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244137AbiDKJAN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 05:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236336AbiDKJAM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 05:00:12 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33A93EBAF;
        Mon, 11 Apr 2022 01:57:58 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id b189so10081192qkf.11;
        Mon, 11 Apr 2022 01:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYOd5uPKUg9Pu/5HEV4rtkFPoYqAMXA0OJu/OmCqEfk=;
        b=bwMGZXsX8lA8V8CGXrGboQjCllbR2mJDpIZdnBK9cxHUcbPtcLyNpH6gaWP5YTWrHU
         TwHcbS12nWi1b270C+x6UOmYGBhiL18OXOtGcStTyrhTgujIrf2/EpLqPtkxajy7L+TE
         n71vdv7HI3Pj+Zf2oob7itTf95ULLEzueHLj+S5eGa0yLobW4e714/ozga2bm7Gbj59S
         27QGcbvnaaBabJngcvzgAYqmNeFt33EuCKNM5aduW+gwibeTvvrRbEh+iIhZRy8urKDb
         mrvQ1kfknsDrfMmZQ7ihknwBFpzhnFJlgC+ckWkC2LYmU7ALkJbHg8ForrQDfvn6XzT9
         IcBQ==
X-Gm-Message-State: AOAM530hPiMa+r55cnrNW/MFoicqRnHwfH8Ml10pusi/PlIjUWgB2Thf
        cqvEQMLzpCO8YeilfVL0OcLG+2W2hFKaXg==
X-Google-Smtp-Source: ABdhPJzXo0/WFy33PsVqImjZ+IZ4ZLZUAE7b/xyj9aH6PPYIMHY7N+Zn5vHfKUEoTgPQZY7NVUdqkQ==
X-Received: by 2002:a37:67c5:0:b0:69b:ed21:e345 with SMTP id b188-20020a3767c5000000b0069bed21e345mr8493441qkc.732.1649667477740;
        Mon, 11 Apr 2022 01:57:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id n10-20020a05622a040a00b002e315b9f08asm26257527qtx.35.2022.04.11.01.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 01:57:57 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ebf4b91212so58692877b3.8;
        Mon, 11 Apr 2022 01:57:57 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr24633663ywi.449.1649667477171; Mon, 11
 Apr 2022 01:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648546700.git.geert+renesas@glider.be> <3295013f27f1e4b8fbf3f79b950d65157ea95ef2.1648546700.git.geert+renesas@glider.be>
 <Yk6IqweUS/INEJiC@ninjato>
In-Reply-To: <Yk6IqweUS/INEJiC@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 10:57:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb3HJqE6EXtqoDOCzPohpmNrbGJ42OBZ0LrHkOFZq5og@mail.gmail.com>
Message-ID: <CAMuHMdWb3HJqE6EXtqoDOCzPohpmNrbGJ42OBZ0LrHkOFZq5og@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r8a77990: Add RPC clocks
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Wolfram,

On Thu, Apr 7, 2022 at 8:46 AM Wolfram Sang <wsa@kernel.org> wrote:
> On Tue, Mar 29, 2022 at 11:44:25AM +0200, Geert Uytterhoeven wrote:
> > Describe the various clocks used by the SPI Multi I/O Bus Controller
> > (RPC-IF) on the R-Car E3 SoC: RPCSRC internal clock, RPC{,D2} clocks
> > derived from it, and RPC-IF module clock.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

> One minor question, though:
>
> > +     DEF_FIXED_RPCSRC_E3(".rpcsrc", CLK_RPCSRC, CLK_PLL0, CLK_PLL1),
> > +
> >       DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
> >
> >       DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
> > @@ -107,6 +110,11 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
> >       DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
> >       DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
> >
> > +     DEF_BASE("rpc",         R8A77990_CLK_RPC, CLK_TYPE_GEN3_RPC,
> > +              CLK_RPCSRC),
> > +     DEF_BASE("rpcd2",       R8A77990_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
> > +              R8A77990_CLK_RPC),
> > +
>
> Any reason the RPC clocks are not grouped together? All other SoCs I

Yes :-)
The "rpc" and "rpcd2" clocks are not internal clocks, so they do not belong
under "/* Internal Core Clocks */", but under "/* Core Clock Outputs */"...

> checked have that.

... Hence soon I'll send out a patch to fix that...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
