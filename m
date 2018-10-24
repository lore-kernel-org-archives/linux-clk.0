Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B1C004D3
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 09:31:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1510F2081B
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 09:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1510F2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbeJXR6W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Oct 2018 13:58:22 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40713 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbeJXR6W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Oct 2018 13:58:22 -0400
Received: by mail-vs1-f65.google.com with SMTP id y195so2719981vsc.7;
        Wed, 24 Oct 2018 02:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oaecH8aH/FtLN0cWacPML5VSFinpgbYV/GIEkFt3xkw=;
        b=apU7KrWQ2zXjSUHggSwenQmBqn0pkhfjgYU4bA+5bI/YJxchNjAp0yRVw4uR3mwYKz
         YnMCBdZ+Maz0BRMDKaODNbQLbexpRAJybfxegyvqylGAKLzLJPiQwlWU8+7QN1x/7qhB
         26+/RDJew9Sg1cQc/Rj3UUH1v3zAAoH3vaaHhtO00U1x5KJCprWe2aGdkwEmxChxtzrY
         biJHR3aEYSN/vuegdRK9M0hmDM285Xft2XBgPEZfTHNK1/0t+ncfyyjHsnx6O3zjBF+X
         rPyXvaeEHcDQRLjGmX7zpZ87lm83nLMrgwK1I6Y17PWBdr/Wxd9AvbpnyrhTd1WhFpcA
         RYrA==
X-Gm-Message-State: AGRZ1gLFu0o/a96qzuGFzfZdiw7vxzV0suskgSyMmlRQH2yyHFt7A1Ah
        u0zB6duqlvMH1+RB2mY0rehmqqhpisKefO4JZWM=
X-Google-Smtp-Source: AJdET5eGcWWgJMjhdB2E8uwLgEcPmA9WDnYj+mFLcooQHcwaxK0CjYRrP0E16FfhvT8M5UnCdiMPcQSa5Uo9N2h0uIA=
X-Received: by 2002:a67:e015:: with SMTP id c21mr713231vsl.63.1540373460363;
 Wed, 24 Oct 2018 02:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181012122924.5543-1-chris.brandt@renesas.com> <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
In-Reply-To: <CAPDyKFqNeHC7VqXsRSZegb7PGLnKBv4F4L2Rx4UtGuO7_bv-JA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Oct 2018 11:30:48 +0200
Message-ID: <CAMuHMdW5ep14ocQQLSRCk89yV-ut29YEr_59+pYvCMb7h-D=Tw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mmc: tmio_mmc: Add support for RZ/A2
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ulf,

On Tue, Oct 23, 2018 at 5:02 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On 12 October 2018 at 14:29, Chris Brandt <chris.brandt@renesas.com> wrote:
> > Basically the same HW block that was used in R-Car Gen 3 is used in
> > RZ/A2 (with only a couple small differences).
> >
> > Not sure if you're going to like the Kconfig change or not.
> >
> > Chris Brandt (3):
> >   clk: renesas: r7s9210: Add SDHI clocks
> >   mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
> >   dt-bindings: mmc: tmio_mmc: Document Renesas R7S9210
> >
> >  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  3 ++-
> >  drivers/clk/renesas/r7s9210-cpg-mssr.c             |  5 ++++
> >  drivers/mmc/host/Kconfig                           |  5 ++--
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c      | 28 ++++++++++++++++++++--
> >  4 files changed, 36 insertions(+), 5 deletions(-)
> >
> > --
> > 2.16.1
>
> This looks good to me. So unless someone objects I intend to queue
> this up for 4.21, once 4.20 rc1 is out. Or perhaps the clock patch
> should go via the clock tree?

Correct. Please do not take the clock patch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
