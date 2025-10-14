Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52326B762
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424402; cv=none; b=KYH/ZVqm4bjTiPffTcn6DVKI2qLP9vw24KQD0nhH5tJdb2/dcIGPQQ/TRtcM9lvIRkVaPoI6AvLOzl3YNVVGxmwDhn5pgHXnRz9xGlaVz9iI4x0gJoZa1dMu3rxcg+S2cnyA2gKfse8fQBnauqad1CTh1nDlwL8Y7XkCwCqiUEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424402; c=relaxed/simple;
	bh=N2ks0n64tB+/FE5YWhzQDWYySPPBMlfvugbK4YvBEKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiNDrIqjn7taEJegsj7dxgdEszvRTI2LVfUaunlTqL85lQLNgSZMFYXJBYJyqcXeB6dA9hhByB6EGALev8DETUmL+x8/5Bh07b+Mw/ziuZjOxcCBOp0hbuyhwtCKdI2QKwDumGAjngPtT9jGfbpB+TCI9ODQtcv7hV47yxM/wuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e936be1359so3025861241.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 23:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424398; x=1761029198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSfE2Jj3hv2EA56oukoN3SzLUHfSpfGkpiKMB1tE1Ec=;
        b=P8AE7kxU1EfHddFdXQd8PNHybY1y3P4Lq47c40kgTpUihgFwEqONbdEsChS3iw12g2
         Am6tvy7VMB7JmubRU2zjdB57hSx+SP4qT+09WA0Yh0ZRwA6cRwXXV3lBLKbuIAbarAd+
         q82mLnsXACG7FHZWczJBqWldSQ/97AZMLArEAJ1UxERhEuIUeOnwBV2eJDQCJAlFz9Bf
         W5s9Vs7nhPDBKeXRNxO1YTqhBdIqyMdeRSiFI/C7SeZDFU5bJkihGOPygMuyxxgAH+Fm
         wMMxH4EZRURAOsCRbzziJNTk5v9OoiKM+jPb+flELV+jyIt7PirFT2QMVvpRZrVAgATc
         w9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JsZ80l47cuYBDaLLeHO57tpwnY2xL4kHniz9EGuK9acanA1O5Lvzf5a0jqa/zJVz0HN8t8XpFjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBDf1GyCAAewUdU1qLyskeijqNfmrJOOAO9Q0AVwZfYasRZ8D
	Ds+EqvQzoMc/0fE5KqXbE0DpyBADuSE0tZeE4pWPRgW6BsxBhSnwLS0nG7W5cSb9
X-Gm-Gg: ASbGncuz10ogHuetl4MlKgVr/ilYsWG95mObmKxWKbDq3/+PqN6Xq1epKtwhRdqO61e
	X+UENkeHRUHfMLlsV0CHqeW9ny5DY16pbiHSS+NQkgCygSeGijbvZj1uXDEjLJj1B6CxazuU5xx
	y0ZlvFUMY8d6EeD7P52KL48sSCMi9iHfBs9dPEHz8wHDInj7AM2YrisFROwyyri4HYHt3J+rajy
	t3rHAdPnDaBCtf3PrUEsB/2vGS4YHqdn1cvXyF1FYxtmCqTwHQmMJERQ5YaeTk5qJtDRvWgTYYN
	5GfuSAtz9xLDxQlyPgL3aEJK2SwQ4f2gULpbe0qbkNKOkf2cOfAOC7r+YIiyc7oe3+8I0/f80Cz
	is8d2N/xrjqAF4cBvzYqrNvkMMuzI5QiFVpARaARKwnBUHrKDaPQ/lYlaIVk/YNwcCQVE25hVhn
	c7HucWk1cSaeVl8A==
X-Google-Smtp-Source: AGHT+IFzmjzowdTy0/xPRAk6NU7pdluVCjU2t0EKpEdndoCF5aIHsBx7iaY4apM9aqAW6W3KK227Sg==
X-Received: by 2002:a05:6102:c50:b0:530:f657:c53 with SMTP id ada2fe7eead31-5d5e1ff1767mr9315753137.0.1760424398261;
        Mon, 13 Oct 2025 23:46:38 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf78d14csm3338868241.16.2025.10.13.23.46.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 23:46:38 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5c7fda918feso5360647137.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 23:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsafQj85wdwai6PA+EnGlVQAdZzR0pthcri3/tbqXDysLoSTI0vOhCwPihtIIOWCwIViajvQ0sOXQ=@vger.kernel.org
