Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D7429028
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154165; cv=none; b=fYRHzYFduXZ5MQwJqyxlHkoNUMjtAqv91ANzq3gJ1oBi9WOiRoAoPIyvm5/yMVoMayIufbJZXCGjf84UJmfqWaF+W1YfqNvlaD+bvRevRqsCYUFT1DgaDhU1w4YCBirGD/sZkru6LrTX7pxbb1lQBGAEiLY4YkORWDUBcwiV1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154165; c=relaxed/simple;
	bh=S13/a2DUuQ9T0YgUluW/YdBy44Rsv04xd7u3nkFLvKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABJB39hAMhWWMTcJpSYiaRIdU5Iev+oLvXvMGvZtFIQihntEbqT+nsCcqPN4Z4lfNpJ93X+QIlApYRKtRyS1qxQiRGaxUQUAnsSV1qmYGuZ6sUNxRgN12SHoeznrqH4dxL+/XvRPoNrwYrKX0cN3yK0ATKctHPL2+EOWLeB2l5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78564421fdbso229769137.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 02:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154163; x=1790758963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y9uL6EIaNRwgONG86sMHrIXf+Agz4aVAR96rGI+nBOA=;
        b=gMRpuUOqOIHtEmvMV990bqaBKv9lf4VrztTThTmaC3Guub1Vjp/nPqv/Uu+FoHuUba
         k7qTgI6a7NVXkQzWUo3JIZsf+6G+H0Ebaca44FFMkT3QZUkzsOFbegtvCMnfGPfK4dxq
         yn9dd4JzrnLIvijsZUcPoiUChOURar5v+LSs+E6khyBnwZVerSWjHIwju/Q22bT0hMiF
         I14+Mzl+eVmtyjop9cccp2blJt2MsNoBNHMtcunSy6dLZYDJAzA2wxvPpqF7H37nNYA4
         m3ZvQ01ovpcO1nAhFOmQeTCh+pA+8NTk47IKzYC9NwpyJZ9u8tkRTa0jgSoB7NFEFZ+c
         yU3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx46TIrabT/U5t+6rMIgc8GXPs4KRIIfQDbF74eiznO6pXfT2K6i260zLbmlYwyOUWtLB2PTVMBNXI=@vger.kernel.org
X-Gm-Message-State: AFuF++n0fxdLUVGzY9SdJBJwYuYyM/x4ujVu7A4AEggOrX5Q6mMokR79
	fRhgefWS8poSaMDMMiF7gazapzp8L3Yu3FWz+mkq/aKMK+FYkmEeCo8ryG3dh1KWtmw=
X-Gm-Gg: AYBFou0e8vrM93yT5bnP8J+N77mlwQnExStWQEtbUhLNlwtDVUPk8A82fXaF/Fy9lLT
	w9MpTOy9U29nkJwqYNLK9GaepzIeWWlK4OhJWdfT4jWlWYo3CCp8/FiL9IsvpH37u/Zrhn+o6Oa
	x0fNVgUN3bc0Yds9o0l1TgGF3jGxcEi6IWB2D0uAplvrInaS6Z4ul88qkVoaB6iYV74b9SsORqX
	rViYaL0yte26rsAoZ2d/vQAV9SNgFXkEW1OxHuzRr6IBWKZ05+1U2HWgUDkGpoC8gQU3m5NIsEh
	v9DaU9LUbumFugpxjZAidDtjAdpst8382HlLxuhn0mgXrvslS2VU3xVRLnRWqiI2CwI0gSd2dvz
	2ms7krA2FcfhaJVzROeLFccGtyzL+kp0uj0l396nE5ZzPCUnP4G2SoVxUn/HOijAW7wmr3WghQo
	xNob57KVAOwhBPB2KAf0SUt8AxyHFfwQFG2Zs+NQcUAaG1DjzMjPKo3Nv5DCUGH5XtEObQPQ34B
	fylwfuPieYQ/X0D6d2F1de2N3eC6GBpxSoX1PCkQkxKFLo=
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7ac1d4eb126mr1684105137.20.1790154162874;
        Wed, 23 Sep 2026 02:02:42 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca0c1e9afbsm980540e0c.10.2026.09.23.02.02.42
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:02:42 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-791a9878aa9so241684137.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 02:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQXUTd1IKlQkUmDGMpLjROHgJzdw1BbBBj/hXSBpBD3IbPV/sf7ho61zNspgXXo1R0LIU5McCROp0=@vger.kernel.org
X-Received: by 2002:a05:6102:f09:b0:7a1:f9df:e35a with SMTP id
 ada2fe7eead31-7ac1e056ffcmr1746641137.33.1790154161709; Wed, 23 Sep 2026
 02:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com> <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:02:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
X-Gm-Features: AclHuK-1ZfYuQqGN_jdMP702kjKVobBbRT4_4h64Ii2zniFyeaaaBXe0tOjgNb4
Message-ID: <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a08g046: Add CANFD clocks and resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 21 Sept 2026 at 15:20, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add the P4 and P4_DIV2 core clocks, CANFD module clocks
> (canfd_pclk, canfd_clk_ram), and CANFD resets (RSTP_N, RSTC_N)
> for the RZ/G3L (R9A08G046) SoC, needed to enable the CANFD
> driver on this SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -162,6 +162,7 @@ enum clk_ids {
>         CLK_ETH1_TR,
>         CLK_ETH1_RM,
>         CLK_M2_DIV7,
> +       CLK_P4_DIV2,
>         CLK_SD0_DIV2,
>         CLK_SD1_DIV2,
>         CLK_SD2_DIV2,
> @@ -337,6 +338,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     dtable_8_256, 0, 0, 0, NULL),
>         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
>                     dtable_4_128, 0, 0, 0, NULL),
> +       DEF_FIXED("P4", R9A08G046_CLK_P4, CLK_PLL2_DIV2, 1, 5),
> +       DEF_FIXED("P4_DIV2", CLK_P4_DIV2, R9A08G046_CLK_P4, 1, 2),

".p4_div2", as this is an internal clock.

>         DEF_FIXED("P8", R9A08G046_CLK_P8, CLK_PLL3_DIV2, 1, 8),
>         DEF_G3S_DIV("P13", R9A08G046_CLK_P13, CLK_SEL_RSCI0, G3L_DIV_RSCI0, G3L_DIV_RSCI0_STS,
>                     dtable_2_16, 0, 100000000UL, 0, NULL),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
