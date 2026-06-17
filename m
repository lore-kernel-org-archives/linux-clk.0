Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AFA390200
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729142; cv=pass; b=R8+U5HaISr8bHy6XfKqrRmZzzcm3cxGIEwBpNyyh4F1Htm0yl8BInnDnbtraQVr8YRCPvbVbuQt08dWJwVeh/kcsVu5ZJJBzRVBV59OO0JN0NZ+i6jjxsL7SEVBsgZjoaNKBUttgM6bLCiAQXSXO4SeKxdNjBPkwdMNMVxvsROI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729142; c=relaxed/simple;
	bh=8a/iR0PgeZPtVkzSIzBEbGfKE8M5iGI/7dK+r7riu/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcCFeF0yidLErHkRU11U5LyDqvBhsFDVNmJssoaVJRGT74ivCnTXfaOARFfXS3W48F6pBPbF+jl8GET4RR8dfblQCAKp48JXw3Zymmmbg0ReUPhTJptLDw6CDefqOhY1HTGtAdnj2DnKNaKJkBqu+ymcU/v1lR4JzR+IhLsw93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT7t0EGd; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DT7t0EGd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-462cdb88d01so124029f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729139; cv=none;
        d=google.com; s=arc-20240605;
        b=cp5J9T7gvI1F88pQqO8Y8qJnXZNBidfIx0aD/2IjrRG+iw7WfSsHqjAJx7OZ/k4wlL
         FhSlWWe3UC1OPkT4E58VcvT6yAuQ6KzGfJ3reSoFgb3Fk4hQL1nP21CaSCM1Hd11fTKh
         yPAJAjAZaQ1a4+1ZG6aihgTNdueKXFBOgG918eXc8NFWKQLGAGvyH0g0aTfZKqsUmvTv
         yTNHSQlqwjUpUsqYUDSF0uN8W4sQJqHPdwLYioSPQiZh7SvrrHX3+u6ReP64zGUd1IU/
         34pURc5NzSoZB/FUrcduk9dun7YJa+8bSUuKnHvEc9uF8tm2QrSBTpkOPXmjrH47tcN5
         fFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        fh=HfGiR3CkQ0UgycGJYRp5kQ4+5+V7yBZOBN2HMBqAsxQ=;
        b=M6ZLjrAzfpHUW4pTqJVA/IPxD7F1EBMX3sWAtQHPY1Ovdo4+BxrDaePPRBPngr39yN
         Zf7Juwumto94p7CG2peNRAWR0a1auVGl7MmO3HVsJ/nuL4+fqOmrpkByvsh7vxQBLwOO
         we+oFY3q3NHwYUghxCk+N3bsvCsVJRbTgD/7+alxT2Vc/wbyyyLpRoUJ6sMxHXOv9MvH
         BAmF4xA9wCNpUBzw4E6Qs/m4lbL4u4u0I2s8Sf28lWQ4xDbhkmMnv2szf1PIGEcFlpF7
         LMdsZMruOESv8JhSJpIjMcHWdbcg+0MHlraXTXCCtX9q6ohBw3WOYsDDfw7fxGq5ttNB
         /wdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729139; x=1782333939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=DT7t0EGddQ6oq5WJ7ix/vWnJ7EGtcz6PvZmYmAXQKsabmw79lUMDNz5YfwKw5LLT9Y
         UH742BBlzFH3EZ2CxXyqIqjl4uEaq1v19Uhwh6olsl2PClKPSOuiBDvYirFPgxo8Nev/
         L1WnJkdp6lTyLN4Z404c0VZUkh+pp5Wfx4Swtuj0l9KFpbt7CEJz4+st0yBw9PT69Mcb
         uWz6cvL8n8hcWmU06fjEWv2gl5Tvavgnl+f3cji8fFH05wtagvLsMwSD3B9UqXcZIH42
         14XdGM1JMQ7pHQukxnZ5bREgzhMK7tWLqn6wz32dQE5eCEOTABbedjtw30DZSjMKxrGv
         5Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729139; x=1782333939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=IOnXTrr9aO4aCBxvwJwLQR2H+gAA5rm+pg85N7apriTMgpUGRaeGrW69TEC67ie8F3
         rT6SfvXg0rrB5124OHFrs7FM2Jy6c8rWjIKrk2/BiD4Vestf2tjothqoUu5VOIefe4/m
         i8hV4Z6LU3hqPA79m9XuPeOqn36AVAaaAhLNIkcCkfh7yZvemPBD7QdkN8n0xMIhYiJS
         1eUVjnBhmBVMPLyutZz2Fihkq0K8+tYghsxjHrq2mM4ZHxKGhsjcglX4ubgRAYDzBMiU
         VVObzaBV23Pc5EAps4CXnUn4Bxb2Nn/ofpzEWG+V55jHnhsM2vHhgV98oqXFsKK9B2ZS
         uvLw==
