Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49221FF4D
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764111628; cv=none; b=dX1ER6j4fue6Qr+zMDxDo6SsMfnh21YSQgC01/U8o9pMxRQ+LMwv+6Rs2nanlwEeOoCrWvLRjOd+obzDm1J0G0yIrAIZ43JKVWfUnvN/MR0qlt6MZqzKuPfkm4oJqHTq5TdFx8lxIfZtg6kzFcbNuZWWg0IL0SqPykSKpCiQPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764111628; c=relaxed/simple;
	bh=idak+uCeBCyAvyZ9fprhw/KV0s00N1Im+/NB63tUTdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpGVmopqp9Wmfjk0pEy8wH3nDdLylirqrK/WHh8AiOsIbTa5tHrp5MOyJpcBarGaSYt5ZwxgK/gB3b7HzlsDXamUMHzEZjOFMNsGzjr5eQk8faON9VYVgtReySWuIwA1IDsltNjE15iO3IFPzhsmKpZdkrr5VH5BRZQNjKcrk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTfCjr2H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTfCjr2H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42bb288c17bso3679418f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 15:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111625; x=1764716425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mxf/zvDrowgtITZiOKfTYBQoYBwaTnkdZo06JbINmCs=;
        b=ZTfCjr2HyC9b8BUwxdsIkpLyFKZPhpPwoVXlQz2JzFtP3aL/BeC1cDx81evI7+UhO8
         LQzXkQTragSR0Tvsnm+YFWAJKwIX81M6EoyRxNbYinJO07AMZ5R8sITnN9Wtpjz+DOld
         YLkvCFcQXUKBPH5jLMZp9TJSIr2GoTspG/S12DGr2yWY5/HOqpKaM5LOFYFML3M6sAS4
         hiPUksnLdFmYGo7+j29cfRaB6J+63OjmodjHcSgpu0kjLAlDFmzV3McR40mbcq6VCiHa
         DVxe0HdJqgtwD+Mf8Ni3QFvc24tRJZIiQFG8ykkR7PIV04PnJKsakPxBGReNMEFJRWc5
         sjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111625; x=1764716425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mxf/zvDrowgtITZiOKfTYBQoYBwaTnkdZo06JbINmCs=;
        b=myu8l6iA/hetjOiI4BaxheEjlq/3xU1sHOG0oEV0gEUUmgdQqkEWz294drOauWlEKQ
         O7NY10Acp+t6s3mebyHne6JvPAwoNDrrYncm1UHJ4I3UKAoqwCzC+TYKVY35GIRpk9F2
         hMrkwQM+J1iZot+J5Gi6qk1ll8DhdAcniNRW1q/0RKWynoe8Q8YWrqGGBw2SdjrtbmfV
         RvBLavTphg4BZ2W9n0T/caqrO+3OQC1zr1FwF86MR2YCzmafu8yRpHqYeQDwWBrQZhYC
         8hQgCz7hrcNQdtOiaxV/Pcc4Zfdy41OcBIjNhYO2+EM4tJ1l4UiqWxSzsEW1z2jpPXG3
         p5jg==
X-Forwarded-Encrypted: i=1; AJvYcCU4jwhqg/45t7eAAnElodIFHRwrVE21D58037cD5uraE2l+GQAgamp/OChNGhfaXLfmWt7h7M2OXD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzvC9tIiL8bFkozRdgQ5dRs/C+oXMKg5cG4zw356Tu4Dqx/65e
	+xAvUIFxrcXdZaItpS5e+ZDURQJWROsfsIfVk8XNylZLsqus1H1RK0Bzqozj7MmT6tZ+++MAkZk
	0eUHf8S1SuQ2xEd6Zpc492o8hqC3tGEk=
X-Gm-Gg: ASbGncuS93TQuKXUnHN9ZGlnmxiY0vqN0sjMZNf5QOWdn+VNyckQ5uTXxJLoSuDc7dE
	lhGD7on87x3HOhi7y+MipuiB18PMkzFR0FsEu2ATd6ipkZ2SGZMMYt7VVok3ccEyiZsxLWc0baU
	JkOoyzx2wlykFRJagWTqsouaQUhhYgO9HDFTwZ8W5wFfXFr1KA2n2Mk461th8AlI5iUT5fSFb6c
	xx63U60eDWRGv9TGDExzCfUO4DSAiydnemFtyCsrY/F3UxH5QmO+hN2anF+V58muBxl3jeHDevM
	3cT8JGG8OjHBr7yjdU6YncY4tk0=
X-Google-Smtp-Source: AGHT+IHfTWcr4pmhEZy7lyLJ8KSjZgdKx6azzv+gBs/PSqdSM9UG1I2+fi9zPROnLAOvdSZsRKUsX214IvJvuEEVAIA=
X-Received: by 2002:a05:6000:1ace:b0:42b:397f:8dd4 with SMTP id
 ffacd0b85a97d-42cc1d0cd18mr17489452f8f.49.1764111625104; Tue, 25 Nov 2025
 15:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Nov 2025 22:59:59 +0000
