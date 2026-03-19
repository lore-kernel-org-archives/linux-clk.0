Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F2384229
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934508; cv=none; b=Sq654GPVVVe0+BBGHqDF2hrDvZlkPja9J6Mn5VV5/1TowTM8pkQTMZ3/SmcOUChy7ZmruXXF+qdvRPqoU3tjlsL1JvNg5F00R4sIQRSGQB7DI0cHqwFoZVW9aW4o9ObPTaK02gUonUg3RvTD81/PGoGjVk0NdcEkFLPuPE7Tx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934508; c=relaxed/simple;
	bh=eylfJ4M1fnU1Ael0qpcvdqzFDOjb2umsOCkO5NW/HWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exbMVjRTz1M/erQN+yX2OVRu4UOX/g79CrRv5OZq7nYogpnLQvyoO8wl5Ag/QoUiFYGMJ+Dl3Qk1zWTOOpBgvSJ86KrLHPyTRB1T04cRVNOE677g3vFFJBr+5/urC6/neh6YY21KIcPGZkYsrqVjuxwZzFgo+AqgvaFsE6B2S6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso260551e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934506; x=1774539306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sna4D+aikgWBC0KTBMb+CkCNEcX0vzdhAjvZ6i6CqOw=;
        b=cWFBz5UxCt0siycll168ksG3GZQOn0KoLDpWRY6PG40BDbJuQeNFxOad/I9hHHCyeQ
         liEwtrqIfub+xY92OTZ30Iun/1/bN772rpIYa7vndwu1WRd16sprNmgkHJl/Nyqb3XYu
         YFC/ivOFx48oZTYxMZmzlfpqmf8AKHGgRcjQdfA0DDQGcOBmB7M3T26om4y/dN6rzHps
         q1ubqptkA0KIO8ZKhWTwuBMQSo+zqPQyKVWBHHwbzorwaajfW/J1/LOnOkbWYN+PwVYQ
         SwVi/2NFKefoe6NPAjmQf7AzMAZAIGywPOT4G4XC+IYYezBV8UdZKae2PHUG+B0XagPe
         EmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQTs0eH7/4HMPI+S9RCJgS0ENRGx/3/Xy5zxRcx6ygPow4jhF2LbBkhMO28XOw5FfZsddbBi/egho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzunFhchSgbGYbUafV2GflY0wY4BK/D3H+w2L+qIymYGwJTOhBB
	gyZUjucEjY+0M0AKI5dH4UGcKPltvcnE00I1HFbaHT+v6+VFWRMfHJsvMnMpz07W
X-Gm-Gg: ATEYQzx+1kYxhmSeYaLwTL2JkjfWRhND5ZgaAV9v5+quvhEe99v8EFmm+caoxsxUOFs
	QfAL990h9NF3CgjZz+f5DWov3usOMB1TPNTBRpCS+HVnEkc0fOYpx862CvDHaUNCUf2g+TVXXQz
	iiWAa2URYEL9d4/rOdjkrCuK4N5BC/je7ION8ypC9TINXEp+ShCtlyarZBWJbpZDoFmmmbWEvRE
	vNzr3fOJH77NSS2zewFxhGMnHNHenqrWmFsiQKOAN2lGCDvjGDgT6mV7IdaToU/NAYWt+QtE6cq
	UETvbQ7FOiKDsmO8m2Yug6T6VUvRTkbJBnWAMn7fdSjJLoXPJWuhM18YPj9Df3J89PXLQAdGj5z
	kwxriajpG1eQjDFsHN24urfMBUpe4qwMF0clJefM9UK+mOWMP/xtKm8rTXp2iYodpZ6FTSgX5ZI
	OhbyrWSWfOpz6utD2fWnZ8bf3bXRsZTSsiXH5vO2x+QrEFEgFTH+LiHBXUzKOH
X-Received: by 2002:a05:6122:1d4a:b0:56b:9083:4335 with SMTP id 71dfb90a1353d-56ba71c80cfmr4071657e0c.16.1773934506291;
        Thu, 19 Mar 2026 08:35:06 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95112e39b5bsm1986488241.12.2026.03.19.08.35.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:35:05 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-950b801b75fso208211241.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 08:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmdrF2IoOQwJXthfWPdiZrE2tbiVGh8N5VAiKF0QEeERZOuKeiQVwKwV2Zt4oWDNKmR8MMiC/nbIE=@vger.kernel.org
X-Received: by 2002:a05:6102:3f11:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-6027d0a9552mr3310306137.6.1773934505746; Thu, 19 Mar 2026
 08:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com> <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 16:34:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
X-Gm-Features: AaiRm50fZzyHCZW5h8M-E1YgMkKFxFNFCA-0vlbyly6nYVtV03im4Mdg7Zg4Ptw
Message-ID: <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 19 Mar 2026 at 13:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
> be left disabled as there is no owning driver to restore them, unlike
> regular clocks. Add rzg2l_mod_enable_crit_clock_init_mstop() which walks
> all module clocks on resume, re-enables any critical clock found disabled,
> and then restores its MSTOP state via the existing helper. This replaces
> the direct call to rzg2l_mod_clock_init_mstop() in rzg2l_cpg_resume(),
> preserving the correct clock-before-MSTOP restore ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * Updated commit description
>  * Dropped the list implementation.
>  * Replaced  rzg2l_mod_clock_init_mstop->rzg2l_mod_enable_crit_clock_init_mstop()
>    for enabling critical clks and restoring mstop state during resume.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1600,6 +1600,23 @@ static void rzg2l_mod_clock_init_mstop_helper(struct rzg2l_cpg_priv *priv,
>         }
>  }
>
> +static void rzg2l_mod_enable_crit_clock_init_mstop(struct rzg2l_cpg_priv *priv)
> +{
> +       struct mod_clock *clk;
> +       struct clk_hw *hw;
> +
> +       for_each_mod_clock(clk, hw, priv) {
> +               if (!clk->mstop)
> +                       continue;

RZ/V2M has critical clocks, but no mstop, so I think this check should
be moved below the call to rzg2l_mod_clock_endisable()...

> +
> +               if ((clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL) &&
> +                   (!rzg2l_mod_clock_is_enabled(&clk->hw)))
> +                       rzg2l_mod_clock_endisable(&clk->hw, true);
> +

... i.e.

    if (clk->mstop)

> +               rzg2l_mod_clock_init_mstop_helper(priv, clk);
> +       }
> +}
> +
>  static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
>  {
>         struct mod_clock *clk;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
