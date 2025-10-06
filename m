Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204C119067C
	for <linux-clk@vger.kernel.org>; Mon,  6 Oct 2025 12:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754984; cv=none; b=RDxsr43FmNNARyZ39UXVz8TP5SiMFl+EbRBiEGVpj08siLgI3+YOPWDnUoVpDQXuiABvrnDhGacTmSHlHA+uDwfW2M70h4s6VF46CSQQRj9kwfB7kLPOD805r6ohSmYP6WCK40m2ZJVnCJKXZYlOKgWP7yKUGgtMVQu8F94q3aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754984; c=relaxed/simple;
	bh=W/ngLzzEijzJIH8PvuzO5TM2e6lsyzUmai6PG+VNePA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSKSldKxg9EO8c4+3ij/QQVw7Rwo9lqXcGPV3jsdznsdU1z917cZTMolzJWoVnhROTwxd9GB5sqeBm39DfMXr2cj5QEvE7FhfjYLAmhSPpVVnWNr7kuURZXgwsJmKZCZySJIh+V/IprV1j6A//Ot790gRNho2SrkszYjPow8HPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so3087573241.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 05:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759754982; x=1760359782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwPjpMz/0J4A8goGwBvaeTijAxI7KyJ1C6GbFZyEwbs=;
        b=W/ph/ndsiHrYVBWgMsT9OygUuhB9VY3G22nEC4UdsS2R+TbdhMZQs+pSRC1FAJglTk
         RYcu//5qDl4bRkoVs5Fb6Xsji3gelrf33TuCear7JSi/3fovCP0bAfE6vVuhALARRQ0E
         FPh+E0McYDuU8aR6h1t0+oD4Ben7oEIbJcjLm5mRMEXssSePfU1dA4K62V2ZI291IQ9D
         +v42hpA2GXT6I80/ZmE5Khdri7wglh4nXyXOfc1PZ7kSFjBLZGbVYlFjpwjsGoh4dVvP
         2h5Yjdd5CpMMUZcDlOtTBD+YTiy8XsG0rxTN/SqUNhIoyIXnpJzRUsnyBeVwo6V4tTYf
         AIDA==
X-Forwarded-Encrypted: i=1; AJvYcCVnKpERzfGs9XfmcuDPEkFSFmyyttdY5t5fMaEw2ni3JT6Q04qn4drAbtE+rLpq5gQgM85KmvPxuTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LFhNpPPxaOzA5QWNAlY8NtbloUIYOjZNA5j+gsXpiHacqdAU
	jh0QUpb8TsNjUDSX4wWIX3bP0JBuuQyDF/br338k2lgymFBVJIlz9AU3URKCjL0g
X-Gm-Gg: ASbGncuOAon5VYaypYg+MqC2KCFff/ecFZTDpqn9kIRcwEFX4DyJfc4KQ3IeLuySGhx
	vuWQaKos1BVtq6JnjqI5yJrYnOcCLlV3NSnBvwC/NUz7GlFM9YzdWZXOBgr9LCVGaXkdvHjEhBv
	jElO6E9d0QHLvbCZVRThWRZ52DIzTz0Ty5WnTP5LX1VKNvQsPm35tiBlWkWwFVZGj+clZIRKsRA
	uQ1+KzXZNVI/tMudyT4po4YZOySdveDaWjCi/sIgeoAhQFRGsTLXZsqquDD3uxaw1eWM3KjSguT
	QHfKn3E3xIYyJmnYQqy3Ku3cL2Wvl5y0n8KOcWrIja24uT6KScv/lOhUdtAq7NB5GHj/aa5IJKq
	wjfHnqa7EItm2dNcv4yXbqYrECFhjwlXroku4nolsHUJlIO42fe4eo84xIwZ0bkfo46LcMqRp5i
	94lniyBqjy
X-Google-Smtp-Source: AGHT+IF3o5la8XS+uZ3zfUfbEVeIoyJYDGx9MSkhtgKC5ZQ7XqtBX1T+92kQEV8MJPd6ZuGCTrXUyQ==
X-Received: by 2002:a05:6102:1497:b0:523:d0d7:b960 with SMTP id ada2fe7eead31-5d41d14367emr4788641137.29.1759754981641;
        Mon, 06 Oct 2025 05:49:41 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4eab863sm2839359241.10.2025.10.06.05.49.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:49:41 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so4205629137.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 05:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEeSnzuyfCaZfvkN3GjOVMgwMUM6ECr4afD01pjy7LTkK4cKXNe+H65CL5DjCW1dYD1O/lOGYt2Ac=@vger.kernel.org
X-Received: by 2002:a05:6102:1620:b0:520:c4ea:4bcd with SMTP id
 ada2fe7eead31-5d41d055f58mr4323006137.9.1759754980548; Mon, 06 Oct 2025
 05:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 14:49:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
X-Gm-Features: AS18NWBb9B-DekEKpQfUFSovMcE6-nb-Pn4OxZ0U_p0Jp7pux_ucj5r-aIzp9-s
Message-ID: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> different clock configuration, and additional timing parameter handling.
> The driver introduces lookup tables and helpers for D-PHY timings
> (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardware
> manual. ULPS exit timing depends on the LPCLK rate and is now handled
> explicitly.
>
> The implementation also adds support for 16 bpp RGB format, updates the
> clock setup path to use the RZ/V2H PLL divider limits, and provides new
> .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> match the RZ/V2H sequence.
>
> With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> compliance with its hardware specification while retaining support for
> existing RZ/G2L platforms.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> v8->v9:
> - Updated Kconfig to select CLK_RZV2H
> - Updated to use renesas.h
> - Added reviewed-by tag from Tomi

Thanks for the update!

> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -19,6 +19,7 @@ config DRM_RZG2L_USE_MIPI_DSI
>         depends on DRM_BRIDGE && OF
>         depends on DRM_RZG2L_DU || COMPILE_TEST
>         default DRM_RZG2L_DU
> +       select CLK_RZV2H

As the kernel test robot has already told you, this is not a good idea.
RZ/V2H support is optional, just rely on (dummy) rzv2h_get_pll_*()
helpers returning false if CLK_RZV2H is not enabled.

>         help
>           Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