X-Gm-Features: AWmQ_blhqg2Ly_A14EsF2_GEsrjZcaf7JM2ijqwQpdQ0l2gyC6xMmEmyN7IBjGw
Message-ID: <CA+V-a8uGLMa33WC_e83keMe2GOONd-92Z2HWzPEK+NNvin-LXg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Nov 24, 2025 at 4:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Nov 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add core clocks and module clock definitions required by the xSPI
> > (Expanded SPI) IP on the R9A09G077 SoC.
> >
> > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 and
> > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> > PCLKH as its bus clock (use as module clock parent) while the operation
> > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > provide mux/div selectors and divider tables for the supported
> > XSPI operating rates.
> >
> > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > where the determine_rate() callback enforces the hardware constraint:
> > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> > be used. The custom determine_rate() picks the best parent/divider pair
> > to match the requested rate and programs the appropriate SCKCR fields.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note this patch was originally part of series [0] as rest of the series
> > is already merged into linux-next, sending only this patch as v3.
> > [0] https://lore.kernel.org/all/20251028165127.991351-1-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> >
> > v2->v3:
> > - Dropped check for 800/600 MHz in
> >   r9a09g077_cpg_fselxspi_determine_rate() instead compared divider valu=
es 3/4.
> > - Sorted pll4d1_div3/pll4d1_div4 definitions to be with other pll4d1 di=
viders.
> > - Dropped u64 caset in DIV_ROUND_UP_ULL()
> > - Hardcoded the maxdiv when no dividers are found
> > - Rebaesed to latest -next
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -58,11 +60,16 @@
> >  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> >  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> >
> > +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> > +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> > +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> > +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
> >  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)
>
> Moving all of these up while applying, so SCKCR comes before SCKCR2.
>
> >
> >  enum rzt2h_clk_types {
> >         CLK_TYPE_RZT2H_DIV =3D CLK_TYPE_CUSTOM,   /* Clock with divider=
 */
> >         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock sou=
rce selector */
> > +       CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn=
 source selector */
> >  };
> >
> >  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
>
>
> > @@ -148,6 +172,8 @@ static const struct cpg_core_clk r9a09g077_core_clk=
s[] __initconst =3D {
> >                 sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ON=
LY),
> >
> >         DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
> > +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> > +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
>
> Inserting a blank line.
>
> >         DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
> >                 dtable_24_25_30_32),
> >         DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,
>
> > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> > +                                                struct clk_rate_reques=
t *req)
> > +{
> > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > +       unsigned long parent_rate, best =3D 0, now;
> > +       const struct clk_div_table *clkt;
> > +       unsigned long rate =3D req->rate;
> > +       unsigned int num_parents;
> > +       unsigned int divselxspi;
> > +       unsigned int div =3D 0;
> > +
> > +       if (!rate)
> > +               rate =3D 1;
> > +
> > +       /* Get the number of parents for FSELXSPIn */
> > +       num_parents =3D clk_hw_get_num_parents(req->best_parent_hw);
> > +
> > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > +               parent_rate =3D clk_hw_round_rate(req->best_parent_hw, =
rate * clkt->div);
> > +               /* Skip if parent can't provide any valid rate */
> > +               if (!parent_rate)
> > +                       continue;
> > +
> > +               /* Determine which DIVSELXSPIn divider (3 or 4) provide=
s this parent_rate */
> > +               divselxspi =3D r9a09g077_cpg_fselxspi_get_divider(req->=
best_parent_hw, parent_rate,
> > +                                                               num_par=
ents);
> > +               if (!divselxspi)
> > +                       continue;
> > +
> > +               /*
> > +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> > +                * When divselxspi is 4 (600MHz operation), only FSELXS=
PIn dividers of 8 and 16
> > +                * are supported. Otherwise, when divselxspi is 3 (800M=
Hz operation),
> > +                * dividers of 6, 8, 16, 32, and 64 are supported. This=
 check ensures that
> > +                * FSELXSPIx is set correctly based on hardware limitat=
ions.
> > +                */
> > +               if (divselxspi =3D=3D 4 && (clkt->div !=3D 8 && clkt->d=
iv !=3D 16))
> > +                       continue;
>
> Inserting a blank line.
>
> > +               now =3D DIV_ROUND_UP_ULL(parent_rate, clkt->div);
> > +               if (abs(rate - now) < abs(rate - best)) {
> > +                       div =3D clkt->div;
> > +                       best =3D now;
> > +                       req->best_parent_rate =3D parent_rate;
> > +               }
> > +       }
> > +
> > +       if (!div) {
> > +               req->best_parent_rate =3D clk_hw_round_rate(req->best_p=
arent_hw, 1);
> > +               divselxspi =3D r9a09g077_cpg_fselxspi_get_divider(req->=
best_parent_hw,
> > +                                                               req->be=
st_parent_rate,
> > +                                                               num_par=
ents);
> > +               /* default to divider 3 which will result DIVSELXSPIn =
=3D 800 MHz */
> > +               if (!divselxspi)
> > +                       divselxspi =3D 3;
>
> Inserting a blank line.
>
> > +               /*
> > +                * Use the maximum divider based on the parent clock ra=
te:
> > +                *  - 64 when DIVSELXSPIx is 800 MHz (divider =3D 3)
> > +                *  - 16 when DIVSELXSPIx is 600 MHz (divider =3D 4)
> > +                */
> > +               if (divselxspi =3D=3D 3)
> > +                       div =3D 64;
> > +               else
> > +                       div =3D 16;
>
> Replacing by:
>
>     div =3D divselxspi =3D=3D 3 ? 64 : 16;
>
> > +       }
> > +
> > +       req->rate =3D DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> > +
> > +       return 0;
> > +}
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.20, with the above changes.
>
Thank you for taking care of the changes.

Cheers,
Prabhakar
