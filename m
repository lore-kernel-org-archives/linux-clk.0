Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C968364055
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014736; cv=none; b=YTNWaltPuAmjY9atbicj5ttFqbsh6FBkeWU2IBEwL5sCl+bpLiMLFKcqA2IXDVlMNKFgAYtNXy59NU2+jk6BZTqkKzfkpHnHzg+QHsYDIlItWRowmKVYancW5zOtx4TM9y7Dx7bB3AmcnQCwYkdw84A19qPbveJWLkY/zubVAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014736; c=relaxed/simple;
	bh=lSGAKaU7dLaHDMsb0z3MFEKF4bRnqGKcSkr3JOxtmVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KopgGJhXyt6EZlRSSK2Bf1iLws+kpTWU1RInPui7tXqEEoxDeVpgPk9FN1Gy16996thYcqvwIFW26BDuhQoGwm8c6USObvnnqcHLlmb/8CRpA8CgPEr4p1q2kXUwl5RAeQAjgwxYHGhoawEHixx/P6NpqkIajsYp6zRjQLTfnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-60579e72ff9so5126743137.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014733; x=1777619533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6+i5A73RZ2qhxuAxeEZqEE/dhPNDUVEKhpkvB0Nw1g=;
        b=qjdnp7dxEbqi7B7UnMYz115udmuuQYTMdhkzZ/tTKpXtgkENhNihhQar6yq/03+YT2
         FcM8zThsDWahFk5DIeFRxlfSl9hLoLDJdsYFIK+OfHlhQ55rUUQWzcba+ALfy4+o8sPw
         AiHwVRIChXot7oSF8ai55XVSg8IMEfYseQrjXhm1+h4ckwnelCKJ9IDuMxJNZOD9Pw+E
         OFrTKGZ1rKd9qBB+a9UgHMvm8ZJ/47ILoCytHAlJOnbK0u2A7dQVu93slbvMd9YwD+x+
         nJXiLtTGZmQoW1XPsLjaHCyEW8FZ06exlzH7svjfsLCpP/lMrE7Je9OnQEQbwfXDSTd5
         Nwyg==
X-Forwarded-Encrypted: i=1; AFNElJ/BFs2zB+5fbRyPT9rBceg+LT9lJLbXwZo+ySR4HqdUz0T45tReaYmQmJYTabuD4CAJBeF8eCYxApE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzj5y1kyBN3H3qhtYcUfHp/rzKO4AV23eAW9SP2LugpS1yKlV1
	ngFFE98FLaMNhAh/ZxC+P/MYhKTgTf/OGc423+xkzJLU/B9Egfr46ZFT65rKD3EeR/Q=
X-Gm-Gg: AeBDietEraRlmvD0I7y1vlZDXPRWGVqy4kyTETEI5H3X/cagJfv5nff45qO7axqJTsb
	5b925CuAM3wkIKQMygFs90PscrfGaN0Xb5mCxBVhHotqbG76R/Y1U9TAY5LG23v76qQJFzhOE33
	nCO3iH+0yq21HlaA0YQVClDSqMB30+WU+e1q0/SYQR7mWwh6+nMxOKst42qMkP1SPzvdHafvt78
	G9ozmegBPnk3+vVFx/uzIrNNTsAxmpM4orBowbw9MBSG2G9K4kwCHbFknFoXu65+2rCLfKC9knf
	K9NqQwlKLV+w+UEVrlH2oDOkJCeq2UY8WJ9fN8udCRNeBPwcgks9cNTRsKCm05glV01hSBoDQab
	LWFAqRTKlXDGDbmmUN17esz5ACnZ9ZjZ2wD95PORKF5oYm2UDw3aimco382CSdCDsxivXmqcHK0
	CuyIoUgPZnqSU4YL6oR8mxyJgTpuFdB8oBLng0OsDGgIY2hMayk/Zo4XJIvm/oN07ehuSF4DI=
X-Received: by 2002:a05:6102:41a3:b0:60f:b19b:e52c with SMTP id ada2fe7eead31-616fe25932cmr10918559137.17.1777014732586;
        Fri, 24 Apr 2026 00:12:12 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890c16fbbsm10744702241.12.2026.04.24.00.12.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:12:12 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so5157101241.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CU+oxEPVSuV5HdBO+whErvimD/H01W8Ka0d1WEAEc5YHJfWA01bOmIKwYAgGUbgbnkW/sUf8Cg8s=@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id
 ada2fe7eead31-616feb7be9cmr11083342137.21.1777014731492; Fri, 24 Apr 2026
 00:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-3-biju.das.jz@bp.renesas.com> <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
In-Reply-To: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:12:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6rNkAw_00-y9YpPbNXFqj_WwBJ6uRyhZ_8pN+Qi3-5A@mail.gmail.com>
X-Gm-Features: AQROBzD65BVtIboRiBum4VXZdf2VNpeEWLRBzAMwGtHsfEBCf7CLYD3n0C1TddA
Message-ID: <CAMuHMdW6rNkAw_00-y9YpPbNXFqj_WwBJ6uRyhZ_8pN+Qi3-5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 11:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
> > some PLLs, if they are not in use(eg: PLL6, PLL7)
> >
> > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > transitions. With the `enable` callback, PLL will be turned ON only when
> > the PLL consumer device is enabled; otherwise, it will remain off. Define
> > new macros for PLL standby and monitor registers to facilitate this
> > process.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c

> > +static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
> > +{
> > +       struct pll_clk *pll_clk = to_pll(hw);
> > +       struct rzg2l_cpg_priv *priv = pll_clk->priv;
> > +       u32 stby_offset, mon_offset;
> > +       u32 val, mon_val;
> > +       int ret;
> > +
> > +       stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
> > +       mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
> > +
> > +       if (enable) {
> > +               val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
> > +               mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> > +       } else {
> > +               val = RZG3L_PLL_STBY_RESETB_WEN;
> > +               mon_val = 0;
> > +       }
> > +
> > +       writel(val, priv->base + stby_offset);
> > +
> > +       /* ensure PLL is in normal/stanby mode */
>
> standby.
>
> > +       ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
> > +                                       (val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
> > +                                       10, 100);
> > +       if (ret)
> > +               dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
> > +                       "enable" : "disable", stby_offset, hw->clk);
> > +
> > +       return ret;
> > +}
>
> With the typo fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
