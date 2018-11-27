Return-Path: <SRS0=WhJS=OG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4070AC43441
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 17:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B826205C9
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 17:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B826205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731845AbeK1EuU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Nov 2018 23:50:20 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42013 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbeK1EuU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Nov 2018 23:50:20 -0500
Received: by mail-ua1-f66.google.com with SMTP id d21so7905206uap.9;
        Tue, 27 Nov 2018 09:51:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WIkgvh9dn6Z1lrl7t09lDYPO3Sr9pulPAhCeVLGGrs8=;
        b=KQBfYlKnJlCwHsWeh/LO8tVtKjGrd2HEaQjMcUaiNOpS7GoMUojBKJF0bwZikESWz7
         ypu5srd4ixCX3sDTSmVnLpPrAHdHq5Pwbqawe5tggx8KTtS0POkmdDhBVzQLHf34kUc9
         K+cOsnF9RZTOorv6oCAjj38celzVbTMKsKlWgiZhRrwAlORE1UTHpOVRhOOefCNVq4Tu
         NqYjxWKab5DfbwqEcyM8twX4spWQPN4GxdQ0aOMk6Zmr89vGGi8BwYzvqajACj2KRhsa
         JJe3ZirX4xO6xDqctR655v6h1raM1CFDLqL/rsnjJmiwdrPcx0zAXWfiqqFM3E2rP/MK
         uTug==
X-Gm-Message-State: AA+aEWZpjd3ZKGXvlMOiedfLEQzs7Y3pthCsmOlyL/SLJbhw2ZjFGC8B
        rtsuXmOKgL0eB6aaZgKY8jz7lRNELXEx9/iBBnO4NA==
X-Google-Smtp-Source: AFSGD/UH5G1OpGal2hxhY8B8Slw98oUklW4opqFxAG1g5kgduyZYwf25Kza7Iwz64fcNOKQ/Qcr97xYgJku82twiuzw=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr12818003uad.78.1543341098515;
 Tue, 27 Nov 2018 09:51:38 -0800 (PST)
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <0e51165d-65cb-1522-3174-b63818180070@cogentembedded.com> <CAMuHMdX6n860T9oOgYiqxiF0QpNyKqEtQW9yEksAv_A02Z9qRw@mail.gmail.com>
 <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
In-Reply-To: <5cb1471a-db86-e074-6585-10d625738d5a@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Nov 2018 18:51:24 +0100
Message-ID: <CAMuHMdXfsXgOFxbfdbqmMNOfZS2mYYOEyBKhFbV29VmCVkEn0A@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sergei,

On Tue, Nov 27, 2018 at 6:45 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/23/2018 03:59 PM, Geert Uytterhoeven wrote:
> >> Add the RPCSRC internal clock on R-Car V3H (R8A77980) -- it's controlled
> >> by the RPCCKCR.DIV[4:3] on all the R-Car gen3 SoCs except V3M (R8A77970)
> >> but the encoding of this field is different between SoCs.

> >> --- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
> >> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
> [...]
> >> +               const struct clk *parent = clks[core->parent];
> >> +
> >> +               if (IS_ERR(parent))
> >> +                       return ERR_CAST(parent);
> >> +
> >> +               return clk_register_divider_table(NULL, core->name,
> >> +                                                 __clk_get_name(parent), 0,
> >> +                                                 base + CPG_RPCCKCR, 3, 2, 0,
> >> +                                                 cpg_rpcsrc_div_table, NULL);
> >
> > Don't you need a spinlock (last parameter, currently NULL)?
> > This needs to be synchronized with controlling the RPCD2 and RPC clocks,
> > as they operate on the same register.
>
>    Indeed. How about the RMW accesses to the other register? I'd like to place
> the lock/unlock right in cpg_reg_modify()...

Yes, RMW, too.

> > However, that would deadlock, as enabling e.g. RPC-IF will enable
> > all parent clocks?
>
>   Could toy please elaborate?

Sorry, I incorrectly assumed it would hold the lock while calling into the
parent, which would deadlock if using the same lock.
But as it only holds the lock for register access, it's fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
