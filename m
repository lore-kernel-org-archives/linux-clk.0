Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877631F7586
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761599114; cv=none; b=QRD7GHpahVmhunUc1WlYUW0L8LrK/a2VMc6WUq797d2S8qxGd9pwKlO/kf029mL3gEZ7jMK4EOn3HbwPOE5I/nBMXy7p92nKbsQN15XN4dPiX7TV0nUOYH1MPYoNLgG8KRM8YRTrbWpNg+VOXct4EUSk544Rms/YBqAyVr39Fwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761599114; c=relaxed/simple;
	bh=XIDl/ERO9aKNyZxFoRMGRXdIovseLN8Xy2xPzQVYRgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akNG64bMjDP8FlHxZtSNBEXlGoedh5XWFuIEVuoxqwt9DaiECuloBBcOj49/5lOeqB7MOnsrPDMvBKPy+9NYAGxIw4WUMviJdsqCI1Vt8rEOcxRMvUN5lDydfPZqOxtM7BoPJek/PtNvjWCRshGtWeK2E5VfLX+WVKDOgx9qYZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghoEx6N+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghoEx6N+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3564958f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761599111; x=1762203911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoP6sWXXFNGFX4Zpq9+V9L/LMjEEOr7rE32h6+1IRjs=;
        b=ghoEx6N+UTJ262ic2N/Gf8mx2wyMC1iHx3o3Wl14zxTLiw/ZdGXPNGh7R0Sbl6Mq3w
         WVxl89hJDpR3uL9qrAREUeV1PsUPryL5UKbsPrTqQfdyqkgQKAxGwr/8TFWJYoEemRg4
         wbCrdVEC9SER9akg8ocru8R2dLPNSPLU26v7N67U4S33wmVYHaJ8TH8J6wV4VgOMLlBZ
         PIaYaCtweQOKyC56/LRlRDVMZPCAGlbgxD1gcMgbrWGc4ehZuTpUwP41j23ijgB0sw54
         BcMaMxFz2ihBGuDSe6qusxVwE8wfdTF9d3Pz9Wlvr4CjbqOpVqh8z/MdDJ5xiGxQFucl
         Y4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761599111; x=1762203911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoP6sWXXFNGFX4Zpq9+V9L/LMjEEOr7rE32h6+1IRjs=;
        b=aRC8Ld57aKcJ/gA8RyMuOhPboWKvIsWxQM9f0lK/mqgoGmYOKn2cOzNXTJJc+6zhE1
         WwdN8TlmRvFSqF5Ybm88FFM4woNuUgPP3Jw4QWoaV2ME0OANERCHeM8n5YHep1binaS7
         g6rMVvvQ2fmZsKWg27eSo9Dx57iRnw35ItYaVWbRQwcZNokkaRRs193APzJHCAmFZGcy
         8mhjELbgPc1n2W/v/kxrhOnB3zFgpNAC0zIL8jn3cjfx3gq8Dh6HoVgDQPTXDuSAgBoe
         dXOIwXdPkxpTqLkwmXhR8eJif+DjH8MkpU6E3AEoQDWetB0QgcGadbtbPYPKRg0PqLW7
         7keA==
X-Forwarded-Encrypted: i=1; AJvYcCVR2RS7s5L3Ta6nYQk4jWIcJPIcv88nhuwJVXia7K3nuatv7atkA8gGJCyekaU4B23xE9Ru/fGzoyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbgOvTjX51CaEScSYpNyryePbrPt3RATnh7wdzGTfa3ZqbqaUy
	OTpK66fHKyFqSN6KZBDL+4Pp9jVAzc5B1NTm5PSIrO+0Z1jcG6eNsy4k6PLUYYwRM59yv0gh027
	dHBiqbLC3/uR52VjHUq47JNtHWutmQAiijC0E
X-Gm-Gg: ASbGncuWIDDEU+XKklvApSssojR2Cnd94F3ILOVk7UExH0XfFjp1w0Mo/2G5PqRgiFx
	nfkB9Lt7gKT0ajoI5M3evaG+LSpQOsMHBHiKnR3Jjpu/j0kmQvrgXoEMFwI2XhH58kEsansDr/7
	LcOgCDYr4rG1Mip7WEfwFU9PmwMYnE654lkQvNTSDot2r6GujvAcM7RhGc5HNCjqG5sO4IAp7VD
	fma1F0oNBErdO48XxorEcSswpCA2xYjFXYYqsb4p/U76xjWh1X+02JHKeG8
