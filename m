Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBBDD531
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 13:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386431; cv=none; b=kx/4q+9LnPXn3qLNzLAm3hFpAO4SBgA+hJ9CioHUMPQUCv5qvyOz+3l1SlxZ33F/IiW165GK8GxmjF+hyOxPQrjVXnVbA5MoVI3RD2bBUasp1hZ5NxFGRL0TDT8+tqNJCQsRG20M6oO2YMiDBPA4HzzKegHxm+cZzwhLo4SqSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386431; c=relaxed/simple;
	bh=1z5P7Ct1dCApMV5cMidEWuBnENLPxUcSA3NHYJ2QfjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptttq5eTWzgv8l7ne7Cz6mlJgXh/4yq7cSPw7pi4Z5P9pJjNHdClb/wt/3gKkMyRJvVCxi0nMe8RrS9M+zjQwV/DI6GbP8AbqsKKz5aSTwe2JbqPrw3Vxy6o4EqI3MflVuhnpUERHbX+HCxMCGw3TO7Ulsxlz2U76uQSHiXtUIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso2165050241.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 05:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386428; x=1763991228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRNOO2D8P1AP0B+8HOigZ1hD5IUxtuvnBzacX9Ugwh0=;
        b=UMnMNyuZx8O+rCfNLB63RR9vCBA6XSnKxWExt2oK9NeK2aUB0yxuMp7X5J3dONzHnP
         LLFDuCzDbNAfFVgV7zhdovQlk/kmb6h+Oe4CSY6Vlips0W4QYsYdQVk3d/2N7hMS75Gv
         Ztj3/IhxuItsVEbV+X0748X92nDiIlA7EuN6EKxVHs70Dp+wL+FlL83jDsQydmI1NqUw
         kkuEX9atKhyC8A3EN0swz5CY3P1gCFGhuK6dPKqw6sHlfQ+Q6Ef3j8ERdzwqsOFL7lGF
         0XIAstF2vtjnOEom1Fc7FWToGQSEr76GtG9Bv2i+mwvdaZyhNcr4+cYnrxUVqbJmq2EV
         sX0g==
X-Forwarded-Encrypted: i=1; AJvYcCUfJwCAZXi595SqnXIXMq3FU7ij0dx8d30IwgZPvpm+5IEH3FRgYwTav9wGpc9hhKGgW3tptDMLj0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzTajvLlrnSdP0boFaEv3zXVJYUJJEs4THy2Ab0vj4+0sRcCPQ
	W34D71KhrHHHNfPcC9XgIjiDH2E2M6UroopYbHIvR7zWtSDnjY2+h8msii4YISd4MxM=
X-Gm-Gg: ASbGncuP+p4FzytBc9Bd/nLWsZqsk97BWosBtJnYn+AwnaxV9jllfWK7OjJG72ffb45
	U1zoF0jwosbLR9iyoP7JIMiyEPPZxzFKzwKtybV+MGY1T31rwAuKxb29G1MOxMo+JaV/leyP+Zb
	DNgNzlO4glPaTbTP4usOOy9z7fcBSUaSVKxvDveyFO3KmDISup9GEtYHUPZMOhCPXr1I8mNfL32
	R0JTORFtSEcZKDUGr4mb7bzNKmEnjicbmabiQW18bgCZ7Qjmxx2GKv6f3xN9EyRH4Y7TFCTl1jD
	TsdOqNmPxdH5WfE5M5ok35gdYXmZ3mC9cZWsTTzz1j2/Hi28bABaegzNenhpZ9xRbkkQUTb+yj0
	qyWbcUIEfudm6X30EX3WoJEwdDehKgf56lAiAfmCE3BajZ+JYxM1B323FnqPrpPSpyn2QVRWhL5
	aTcK6CkoBjKRxiViYH7JVziN3YeIzawNLJsiu48AL4FBpkhVRb1p59
X-Google-Smtp-Source: AGHT+IFxE/Bl2gGahm0PkqGAr1mB3th4Air44eKuYpMmujIJ6v7zhe9b9KctDhlSQOynN8legiOc3Q==
X-Received: by 2002:a05:6102:4a91:b0:5db:f5d1:5799 with SMTP id ada2fe7eead31-5dfc5bcb984mr4786326137.33.1763386428363;
        Mon, 17 Nov 2025 05:33:48 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb707521fsm4366921137.2.2025.11.17.05.33.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:33:48 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b1dde0961so2023424e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 05:33:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ39H467itELlyyCJNXuArPpijxIwjfKv2luxnuRUSzpsl/dlWqg7o/iomaEjm5DWo6QJXl1R6j8A=@vger.kernel.org
