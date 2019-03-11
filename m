Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B642C10F0C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 09:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FFDF20857
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 09:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfCKJbI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:31:08 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37092 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfCKJbH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 05:31:07 -0400
Received: by mail-ua1-f66.google.com with SMTP id x1so1279530uaj.4;
        Mon, 11 Mar 2019 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQG4ls2I/7Yv2nhxsvdQkjXQ28zIa3R4IqAUucuPVWE=;
        b=tRWRZ0cElLD5DDtDplaDTeWNOuFTuFH5SiMg/BQ62Ek1lGI7yTkz2uILMDih6K1lZk
         AmzrTz+MQtwmtblRqtNDL7lW5hSeJXT4akZIB65vj2vDuu8ArRVdjBu2ovdEZdgfLCgu
         UzYMAtBTD201wmUiiKfelvd4qDwtjfNZVEwUklO4aGiyMqTpa3FScOgw12mPW060miFS
         7c8mFte+DQUwaxGB4h6tyeMJPqc4TRDjVPQmCsVDe9Yfj9+lhKeIq8xuUoqgqJT6ww9l
         giiGO799L0OpGwnuO9t8R9J8WsyXbQMkp4OQFZr/RIcbt3PNcObXtb8msphdIQXX2dXH
         gSaQ==
X-Gm-Message-State: APjAAAWIh2ETX3/jL0U8e0e+xdfVaiNAr5wrTG0zag/oLNB0ojlE4ka/
        DdkvG9LjFrRGSghrWMIR6u0MHQgsB3+KCMiknZQ=
X-Google-Smtp-Source: APXvYqy7iFNYKC+S5SfjzqSGAJByiIC1pCx1y+AGClAQolJBP/P2gkCPgX6xEK59QvuR6SBQnTT8TpqSEPpQMdxwbC4=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr16098588uao.20.1552296666673;
 Mon, 11 Mar 2019 02:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com> <ebc41558-2a0a-bf6d-05df-077e3c769344@cogentembedded.com>
In-Reply-To: <ebc41558-2a0a-bf6d-05df-077e3c769344@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:30:55 +0100
Message-ID: <CAMuHMdWxkM2YbLqyz3BemcVJphWYSZi4ejuLiG+fpfDdnuU4Uw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77980-cpg-mssr: fix RPC-IF module
 clock's parent
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sergei,

Thanks for your patch!

On Thu, Mar 7, 2019 at 8:53 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Testing has shown that the RPC-IF module clock's parent is the RPCD2 clock,
> not the RPC one -- the RPC-IF register reads stall otherwise...

Perhaps... Or something else is wrong with how the RPC driver uses the
clock hierarchy.
According to the docs, RPC clocks RPC-PHY, and RPCD2 clocks RPC-LINK.
Currently nothing references RPCD2, so it is disabled automatically.
If you make RPC -> RPCD2 -> RPC-IF, enabling RPC-IF indeed enables
both RPC and RPCD2.

Perhaps the RPC device node does need a reference to RPCD2?

Is this also the case on R-Car V3M, where RPCD2 is not controlled by the
CPG, but by the DIVREG register in the RPC-IF module itself?

See also section 62.4.7 (Frequency change), which does not have a
subsection for V3H, but it may be impacted (changing RPCD2 causes
an additional read of RPCCKR, satisfying the read-after-write requirement
documented there).

> Fixes: 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
> @@ -171,7 +171,7 @@ static const struct mssr_mod_clk r8a7798
>         DEF_MOD("gpio1",                 911,   R8A77980_CLK_CP),
>         DEF_MOD("gpio0",                 912,   R8A77980_CLK_CP),
>         DEF_MOD("can-fd",                914,   R8A77980_CLK_S3D2),
> -       DEF_MOD("rpc-if",                917,   R8A77980_CLK_RPC),
> +       DEF_MOD("rpc-if",                917,   R8A77980_CLK_RPCD2),
>         DEF_MOD("i2c4",                  927,   R8A77980_CLK_S0D6),
>         DEF_MOD("i2c3",                  928,   R8A77980_CLK_S0D6),
>         DEF_MOD("i2c2",                  929,   R8A77980_CLK_S3D2),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
