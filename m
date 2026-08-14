Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E9443E43
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710772; cv=none; b=AYGpjB/majLqCuL21BVkZ3h+IoFZBUmzGoDN3vUNgt7Jv6RHigZBHzLSs/SqRRBnCNxIgFoYAr0WG43cJg8lBDKKt7YE2CIUIWZYukmuD3ECHdtZ1Zv4aW5W9mMCpI+0j1spijmnlNyzRjC+WTBpRd5tcTPpZl5LU1OIeMupSuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710772; c=relaxed/simple;
	bh=Gm7XpMTBI9C6os8izblCzRmv3EKOG46D4FOgROjtKdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAmrRkhWMj4qkPQKr0t1LNdKz0/4OGDFkCsWbHp85n+PO/KepnJZwrUO0XIY9ypMmM1kVvEBBTVK7KqV8MeNhDzoRVUKwcXZnm8S2oOwryiJgkpp8EAbU7NtozXy0wwWdw0Fj0U3F9pTBTMrQ0NpKSqbPhRBG/feRQxwsx5x0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20363107f4so103290966b.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710769; x=1787315569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQwQJ7BuSB9LR6pXE971+6A950GIyy9ZUcXBGdW2QIc=;
        b=L6XBVkDKGJ2oyPSNtxSSinf7qacZ2Xw7QdI0m+Dsk5cAmZqamEeIrLhq48/F3cfnlk
         RJYCdLhLzTHnJ//6jJCu5Tc8DRh98eIZgoZYMd6GGvK8ChuQzaQOQZDxdkR1ETOkH8no
         fbUQKX4AFvCc6mVtSoA07SLC0BA7r/BDK0GgLs1KTY976mMOjQyLatc773y/N6G/Xne6
         OWDWVEjS3TZ1Sr/bxG6iPKCj/NhEAG8wljtBu4ENVqoVeHtDmrdJ6x9ki72tsGFWm+zk
         PbuHeEoprT+G0RHXQvUq7Dp7QK+A80Wnueviev2PlE/rBwudEyfG9BcTAoYhxAZ7pFKx
         dV6g==
X-Forwarded-Encrypted: i=1; AHgh+RoM9fSCaG4aTwHdnYBosXSGIa1q6HXvCPXlBHuDUtKaFmQRgtb7QOk2sC6rKYLWgO4f4Bq4qEVzpgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlgs7dPm6i1YgDhsNaqxzbXnigrbR9QyjqVM46M9ndINIEiFlL
	Qpkm3K7JzWK/svL+PBePJ7zCqVRgOwdrb3gVIt+ZWtSHcq8XbLV4NoHjn3cXSPhmD4o=
X-Gm-Gg: AR+sD12WiVebIxk/B4lrVhMucEqqQPLXT/vPWvWVXZZFRJ5hn3jqga4EN+IZWsdjwjH
	Slsd9QXcJW4DISS6ws/ZsUTvNGrjPfWmh7DhcxnZH9gD2LxRyNn+dz/PNOAMaRpZ2ePBhrw4v3O
	3CUKTQtN8lnkRNbxxmUdrj78v8b2kD/dQyYiX463SzEoCnPDr9S9OfzgNrJy+vIDeOEQooU531y
	qfv1yHSqTdk7iGrtPtCI/N3atDelm4E33zMPwHqw6rU2kzD7oVUiaYdklZ7AHDNiRQLaX882MzR
	CgzgRustrKmlmY/gYY/Z9jZ6u2ME3oFvcWjCqdpfK2fRcYOOIOFaVsoty5ZoZnKkRpaddhOnOKo
	yPv69HbhLzY1bLRgG1yTRzO2CEALFUq/KfWTUKBRMfjhKDMweouJJOI6pgbtkwTM1pB/APy0KsL
	Ya3ZHgpgit/VArxUi0LMh8p8qbMMeZ3e5BEPFTf1eIdhzJDmTE8hquPijuAbDLxqNE3UtTupn/c
	mB7YNddJKGgEgt53DeqG7YXFgPfm0uSGTvL
X-Received: by 2002:a17:907:7b97:b0:c15:f65a:43a8 with SMTP id a640c23a62f3a-c212a205781mr283354266b.12.1786710768964;
        Fri, 14 Aug 2026 05:32:48 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21233a1c67sm98555266b.13.2026.08.14.05.32.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:32:48 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1361984a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RotKspTZjmBFOxZhrEW7WpEL5MRvjAoUL4dSb0Vvz1BWmJBKmCvgOB6H+CUI142zbPgy+SVOOMWSHE=@vger.kernel.org
X-Received: by 2002:a05:6402:4513:b0:6a0:926e:f907 with SMTP id
 4fb4d7f45d1cf-6a38a8bea9fmr2749183a12.1.1786710768303; Fri, 14 Aug 2026
 05:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiEQw94rf7ZP_8PV8EQo3K03ioFpsxG1sh=HLJOgzQpg@mail.gmail.com>
X-Gm-Features: AUfX_mx58STpckVp6kMwxfOPKFC2_LGNIJFgER7roj-40A3WGKTSPesm0sP_dCM
Message-ID: <CAMuHMdUiEQw94rf7ZP_8PV8EQo3K03ioFpsxG1sh=HLJOgzQpg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] clk: renesas: rzg2l: Add PLL7 DSI clock support
 for RZ/G3L
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new fractional PLL clock type (CLK_TYPE_G3L_PLLDSI) for the RZ/G3L
> SoC's PLL7, which drives the DSI interface and requires a dedicated
> parameter calculation and programming sequence distinct from other PLLs i=
n
> the RZ/G2L family.
>
> PLL7 output frequency is determined by the formula:
>
>   Ffdco =3D (NIR + NFR / 4096) * (Fosc / MR)
>   Ffout =3D Ffdco / (1 << PR)
>
> where:
>   - Fosc =3D 24 MHz (oscillator input)
>   - PR in [0, 4]   (post divider, power-of-two)
>   - MR in [1, 12]  (input pre-divider)
>   - NIR in [56, 375], NFR in [0, 4095] (integer and fractional parts)
>
> The FDCO must fall within one of two valid ranges: 900=E2=80=932000 MHz
> (rangesel=3D0) or 2000=E2=80=933000 MHz (rangesel=3D1).
>
> The parameter search in rzg3l_dsi_get_pll_parameters_values() iterates
> over all valid (MR, PR) combinations, filtering by the required FPFD rang=
e
> of 8=E2=80=9316 MHz, then delegates to rzg3l_dsi_compute_pll_parameters()=
 to find
> the NIR/NFR pair that best approximates the requested rate. An exact matc=
h
> returns immediately; otherwise the combination with the smallest absolute
> frequency error is used.
>
> Computed parameters are cached in pll7_dsi_params within pll_clk to
> avoid redundant recalculation in determine_rate() when the requested
> rate has not changed.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped the macro CPG_PLL_CLK1_VAL and instead using FIELD_PREP
>    at all callsites.
>  * output_nir updated with mul_u32_u32((p->nir + 1) * MILLI, fpfd) as
>    p->nir is small.
>  * output_nfr_range updated with mul_u32_u32(fpfd, MILLI)
>  * nfr updated with div_s64  as div64_s64 is overkill
>  * mul_u32_u32(p->nir + 1, 4096) computation reused in fdco and output.
>  * Open-coded 64-by-32 division replaced with div_u64()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

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
