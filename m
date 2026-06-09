Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FD3E7BD5
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996985; cv=pass; b=hiDkl17jVluvOOh/Ffv8tjRB5uDkJNGmPLjvQ6QeE4CKn3xpxHPmUpexCvBQmJZVYdpIB59ZSk5cuKLULl74ZwCtxHf548DzEda55+TgsoSURgRh63JNJDyRMlrAVZIK2QfMB6AJ0+qj8/MRXmxlyBZuGqfK7vajdV/5RWc9B0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996985; c=relaxed/simple;
	bh=dsTfQXdWXveui6Dm6dnofvs2mvgUGCQBF9A4gl7pVtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvyK/ZcTmvX4ppt8csp43foc7ukUA2ij5VvApX9DOgPldKJY/gzDfiGq7j1TKp9ngew3/RqqSjL7N3MbhaqlpccfQxXQBLxIjsRcMESK2Uy0OwPNOY2+HlCiPFd8HV0PMJe6ihz/0LedxgXLpjnfr/hAGMf3b2UQGXiDCxjf93U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqR9IIvD; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqR9IIvD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3577092f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 02:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996982; cv=none;
        d=google.com; s=arc-20240605;
        b=TeRVgIaeJWt1nMhr/vw23HaJQda70COZMjbRryXHkOa3M5sXhveIuV78ZDRofQf32p
         J8d4m7+RBRCZ0Lm+0Pug3MXdBekFDBU8BHgXULWGJm8QU52+IB1vd8+B0iagfQmBOM3t
         CqUHbIBVSDjjHDmedzQXMlLw7Cq2HlIZinSPwRQf28SBb62cBrVqeBcnc87S0zAo2NmQ
         wgxxO/GBxAiUvba1pUvLs4o29mggqaEKkaWB4UH/5sX3wD9KQyY3s+F+eKPSIkaABuQR
         FXa/yNjR+iv/p/LhXSac9t4WbMR0ZY2ozG/lkr9/SHBDMm9hd7rVD1k19ATPf8hCbsRC
         AweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        fh=f4Wbszp1t4AraV9jumuhtQ9qC6fVodmprbj/xCkkoOw=;
        b=PjfO9ghmVjettPOJmjgsIy3NQQb9XgfCoX0kAMWrfVgplem/qJOF52qPC30Tn+xfP3
         RZIkXbCP51wFbPw2oq3BFp+hE9JTqWLn1xDYVLGc0C1Oe/Kxcu6OqUlddFT3ZKSQQXZO
         OK0FrwyrIpkLGfoux/Z+VKraL0vwBTjAIowI4HptaAUCYyDxW9oaJRZ01OxGMTELXGH5
         YSgJpti+hD21WaxI9EAQp+u3sm0PDpMdeQOFHD7pZT0o+WDgN0eN1efjGNh9+W/qFhec
         OdbwyFFIoZVi3gMgHjzWraxPAfsBzUF3Qn6qE7LrwyPmXoOr+hQTBoI2YgOHcOpfxz7Q
         oeDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780996982; x=1781601782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        b=lqR9IIvDLVq4SQqkwFkyfVhZXEFJrofjb3QPfGz7CQLSvAyUIOfh0YmrCFzwVG+mya
         YtRRhcbV1Z+hGTd6OMuCjW4Ri+ow8x2DEchuIVGAy+y9SrJpc4tFLI6Coq/zEhgdx9s3
         zrYm7+c1rh8MM9kgHuAZUDzPLqkNhHF+51gbZvDGxMD08Go+K3LmdFXsl1a5GrPZwgE8
         bW9todlOEDBLzwHvWWKM4fVwVtGG5Y2CUTMSC+gvJWKgvZqVUhARYB1kDffZ1HSxL2Pz
         QNUQuE9bbpVqawKR4DFyujDa/aLzf/ttQmCiskJp+RN1iqXdndjIJYV/vzOD5YYUwdMr
         3M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996982; x=1781601782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        b=PcTRpJKEQaKMrVf7ZCiM9lSnnnmX/h6c6DBtdk7LtFGSMtsvq7PXPeE3YM4MkBjj0b
         xj2Do3+V9Oflu6RHqzvvWae8M0PUaeH3vteAnupMQUQMSty0L4KqWVZ/wb+ekVXEzchk
         wLq2S9UpNlcPBVxPVryCbKVnTa0BYHkdZYc2A7T/Kq1wf+9p9xxEHi1OjBjxYVmlCJJx
         mrzRlJuxkgz/x55Bd/SPLNxn3zhJt16Q+YmmN2o1DX08TEo35DUW9A96nBNrl+0uzRv9
         rHZMxZIOJM44sZ1CJgtu44I25DebgsunFq8LfZur5vLADIW/MJXnr4dtmOmJWAqBLLrn
         1Rag==
