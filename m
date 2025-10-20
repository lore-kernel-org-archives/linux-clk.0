Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDED2EAB60
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948017; cv=none; b=uVe+bkp3/nCIcaecxylWbDnYx8rNJXNjpPpvKch/og8kvxpc/Q8G1FkBzGftINGsj+G+hAphPQlqte+WTPOOO9zP11/Mi0mhQDj5svHF7FuJeZ/zlnlge7dnFwnaVWfuW6F0w2eB8Gyu6NWddzQElyW+7TxM9YtmsvORXqEtApw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948017; c=relaxed/simple;
	bh=pBOe2oj4HPen9NXEf4tPmq1Jfw0IEwwy/FGaDyb3WRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8l3VIni7GTupUiEOrXAnbrfToDCgoSgZjAVe3PquT2lFdEnc2hX5dt3rzcTs7pWUb0ZBVmMhkfaDsLanDr6nOvXAv8Ehr9jKtMYOyPDvzYi4/20VnOJfP5kJYXOxTr7opeCP2DOEmHMhELinZ7K0KErRc1fcBj1LzD+wCl2V2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so2991470e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 01:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948014; x=1761552814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO2kQ54ctZ1GJPCFblCj0sw6xchdhfUc4nyLHbZc/QQ=;
        b=NdZHq3p6sNBcsJ2TWEU+0aiw6xothPu5BaLG5YZXLB/McxcODP6SDQo6TrfgajoxCY
         rWMyR6aM0JXVbsXL8UP0jiaIJNCVM02jwW+X7NUcm/2G2f/qtIf7UPjUO3g6Faok7emk
         mb1ReJ8NbP9hQbZM7bZV+xgfFLO52Qck3vXOWbLYK7+RIEQaThAXb2RvzmUTaMFgcw47
         rrZVybQFj3auJKoYeq2kjgMMDvoEhSbqdFo593hO8khECYqMKr1wNMXW2TkulZJ6BPIT
         8PAo36Ga4H3jJZEc4fpV3z4nimZ+IWfZNnKB3Oqymrnr/RvUKNROMP5qCvimPdmz6hm7
         2VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUEwpH8odcICz0Ny+q2MYrmf6vG4VIlG89zaIifdTRo78kqMfBUrJcaPU+5Eucvhhjl1PBSUhYErY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SnJ2/C9Ziin40wkrJKw6UbENAFc7qDe66lxsJyn1vUJlNN+M
	F3jhjAuH9+F/MqeXh+ilBu+zklhtf7Y3IItEvvPgtQrbp7IYSy3DRiWZqTJ8Udq8
X-Gm-Gg: ASbGncsDkXD/JJX5ZkvatksCkWSKKxYPpM9Rjj0V0SOjNSgxc0nSsWspFFltsGz+xx9
	cZc1XTcXaZSO9E4PEf78z49fzZtQ/n46rWvYpzYLtSc7mH3oTFbmVN9p1uX6rfZkaZGW3/gZExT
	HdVbpnvMy7IIsMG4GNZZsCG3u5W9dmIvcvduNQENHChmnFPVCa4mbd8GO2U/VXbAr3p4aNBktsc
	vcnSzHFGIN10f/cRBklejdRUyEDNkrBS7CJeTPZK/0m2UTlUC2CGtWgb2zlFbY4bsD7vSVD5G8I
	/5gV26240pdfj0xXyLXWqDyRq5ZBSCANrXFfJ9FvwmPMuHJx8KtSx8bQHiW3PQeHZ8FiD/Tsewj
	HTUgaeTbjFoHa1O09csdMfaPDhVxYfQVHbWnjjqrNpr0AAAXDKsrA169/aDJ0sM8/Qum2KNy03O
	3e+rA+K6j77vykSxaWtpOC5c5vW3twLrezGDN/4r2JLkFHLpkC
X-Google-Smtp-Source: AGHT+IEoCAFVFGaH83KPyQq78WS6+cYae82CrFUyPx9NyKz3sQJn68CQS2lbMphIH1EAL5vkhVnhsQ==
X-Received: by 2002:a05:6122:1e14:b0:539:44bc:7904 with SMTP id 71dfb90a1353d-5564ee57420mr3597148e0c.5.1760948014257;
        Mon, 20 Oct 2025 01:13:34 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f6f10bsm2103945e0c.5.2025.10.20.01.13.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 01:13:31 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d967b67003so2312221137.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 01:13:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXU/tH7TOKlK0RqlrnIm74DUgIxMEpFiOulYsgcZqzthAEM6v+4SXHpa+5nzTMGRIRIeDg087YrTdA=@vger.kernel.org
