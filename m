Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C44E344050
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411147; cv=none; b=jWTLqgMukQWGbH1d/iHJwsy6tS6w2wYJJiUueF1QKJS5foGc7Pn09VE83EnYdeVjqgmHZTqZF8l9TDoLy/6RNxv6ZEKyIiH0xFaNGy6XmvZQVgM/n/Yl2d2B2vLosaTm5FA5TuFkq+uuEe+RVp98TVAuvVpsx7OFMfYE4MmJuaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411147; c=relaxed/simple;
	bh=cpgqiL5/LaCZUbfB8G72tgBIiB5bJI06pJUi96zR1cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTHyetOcchbpTPacx5IkD3cE3VsOCX8ksJq7jxvHivfIPFRQRTJxKwc3SO+r1uNW7sNFXd0NGCdHvr9zb+/rC0cQsuIJuxzLWGZvJVJvtOX14TAEKwAGslbtocW2PAo8EemmZMf9BOWTLF7dV06tDDHpE9uOXge+zCWHNy8LNK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZSnbNVk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZSnbNVk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b2dc17965so3842154f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763411129; x=1764015929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgjjK2XbJQUpqGGoaCrQdhUPKZGbik3QiZYNr8oO2RM=;
        b=lZSnbNVkoTUUfM/d1JAjIfjWTRFJgeRHp+L421tjgsFBm/xdvceW6KlOdF28Pps00I
         ZXZ2ITrfdpJ0dSsUGr1BTjdfkHm4f/UY5WT+yIaNfUtcGTvrMZEAjoPZjciUpDrf2wP9
         wo4N/K/11TbaKU5J/4WuNeJvqlNqLWwJRUAzLJeIL0AepBj5Wu3zRhihHF14Q/D6I0CY
         bVELwCXmL8SvO7+wNOsRc28XHvOsJdG8N5LplvyOw02iBqr3FAVIzlpMlihshTBgmxJP
         2GxWFVJ0lKKp83S0Xodf06YioZaf3rH1Dth0jyn3/F0Fo2ZeM/Ys3biLkVvEg2jAbTMX
         vmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763411129; x=1764015929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgjjK2XbJQUpqGGoaCrQdhUPKZGbik3QiZYNr8oO2RM=;
        b=CXrFuNDGNnZ2qmZKy1USbDhSpaHPYHGj90ZairtP3GR9Jm09stkh3UL3RUEBV+Kub0
         RKMukmUItdEyZFo3GFB6Xz1H4zisFOqiV3o2gukRRT7HpAwGvTqLZg3nLUECWxaY7BL4
         pMkeN2xlmGsEM8z6rupmQIpALsi4ZOK2Pk5P5m98jsw7bG0oNFjq0LFoCyEArgS2zNEj
         eEO+1oQmm45O+ku3dw3Yw+Zh1dLx7Ou+fwywOI1Svq5jfHyYbqwjfhmUMC6z9gXAG7Jz
         XaPJTKJjjcrhyDq7VD2taYLH7uK1I0pqOqAym6IyjuTZ5OXyJEnKPP1k5gYA8NaW8BIX
         jKLA==
X-Forwarded-Encrypted: i=1; AJvYcCXCNwGm327pGhN/D1rmrOB0GwKldHOYuhoXY3L9DW8GeBT1wsWsl9OLnq17b1TRaaeUutuPehPJzrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6OZ3KTzzNodLLUT4b8qctvu/c2IJBxbbiPsJRUVQ+Iq4JEnk
	tFs+VW20iqpFSPWrmSJ4x8lirJLWHbNZikAmFdSvIUekYp5TUyKK8nPwTl68i8fx/VI8s/LX/1j
	3ajoCJzknpTcZ9yeuoiF1JCBW8Ce4T6A=
X-Gm-Gg: ASbGncuXnog0lgy+12yjF2uO1GTaQotcByyRvUmoLHWBW9OXwVpB5f5xtAcHHUzvSsI
	Ee1wYYtaN/MkRso7gWZIDlEMD33IYwZ68I/gPoxsebikY7G3Biw0M0LoRN6WWRYEVQ655AWPRiP
	uaoZtvBe5bcBDOuI74TKzAL7CLsRsjZ8NsO6Xpkv189o2fdHrkZ2XsGmt4jLFvPAwhPTmamDwDs
	E6qBM/GTyYW4Ur5qm3IV0zCQZz+Lx6buS1ITStd+6fBBkW4W+pRCLd2ZBU09bzLIUsH7DFMiE70
	mI6Lby85dhTFJ3kF7QHYlj9HOw46bBnDy72fT3NABo7uMylT5NuERF0LD8CS
X-Google-Smtp-Source: AGHT+IEG+aF2dwCSgK6oB5qEOwvTBM24ZBhpeHRDai5TxbtUYEK0l2B7md0rwDsEmyVRM67U8IFhNeR262uFVjgaGM0=
X-Received: by 2002:a05:6000:1ace:b0:42b:41d3:daf1 with SMTP id
 ffacd0b85a97d-42b59377e6amr12836453f8f.38.1763411128508; Mon, 17 Nov 2025
 12:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
 <CA+V-a8sC44HeShCFdk2xwTHMdcOo+8btNh9i0hthTEUMdnhqAQ@mail.gmail.com> <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+7cvwxGVYGUd_nV3sUZ60YWzsWr_Ec6RJToPttUfKRA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 17 Nov 2025 20:25:02 +0000
