Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B622421A0E
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573317; cv=none; b=HZ+TDZXidDE8y2CfP7gPZ2ObpdblUpf8amDaR3ZeSu+eVq5DfCwuizZdXLAYZ209Ka1yUxYPywAR9Jov1YLHki7A1bPShGMaT1SM40vm4dKbOYVVDVK4t9JO7V9y/aFI926PyP6JxD/0N2x3wb2gETEL+e1HwSPOcPCz+T6UEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573317; c=relaxed/simple;
	bh=NFcn+5re6W8fOUpStLnoOpP08n3MpCoonlan2BCzqsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZDsWuC3XCFUx8cdyYJsUKQPRoDnscS8mWxGrcR0t0WGQb7D7ykZoOkhXaOCsvxCtHCpUxVUoP5LfdSzaQA1EBYYRn8ZKH2UM5EZ25GzmPLqhB9c4CnDj9hWkmi9UCL5hptnlO/qyoTh3cwrUJqSfrBc+1qXVL86MYWMpleLyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59f8a140a51so372957e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 04:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573312; x=1781178112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SjEL3J1M6ssyuV3yx1NZqXFQtnLE7rLxALmfU/mPzo=;
        b=BSb4vL5udbNU0HD8zUY9tF3bcWSIi0Tw7r2SWhgBAgfGdDF2pnSF1wHowP2PxazCPU
         5+NvQ4CKGUhol3WPheOE/rcItjBHGhP73zcPRqKfovgBko28ykWH68kijiv60/yF4ZZ/
         qT2edaZs2SuLWbyoyuVOBSWPNi11j7E4NoR2Ue3K+xsJFNAgON8V+6dy4bNTfEf9mLSf
         vPk1elsILysmpNiZ30s/lw+eidVMJKem+EM3mbE0+BQGGze/TFg/+Q+nasgc72xJ/sb4
         pk7a7W19HsEGi2jzWvSUu8/Gt/fFeCJzIf5KmhjVpvLz/NHI76wQEZamjxgVNVt2t3r+
         qgtw==
X-Forwarded-Encrypted: i=1; AFNElJ/2kbC+QCMktw1kv+w6y7BSaF3P7WsimUuC5WHHXerqfdKrgGonLJhSkfUCbNPXtI49yTbuf1foEO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWg0MmNmzg2dgSjW4eYkciEveStEuR+o6h9sm3gtY+Ag8w8wNL
	CaWZEz2btZF2PIvmHO+9aOqKsWhrBb/ukgosxtY/qerMNP0PDVxE9ybF423uiIk/1iI=
X-Gm-Gg: Acq92OGrpBSAiokfQOPXNeCtmoJz9Uy2+wLXrP/nIt30HCb+zrL0yI1DRw0GhDqLDBk
	gPEbvsOaqA9m3Tiig4/FXmmYtp+3zoNNJuLcGcbviRyIG717cPklvCSsqyj2OtigJUAZOPntVbg
	HdgT9xzmarHNAU3zf3SMnb8H3toDFqbsU1DAB4W9xsPlaflkcj4HDRwsVi1W5PpuxB7H7DgJV/S
	Z1A7VvRIHr7G5h5J9IlSgtAeZOWFSZIZv61TwfNFzqDqiv/2iSirZz3+JQdkQflEG/D3YyK0FVR
	Vu11pzKWJ5Ln/ofpFJvzEwOIqIfb94WM82xSyXuqzi6nzTbMGWexMjzd0dPJz3ULIrx6TCRDeBD
	zvr9MVUiE6H8X9JW567q8F2axNon3i5VoFM8J8FJTvwzwO3a2b4Z1Aj6o/xbEh9+nEyzJ5kRaB7
	LfWshHmQGhRRBCKAPaks18URChbD+b33ZCoWBZh6y1cZzwMtvDHFZA/R8cqa+OBoJWWpAxjWo=
X-Received: by 2002:a05:6122:1823:b0:5a0:1bcb:acec with SMTP id 71dfb90a1353d-5a6e90e41c0mr4631735e0c.13.1780573311902;
        Thu, 04 Jun 2026 04:41:51 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6fb9ca0sm5558880e0c.6.2026.06.04.04.41.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 04:41:51 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6efdb6755f0so365671137.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 04:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9e2Kee6w5Zevo2jNB5sisHAPxfK2rMhFx2uOfiiMKJFG5wc1aPTVD6Pc6qXcoYpjj02FG13dtWcDc=@vger.kernel.org
X-Received: by 2002:a05:6102:8017:b0:633:3040:ca5c with SMTP id
 ada2fe7eead31-6ec4cc6cc9fmr4288587137.30.1780573310828; Thu, 04 Jun 2026
 04:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 13:41:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
X-Gm-Features: AVVi8Ccw5Ba_60Dzs2adNDvsycCaE2yjwE6AKvLwWxbsEZk5LA6wgR8624sRVIc
Message-ID: <CAMuHMdVC_XtgRxJVjX6wnzMHYZeSGeqOmHsm4Tg6RJ0Tm=dX6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - DMACpp (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> The ADG SSI clock outputs (adg_ssi[0-9]_clk) are parented on
> CLK_PLLCLN_DIV8 as a deliberate simplification: the ADG dynamically
> muxes each output between adg_0_clk_195m and audio_clk[a,b,c] at
> runtime via ADG_AUDIO_CLK_SEL{0,1,2}, owned by the rsnd-adg driver.
>
> While at it, reorder plldty_div16 to group it with the other plldty
> fixed dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v4:
>  - Drop CLK_AUDIO_CLKA and its DEF_INPUT("audio_clka") entry, and
>    reparent adg_0_audio_clka on CLK_AUDIO_EXTAL, since AUDIO_CLKA is
>    provided by the existing AUDIO_EXTAL pin (Geert Uytterhoeven).
>  - Drop the internal core clocks Geert flagged as unused:
>    pllcm33_div4_ddiv2, pllcm33_div4_ddiv2_div2, pllcln_div32,
>    plldty_div2, plldty_div4 and cdiv5_mainosc. pllcln_div4 is kept,
>    as scu_0_clkx2 is parented on it.
>  - Rename the audio module clocks as suggested by Geert: ssif_clk ->
>    ssif_0_clk, scu_clk -> scu_0_clk, scu_clkx2 -> scu_0_clkx2,
>    admac_clk -> dmacpp_0_clk, adg_clks1 -> adg_0_clks1, adg_clk_200m
>    -> adg_0_clk_195m, adg_audio_clk{a,b,c} -> adg_0_audio_clk{a,b,c},
>    ssif_supply_clk -> ssiu_supply_clk. Update the target-module list
>    in the commit message (ADMAC -> DMACpp) to match.
>  - Rename the audio reset entries as suggested by Geert: SCU_RESET_SRU
>    -> SCU_0_RESET_SRU, ADMAC_ARESETN -> DMACpp_0_ARST,
>    ADG_RST_RESET_ADG -> ADG_0_RST_RESET_ADG.
>  - The adg_ssi[0-9]_clk parent is left unchanged as CLK_PLLCLN_DIV8.
>    Geert questioned whether this is correct, since these clocks are
>    ADG-generated. The parent is not changed; instead the commit
>    message now documents that the ADG muxes each output between
>    adg_0_clk_195m and audio_clk[a,b,c] at runtime via
>    ADG_AUDIO_CLK_SEL{0,1,2}, which no static parent can describe.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c

> @@ -532,6 +538,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_0_clk",                   CLK_PLLCLN_DIV8, 15, 5, 7, 21,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),

I will reorder while applying, to preserve sort order (by _onindex/_onbit).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
