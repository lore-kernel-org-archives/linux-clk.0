Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCCE2857CC
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344977; cv=none; b=K6DT6Bs+vTgnSKmN6sGP80QruFdaJdKv8B+KHInk7grmUuZxOa+OayQbtWT8kbjj3ij/BY2INaYSA+7ymev05GmPN9pOJP7hR28oI0F3NijorZqdc9aueRGcdl+gulwUlp8PwNmCD3rhv3at4tYw8JZ2p3vq8M8PqBucpxOuGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344977; c=relaxed/simple;
	bh=/s1RSE8T94ukLF8gyrvHmN7vQg+U8Jmkrx6H9/OZWAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtrNT6RqcqRnx0IGGunZhr5+S/3r9yHkRxvFbMQ9kqzhmYOF8fnZEbPQuFxMoeWVJAQ4jIDjub3Gy/GxGkZVZ/NLhGWY0u7XGf+9NIVkx3JTeojGXLYH7TDLp8fDvpRFOc1zcVH0n0zT20uR7amJohtz83XTrYuffZ+pGy4cTDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN+VI4Wu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN+VI4Wu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD22C4AF09
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771344977;
	bh=/s1RSE8T94ukLF8gyrvHmN7vQg+U8Jmkrx6H9/OZWAs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nN+VI4WuCOwe4QC38vIXqvsap416Euw1liNmCKOikP7ZhCBV00LmzuDodGJ12Ppfy
	 6RZoPYAIKoT8hCorpQlDODkmFQa6vY3P97n4WM9cf0FazkUpVuTsQVEaq9sRVMDCnS
	 JiZvk5ey6/F7UU0BWXXJo9oZJxVAxHiknvlrflbtBaHCMJuAlauBt/1u0P1X7G5jBF
	 OgOF5DNRPSGiTyE/alg8vG5ILSM8BJehojRd0cxPYHlnil8+ppOG9xVYGUqyiBd7pe
	 r87ZeFIghE4NSSpSuBaaSsH1PzNVCM2qddK1OoUKDPh6dSCBBC9Voif6oAiVO7ZrDd
	 xtIRbYsF6wYyw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38709888abeso34492381fa.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 08:16:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYICxGRaKNe0/TmymRT/RgNggVBu3TU+hC66uyNkSM2gZsuIgKETvfsLPPDkk0wXr++lrjS35Dq58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwItyCb+R9NorEa6CER4Panf+FM+WMVbYNbaVuDc17aRQ5KVKvA
	/t1i0NWUgl/UD8V7qau1onKM7qLECuZkqc+51jL9uapEfq+ZTNdB0VNLCWwCTyRe5FCczhWNXXl
	zrVaqLGU/xq7jDoq9AigCftK7ebfU/tM=
X-Received: by 2002:a05:651c:4201:b0:386:1ce2:11a9 with SMTP id
 38308e7fff4ca-38810570e54mr43358761fa.23.1771344975457; Tue, 17 Feb 2026
 08:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217093004.3239051-1-wens@kernel.org> <20260217155717.0b99c310@orionap.fritz.box>
In-Reply-To: <20260217155717.0b99c310@orionap.fritz.box>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 00:16:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65tO56=7pJtaB8WaW8O9A9m0EGa_XLW_Jj-HN8pEHtvEg@mail.gmail.com>
X-Gm-Features: AaiRm53DUWoECi_d8aGElFwN4vbWdscHSmspOWe2xrny_hmVpKJsk2TliQhvzuw
Message-ID: <CAGb2v65tO56=7pJtaB8WaW8O9A9m0EGa_XLW_Jj-HN8pEHtvEg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 11:57=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 17 Feb 2026 17:30:03 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi,
>
> > When the PRCM clk driver was added, somehow the r-spi module clock
> > was skipped over.
> >
> > Add it so that r-spi can actually work.
>
> The patch itself looks fine, compared against the manual, so for that:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> But I noticed one thing below....
>
> > Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM=
 CCU")
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523-r.c
> > index 0339c4af0fe5..db0e36d8838e 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> > @@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "=
r-pwmctrl",
> >  static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
> >                        &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
> >
> > -/* SPI clock is /M/N (same as new MMC?) */
>
> Ooops, looks like I saw that clock, but someone managed to dodge it :-(
> Sorry about that.
>
> > +static const struct clk_parent_data r_spi_parents[] =3D {
> > +     { .fw_name =3D "hosc" },
> > +     { .fw_name =3D "pll-periph" },
> > +     { .name =3D "pll-periph0-300M" },
> > +     { .name =3D "pll-periph1-300M" },
> > +     { .name =3D "pll-audio" },
>
> Looking a bit closer, all the PRCM PLL-AUDIO clocks in the manual refer t=
o
> AUDIO1PLL4X, which is provided by the MCU CCU, not AUDIO0PLL4X provided b=
y

That's weird though, given that pll-audio1 only has /2 and /5 outputs.

The BSP code from https://github.com/radxa/allwinner-bsp.git also shows
pll-audio0-4x as the parent for the r_spi module clock. It does show
pll-audio1-4x as the parent for the ahbs clock, but "pll-audio1-4x" is
nowhere to be found.

So I think it's an error. Moreover, I think we might have discussed this
on IRC at the time?

> the main CCU. So we would need to change the DT? I wonder if that breaks
> boots with kernels which didn't know the MCU CCU yet (v6.15-v6.17)?

Did you mean new DT with old kernel? I think we don't really support that?

But even if you did do that, AFAIK the clk parent resolution is done
opportunistically, so if this one is missing, it would be fine as long
as no user is directly trying to select it with clk_set_parent(); and
even if they did, it would probably fail?

I could be wrong though.


Anyway, thanks for being thorough.


ChenYu

> Cheers,
> Andre.
>
> > +};
> > +static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0=
x150,
> > +                               0, 5,         /* M */
> > +                               8, 5,         /* P */
> > +                               24, 3,        /* mux */
> > +                               BIT(31),      /* gate */
> > +                               0);
> >  static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
> >                        &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
> > +
> >  static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
> >                        &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
> >  static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
> > @@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] =
=3D {
> >       &bus_r_twd_clk.common,
> >       &r_pwmctrl_clk.common,
> >       &bus_r_pwmctrl_clk.common,
> > +     &r_spi_clk.common,
> >       &bus_r_spi_clk.common,
> >       &bus_r_spinlock_clk.common,
> >       &bus_r_msgbox_clk.common,
> > @@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_=
clks =3D {
> >               [CLK_BUS_R_TWD]         =3D &bus_r_twd_clk.common.hw,
> >               [CLK_R_PWMCTRL]         =3D &r_pwmctrl_clk.common.hw,
> >               [CLK_BUS_R_PWMCTRL]     =3D &bus_r_pwmctrl_clk.common.hw,
> > +             [CLK_R_SPI]             =3D &r_spi_clk.common.hw,
> >               [CLK_BUS_R_SPI]         =3D &bus_r_spi_clk.common.hw,
> >               [CLK_BUS_R_SPINLOCK]    =3D &bus_r_spinlock_clk.common.hw=
,
> >               [CLK_BUS_R_MSGBOX]      =3D &bus_r_msgbox_clk.common.hw,
>
>
