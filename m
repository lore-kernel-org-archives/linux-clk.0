Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8F3D1CDB
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670705; cv=pass; b=ehgKbDHZkRL/I7ItKysSBnHK/j7S/7ZukyiBt95HN2U3kI2r7BNH0Qf+vBHBfFq4nRJoQDkqnxBiJo3TDElP8YJ9ViofLd67W+TPRcjW08SZ1dgwOfDIXSq86t5NjEFRvjatRI6KAa01vnXngrbabWfj5IkmC6yi2nTEHXSiCTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670705; c=relaxed/simple;
	bh=V99FgU+T9GXepKQjZbwcvobP8EXHRxrvdmdHmWGWLss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d99rhLC6TV1+S7we2w5PESp7nAnasggH7/PANfjpcAJ7R7yC6xkIKMSy+Dp8kAy9Z/IqhZspdFhPqhp5PDlbiInBpV0aZwoJdVW6sBqsnKD0bR3XcU3WqrVAf9RLyG7XWq1+EpOBtT0k3FGvav4cD7y+iVNoOUzofZvgAhQmbsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDEG+Jds; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDEG+Jds"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bec43ee8ff0so291156666b.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670700; cv=none;
        d=google.com; s=arc-20240605;
        b=HMqIy3qMkPo/+4ymNEBzQ79VhJlYxdUVjb3qgc63RlKztTbhFG34LuxXnsNxUF3LYL
         v7ALkUv7lc9rvLSQHCOHVOsFd5y5EESVg6Z0h7m/5oSq+wKmYELr5+TwXgo2n4Fm/bcf
         AS7yX+QjFyr7ugWlSmwX+X6iCs5pBSH6Vxg7vvKK9QrXJB03IBaabQRacMmIBSeHD4LN
         SU1vh9fcNzCW/ANqLBDu6Ky8X5CiKkV7XB05kmE5+ASwtAAw0PxXkSMFpdm4cGsR+hxF
         69hFy/rnEaFGgHly/uXcTJF4bQj3WyNYtkKL8VuOAJUslXWW8nNvVYr1PRnzjAmoszZY
         Ir6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        fh=t7nb3GRh+YXAMf8fJgD6Jwn7viKGt0pPZph4UrkWomo=;
        b=aIQs8yvbjYqe8t/pIDVfiI/zKu2qN2Dp3B/1mE2BlfUHXsoBN414rh//mvhFOZBacy
         CpHLBZGZgnTJNxQZHna/Ein0Hgn+FYTiOimpQWoz5Y+Djywf6u49aeK1obl8I0SdUjZ5
         qioM9x1r9PotIl/uudd6A6EJwgVUQTBkAqQOPD6tT1VRxdWiLl8NDMY20mP07yqQELu4
         eboVzaoi5kPMHvk+RRwPvMV4rxyc9XoFWEbvaFw/xeMAbY5D7FTDitSo4durmBiMYzp9
         uOomMy0W5MLws2tYype75HRZvM5kNRu6dtOJE23FKQGfEbme7Lo8ecph8guq1CN41GM7
         0ZiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670700; x=1781275500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=QDEG+JdsCi/nGhsGKHWrmakZCAAAKH94mJTgHAZsugCteBQLJ25F//75ar+srWpCPd
         4A44v/U3CUW6nqTQRd/qKB+M+kFmeYbE9+nlRqymKwDmadGXMH6dBGJmZdWsAmVxrAT7
         KQDiapY7mTQSL0SPpNNwC/gfnu5wSLuXrg8ImJufJh/kr6HXBKRo/DFW97P7T+zTTvvH
         TkDi9uk8k2lvgiv36m4CuHV0WEy+hy7MPDtcbXT2e8UbponLrOXhgjoSA2oV1gzmuamT
         4TGt6CiJV/ngqyzr6vxhrNQYyd/D0/IeX/v+xbt9Emomtg/Slf1iJYdzIdejRULLkKiu
         rlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670700; x=1781275500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=tCe4byrD0uHsD/itS4l8dfSFnJb9wo8ckMqZMgEkFmF0SVogit2NNNA4PhgB9vwck+
         2HQP2hwbZFHEJ2Rvq7nS2O+8EFHxxmCrcJZ0YhK7zNw1QvuWeoLrj+GgilHneHHJPD20
         e4NuHmZtLE+oLVslHA1e9iRhyHszbuoCJdnwT52Hmfv1Rov4VVspeHV/ULhlSW6rFSMv
         +dFYLq+wcXsoKvUJr8Q7GsdkQ4YO2IM2vTAz8CRRGcIdy6u7Khq+XaNKR9WgpkMeH8PS
         v9a2ZJwnvFc2BW3zSI+Ze9tnFALt8VFt2OOFiY1sTVJd7dQUQ8vkce/5uTCLw0Y41WDq
         4xaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pM3++bxfJkJFk1uhESg8KU/jg/JiFAEscCKvGP38obhKcl0dkLZTmcV06H5sARXv0l8l0cog7X0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhG8I85l9hLR2nNymTigbffsusvRQLsT1jEBubmzUQMK+8JHtc
	FV72b4g+clGT53e/+B6LuwhqhFca/s4F3Ogfs0Ye5mSOGPW8FQSXRQZ0AJTz7CHZNDpkaRzhoeZ
	s4CxKewS+tU63K6uqCY6WCSFJltxfqL0=
