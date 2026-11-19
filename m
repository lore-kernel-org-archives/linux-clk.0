Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795118767;
	b=RuBFvi5e9K74GeGzsNsSStix+1XhpvVSPMWGebkJD65OU+nZE/o6sE6ynLgNL1POxHF7
	 EZf+q2UMCIrNc2IgoyaNnLCK5T3YIBYKpgagurKjHp8XUvVklbBT33jEszFO5JaRpx774
	 wWyCXXYx/sJKYUzZnLhCjrLgONHA+L8jllZaTlGChsnsiro5humk6onRdEpaGssD1hZoy
	 bNJ7YSn6ibneF5Toz4KMFFDpn0UP4lvRjNIHGHEj7jbDR51Yzx2GSOGFiVSF/TgOZR5+B
	 jYGIBj9tWk/xhT1f82OTkzFVGY5tg3cSAtr0VTjYLIvbNAXpT3jP5zj+34CYqV7si5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8yAe18DcMYptqjKtSLkA6vTdr+cVBbQE0DdJOkjSKyc=;
	b=dWtbyzx5YzaL1J2wpevc+ozYiuK4dBVbe4tdUrnKy3XEnz4frm9XSzV96ApKh7IzouXl
	 jIqqluo9EQd1KYY8hBt5BPSKCzsT+5p+RfdVxMBqrVpEty3QMh7jIrMduAL4d38B5bc0x
	 XNccSLPYYbFX5TehxFRhcx/I9+Zl8HTKJ4DOtuv9oXm3Onrx2qrrNrAM+pKg+f2TvAA0d
	 edOD8icYGhyu11ZwznncgMvGwt20lZkMGJgdEF7azi6Yb34GNTepJtUULIwW3KBhRspLT
	 PTa/B3aTybE3h3+ACcyBD1T20eTftYhUERR2BeMDpxQebOGHWJ0BiK2fRnkhWDNJDnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw86n4F9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B4606A320
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 20:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hw86n4F9
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-921159376efso2504496d6.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 12:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795118766; cv=none;
        d=google.com; s=arc-20260327;
        b=eNiFmBEosVxL3vRhJivqNOMwsm/rpAQIgrliJEDBwFllBr+E+e1jYnkrIuMBFA1uFW
         tNMZs+ve9L31W5uso4QfV8jk3HX5WBIKTInE+YsbZ/pD1Z8Vscq5iRBG/WIzWci+KZIj
         BcwiOQhFJQQr9axb6NhgwThqaby4t2uqP7NgGDjNllH9RJ5gVyRqpICsWw5JDlchAs2r
         UoBL7LHiaCyh5kFyAMyIc90RvmR5mkZ624Nskg5l1HPDdz7t+7ydaKNl4O4XbTftZT3y
         L77m2fhn0yWPGaTgEfg0j8K2q7Y7YAMcXTRkCnTSuMbhuoQ9uHypqbz/xAUpzS5ndj66
         P1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8yAe18DcMYptqjKtSLkA6vTdr+cVBbQE0DdJOkjSKyc=;
        fh=+wgDB9EoPW8fV/BX2VTCBot1LxfZzEDzsS46ROdVveY=;
        b=Dnq7xP3HiDiXaLJLi4Q16TZ7JuO2HO3PShTPLxg7n0l2082G0eS56rgo1VBxW0yUms
         mOItfz/qbO6+eFhcs9TVSy6eyOOcXRvNMmBf8H1eQt/GeycACpyYxpavNMPIufYpfcfM
         fS+Qg0DuOq5uEEW4YKhcrk7h4Fq7yM+PNlhFKsZzkVdYLh5yfwiChlpb1EHg/R3bGPHu
         sRKdcCeLjKI1aAszeKSTNp/4a8Ydmu2L3xBT7FnLvlnCzDyPv9scdly2ewcN/HKu7RVD
         Te6q/VfXvzIv7FnoCixnIXfAEFwNELfEU9NVAWIJDtrcCOb+Yy6lFmuN7cdaIIiXNU4H
         6ZWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118766; x=1795723566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yAe18DcMYptqjKtSLkA6vTdr+cVBbQE0DdJOkjSKyc=;
        b=Hw86n4F9yGfKqjD1wUCKPG6w96WUeavPt7HMolTqh4d4o4Gkc4uzk3prdTZUCdlp6V
         YNKre6o8CTYSA7Z1sbj+FAZ+cwhWo4xZ8llhSjFiKugxOYujY1q357jQqUJYY/6Lns5K
         Tgk/CCCy0fi77CPAIU0cZVR3fFTatituX6R4+s1YJNRARRnn9LJmormSwzC3z7mfdsAt
         KrYOky3FF8OzRTF51y6A17jGXicy38rBR7b+5TSeCZCwYpO1U6+N/ZgRsOkZjNAa7IZl
         +sZM2dNMJ14sj+NVvo/SPyqZsxaatnIvOU8Ux1rYF4gy1220H5Ki7+kz3Pfn2/AYlXfz
         O8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118766; x=1795723566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yAe18DcMYptqjKtSLkA6vTdr+cVBbQE0DdJOkjSKyc=;
        b=V+oran+Be1QkqgTxonLAfIaRhWIhIV1vs48/MrysxwP/uJqW1fscgy/ou6ih6CSCz0
         ac9wP4Iyd6l53kDl2tn6OOL6IixpC+mwd2E+Z9rYJzyvCNHAzJu3cAKeVvQJVF5k8YaX
         FE1BeAicSNCZF56/fy8F/j4oFrqQgzbSqnnRhCV8Ybs0mPMJkoOa5/RJtorwprzHiB+E
         TJ6WHWUUtXe/uo7xeWGbMko9nlmuQ+idd5G010L1SFxpHl9dddtRjZ4u+YJpkm3FpJ3T
         4TeTJxTCOfrsEEGZwnBj7eVId/VgwivYluldMEI+I+CEQtDR+F+nkZ+B7y4TFeiSmXDt
         CHGw==
