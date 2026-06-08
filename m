Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95E3E5588
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947104; cv=pass; b=GjRc017+rjzZNUNz0UtvoBQz1Rpa0e6a9GgjP4hgKmMZrUSzpR9DMk1uzlnm4WKsfUhtvR2rllrMNQB6L+kZZCWGCWUpn69iT04het3xubzIbuIhmKMOevvVRZo9IOCU1DcyWVb/Kly+qkfQL1X5H4+rwxqPrgTB083FX2awW38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947104; c=relaxed/simple;
	bh=QHbHk0ExXgTj9Qdazczm090dMKoR2Z8xMtI7oSBa7UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXoLFEjvomdyM3zSIfKwNggUDpJzNlDx05B9ffj3egruImFgJ15nZpqdCNJPyHBYO50hlLWMiaxKG+hT2c/WOv/BmCw5Elx7/F1mpMb7Tfr2tX8jx7KQgZ4WyEWFMdoJsIhmQp112eQrPIQYBLV4wCx+DNQvpZKXoiO6pXBnlC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrscCery; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrscCery"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490be03d47bso40257705e9.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 12:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780947101; cv=none;
        d=google.com; s=arc-20240605;
        b=Jpu5vQwJ9abH0ScC3eMmvDK6RPHhITDTtUv9gDpkKJ0iLxqKSSY+SQe2BRydgUlQfg
         cX+DrrmcR5+qtl56hVeQWqEzbcK6JU8mCR56kjKlZ3w8Y8UY78bYCdhK6vNFtdcWqV1g
         MFR+uCT6yE8VDrRQomRjBEUXegMdtGqQ4PKeEtMqoSXzx7DVd4Sa/BPWVBH7fcus2Sha
         lVGKOWJ5eXrynlfInX6hT1MmHERVrBiWVkrmYFzWXawDDnW/t2dS+zFcC3AHFD4RCfWF
         JZTBaHksfepgx25hSoDcksSoxHtmosBcyt9Jf9QscxhTa6d6wxtvTGF9qYX8WKDv4aQn
         iA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        fh=O10Rfv+ke9XWZPQaT+1j0nNd/QxzewdRwMqYpzhymjs=;
        b=d3KhrrI0y7yLZt8l1XoBuJgS8A7SI7ggPGOw0eR0wt3hBbCAI+5Q58D3YmIoUAocvx
         5Z6MQ1bLcGJ/RB6WztKc5JW+eeaNBFEwQX18vSg9nmWytCo1Yg5OdqGveB4CocbaOk0q
         FyZ029vh+8psHg7SYc7lW5LEcA/HouRnjkoOnIWCdjeL7iqL9mg0bHqKrr0uOLS+VT/S
         2aJq58vUh7tWZ8A3ag2U6XA01QBfOuSuECkoimd73E2pBSChDvr/L34o+gmAAnMHeVqi
         Lb+ykqYmCqRybgB5MwvWvId7OnuK3bAetrVB9hhgq9RQcBekh0TBxwsOBmWcRQ1ZVgi+
         7XWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780947101; x=1781551901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        b=TrscCery0NjUdza7NsRWyHqS2EjsD98z1d5RykFY5DumcDSfLzVkm62ZSXCpoMmCMZ
         tUYgUlc51fZMylt9o6Cau0x3UX7UsE8vHTzpFChxtkuwlcjpJRblhISfwkMKUHVjJuY4
         a1TOxnIeX2nkW2B4+YY2GZDyaTK6sebtogAX3AcrG+EpCyVbcS5VfVpK7wS3GG/86pkJ
         gYiZYr8h1s8jzrF4RHL13ONgjXat9Hr/IzDMMLR1SkUz5cYMa73PwIEmJqlz1r+E1zgI
         CjuUer5f8gAM4RYBp7OVxG7jPzZcQh94JK6H88oXOTDd29TCL4q4II2L4zRhPcKGFJF7
         eIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780947101; x=1781551901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        b=T9GpSfQAyWMN3X5OM/RKeMO1nFKKCzR0VP5xRcxMh2ijsSziXkr5CtdQn5vxuuZsWB
         PCVGGbMU8+08fBnQHH/ENuTQVUh5xoiXXPo/UhgoDWLWJ9hd0jK1dms45kT4ExPhwI5M
         z54+UxGcmo+Vm1FHGZfNqWU6KQRhFVNKMn8p3PaZek/Gbg01O4vEb4p/B/BKdted9L0h
         jywJSv0HE1IN7D0WMVi1KoQzj7FQ4wbkRR5VWjaWoojz8VYM0RbrCJpI9jBlqtLk/H3W
         Kx3MCl6mcf/s13S255p6Macgf8zNTCEDoPwgv3GKOsR0NFymyMsn4z00w6uROfkt46Qe
         1Hgw==
