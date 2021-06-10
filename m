Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EF4C47094
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 12:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D20B61403
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 12:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhFJMeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 08:34:06 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:39543 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJMeF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 08:34:05 -0400
Received: by mail-vs1-f43.google.com with SMTP id 68so1757739vsu.6;
        Thu, 10 Jun 2021 05:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+I6PMDrwwUFeeqyDEHB3lJWQDbkfBlmBHWHv+TnD4hE=;
        b=MQvAyl4VB65/Cp6Ll2UPPejtDDaXpKqpluZMc1U0Z3Cc5V56e+7RzuWDOGdQV32/cg
         kUdnxuqHQu51D3ROIC12NcJL/X9hAbzm5g/Lk1yflat56M2bXumTaYgXH2WgZu937y7p
         6noOFfOR6EYUE8p7cvHeqCXTkoAaDH4lANZJTRmoT6g/LVwqyzCat8NWeG/+fC/oxEVC
         IPQthZFUVtxR6ePzhvBAyjSjH1y4g4eO+vpLz/mfnPm7auSiWsvfy0/25nT9Mcg8FFhx
         2B3s6EDa+/2feUWIzTDmdam/brsfRBi4+8q81G6oYOHFGgZQMkFFiqspIYL46DJ1rIsZ
         amDQ==
X-Gm-Message-State: AOAM531BiqCG57M5i4N4hnBjGYabhQBi/joUggZfxtmfyp5b3uCL2IU6
        RgQjkWpyP1CMuyxfDMgkHJvD9h4noZVRxhxWzcI=
X-Google-Smtp-Source: ABdhPJz2OmxSqu3WLgARdW0PGVUepO42xYbIQsxHyBeX3+3gfDbCRiyYozfWIa+7UtB3TcOfYToxyYgQ99r1JyCqW/4=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr3731904vsr.40.1623328327052;
 Thu, 10 Jun 2021 05:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210609153230.6967-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWcJGHxjQgHWPVsgvtsz=y0=y0QTocf879MvidrpEZDgQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWcJGHxjQgHWPVsgvtsz=y0=y0QTocf879MvidrpEZDgQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:31:56 +0200
Message-ID: <CAMuHMdWSjhv95vFFfg=+R6uw2u3g0Y6BTy0tipXx+kfqqttR_g@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 10, 2021 at 2:30 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Document the device tree bindings of the Renesas RZ/G2L SoC clock
> > driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.14.

renesas-clk-for-v5.14, of course

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