X-Google-Smtp-Source: AGHT+IHk2BlyZjRFVUILloQdhusl5C3XR9jf4ug3ST318DPm7lP7GrQepTteSylu4Lm1lrHkxRCafckMptsRpnQAp2c=
X-Received: by 2002:a5d:5c8a:0:b0:429:8d46:fc40 with SMTP id
 ffacd0b85a97d-429a7e4f541mr1140944f8f.25.1761599110650; Mon, 27 Oct 2025
 14:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
In-Reply-To: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Oct 2025 21:04:43 +0000
X-Gm-Features: AWmQ_bnLKxvnu2wt9shyDeaA5MSq9GtqCcfZY2URt6Hj7wb0HhH2yB8dTxpJ5hg
Message-ID: <CA+V-a8soq2HJD0dM8GPhprpd_tyW735MSC-FkHwrY6wb-dqTZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add xSPI core and module clocks
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

On Fri, Oct 24, 2025 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add module and core clocks used by xSPI (Expanded SPI) IP on the
> > R9A09G077 SoC.
> >
> > The xSPI block uses PCLKH as its bus clock, while the operation clock
> > (XSPI_CLKn) is derived from PLL4. To support this, define new selectors
> > and dividers (FSELXSPI0/1 and DIVSEL_XSPI0/1) in SCKCR.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -105,6 +113,15 @@ static const struct clk_div_table dtable_1_2[] =3D=
 {
> >         {0, 0},
> >  };
> >
> > +static const struct clk_div_table dtable_6_8_16_32_64[] =3D {
> > +       {6, 64},
> > +       {5, 32},
> > +       {4, 16},
> > +       {3, 8},
> > +       {2, 6},
> > +       {0, 0},
> > +};
> > +
> >  static const struct clk_div_table dtable_24_25_30_32[] =3D {
> >         {0, 32},
> >         {1, 30},
> > @@ -119,6 +136,7 @@ static const char * const sel_clk_pll0[] =3D { ".lo=
co", ".pll0" };
> >  static const char * const sel_clk_pll1[] =3D { ".loco", ".pll1" };
> >  static const char * const sel_clk_pll2[] =3D { ".loco", ".pll2" };
> >  static const char * const sel_clk_pll4[] =3D { ".loco", ".pll4" };
> > +static const char * const sel_clk_pll4d1_div3_div4[] =3D { ".pll4d1_di=
v3", ".pll4d1_div4" };
> >
> >  static const struct cpg_core_clk r9a09g077_core_clks[] __initconst =3D=
 {
> >         /* External Clock Inputs */
> > @@ -154,6 +172,15 @@ static const struct cpg_core_clk r9a09g077_core_cl=
ks[] __initconst =3D {
> >         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
> >                 dtable_24_25_30_32),
> >
> > +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> > +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
> > +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> > +               sel_clk_pll4d1_div3_div4,
> > +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MA=
SK),
> > +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> > +               sel_clk_pll4d1_div3_div4,
> > +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MA=
SK),
> > +
> >         /* Core output clk */
> >         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA=
55C0,
> >                 dtable_1_2),
> > @@ -178,9 +205,15 @@ static const struct cpg_core_clk r9a09g077_core_cl=
ks[] __initconst =3D {
> >         DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
> >         DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
> >         DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> > +       DEF_DIV("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR=
,
> > +               FSELXSPI0, dtable_6_8_16_32_64),
> > +       DEF_DIV("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR=
,
> > +               FSELXSPI1, dtable_6_8_16_32_64),
> >  };
>
> Perhaps we need a custom clock for this?
> According to Section 7.3.1 "SCKCR : System Clock Control Register",
> some divider combinations are prohibited:
>   - 4 x 6,
>   - 4 x 32,
>   - 4 x 64.
> The last two are probably not an issue iff the xSPI driver never tries
> to set the corresponding clock rates.
> However, the first one may be an issue, as both 3 x 8 (valid) and 4 x 6
> (prohibited) yield the same resulting divider, and I believe we cannot
> be sure the clock core will never pick the prohibited combination.
>
Agreed, I think I will have to compose both MUX and the divider into a
single clock so that the dividers can be adjusted based on the MUX
value, or do you have any suggestion to just adjust the divider clocks
and leave the MUX clocks as is?

Cheers,
Prabhakar