X-Forwarded-Encrypted: i=1; AFNElJ8diwv2YCx6KqzjZw79TcidWY5fYJxwWv1/z4tg1RSUQO2VwG3iBnB2fiRWOh6lha0eVEk+0femqHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSndiP1coEnD/RR/0UHWuqfPxmVDNzQ9U7A3VZokjPelSTaJx
	ynMoggiuJ+TXSBcYNLNww2dKfqQr5YXXZsgNlD6dFi4y1pLPI45YOAYsX/CVSGSoHqogMMDCwgD
	/cfN/jPCz9dVCK3U5IAoodq1KjYG+2Mo=
X-Gm-Gg: Acq92OGoSvErUM+AMHvy765IEOYPO2SevteA+5pqO20W3DHeS2ZTsiYheDPaPqK5CWP
	M2Ldug9NJgCvGyl9wv2k5FCSGuy1SLdhC4BmqrSG5mynnn+CIfkvVtT5TaqOIllSkSNs2bRQuQm
	aBolkCm3saXbWi+0C7uJZV5MPt0exgIg774LMeojYxFklcxcmABfLZ4q8rdAl0LOG0+VOoNBegD
	c1zCsupGW/ozDSiC5fdn8TdjNswfMk4+pLff45UNRGcDCvFO/tirzivskpCZ+pDvxj/uk1fZ3AZ
	OeulXSK82CnNU/fMP9bybyrdAUT2sjTdJYzt5wjKNLmKdVLoRHTVFtOZvoZ1d9XsGEhzGCaBFt1
	qvH8=
X-Received: by 2002:a5d:504e:0:b0:45e:f302:95b with SMTP id
 ffacd0b85a97d-46030767c03mr21925116f8f.37.1780996981886; Tue, 09 Jun 2026
 02:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 9 Jun 2026 10:22:35 +0100
X-Gm-Features: AVVi8CeeObicykNnGA2iNO64dGKHVIYZcZfOf-WaYEjsA4Aa85keX4ByqxRaSc0
Message-ID: <CA+V-a8ujd4CJmPkRoHfwrmC-gEA98xm3N9ANacKdHZM-6CX_tw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
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