X-Forwarded-Encrypted: i=1; AL+hErGe+ydv7gCRZZU04Gl+rXK+w4BSEeXfRVCtr2RDgsgRGGcWOv3xWG4v51wU1+gQ74pGLA/TryRnE6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t/5IVzz59CL3TfKdBWfP0Z8SGmkaBLp0Wz8eijfUbLr1d4SvW
	GdyXMjiNCqFTV6FniGPiwIzVY7QI/fe9z2UAnanvgN7UFprtG8Ewp2jzWV3GlXMnhJiaHeiHwur
	XcQe+EO1S6X7m8vLbepQ/XYSwTI+IMC8=
X-Gm-Gg: AZFdTZd4cWBeF62XXou7bMWlQU9f+3aFZCiBEt9qZSoPD8UUFJxg6SF4jPNQIr/2hLU
	RRGIYsHdiW4ZXqIyPGoO6TdRUwyTdbdQWGUDdxau3jJN6VR7o42HdmeShnrP8L4+sosEx42xLZ7
	oYVetMh1xdkkLtfcChHCCWScegNn13PEmDN/jLNfZj7X07osWJeYGbLue854okSvcEHAS4XqaMP
	Lh8XvQ8Z8BHPqyC7M3b4hb0kJW+TOqamVKDg0Fbts0MwA74z8hBh/QojDTIDtZ2c1qUqZ0wRyiJ
	tQ1uwHxwiPbUqty5AWBfBvZSoKGrOMnbYZP1iub9Dx6YkOiIrGSBiWx3yrGyW/shpApxC/OxVuF
	tIXhCW22Ns4MeaTf8GNtfcmlAQb4uCpITdz2FWq03xStvTviwygA72ZrdXtyRLcG3LVbC6Q44Ff
	I/CBBi
X-Received: by 2002:a0c:f00f:0:b0:921:1150:b15 with SMTP id
 6a1803df08f44-92134b496c9mr9729666d6.52.1795118765460; Thu, 19 Nov 2026
 12:06:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180213.88046-1-ansuelsmth@gmail.com> <20261117180213.88046-3-ansuelsmth@gmail.com>
 <179511794323.284394.3927169878877033939.b4-review@b4>