X-Received: by 2002:a05:6102:6c3:b0:5d5:f6ae:38f2 with SMTP id
 ada2fe7eead31-5d5f6ae3eddmr6835548137.41.1760424397767; Mon, 13 Oct 2025
 23:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com> <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com>
In-Reply-To: <CA+V-a8urG_e4yZXg9VH-cOPeK62qPGR1L2Zbbc3O97WB22hcRw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 08:46:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
X-Gm-Features: AS18NWCq45AWdwHRPSKHrYKOvzjULBWX8ax2oWaB6g9V2rbkYgBc5E0MPDXBfwk
Message-ID: <CAMuHMdWNnmmXPxPiuO4r66Mc78gPQ7ticuKt3y5pJ_DqRu_aLQ@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 13 Oct 2025 at 18:45, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Oct 13, 2025 at 4:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for module reset handling on the RZ/T2H SoC. Unlike earli=
er
> > > CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> > > Registers (MRCR) where both reset and deassert actions are done via
> > > read-modify-write (RMW) to the same register.
> > >
> > > Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and ass=
ign
> > > it to reset_regs. For this SoC, the number of resets is based on the
> > > number of MRCR registers rather than the number of module clocks. Als=
o
> > > add cpg_mrcr_reset_ops to implement reset, assert, and deassert using=
 RMW
> > > while holding the spinlock. This follows the RZ/T2H requirements, whe=
re
> > > processing after releasing a module reset must be secured by performi=
ng
> > > seven dummy reads of the same register, and where a module that is re=
set
> > > and released again must ensure the target bit in the Module Reset Con=
trol
> > > Register is set to 1.
> > >
> > > Update the reset controller registration to select cpg_mrcr_reset_ops=
 for
> > > RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v3->v4:
> > > - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for clarit=
y.
> > > - Updated the parameters in cpg_mrcr_set_reset_state().
> >
> > Thanks for the update!
> >
> > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_controll=
er_dev *rcdev,
> > >         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bi=
tmask);
> > >  }
> > >
> > > +static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcd=
ev,
> > > +                                   unsigned long id, bool set)
> > > +{
> > > +       struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> > > +       unsigned int reg =3D id / 32;
> > > +       unsigned int bit =3D id % 32;
> > > +       u32 bitmask =3D BIT(bit);
> > > +       void __iomem *reg_addr;
> > > +       unsigned long flags;
> > > +       unsigned int i;
> > > +       u32 val;
> > > +
> > > +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deassert"=
, reg, bit);
> > > +
> > > +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> > > +
> > > +       reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> > > +       /* Read current value and modify */
> > > +       val =3D readl(reg_addr);
> > > +       if (set)
> > > +               val |=3D bitmask;
> > > +       else
> > > +               val &=3D ~bitmask;
> > > +       writel(val, reg_addr);
> > > +
> > > +       /*
> > > +        * For secure processing after release from a module reset, d=
ummy read
> > > +        * the same register at least seven times.
> >
> > This comment is waiting to become out-of-sync with the actual value...
> >
> For the reset operation no, for this I would like to keep this as is.
> But for the MSTP registers I will be adding a delay. Or did I
> misunderstand something?

How to make sure both "#define RZT2H_RESET_REG_READ_COUNT 7" and
"seven" are updated together?

    /*
     * For secure processing after release from a module reset, one must
     * perform multiple dummy reads of the same register.
     */

>
> > > +        */
> > > +       for (i =3D 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++)
> > > +               readl(reg_addr);
> > > +
> > > +       /* Verify the operation */
> > > +       val =3D readl(reg_addr);
> > > +       if ((set && !(bitmask & val)) || (!set && (bitmask & val))) {
> >
> > Perhaps just "set =3D=3D !(bitmask & val)"? Or is that too obscure?
> >
> Ok, I will update it to the above in v5.

No need to resend yet, I could make these changes while applying
(when Philipp is happy).

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