X-Forwarded-Encrypted: i=1; AFNElJ8HcF3yChjqH9TFvrufheI5bS1XVWh9lctRZfU6wYwUHSrslhBnqCqzcMW+wlT2K3/2PZd6/ejlgXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7N5HOaPIig0Xaqw574L4t+9gaC4rE33cvUfE1VeWcO4KWbEFr
	NDqLgKcVgW4PavjOdzz3hAq4X+fIFnTD8o61iyMg3/B9oEJc7YmW04IXxPw0+Og/TQF5xoPKl69
	VpmSIYY3bboZ+giRdAr+hBB19DKhT8M8=
X-Gm-Gg: Acq92OErSIjG5KalJ59xn5AtWGT1dFqMNrG80lw1afQ09m0R1PYDnRjTqtzntKpE/06
	c3eMK8m9Gj9dZNQPbuR/lYjXr1wwj4PGL8mGG3puvmGdbfFNaFqQmXBP96JqPdkPDvkN//OGN5f
	2GqLMKKfvooubbvTmnJ+xcK6JPIEtNCBjIr4vvcJIVQy4RIMsnJELGJf7HPmxl2PbTmLNTF8XK0
	y1jE8M4OPsc77HtM/OMRcrc14mYhUwihJsMg9Zvgq9WlxgKbisug2e88GMomfEpwtbNrhTufysX
	+kZpoM1pgEvX6PqkvuHWjYV0ykeVJ663OPGHGX4pYrsr4OnH39R8C6OExDAiNUmdRl740F/aGMY
	2Fv0=
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id
 5b1f17b1804b1-490c25e1104mr294910145e9.19.1780947100632; Mon, 08 Jun 2026
 12:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
In-Reply-To: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 8 Jun 2026 20:31:13 +0100
X-Gm-Features: AVVi8CcT1M1fPmxvE4ryOUIEys8Vk0daHnh_JjKaDGls1nWor-Gf0r8rG_5vSY8
Message-ID: <CA+V-a8vL_fKw4WE80_=ZcTxx8vzzx77Ov+8r_OCe+zz7S-2eug@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP
 dummy-read delay for LCDC on RZ/T2H
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2026 at 2:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Per the RZ/T2H hardware manual, to secure processing after release from
> > the module-stop state, dummy read the same MSTPCRm register at least
> > seven times for most IP blocks, at least 100 times for LCDC and at
> > least 300 times for RTC before proceeding with subsequent processing.
> >
> > The existing udelay(10) satisfies the seven dummy-read requirement for
> > most IP blocks. Extend this to support per-IP dummy-read requirements
> > by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
> > each entry records the MSTPCRm register index, bit position and the
> > minimum dummy-read count from the hardware manual, converted to
> > microseconds via RZT2H_MSTP_READS_TO_US().
> >
> > Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
> > udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
> > bit are known so the lookup matches on both fields. In
> > cpg_mssr_resume_noirq() the register is known but not the individual
> > bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
> > register alone and return the delay for the first matching entry.
> >
> > Add an entry for LCDC which requires at least 100 dummy reads. Adding
> > support for further IP blocks with non-default requirements only needs
> > a new entry in rzt2h_mstp_delay_table with no logic changes needed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] =3D {
> >  #define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIF=
T)
> >  #define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK=
)
> >
> > +/* Dummy read counts as specified by the RZ/T2H hardware manual */
> > +#define RZT2H_MSTP_DEFAULT_DUMMY_READS 7
> > +#define RZT2H_MSTP_LCDC_DUMMY_READS    100
> > +
> > +/*
> > + * Time per dummy read in nanoseconds, derived from the original udela=
y(10)
> > + * which was used to satisfy the 7 dummy-read requirement:
> > + * 10000 ns / 7 reads =3D 1429 ns per read.
> > + */
> > +#define RZT2H_MSTP_DUMMY_READ_NS       1429
> > +#define RZT2H_MSTP_READS_TO_US(n)      (((n) * RZT2H_MSTP_DUMMY_READ_N=
S) / 1000)
>
> IMHO this is overly complicated and hard to follow...
>
> > +#define RZT2H_MSTP_DEFAULT_DELAY_US    RZT2H_MSTP_READS_TO_US(RZT2H_MS=
TP_DEFAULT_DUMMY_READS)
>
> i.e. this is just 10 again?
>
Yep.

