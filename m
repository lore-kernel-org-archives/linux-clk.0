Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45C8C388F9
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 06:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36DC4206D4
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 06:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fGjMpbie"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEG4n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 01:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgKEG4m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 01:56:42 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B51C0613CF
        for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2020 22:56:41 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id c25so173341ooe.13
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2020 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EwC6aaL5scs/P7pPY4FBOZM78H0SX2GDzgejVIvtuSI=;
        b=fGjMpbieMBYGTP8eXkgUOsId8oCd1W0FvaKudufpR/oS4DI1DbaCiew8igvijFxBwS
         EHhoyWaghz1rNg9gKQCAQEMN3BvUTuPkhwCLnk+EQobkdb1tXrYj5a6rBuBQ9F39Dtu2
         VId+sax2ltEsuv9c8Q5RCbyHOAWv1FbLTXg3Y6Kxeguv4tq/CGHIJ5pl5IMERreUSAD6
         UM7T1zFhlnlo2IpL2n6yFmJuAaptDx4lxL3h/VKMT/l7r47IVPkX3DEsgSi/n94y6fle
         ImOYBhqXAjxHdO7nOj+r4aj8mZCPgD+HXicU4xsdbx3245xjMpmp6wc7bZmCqDJpgBra
         17xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwC6aaL5scs/P7pPY4FBOZM78H0SX2GDzgejVIvtuSI=;
        b=OMF55YfrlASn7fyVXjFkWv5IZXJLEtgnn7wVVPa2Xn5gRmjS0I2KJ4Us5rQQWEEn2I
         4S4aGEFq5a53cLPdKRM2pe9VT821MQ9p0WJsUAqJGeOnrg0tkOTrOIho+t2pmZugAZ3v
         yuUqD4qfCXtWjJ1s6d+p26ILdC19Z8RK74N6JuiMwDGPNemq7iSIyukH8v6ZuyS74bWH
         7h91MWfKkBMTyXVIo3eChCAte+9e9PxaCu+XkZtL7Mm6ksx3rADdJtfQfcmrfsns7rI/
         BhSEjjU/lpKQEbkqltuSAsWpH7Sn3TyFacPazbVJsGnoB13BUbhH4itFupvYnw1TWTZl
         6IYA==
X-Gm-Message-State: AOAM531jvxM1kYYPBZP1yx0L4BqFIuHTvnOhGQzhc65ojFVyFb6m9SNs
        hYMMQaTRZsQd2DvoQjPPuSAYcKevzMzHVNe8WCTpvQ==
X-Google-Smtp-Source: ABdhPJzG+mUg1IhLpXs4PxzIVuJht73184cn4t2P8RYlFePqEzl5jZbufSglQtuHFx1WT3FcXVbe7LhHZNe2AclMWNk=
X-Received: by 2002:a4a:96b0:: with SMTP id s45mr804814ooi.33.1604559400459;
 Wed, 04 Nov 2020 22:56:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com> <691e24d1c45a4b56b57ce1e02a04268c4253a77d.1602838910.git.zong.li@sifive.com>
 <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
In-Reply-To: <160454441626.3965362.17922436443029310228@swboyd.mtv.corp.google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 5 Nov 2020 14:56:27 +0800
Message-ID: <CANXhq0oNpVAwGYHwjFngdGtbLHGZ8tMvgdQ8Prsg2N9L9Qpf5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: sifive: Use common name for prci configuration
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 5, 2020 at 10:46 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2020-10-16 02:18:24)
> > Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> > patch is prepared for fu740 support.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
>
> Looks ok but needs an ack from riscv maintainers to go through clk
> tree. I was worried it would break defconfigs but it seems that the arch
> selects the config so this should be OK, right?

Yes, this config is selected by arch, the defconfig won't be impacted.

>
> >  arch/riscv/Kconfig.socs     | 2 +-
> >  drivers/clk/sifive/Kconfig  | 6 +++---
> >  drivers/clk/sifive/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 8a55f6156661..3284d5c291be 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -5,7 +5,7 @@ config SOC_SIFIVE
> >         select SERIAL_SIFIVE if TTY
> >         select SERIAL_SIFIVE_CONSOLE if TTY
> >         select CLK_SIFIVE
> > -       select CLK_SIFIVE_FU540_PRCI
> > +       select CLK_SIFIVE_PRCI
> >         select SIFIVE_PLIC
> >         help
> >           This enables support for SiFive SoC platform hardware.