X-Gm-Gg: Acq92OGE24xB9/o9AOr7WASa66cyYaSWXYANQqt6gtOgw95arIgpDSI9Qy1objXR14R
	J+A4HKnCN1DLoRuaKUfNBx9UpVZ20bORM5SwtYGZNtZF/wvY4/0QqVB2VmHLn+vmY7IOlWbDbdo
	xtM+JgK1yUPVYLAL8H7+RlWmgxYcziZoYtHGCcsWxax7pDJK++mCoz/3ssIVxqC4s+PPUd67CNO
	Nd5hs7RCyH3k8K0Jjfu7lgMcnSxewdCL4h/NBEtkPXYe/+fp8fcWO0sLxfGHPNXgWlBm4jK0fLn
	3nmnAHwSxIPU19CMhOLOLaTiIqQG26T5ypsgRgefv5ekonlJ6wlDqQoTs/2XC4Ch5VPj8xac0Om
	Z13o=
X-Received: by 2002:a17:907:972a:b0:bdb:5c26:d499 with SMTP id
 a640c23a62f3a-bf3a8a06e97mr148149566b.22.1780670700008; Fri, 05 Jun 2026
 07:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
In-Reply-To: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Jun 2026 15:44:32 +0100
X-Gm-Features: AVVi8CcZWc8NSzDAQ_aVku7QXQXrcmHdaazPbFgpm7kgo3ZnjYI1QxUBkTayMTw
Message-ID: <CA+V-a8uYEOB2DcOjQ63hLDW-vYxGLTpphvDXyAwV3g1-GrHhgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
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

On Fri, Jun 5, 2026 at 2:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Use a per-SoC PLL reference input frequency for PLL parameter
> > calculations instead of relying on the hardcoded 24MHz constant.
> >
> > Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
> > reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
> > existing 24MHz value when no SoC-specific input is provided.
> >
> > This allows the existing PLL divider calculation logic to be reused
> > unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
> > input instead of the 24MHz reference used on RZ/V2H(P), while keeping
> > current RZ/V2H(P) behaviour intact.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
> >  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> >                         struct rzv2h_pll_pars *pars, u64 freq_millihz)
> >  {
> > +       unsigned long input_fref =3D limits->input_fref ?: RZ_V2H_OSC_C=
LK_IN_MEGA;
> >         u64 fout_min_millihz =3D mul_u32_u32(limits->fout.min, MILLI);
> >         u64 fout_max_millihz =3D mul_u32_u32(limits->fout.max, MILLI);
> >         struct rzv2h_pll_pars p, best;
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz)
>
> Iff there is a default, it should be documented here?
>
Agreed.

> > + *
> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
> > @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
> >
> >  #define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> >         static const struct rzv2h_pll_limits (name) =3D {              =
   \
> > +               .input_fref =3D 24 * MEGA,                             =
   \
>
> Why add this if 24 * MEGA is the default value anyway?
> Why not do the same for the two similar RZ/G3E macros?
> Perhaps the default handling and the RZ_V2H_OSC_CLK_IN_MEGA macro
> should just be dropped?
>
Agreed. I will drop this change and get rid of RZ_V2H_OSC_CLK_IN_MEGA mcro.

Cheers,
Prabhakar

> >                 .fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA }, =
       \
> >                 .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> >                 .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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