X-Gm-Features: AWmQ_bnT3iDZtN9BTK7GhNdRI2SP9L9Joge1rJBp7r_hZwF1SU7_dr9fgFWwKMc
Message-ID: <CA+V-a8vWCV8UuKwTaYU7dY7nPwHiMr-6chz498BqvAfaFWisJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
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

On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 10 Nov 2025 at 22:38, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Nov 10, 2025 at 1:48=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add core clocks and module clock definitions required by the xSPI
> > > > (Expanded SPI) IP on the R9A09G077 SoC.
> > > >
> > > > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 =
and
> > > > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block use=
s
> > > > PCLKH as its bus clock (use as module clock parent) while the opera=
tion
> > > > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > > > provide mux/div selectors and divider tables for the supported
> > > > XSPI operating rates.
> > > >
> > > > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > > > where the determine_rate() callback enforces the hardware constrain=
t:
> > > > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > > > whereas for 800MHz operation the full divider set (6,8,16,32,64) ma=
y
> > > > be used. The custom determine_rate() picks the best parent/divider =
pair
> > > > to match the requested rate and programs the appropriate SCKCR fiel=
ds.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2:
> > > > - Added custom divider clock type for XSPI clocks to enforce hardwa=
re
> > > >   constraints on supported operating rates.
>
> > > > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > > > @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device =
*dev,
> > > >         return clk_hw->clk;
> > > >  }
> > > >
> > > > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw=
,
> > > > +                                                struct clk_rate_re=
quest *req)
> > > > +{
> > > > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > > > +       unsigned long parent_rate, best =3D 0, now;
> > > > +       const struct clk_div_table *clkt;
> > > > +       unsigned long rate =3D req->rate;
> > > > +       int div =3D 0;
> > > > +
> > > > +       if (!rate)
> > > > +               rate =3D 1;
> > > > +
> > > > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > > > +               parent_rate =3D clk_hw_round_rate(req->best_parent_=
hw, rate * clkt->div);
> > >
> > > I had expected the use of some *_determinate_rate_*() helper, as the
> > > parent can be changed to find a better clock rate?
> > > Perhaps you should use a composite clock for that?
>
> OK, so per your test results, the core clock code does try
> various parents.
>
> > >
> > > > +               /*
> > > > +                * DIVSELXSPIx supports 800MHz and 600MHz operation=
.
> > > > +                * When the parent_rate is 600MHz, only dividers of=
 8 and 16
> > > > +                * are supported otherwise dividers of 6, 8, 16, 32=
, 64 are supported.
> > > > +                * This check ensures that FSELXSPIx is set correct=
ly.
> > > > +                */
> > > > +               if (parent_rate =3D=3D DIVSELXSPI_RATE_600MHZ &&
> > >
> > > Does this actually work as expected? I doubt parent_rate is guarantee=
d
> > > to be exactly 600 or 800 MHz, and expect it can differ slightly due
> > > to rounding.  Hence I would look at clk_fixed_factor.div instead.
> > >
> > With below diff, Ive got the below results for the various freqs
> > requested where appropriate parent and divider clocks are picked.
> >
> > @@ -317,6 +317,7 @@ static int
> > r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> >
> >         for (clkt =3D divider->table; clkt->div; clkt++) {
> >                 parent_rate =3D clk_hw_round_rate(req->best_parent_hw,
> > rate * clkt->div);
> > +               pr_err("parent_rate=3D%lu, req-rate=3D%lu div=3D%u\n",
> > parent_rate, rate, clkt->div);
> >                 /*
> >                  * DIVSELXSPIx supports 800MHz and 600MHz operation.
> >                  * When the parent_rate is 600MHz, only dividers of 8 a=
nd 16
>
> > Case 2# assigned-clock-rates =3D <75000000>;
> > [   12.288507] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> > [   12.310528] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> > [   12.318426] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> > [   12.326361] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> > [   12.341540] parent_rate=3D0, req-rate=3D75000000 div=3D6
> > [   12.347546] parent_rate=3D800000000, req-rate=3D75000000 div=3D64
> > [   12.357593] parent_rate=3D800000000, req-rate=3D75000000 div=3D32
> > [   12.367148] parent_rate=3D800000000, req-rate=3D75000000 div=3D16
> > [   12.418871] parent_rate=3D600000000, req-rate=3D75000000 div=3D8
> > [   12.433560] parent_rate=3D0, req-rate=3D75000000 div=3D6
> [...]
>
> Thanks for checking!
>
> > Looking at the logs I think I could optimize the code to continue when
> >  parent_rate =3D=3D 0
>
> Do you know why it gets called with parent_rate =3D=3D 0?
>
When it doesnt find the best parent, parent_rate =3D=3D 0.

> > Based on the above logs, would you prefer me to represent it as a
> > composite clock?
>
> Given the core code does try the various parent clocks, there is
> no need to model it as a composite clock.
>
Ok.

> However, I still think you should look at the parent's divider value
> (clk_fixed_factor.div) instead of at the actual clock rate, as that
> may not be 600 or 800 MHz exactly (e.g. when underclocking the SoC
> on a custom board using a 24 instead of a 25 MHz crystal).
>
Ok, I will have to iterate over the parents to determine the divider value.

Cheers,
Prabhakar