X-Received: by 2002:a05:6102:1456:20b0:5d7:e0ea:8d25 with SMTP id
 ada2fe7eead31-5d7e0ea9044mr2796129137.38.1760948010271; Mon, 20 Oct 2025
 01:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
 <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com>
 <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com> <86cdb51d3eb7414cb1665836175e3ea32ed687dd.camel@pengutronix.de>
In-Reply-To: <86cdb51d3eb7414cb1665836175e3ea32ed687dd.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 10:13:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuPoCun=cj1TEY1B6nm4mgvphXDSvRtcWSMpZZxOa95g@mail.gmail.com>
X-Gm-Features: AS18NWAVc6svVYRmDE_ImJ0vS-dMbd7rwpy0E67grCEhNIDyCvbpxgqEnUMj_K4
Message-ID: <CAMuHMdWuPoCun=cj1TEY1B6nm4mgvphXDSvRtcWSMpZZxOa95g@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Tue, 14 Oct 2025 at 18:37, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Di, 2025-10-14 at 08:46 +0200, Geert Uytterhoeven wrote:
> > On Mon, 13 Oct 2025 at 18:45, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Oct 13, 2025 at 4:46=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add support for module reset handling on the RZ/T2H SoC. Unlike e=
arlier
> > > > > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Cont=
rol
> > > > > Registers (MRCR) where both reset and deassert actions are done v=
ia
> > > > > read-modify-write (RMW) to the same register.
> > > > >
> > > > > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and=
 assign
> > > > > it to reset_regs. For this SoC, the number of resets is based on =
the
> > > > > number of MRCR registers rather than the number of module clocks.=
 Also
> > > > > add cpg_mrcr_reset_ops to implement reset, assert, and deassert u=
sing RMW
> > > > > while holding the spinlock. This follows the RZ/T2H requirements,=
 where
> > > > > processing after releasing a module reset must be secured by perf=
orming
> > > > > seven dummy reads of the same register, and where a module that i=
s reset
> > > > > and released again must ensure the target bit in the Module Reset=
 Control
> > > > > Register is set to 1.
> > > > >
> > > > > Update the reset controller registration to select cpg_mrcr_reset=
_ops for
> > > > > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other S=
oCs.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > > v3->v4:
> > > > > - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for cl=
arity.
> > > > > - Updated the parameters in cpg_mrcr_set_reset_state().
> > > >
> > > > Thanks for the update!
> > > >
> > > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_cont=
roller_dev *rcdev,
> > > > >         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) =
& bitmask);
> > > > >  }
> > > > >
> > > > > +static int cpg_mrcr_set_reset_state(struct reset_controller_dev =
*rcdev,
> > > > > +                                   unsigned long id, bool set)
> > > > > +{
> > > > > +       struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > > > > +       unsigned int reg =3D id / 32;
> > > > > +       unsigned int bit =3D id % 32;
> > > > > +       u32 bitmask =3D BIT(bit);
> > > > > +       void __iomem *reg_addr;
> > > > > +       unsigned long flags;
> > > > > +       unsigned int i;
> > > > > +       u32 val;
> > > > > +
> > > > > +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deass=
ert", reg, bit);
> > > > > +
> > > > > +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > > > > +
> > > > > +       reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > > > > +       /* Read current value and modify */
> > > > > +       val =3D readl(reg_addr);
> > > > > +       if (set)
> > > > > +               val |=3D bitmask;
> > > > > +       else
> > > > > +               val &=3D ~bitmask;
> > > > > +       writel(val, reg_addr);
> > > > > +
> > > > > +       /*
> > > > > +        * For secure processing after release from a module rese=
t, dummy read
> > > > > +        * the same register at least seven times.
> > > >
> > > > This comment is waiting to become out-of-sync with the actual value=
...
> > > >
> > > For the reset operation no, for this I would like to keep this as is.
> > > But for the MSTP registers I will be adding a delay. Or did I
> > > misunderstand something?
> >
> > How to make sure both "#define RZT2H_RESET_REG_READ_COUNT 7" and
> > "seven" are updated together?
> >
> >     /*
> >      * For secure processing after release from a module reset, one mus=
t
> >      * perform multiple dummy reads of the same register.
> >      */
> >
> > >
> > > > > +        */
> > > > > +       for (i =3D 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++=
)
> > > > > +               readl(reg_addr);
> > > > > +
> > > > > +       /* Verify the operation */
> > > > > +       val =3D readl(reg_addr);
> > > > > +       if ((set && !(bitmask & val)) || (!set && (bitmask & val)=
)) {
> > > >
> > > > Perhaps just "set =3D=3D !(bitmask & val)"? Or is that too obscure?
> > > >
> > > Ok, I will update it to the above in v5.
> >
> > No need to resend yet, I could make these changes while applying
> > (when Philipp is happy).
>
> Consider me happy and feel free to add
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> , set =3D=3D !(bitmask & val) and all.

Thanks, will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
