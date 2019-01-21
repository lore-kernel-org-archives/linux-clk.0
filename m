Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF70C2F3BE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25C7F20861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730062AbfAUOIV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:08:21 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35580 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbfAUOIU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:08:20 -0500
Received: by mail-vs1-f66.google.com with SMTP id e7so12676363vsc.2;
        Mon, 21 Jan 2019 06:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eyn44RtDijPIsNO3I5jxxMbYj0lvNQkEtVnjpT5EJas=;
        b=r5VE3chVeYtuFvTWdzkAWz9Dsz2McKJ3iD4hfgGuuL7e54+COQ5p6D8HBVLtHX/N6S
         ThaVJvcb+wa8/Cn8LFExHI3z7TQyFBh5HADYyg5RAKBSliAja0AeyI1NzJyW2bwH95j+
         GLYElhQb85TNDfE6Xvvm22mxJT2FuBlcuip9iIsOgNKH3rCL3t3tJHrofNtYPkxKXEus
         yR1QaGzN4TZx2Dm/pMfNQZMdE/Ew4QXbPVFFzt0cIGlOcaa6iLzT1GwS9cMFtkIwgphB
         34HhdzA2fJR7tSh1lKRS055tYGzF5q+WVzuATkt0f086zOoBnMToTw4Tgyr15yumkgXk
         2szg==
X-Gm-Message-State: AJcUukeD8n6eVzSuUz+NPaa/nNuQpvXNBYvIgOrXRVun7dmPRu0jEURq
        W1JqQwd2I/d6JghSQCke1qq+KYZ2arlXNhiYx/mD4w==
X-Google-Smtp-Source: ALg8bN4TkydR7PEsLG3UNfHJOfa2LLSNFhxiLxqG4IJ5Nr7ncxAWRR5VfNqf1KptJoeMUjZ+t4IePz6nT8S1AlAZ4iw=
X-Received: by 2002:a67:3885:: with SMTP id n5mr10701506vsi.96.1548079699282;
 Mon, 21 Jan 2019 06:08:19 -0800 (PST)
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
 <5aa01cae-28ff-efb5-bf4d-1994760ecb79@cogentembedded.com> <CAMuHMdX4cDC1ML8Wp8oT45YkjHux+uk5NMYX2BAvs=nNgm_oAw@mail.gmail.com>
 <64072661-0f85-9354-7792-fca7214cb450@cogentembedded.com>
In-Reply-To: <64072661-0f85-9354-7792-fca7214cb450@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 15:08:06 +0100
Message-ID: <CAMuHMdVSQUETbo5EcY5ub2KYSXYQkwf83h3N9u1jbOwimsZbFA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
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

On Tue, Nov 27, 2018 at 4:39 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 11/23/2018 03:55 PM, Geert Uytterhoeven wrote:
> >> Add the RPC clock for the R-Car gen3 SoCs -- this clock is controlled by
> >> the RPCCKCR register on all the R-Car gen3 SoCs except V3M (R8A77970).
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> > Thanks for your patch!
> >
> >> --- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.c
> >> +++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.c

> >> +       init.parent_names = &parent_name;
> >> +       init.num_parents = 1;
> >> +
> >> +       clock->reg = base + CPG_RPCCKCR;
> >> +       clock->hw.init = &init;
> >> +
> >> +       clk = clk_register(NULL, &clock->hw);
> >> +       if (IS_ERR(clk))
> >> +               kfree(clock);
> >> +
> >
> > For save/restore during system suspend/resume:
> >
> >     cpg_simple_notifier_register(notifiers, &clock->csn);
>
>    Done.
>
> > Hmm, looks like I missed that during review of commit 381081ffc2948e1e
> > ("clk: renesas: r8a77970: Add SD0H/SD0 clocks for SDHI"), too.
>
>    Want me to fix this?

Yes please. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
