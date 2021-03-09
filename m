Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EAFC433E6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 07:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1068F652B5
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 07:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhCIHXb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 02:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhCIHX1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 02:23:27 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8568BC06175F
        for <linux-clk@vger.kernel.org>; Mon,  8 Mar 2021 23:23:27 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id a9so12045993qkn.13
        for <linux-clk@vger.kernel.org>; Mon, 08 Mar 2021 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oqO7RxhDDe9vwKp/BB6AgPJShCvp9ZtWoA6Sh+EENcs=;
        b=Ud3PEmS7F/HL1ClBM5fvcc71dFxIGph/JiVvIxFtoAACgUhUdwd3d1JDpZAWyryI4/
         H00WQUh6kjUPafd2ThBYw9ZtS34nshFF5tWtZGNZ1EgBfQTdUN3XYkl7kzREpnyavn71
         TK+awh0xLrq0MfmLyTt1/Y13AGmNR3ZBJ15axGl3gd82rU/QKEwN/OMs+2mvmBscgDVy
         BZeZLu7f0meD98GsZFypmTNkG5/8iycndvsukzJpMwALx2+3+j4rat0gZlbufwYXVt82
         vFlOJutYcZmd4oW9S7VQwWQPDoXikWAturt0OVgGLzb5SQ+c5k0WpbbIHyWni6dbwUGq
         Kaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oqO7RxhDDe9vwKp/BB6AgPJShCvp9ZtWoA6Sh+EENcs=;
        b=nE54+gTJG2EHXdZrMWGw30w3V9vpsVeFpFctm7ks80fJ5lClLHewuKPnhUKZ29/TBq
         y2ZNKdgxpnoXERiSkjLR2izwviKumCWa1wm9DfB5sMx+N36kuCMsAwPGMldioFxNvgT/
         Hq4hzSiHNYv9Wj2NM1jEQpEiRgeilP3Dwr0MKZOdm1Sr9XeVvcE3jjaudABOZCexFs88
         jcNFiovBe8H9V560eHrn/iGbm4m5OD62fA6OvJDF3OpvFIl+IEosVbOIeZB8bl9ZsEwF
         OCqHF3ZyZE7uqA/anxc3ZowCW8031deZUauQRYsfLlgG4IHDqdXIZ6hxwrIjcwb1hS6a
         TnQg==
X-Gm-Message-State: AOAM533ikswPFhhrJh6IE84YBDX7YFpIKSPxRmf8IMG4j3mbisU6bavM
        H0x0wSt/O/qRGlyWbtAVYhh7OPVzpk3IIe3lVLw+lg==
X-Google-Smtp-Source: ABdhPJwtYPYtApR4EueplUtwNsjPnC8GSeKATOROKTHuWvVYiLX1g7t/b1oVki8yJ8MfrVSGPDDRQGIb0ZVn6cn5YHw=
X-Received: by 2002:a37:66cd:: with SMTP id a196mr16664749qkc.374.1615274606652;
 Mon, 08 Mar 2021 23:23:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614681831.git.greentime.hu@sifive.com> <e2bd7db9db3c196b9b0399f0655a56939a0f3d62.1614681831.git.greentime.hu@sifive.com>
 <81c45bf40b397b57343f159baae896528fa32d89.camel@pengutronix.de>
In-Reply-To: <81c45bf40b397b57343f159baae896528fa32d89.camel@pengutronix.de>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Tue, 9 Mar 2021 15:23:14 +0800
Message-ID: <CAHCEehK3P7jXq-v_xVm-0+BQsugG21VgjU0teyuUgANyR5ErKA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] clk: sifive: Use reset-simple in prci driver for
 PCIe driver
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com,
        Erik Danie <erik.danie@sifive.com>,
        Zong Li <zong.li@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        lorenzo.pieralisi@arm.com, alex.dewar90@gmail.com,
        khilman@baylibre.com, hayashi.kunihiko@socionext.com,
        vidyas@nvidia.com, jh80.chung@samsung.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Philipp Zabel <p.zabel@pengutronix.de> =E6=96=BC 2021=E5=B9=B43=E6=9C=884=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:58=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Tue, 2021-03-02 at 18:59 +0800, Greentime Hu wrote:
> > We use reset-simple in this patch so that pcie driver can use
> > devm_reset_control_get() to get this reset data structure and use
> > reset_control_deassert() to deassert pcie_power_up_rst_n.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  drivers/clk/sifive/Kconfig       |  2 ++
> >  drivers/clk/sifive/sifive-prci.c | 14 ++++++++++++++
> >  drivers/clk/sifive/sifive-prci.h |  4 ++++
> >  drivers/reset/Kconfig            |  3 ++-
> >  4 files changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> > index 1c14eb20c066..9132c3c4aa86 100644
> > --- a/drivers/clk/sifive/Kconfig
> > +++ b/drivers/clk/sifive/Kconfig
> > @@ -10,6 +10,8 @@ if CLK_SIFIVE
> >
> >  config CLK_SIFIVE_PRCI
> >       bool "PRCI driver for SiFive SoCs"
> > +     select RESET_CONTROLLER
> > +     select RESET_SIMPLE
> >       select CLK_ANALOGBITS_WRPLL_CLN28HPC
> >       help
> >         Supports the Power Reset Clock interface (PRCI) IP block found =
in
> > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifi=
ve-prci.c
> > index baf7313dac92..925affc6de55 100644
> > --- a/drivers/clk/sifive/sifive-prci.c
> > +++ b/drivers/clk/sifive/sifive-prci.c
> > @@ -583,7 +583,21 @@ static int sifive_prci_probe(struct platform_devic=
e *pdev)
> >       if (IS_ERR(pd->va))
> >               return PTR_ERR(pd->va);
> >
> > +     pd->reset.rcdev.owner =3D THIS_MODULE;
> > +     pd->reset.rcdev.nr_resets =3D PRCI_RST_NR;
> > +     pd->reset.rcdev.ops =3D &reset_simple_ops;
> > +     pd->reset.rcdev.of_node =3D pdev->dev.of_node;
> > +     pd->reset.active_low =3D true;
> > +     pd->reset.membase =3D pd->va + PRCI_DEVICESRESETREG_OFFSET;
> > +     spin_lock_init(&pd->reset.lock);
> > +
> > +     r =3D devm_reset_controller_register(&pdev->dev, &pd->reset.rcdev=
);
> > +     if (r) {
> > +             dev_err(dev, "could not register reset controller: %d\n",=
 r);
> > +             return r;
> > +     }
> >       r =3D __prci_register_clocks(dev, pd, desc);
> > +
>
> Accidental whitespace?
>
> Otherwise,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you, Philipp.
Yes, it is an accidental whitespace. I'll remove it in my next version patc=
h.
