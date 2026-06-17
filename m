Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693D44BCA8
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692535; cv=none; b=m6fwOGlVL2q2LzEEqbVlX2A0EMWt2q31BO/C41kjBywQZaAyU7wtFwSb3+LFHPHJbrBZvjSliFnNhmSgqXjBr8k/ler9x8qMqcT6xpsNwaNsRapJNL8Y+HHa0KfjdyJPGVpd9kaNHdq221EJVqR7qKwC5ZZZ2qgpGav/M28JJqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692535; c=relaxed/simple;
	bh=9ylgy9lZAnEGisGJJ+K92s4diTRd1QMOEi60uc8E6F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOZ+otqkCXVkb6u6zCIIn1MXjt7mzF9LhnM3xWvlESqIFCCn4uPWQmgVe9f6jQEqkOIVFYZ3/FUd78bhSCqnM3f7Cf13EMIqIHEkB/2rfIw8k71FDSwUFwM30/4MY8y/GtLvCugT8JRV3S8F4AH1LZ+Vu4CZl6kc1+XJXQueiN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59cd803792aso3751758e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pgCUfOUM8Bz0qgtgoN+MxhTmTdVfQlveU2gE10ABVfs=;
        b=m+tASX08daronlxSA7Ob6TwBe+KEURi/Gb69lXIqm8oXGw/JTxbltZlJPitajDkcID
         4oyeI8BIkuGfg00AgG5id5VlPOAVes65sLXDdi0RX5/HF2dKZTdHXbiPO3OP9Ucquv7w
         HI8phE/swg1utAAZwwDUSajjS1M2PXkQgHhAbDe3CxOBSD8x1qVz/XgfJyw+gfZNWMwS
         yTA1wqq/BL2/HQbHjGjdiwzsQaw0TxCPVVGR4Rg+W0ruuJNbEU/SPbtC5rLfBh//0R6P
         hZqx+6eKvoCMPI8G8aepDLDPksG+uvZZw7hgCo/J9Bwawii4vJl+vJv7X3ViFCR9IJwF
         XEhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Yh8Uau6hUrEGDUw+5he/kMjF/xtwfyHq9GjbuWFBqrPNGxtpaAFsjtm2RzslfxRDgLCy5Nf/U4xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfwaQqMBvr7f6g6Mt8HYFlua2Llq3G+BphiutR6GAyL75ebrp
	LJ1fbO/z4gw0HOK3Tr3STF2lWDtL7VO7zhxtYlNiMKtgzeKOkopssk2xotA291Kw
X-Gm-Gg: AfdE7clgrIhye652fG1VA2I8dVNUxJe68HxC1vULuf7yo9zdo7O+tSn1lSegvcZprQm
	4EdyDjc5C0QwpI2NAeDSs8MGR+1UQVv0iu25oTkixYC3D4JZwEYMaycJnj4dGPsncS4mspKiwCB
	MUs/ztSfHKLa4bbNUNxt1sCLE/Kkx0ujgytvFJ8kCUDINdIeTceZmVuLhDlcb8MlwvA3mH17sch
	f7xe31tS8aFQjsv5zieffc+diGD0dXNMpPhVx779g7qapnvXUE0WiNS1MfWUJY1PRmADs/BlyDt
	rpdLt5i4pOFx3SZ0V++U6qPy8crC/2nwjUgjU8wIZkCiVvTnjR4VygxpRssUsBflVODV/nJOh7Y
	CybLRCb1KbaUkeE7qQo+rbpuAWN8WTrNOgygfsFUrGtzwwxS7H4Q5EKMj/3x2wYBlFzJW/EBXZW
	cv7dwZU31yREpMkjEL4GW1Zt26CPm/AxvN+jOlZyortykK/hQ/fLP3YHfQD1z5
X-Received: by 2002:a05:6122:1d48:b0:5a3:fd8c:98ae with SMTP id 71dfb90a1353d-5bbc0b20ef1mr1001097e0c.3.1781692528923;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbca9bcc34sm242371e0c.6.2026.06.17.03.35.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6c79d2bb687so3887194137.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mLEQLzdXro4zfeOtvV42bMLisuRo+tXl9brRnY7BjEangRwCXZBWvJMl5vLUkp68ELh1VTsAfqAI=@vger.kernel.org
X-Received: by 2002:a05:6102:3a07:b0:631:4e9a:ba3 with SMTP id
 ada2fe7eead31-7246d325006mr1751407137.21.1781692528474; Wed, 17 Jun 2026
 03:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260616175247.2104891-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:35:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViTA80owpdLHtRhkO8i+jEDeMbnAgW42J6=R3QnmSUNg@mail.gmail.com>
X-Gm-Features: AVVi8CdA-Rr1oirE4y8pzhWsdywdxCE34hLjlnylVEjM69RqnaDVji3Jg_h6afs
Message-ID: <CAMuHMdViTA80owpdLHtRhkO8i+jEDeMbnAgW42J6=R3QnmSUNg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a77995: Add ZG and 3DGE support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, 16 Jun 2026 at 19:53, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG and 3DGE clocks needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Fix the ZG parent and clock divider are not fixed, but configurable
>   through the FRQCRB.ZGFC register bit field

Thanks for the update!

> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] _=
_initconst =3D {
>         /* Core Clock Outputs */
>         DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D3,     2, 1),
>         DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
> +       DEF_GEN3_Z("zg",       R8A77995_CLK_ZG,    CLK_TYPE_GEN3_ZG, CLK_=
PLL0D3, 1, 24),

You cannot use the existing CLK_TYPE_GEN3_ZG for R-Car D3 (and E3),
as the FRQCRB.ZGFC register bit field does not configure not a simple
linear divider, but selects between multiple parents and divider values.

>         DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
>         DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
>         DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),

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