X-Received: by 2002:a05:6102:d89:b0:5de:736:71d9 with SMTP id
 ada2fe7eead31-5dfc5b9440emr4348291137.28.1763386103237; Mon, 17 Nov 2025
 05:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com> <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Nov 2025 14:28:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
X-Gm-Features: AWmQ_bn5dkinW3o6sLUPnioziluAG20e1jQ8jExDV1eY758BmsHmrWuqLGXTcCQ
Message-ID: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 10 Nov 2025 at 22:38, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Nov 10, 2025 at 1:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add core clocks and module clock definitions required by the xSPI
> > > (Expanded SPI) IP on the R9A09G077 SoC.
> > >
> > > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 an=
d
> > > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> > > PCLKH as its bus clock (use as module clock parent) while the operati=
on
> > > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > > provide mux/div selectors and divider tables for the supported
> > > XSPI operating rates.
> > >
> > > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > > where the determine_rate() callback enforces the hardware constraint:
> > > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > > whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> > > be used. The custom determine_rate() picks the best parent/divider pa=
ir
> > > to match the requested rate and programs the appropriate SCKCR fields=
.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2:
> > > - Added custom divider clock type for XSPI clocks to enforce hardware
> > >   constraints on supported operating rates.

> > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> > > @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device *d=
ev,
> > >         return clk_hw->clk;
> > >  }
> > >
> > > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> > > +                                                struct clk_rate_requ=
est *req)
> > > +{
> > > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > > +       unsigned long parent_rate, best =3D 0, now;
> > > +       const struct clk_div_table *clkt;
> > > +       unsigned long rate =3D req->rate;
> > > +       int div =3D 0;
> > > +
> > > +       if (!rate)
> > > +               rate =3D 1;
> > > +
> > > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > > +               parent_rate =3D clk_hw_round_rate(req->best_parent_hw=
, rate * clkt->div);
> >
> > I had expected the use of some *_determinate_rate_*() helper, as the
> > parent can be changed to find a better clock rate?
> > Perhaps you should use a composite clock for that?

OK, so per your test results, the core clock code does try
various parents.

> >
> > > +               /*
> > > +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> > > +                * When the parent_rate is 600MHz, only dividers of 8=
 and 16
> > > +                * are supported otherwise dividers of 6, 8, 16, 32, =
64 are supported.
> > > +                * This check ensures that FSELXSPIx is set correctly=
.
> > > +                */
> > > +               if (parent_rate =3D=3D DIVSELXSPI_RATE_600MHZ &&
> >
> > Does this actually work as expected? I doubt parent_rate is guaranteed
> > to be exactly 600 or 800 MHz, and expect it can differ slightly due
> > to rounding.  Hence I would look at clk_fixed_factor.div instead.
> >
> With below diff, Ive got the below results for the various freqs
> requested where appropriate parent and divider clocks are picked.
>
> @@ -317,6 +317,7 @@ static int
> r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
>
>         for (clkt =3D divider->table; clkt->div; clkt++) {
>                 parent_rate =3D clk_hw_round_rate(req->best_parent_hw,
> rate * clkt->div);
> +               pr_err("parent_rate=3D%lu, req-rate=3D%lu div=3D%u\n",
> parent_rate, rate, clkt->div);
>                 /*
>                  * DIVSELXSPIx supports 800MHz and 600MHz operation.
>                  * When the parent_rate is 600MHz, only dividers of 8 and=
 16

> Case 2# assigned-clock-rates =3D <75000000>;
> [   12.288507] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> [   12.310528] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> [   12.318426] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> [   12.326361] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> [   12.341540] parent_rate=3D0, req-rate=3D75000000 div=3D6
> [   12.347546] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> [   12.357593] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> [   12.367148] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> [   12.418871] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> [   12.433560] parent_rate=3D0, req-rate=3D75000000 div=3D6
[...]

Thanks for checking!

> Looking at the logs I think I could optimize the code to continue when
>  parent_rate =3D=3D 0

Do you know why it gets called with parent_rate =3D=3D 0?

> Based on the above logs, would you prefer me to represent it as a
> composite clock?

Given the core code does try the various parent clocks, there is
no need to model it as a composite clock.

However, I still think you should look at the parent's divider value
(clk_fixed_factor.div) instead of at the actual clock rate, as that
may not be 600 or 800 MHz exactly (e.g. when underclocking the SoC
on a custom board using a 24 instead of a 25 MHz crystal).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