In-Reply-To: <179511794323.284394.3927169878877033939.b4-review@b4>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 21:05:53 +0100
X-Gm-Features: AclHuK9qlitOVW5yb6rsTEqXXz93pycPG8hagb9iwC3jGaqvuUap176WHaqx3MM
Message-ID: <CA+_ehUxpNk-2goT22GB5Tx0+NNhHR=c+1VpriaX8D+Q6kbK3dw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] clk: en7523: add support for .set_rate for en7581
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 19 nov 2026 alle ore 20:52 Brian Masney
<masneyb@kernel.org> ha scritto:
>
> Hi Christian,
>
> > Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
> > The SoC expose both base clock selector and clock divisor hence it's
> > possible to change the rate.
> >
> > This will be especially needed for new SoC AN7583 that require changes
> > for the MDIO and the eMMC.
> >
> > The clock were assumed correctly configured by the bootloader but this
> > goes against the rule of "kernel should not depend on external
> > configuration".
> >
> > To support the use of standard clock divider API, clock_div_table are added
> > where needed (BUS, SPI and SLIC) in additionl to the previous info to
> > derive and simulate the clock from the divisor registers.
> >
> > Recalc rate for Airoha EN7581 is updated to use the divider_recalc_rate API
> > for consistency with .set_rate and .determine_rate.
> >
> > en7523_get_div() is updated to use the div table to drop redundant values.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 322 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 288 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 634e75348c71..2bbc1e71fa2d 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -116,9 +116,7 @@ struct en_clk_desc {
> >       u16 div_reg;
> >       u8 div_bits;
> >       u8 div_shift;
> > -     u16 div_val0;
> > -     u8 div_step;
> > -     u8 div_offset;
> > +     const struct clk_div_table *div_table;
> >  };
> >
> >  struct en_clk_gate {
> > @@ -161,7 +159,88 @@ struct en_clk_soc_data {
> >  static const u32 gsw_base[] = { 400000000, 500000000 };
> >  static const u32 emi_base[] = { 333000000, 400000000 };
> >  static const u32 bus_base[] = { 500000000, 540000000 };
> > +/* From documentation divisor 1 is n/a */
> > +static const struct clk_div_table bus_div[] = {
> > +     { .val = 1, .div = 2 },
> > +     { .val = 2, .div = 3 },
> > +     { .val = 3, .div = 4 },
> > +     { .val = 4, .div = 5 },
> > +     { .val = 5, .div = 6 },
> > +     { .val = 6, .div = 7 },
> > +     { .val = 7, .div = 8 },
> > +     { /* sentinel */ }
> > +};
> >  static const u32 slic_base[] = { 100000000, 3125000 };
> > +static const struct clk_div_table slic_div[] = {
> > +     { .val = 0, .div = 20 },
> > +     { .val = 1, .div = 2 },
> > +     { .val = 2, .div = 4 },
> > +     { .val = 3, .div = 6 },
> > +     { .val = 4, .div = 8 },
> > +     { .val = 5, .div = 10 },
> > +     { .val = 6, .div = 12 },
> > +     { .val = 7, .div = 14 },
> > +     { .val = 8, .div = 16 },
> > +     { .val = 9, .div = 18 },
> > +     { .val = 10, .div = 20 },
> > +     { .val = 11, .div = 22 },
> > +     { .val = 12, .div = 24 },
> > +     { .val = 13, .div = 26 },
> > +     { .val = 14, .div = 28 },
> > +     { .val = 15, .div = 30 },
> > +     { .val = 16, .div = 32 },
> > +     { .val = 17, .div = 34 },
> > +     { .val = 18, .div = 36 },
> > +     { .val = 19, .div = 38 },
> > +     { .val = 20, .div = 40 },
> > +     { .val = 21, .div = 42 },
> > +     { .val = 22, .div = 44 },
> > +     { .val = 23, .div = 46 },
> > +     { .val = 24, .div = 48 },
> > +     { .val = 25, .div = 50 },
> > +     { .val = 26, .div = 52 },
> > +     { .val = 27, .div = 54 },
> > +     { .val = 28, .div = 56 },
> > +     { .val = 29, .div = 58 },
> > +     { .val = 30, .div = 60 },
> > +     { .val = 31, .div = 62 },
> > +     { /* sentinel */ }
> > +};
> > +static const struct clk_div_table spi_div[] = {
> > +     { .val = 0, .div = 40 },
> > +     { .val = 1, .div = 2 },
> > +     { .val = 2, .div = 4 },
> > +     { .val = 3, .div = 6 },
> > +     { .val = 4, .div = 8 },
> > +     { .val = 5, .div = 10 },
> > +     { .val = 6, .div = 12 },
> > +     { .val = 7, .div = 14 },
> > +     { .val = 8, .div = 16 },
> > +     { .val = 9, .div = 18 },
> > +     { .val = 10, .div = 20 },
> > +     { .val = 11, .div = 22 },
> > +     { .val = 12, .div = 24 },
> > +     { .val = 13, .div = 26 },
> > +     { .val = 14, .div = 28 },
> > +     { .val = 15, .div = 30 },
> > +     { .val = 16, .div = 32 },
> > +     { .val = 17, .div = 34 },
> > +     { .val = 18, .div = 36 },
> > +     { .val = 19, .div = 38 },
> > +     { .val = 20, .div = 40 },
> > +     { .val = 21, .div = 42 },
> > +     { .val = 22, .div = 44 },
> > +     { .val = 23, .div = 46 },
> > +     { .val = 24, .div = 48 },
> > +     { .val = 25, .div = 50 },
> > +     { .val = 26, .div = 52 },
> > +     { .val = 27, .div = 54 },
> > +     { .val = 28, .div = 56 },
> > +     { .val = 29, .div = 58 },
> > +     { .val = 30, .div = 60 },
> > +     { .val = 31, .div = 62 },
> > +     { /* sentinel */ }
> > +};
> >  static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
> >  /* EN7581 */
> >  static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
> > @@ -185,8 +264,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_EMI,
> >               .name = "emi",
> > @@ -199,8 +276,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_BUS,
> >               .name = "bus",
> > @@ -213,8 +288,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> > +             .div_table = bus_div,
> >       }, {
> >               .id = EN7523_CLK_SLIC,
> >               .name = "slic",
> > @@ -228,8 +302,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >               .div_reg = REG_SPI_CLK_DIV_SEL,
> >               .div_bits = 5,
> >               .div_shift = 24,
> > -             .div_val0 = 20,
> > -             .div_step = 2,
> > +             .div_table = slic_div,
> >       }, {
> >               .id = EN7523_CLK_SPI,
> >               .name = "spi",
> > @@ -240,8 +313,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >
> >               .div_bits = 5,
> >               .div_shift = 8,
> > -             .div_val0 = 40,
> > -             .div_step = 2,
> > +             .div_table = spi_div,
> >       }, {
> >               .id = EN7523_CLK_NPU,
> >               .name = "npu",
> > @@ -254,8 +326,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_CRYPTO,
> >               .name = "crypto",
> > @@ -281,8 +351,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_EMI,
> >               .name = "emi",
> > @@ -295,8 +363,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_BUS,
> >               .name = "bus",
> > @@ -309,8 +375,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> > +             .div_table = bus_div,
> >       }, {
> >               .id = EN7523_CLK_SLIC,
> >               .name = "slic",
> > @@ -324,8 +389,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >               .div_reg = REG_SPI_CLK_DIV_SEL,
> >               .div_bits = 5,
> >               .div_shift = 24,
> > -             .div_val0 = 20,
> > -             .div_step = 2,
> > +             .div_table = slic_div,
> >       }, {
> >               .id = EN7523_CLK_SPI,
> >               .name = "spi",
> > @@ -336,8 +400,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >
> >               .div_bits = 5,
> >               .div_shift = 8,
> > -             .div_val0 = 40,
> > -             .div_step = 2,
> > +             .div_table = spi_div,
> >       }, {
> >               .id = EN7523_CLK_NPU,
> >               .name = "npu",
> > @@ -350,8 +413,6 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >
> >               .div_bits = 3,
> >               .div_shift = 0,
> > -             .div_step = 1,
> > -             .div_offset = 1,
> >       }, {
> >               .id = EN7523_CLK_CRYPTO,
> >               .name = "crypto",
> > @@ -568,16 +629,20 @@ static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
> >
> >  static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
> >  {
> > -     if (!desc->div_bits)
> > -             return 1;
> > +     const struct clk_div_table *clkt;
> >
> >       val >>= desc->div_shift;
> >       val &= (1 << desc->div_bits) - 1;
> >
> > -     if (!val && desc->div_val0)
> > -             return desc->div_val0;
> > +     if (desc->div_table) {
> > +             for (clkt = desc->div_table; clkt->div; clkt++)
> > +                     if (clkt->val == val)
> > +                             return clkt->div;
> >
> > -     return (val + desc->div_offset) * desc->div_step;
> > +             return 0;
> > +     }
> > +
> > +     return val + 1;
> >  }
> >
> >  static int en7523_pci_is_enabled(struct clk_hw *hw)
> > @@ -708,10 +773,18 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
> >               const struct en_clk_desc *desc = &en7523_base_clks[i];
> >               u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> >               u32 val = readl(base + desc->base_reg);
> > +             u32 div;
> >
> >               rate = en7523_get_base_rate(desc, val);
> > +
> >               val = readl(base + reg);
> > -             rate /= en7523_get_div(desc, val);
> > +             if (desc->div_bits) {
> > +                     div = en7523_get_div(desc, val);
> > +                     if (!div)
> > +                             continue;
> > +
> > +                     rate /= div;
> > +             }
> >
> >               hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
> >               if (IS_ERR(hw)) {
> > @@ -774,11 +847,192 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> >               return 0;
> >       }
> >
> > -     return rate / en7523_get_div(desc, val);
> > +     if (desc->div_bits) {
> > +             val >>= desc->div_shift;
> > +             val &= (1 << desc->div_bits) - 1;
> > +
> > +             rate = divider_recalc_rate(hw, rate, val,
> > +                                        desc->div_table, 0,
> > +                                        desc->div_bits);
>
> You can combine these into two lines.
>
> > +     }
> > +
> > +     return rate;
> > +}
> > +
> > +/*
> > + * Simulate rate with every divisor supported
> > + * 1. Search the divisor for the requested rate
> > + * 2. Simulate the final rate with the new divisor
> > + */
> > +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> > +                                          unsigned long rate,
> > +                                          unsigned long parent_rate,
> > +                                          const struct en_clk_desc *desc,
> > +                                          int *div_val)
> > +{
> > +     *div_val = divider_get_val(rate, parent_rate, desc->div_table,
> > +                                desc->div_bits, 0);
>
> I think you should use divider_determine_rate instead for the rounding.
>

For v7 I have a better implementation but for the set_rate I will still use
this version that doesn't round rate...

Tell me If I'm wrong but it's determine_rate that round the rate.
set_rate should only set the rate based on the req->rate value. Right?

> > +     if (*div_val < 0)
> > +             return 0;
> > +
> > +     return divider_recalc_rate(hw, parent_rate, *div_val,
> > +                                desc->div_table, 0,
> > +                                desc->div_bits);
> > +}
> > +
> > +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> > +                                 const struct en_clk_desc *desc,
> > +                                 unsigned long rate,
> > +                                 u32 *base_val, u32 *div_val)
> > +{
> > +     struct device *dev = clk_hw_get_dev(hw);
> > +     unsigned long parent_rate, tmp_rate;
> > +     int tmp_base_val = 0;
> > +     int tmp_div_val = 0;
>
> The two int lines can be combined.
>
> > +
> > +     if (!rate || (!desc->base_bits && !desc->div_bits))
> > +             return -EINVAL;
> > +
> > +     if (!desc->base_bits) {
> > +             parent_rate = desc->base_value;
> > +
> > +             tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
> > +                                                desc, &tmp_div_val);
> > +
> > +             /* Matching clock found */
> > +             if (tmp_rate == rate)
> > +                     goto exit;
> > +     }
> > +
> > +     /* Search requested rate with every matching base rate + divisor */
> > +     for (; tmp_base_val < desc->n_base_values; tmp_base_val++) {
> > +             parent_rate = desc->base_values[tmp_base_val];
> > +             tmp_rate = parent_rate;
> > +
> > +             if (desc->div_bits)
> > +                     tmp_rate = en7581_get_div_for_rate(hw, rate, parent_rate,
> > +                                                        desc, &tmp_div_val);
> > +
> > +             /* Matching clock found */
> > +             if (tmp_rate == rate)
> > +                     break;
> > +     }
> > +
> > +     /* Impossible, should be validated by determine rate */
> > +     if (tmp_base_val >= desc->n_base_values) {
> > +             dev_err(dev, "Invalid rate for clock %s\n",
> > +                     desc->name);
> > +             return -EINVAL;
> > +     }
> > +
> > +exit:
> > +     *base_val = tmp_base_val;
> > +     *div_val = tmp_div_val;
> > +
> > +     return 0;
> > +}
> > +
> > +static void en7581_find_best_rate(struct clk_hw *hw, struct clk_rate_request *req,
> > +                               const struct en_clk_desc *desc,
> > +                               unsigned long parent_rate,
> > +                               unsigned long requested_rate,
> > +                               unsigned long *best_diff)
> > +{
> > +     unsigned long tmp_rate, diff;
> > +     int tmp_div_val;
> > +
> > +     tmp_rate = parent_rate;
> > +     if (desc->div_bits)
> > +             tmp_rate = en7581_get_div_for_rate(hw, requested_rate, parent_rate,
> > +                                                desc, &tmp_div_val);
> > +
> > +     if (!tmp_rate || tmp_rate < req->min_rate ||
> > +         tmp_rate > req->max_rate)
> > +             return;
> > +
> > +     diff = abs_diff(requested_rate, tmp_rate);
> > +     if (diff < *best_diff) {
> > +             *best_diff = diff;
> > +             req->rate = tmp_rate;
> > +     }
> > +}
> > +
> > +static int en7581_determine_rate(struct clk_hw *hw,
> > +                              struct clk_rate_request *req)
> > +{
> > +     struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> > +     const struct en_clk_desc *desc = en_clk->desc;
> > +     unsigned long best_diff = ULONG_MAX;
> > +     unsigned long rate = req->rate;
> > +     int tmp_base_val = 0;
> > +
> > +     if (!rate || (!desc->base_bits && !desc->div_bits))
> > +             return -EINVAL;
> > +
> > +     if (!desc->base_bits) {
> > +             en7581_find_best_rate(hw, req, desc, desc->base_value,
> > +                                   rate, &best_diff);
> > +             goto exit;
> > +     }
> > +
> > +     for (; tmp_base_val < desc->n_base_values; tmp_base_val++)
> > +             en7581_find_best_rate(hw, req, desc,
> > +                                   desc->base_values[tmp_base_val],
> > +                                   rate, &best_diff);
> > +
> > +exit:
> > +     return best_diff == ULONG_MAX ? -EINVAL : 0;
> > +}
> > +
> > +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                        unsigned long parent_rate)
> > +{
> > +     struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> > +     const struct en_clk_desc *desc = en_clk->desc;
> > +     struct device *dev = clk_hw_get_dev(hw);
> > +     struct regmap *map = en_clk->map;
> > +     u32 base_val, div_val;
> > +     u32 reg, val, mask;
>
> The u32 lines can be combined.
>
> Brian
>
> --
> Brian Masney <masneyb@kernel.org>