> > +
> > +#define RZT2H_MSTPCRM_INDEX            12
> > +#define RZT2H_MSTPCRM04_LCDC           4
>
> Everywhere else (DEF_MOD(), DTS) we refer to module clocks using the
> sparse base-10 combined number, i.e. "1204", so I think it would be
> better to do the same here.
>
> > +
> > +#define RZT2H_MSTP_ANY_BIT             U32_MAX
> > +
> >  static const u16 mstpcr_for_rzt2h[] =3D {
> >         RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
> >         RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
> > @@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] =3D {
> >         RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
> >  };
> >
> > +/**
> > + * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/=
T2H
> > + *
> > + * @reg: Index into control_regs[]. Exact match.
> > + * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level m=
atch.
> > + * @delay_us: Computed delay in microseconds to satisfy the dummy read=
 requirement.
> > + */
> > +struct rzt2h_mstp_delay_entry {
> > +       u32 reg;
> > +       u32 bit;
>
> The sparse base-10 combined number or packed index would need just a
> single u32...
>
> > +       u32 delay_us;
> > +};
> > +
> > +/*
> > + * Per RZ/T2H HW manual: to secure processing after release from the
> > + * module-stop state, dummy read the same register at least seven time=
s
> > + * (except RTC and LCDC) after writing to initiate release from the
> > + * module-stop state. For RTC, dummy read at least 300 times and for
> > + * LCDC, at least 100 times.
> > + *
> > + * Instead of performing the actual dummy reads, an equivalent delay i=
s
> > + * added using udelay(), computed from the required read count via
> > + * RZT2H_MSTP_READS_TO_US().
> > + */
> > +static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] =
=3D {
> > +       { RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
> > +         RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },
>
> "210" (us)?
>
142us

> > +};
> > +
> >  /*
> >   * Standby Control Register offsets (RZ/A)
> >   * Base address is FRQCR register
> > @@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_p=
riv *priv, u16 offset, u32 val
> >         writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
> >  }
> >
> > +static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
> > +               const struct rzt2h_mstp_delay_entry *e =3D &rzt2h_mstp_=
delay_table[i];
> > +
> > +               if (e->reg =3D=3D reg && (e->bit =3D=3D bit || bit =3D=
=3D RZT2H_MSTP_ANY_BIT))
> > +                       return e->delay_us;
> > +       }
>
> Given there are only two modules (LCDC and RTC) that need special
> handling, a table sounds like overkill to me.
> For exact matching, a switch() statement with two entries and a default
> would do.
> For wildcard bit matching, perhaps you can use a mask?
>
>     unsigned int mask =3D bit_valid ? GENMASK(31, 0) : GENMASK(31, 5));
>
>     if (idx =3D=3D (MOD_CLK_PACK(1204) & mask)) {
>             /* LCDC needs 300 dummy reads, or 210 us */
>             return 210;
>     } else if (idx =3D=3D (MOD_CLK_PACK(605) & mask)) {
>             /* RTC needs 100 dummy reads, or 70 us */
>             return 70;
>     } else {
>             /* default 7 dummy reads, or 10 us */
>             return 10;
>     }
>
> What do you think?
>
agreed, this approach would much simpler.

> > +
> > +       return RZT2H_MSTP_DEFAULT_DELAY_US;
>
> You might as well just do the udelay() here, too.
>
Ok I will have the below,

static void cpg_rzt2h_mstp_delay(u32 idx, bool bit_valid)
{
    unsigned int mask =3D bit_valid ? GENMASK(31, 0) : GENMASK(31, 5);

    if (idx =3D=3D (MOD_CLK_PACK(1204) & mask)) {
        /* LCDC needs 100 dummy reads, or 142us */
        udelay(142);
    } else if (idx =3D=3D (MOD_CLK_PACK(605) & mask)) {
        /* RTC needs 300 dummy reads, or 428us */
        udelay(428);
    } else {
        /* default 7 dummy reads, or 10us */
        udelay(10);
    }
}

> > +}
> > +
> >  static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
> >  {
> >         struct mstp_clock *clock =3D to_mstp_clock(hw);
> > @@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *=
hw, bool enable)
> >                  * register, we simply add a delay after the read opera=
tion.
> >                  */
> >                 cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> > -               udelay(10);
> > +               udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));
>
> In this function, you do have the packed clock index (clock->index).
>
Agreed, this can be replaced with cpg_rzt2h_mstp_delay(clock->index, true);

> >                 return 0;
> >         }
> >
> > @@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *d=
ev)
> >                         cpg_rzt2h_mstp_write(priv, priv->control_regs[r=
eg], newval);
> >                         /* See cpg_mstp_clock_endisable() on why this i=
s necessary. */
> >                         cpg_rzt2h_mstp_read(priv, priv->control_regs[re=
g]);
> > -                       udelay(10);
> > +                       udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_M=
STP_ANY_BIT));
>
> Here you don't have it, but idx =3D reg * 32, and bit_valid =3D false;
>
and this one with cpg_rzt2h_mstp_delay(reg * 32, false);

Cheers,
Prabhakar