On Fri, Jun 5, 2026 at 2:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the clock definitions and PLL logic required to supply the LCDC
> > (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H displa=
y
> > subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> > clocks.
> >
> > Introduce a new PLL clock type and implement rate recalculation,
> > programming and locking sequences for PLL3 using the RZ/T2H specific
> > divider and VCO limits. Add the corresponding muxes and divider entries=
,
> > expose the LCDC core clock, and register the LCDC module clock using th=
e
> > correct PCLK parent.
> >
> > This enables the RZ/T2H clock driver to generate the display pipeline
> > clocking tree needed by the DU and VSP-based composition engines, allow=
ing
> > upcoming display support to be integrated without duplicating CPG logic=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -218,10 +218,12 @@ config CLK_R9A09G057
> >  config CLK_R9A09G077
> >         bool "RZ/T2H clock support" if COMPILE_TEST
> >         select CLK_RENESAS_CPG_MSSR
> > +       select CLK_RZV2H
>
> That includes a lot. Perhaps spin off the required functionality in a
> separate file, like CLK_RCAR_CPG_LIB?
> That would impact the MODULE_IMPORT_NS("RZV2H_CPG") in
> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c, too, though.
>
Ok I will create a rzv2h-cpg-lib.c and incremently switch the DSI
driver to use this new lib.

> >
> >  config CLK_R9A09G087
> >         bool "RZ/N2H clock support" if COMPILE_TEST
> >         select CLK_RENESAS_CPG_MSSR
> > +       select CLK_RZV2H
> >
> >  config CLK_SH73A0
> >         bool "SH-Mobile AG5 clock support" if COMPILE_TEST
> > diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/=
r9a09g077-cpg.c
> > index f777601a23b9..48052e7b93fd 100644
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -66,11 +73,26 @@
> >  #define DIVSCI2ASYNC   CONF_PACK(SCKCR3, 10, 2)
> >  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> >  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> > +#define LCDCDIVSEL     CONF_PACK(SCKCR3, 20, 4)
> > +
> > +#define PLL3EN         FIELD_PREP_CONST(OFFSET_MASK, (0xc0))
> > +
> > +#define CPG_PLLEN              BIT(0)
>
> CPG_PLL_EN_EN, for consistency with CPG_PLL_MON_LOCK below?
>
Ok.

> > +#define CPG_PLL3_VCO_CTR0(x)   ((x) + 0x4)
> > +#define CPG_PLL3_VCO_CTR0_PDIV GENMASK(21, 16)
> > +#define CPG_PLL3_VCO_CTR0_MDIV GENMASK(9, 0)
> > +#define CPG_PLL3_VCO_CTR1(x)   ((x) + 0x8)
> > +#define CPG_PLL3_VCO_CTR1_KDIV GENMASK(31, 16)
> > +#define CPG_PLL3_VCO_CTR1_SDIV GENMASK(2, 0)
> > +#define CPG_PLL_MON(x)         ((x) - 0x10)
> > +#define CPG_PLL_MON_LOCK       BIT(0)
>
> So all registers are calculated based on the CPG_PLL3EN register
> address...
>
Yes.

> >
> >  enum rzt2h_clk_types {
> >         CLK_TYPE_RZT2H_DIV =3D CLK_TYPE_CUSTOM,   /* Clock with divider=
 */
> >         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock sou=
rce selector */
> >         CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn=
 source selector */
> > +       CLK_TYPE_RZT2H_PLL3,                    /* PLL3 Clock */
> > +       CLK_TYPE_RZT2H_LCDCDIV,                 /* LCDC divider clock *=
/
> >  };
> >
> >  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
> > @@ -83,10 +105,51 @@ enum rzt2h_clk_types {
> >  #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
> >         DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf =3D _conf, =
\
> >                  .parent =3D _parent, .dtable =3D _dtable, .flag =3D 0)
> > +#define DEF_PLL3(_name, _id, _parent, _conf) \
> > +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_PLL3, .conf =3D _conf, \
> > +                .parent =3D _parent)
> > +#define DEF_DIV_LCDC(_name, _id, _parent, _conf, _dtable) \
> > +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_LCDCDIV, .conf =3D _conf, \
> > +                .parent =3D _parent, .dtable =3D _dtable, .flag =3D CL=
K_SET_RATE_PARENT)
>
> I assume you can't reuse DEF_DIV() because you need the extra accuracy
> from interfacing with rzv2h_get_pll_divs_pars()?
>
Yep, thats correct.

> > +
> > +struct pll_clk {
> > +       void __iomem *reg;
>
> This is the PLLxEN register address, from which all other register
> addresses are calculated: pllen?
>
Yes.

> > +       const struct rzv2h_pll_limits *limits;
> > +       struct device *dev;
> > +       struct rzv2h_pll_pars pll_parameters;
> > +       struct clk_hw hw;
> > +       unsigned long cur_rate;
> > +};
> > +
> > +#define to_pll(_hw)    container_of(_hw, struct pll_clk, hw)
> > +
> > +struct r9a09g077_lcdc_div_clk {
> > +       const struct clk_div_table *dtable;
> > +       void __iomem *reg;
> > +       struct device *dev;
> > +       struct clk_hw hw;
> > +       u32 conf;
> > +       u8 divider;
> > +};
> > +
> > +#define to_lcdc_div_clk(_hw) \
> > +       container_of(_hw, struct r9a09g077_lcdc_div_clk, hw)
> > +
> > +#define RZT2H_MAX_LCDC_DIV_TABLES      16
> > +
> > +static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits =3D {
> > +       .input_fref =3D 48 * MEGA,
> > +       .fout =3D { .min =3D 25 * MEGA, .max =3D 430 * MEGA },
> > +       .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA },
> > +       .m =3D { .min =3D 0x40, .max =3D 0x3ff },
> > +       .p =3D { .min =3D 0x2, .max =3D 0x8 },
> > +       .s =3D { .min =3D 0x0, .max =3D 0x6 },
> > +       .k =3D { .min =3D -32768, .max =3D 32767 },
> > +};
> >
> >  enum clk_ids {
> >         /* Core Clock Outputs exported to DT */
> > -       LAST_DT_CORE_CLK =3D R9A09G077_PCLKCAN,
> > +       LAST_DT_CORE_CLK =3D R9A09G077_LCDC_CLKD,
> >
> >         /* External Input Clocks */
> >         CLK_EXTAL,
>
> > @@ -242,6 +335,8 @@ static const struct cpg_core_clk r9a09g077_core_clk=
s[] __initconst =3D {
> >                          FSELXSPI1, dtable_6_8_16_32_64),
> >         DEF_MUX("PCLKCAN", R9A09G077_PCLKCAN, FSELCANFD,
> >                 sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_d=
iv10_div20), 0),
> > +       DEF_DIV_LCDC("LCDCDIV", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, =
LCDCDIVSEL,
>
> "LCDC_CLKD"
>
Ok.

>
> > +                    dtable_2_32),
> >  };
> >
> >  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =3D =
{
>
> > @@ -481,6 +577,272 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct de=
vice *dev,
> >         return hw->clk;
> >  }
> >
> > +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw =
*hw,
> > +                                                       unsigned long p=
arent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       unsigned int ctr0, ctr1;
>
> u32
>
Ok.

Cheers,
Prabhakar

> > +       u8 pdiv, sdiv;
> > +       u64 rate;
> > +       u16 mdiv;
> > +       s16 kdiv;
> > +
> > +       ctr0 =3D readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
> > +       ctr1 =3D readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
> > +
> > +       pdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
> > +       mdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_MDIV, ctr0);
> > +       kdiv =3D (s16)FIELD_GET(CPG_PLL3_VCO_CTR1_KDIV, ctr1);
> > +       sdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR1_SDIV, ctr1);
> > +
> > +       rate =3D mul_u64_u32_shr(parent_rate, (mdiv << 16) + kdiv, 16 +=
 sdiv);
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(rate, pdiv);
> > +}
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