X-Forwarded-Encrypted: i=1; AFNElJ94WSIxvYOFDD9flnDNBwCxRxyBFd9+70yDfv1JAfcDBPH4bjHBTmoyrj7ptRLjyjqQLyG9NcQiNo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGYxv+AArwTg29YkSl6Q6fd+ml/MG8n38bQQoaND+LNjp016J
	fxMjngDUEMhxuikVNqmH033AYZZZdzwoLiEPMz7gk/RbFWci0Y8FYwbjKhA0tui8OLZGWjWu6XZ
	UnXYU/OBon3lR8SygxMwfUpXOGg9tZao=
X-Gm-Gg: AfdE7clnZgVahBE901/LR/iJjnKVkfm+Q66pbPEQ5XmbjfDo7iMU4VSRC5JGIDCLzZM
	ckk2Yafqgjw2TNYMqtvk9/SeM9GubD8K1CYWF2z+VDH+N2f7Y++QMxPszzsSbfGvdZyQPSpOtMw
	L+hUZiZVvvIDL7W/F+u3pqQvnAaeftD8NMNrAcgimgfF38EBbkA5eWWtToM9cNvdMlDmVKXqgxM
	5PxOblZVBFxokYM9O/0yhFxKKqoAGBD5c+nProNyj9/npo6PR7US/TzkDjK5RSWwXa/ZZrd/yFS
	AdV0Opje3b9MRGpuZCGVVkToJgB1QASjo5dTLhP4uQ4/uusByr3xbP7rZwk=
X-Received: by 2002:a05:6000:4712:b0:460:11a7:f82e with SMTP id
 ffacd0b85a97d-463968566c6mr1731610f8f.8.1781729139388; Wed, 17 Jun 2026
 13:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:45:13 +0100
X-Gm-Features: AVVi8Cdkf1jVo4kO3gd7API00mVvh1fcU6060AgvOUxLid7Szzq8x4Qi-iPfzo0
Message-ID: <CA+V-a8t9b-xi-bfBs-rp8eZOS+TM8OVLVy44S19fPFZjRKT3Lg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 11:05=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the common PLL and divider parameter calculation logic from the
> > core rzv2h-cpg driver into a standalone library file.
> >
> > Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> > rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> > rzv2h_cpg_get_pll_divs_pars().
> >
> > Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> > driver as wrappers that call into the new library helper endpoints.
> > These wrappers are maintained for this cycle because they are actively
> > referenced by the DSI driver; they will be safely removed in a subseque=
nt
> > cycle once the DSI driver is updated to use the new APIs from the libra=
ry,
> > preventing cross-subsystem build breakages.
> >
> > This restructuring allows other Renesas SoC clock drivers, such as the
> > upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> > divider mathematical logic, to share the iterative calculation helper
> > infrastructure without duplication.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const s=
truct rzv2h_pll_limits *limits
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> > +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_pars *pars, u64 freq_milli=
hz);
> > +
> > +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits=
,
> > +                                struct rzv2h_pll_div_pars *pars,
> > +                                const u8 *table, u8 table_size, u64 fr=
eq_millihz);
> > +#else
> > +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limit=
s *limits,
> > +                                         struct rzv2h_pll_pars *pars,
> > +                                         u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +
> > +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_=
limits *limits,
> > +                                              struct rzv2h_pll_div_par=
s *pars,
> > +                                              const u8 *table, u8 tabl=
e_size,
> > +                                              u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +#endif
> >  #endif
>
> What about just dropping the old functions, and adding two simple
> compatibility defines in the header file:
>
>     #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
>     #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars
>
Thats neat!

> That way there is less code to change in the next phase.
>
Agreed.

Cheers,
Prabhakar

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
>
