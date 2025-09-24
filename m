Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C51C860E
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719493; cv=none; b=L9oV/PihudIVinh/5IgPGyeIc0qwAhl1bLiDFb9OZrTfduC6dIjsXtYbPxWYqSntKV4kR/WvJl4qmwxJZ1nHsKugiZlzXY26bzlzn0rMPHbtMl44jgPWKnWnITYuq51JHyL2W3gVZRr8rPfwwiMOWKoJoIIfUkVlWraYLfgh8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719493; c=relaxed/simple;
	bh=z/C4wkQC8gaVbvYtfUOzohgsubPk5RoreYsa0amGnQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGvnl7PPb/DFzfxMyGCGg+Vy7WNPsQJJY03FKN6Ex90lDuhICG+vYV9ZsKil9uayPqx3Q9oqVxdk9LbOVNrOYBMmiJuNqiqSyu5bXfLhbnT5Mg/tE5TcCgBd/MRijFWDB363xdJjnWGNgksAnDZs+3rrI2ZkZjHVFioUIvVxfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-89018e97232so1653741241.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 06:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719490; x=1759324290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIlYzxGhD3l9eBjwM++AWTKEOipfMDPpBnbYVK8JQsQ=;
        b=Rr72zCGdISm5Mn0T+edPFH2/1c8B1GgNGSJ0OoqCRPxU99GgsDZ4gwDaPQW7PI+YPu
         KHy7ixzdOmbYEgjc9dM6SdRm1XJZCkU7oIMSbJ1eIq9BbMyjbUboamp1n/tfPebqVMZt
         bcbjdvpHnQYa5ZyIKuDqygMJ3M1sOIQh2vBlCI5tqEZUvJR8hRoBCeuAiHdKn0WW1QJ2
         HI/aZcCfEsuancWPYZF7GpgVy+IOvreGo3E5CZr3dxXZBaEU9vm3JUW7sEWbGJXu2Rsi
         cvqvtuRsGzU/Ri+UARJLXepz8xBB8VyGA1M04jjljuQ9L3uB8pSKu+uAeKwnbpTnllvB
         XwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI801HRvTRiP1BRv4c2sPfjuL8wkAZRrKDF2tG/+g+oHlFwdxT2LmicrxTsq2v4Mtj4dngoQNZX8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxfQYMRf5o7ThgpOPD03ahlxpnsPgLawH3pDxL73Mkb6RxZfsT
	HMR1EY2+OAHyCkNL3t9RsSVun9IZkjxy6DQGS4zo7vDqA3/W8YU/2pbJ/L/ZyFSA
X-Gm-Gg: ASbGnctkO0tsNU6Z9couN5SM4D3u9us523xVQzqqW2RL3JTXcx1NyZGyNzdqD/5ikDG
	lLaQXKvACO5F6mGp9ZAw6b6Zsr5fAY3faaUuzcgDjoN03qCIYpblPx9HmJ4nnW88NVVTrpnB+BO
	odOfa3U6oPX8qYM7txPBIJ4d4PKRy+o8RVc9DVueGFYw2lkhqoV67bkifIKtlia94DjMq1cw/+0
	HFudUrI4Uw+8v2q+HLZDhMCX9SJ63vNQY5ijqvX2T1XYINcSoJ/IQ7AtLE/OzGdr9Pqsw2LBHxF
	qmRisOpt0Le1tOVKgKpXziabtVeO7HedsVZ2CgKWX/rDnMDpQXjbck84Yb+Nc+EnqRFQ+LnDUth
	ub3wUpJDesXehdHU1yXIUMt8qCbzZ0sXomXWcBDpDkm1NRrpdwu9u8gxZsPzk
X-Google-Smtp-Source: AGHT+IGs7meGWnYuq2C3SUzzAcuyOdUopTb9TMrZUsbDe0/jwAiEraE6sTNbQc2aNdWI5u9bpBBYpQ==
X-Received: by 2002:a05:6102:c8d:b0:592:cf84:dec1 with SMTP id ada2fe7eead31-5a579b1bf29mr1994051137.33.1758719490053;
        Wed, 24 Sep 2025 06:11:30 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e7514sm2911317241.2.2025.09.24.06.11.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:11:29 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5a3511312d6so1349885137.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 06:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNr+gdLLwKAPs0RwYM3cMAU/a9liNLXKb7cEpRHc8NW3+Fb9pQA+TC8BWuN0/UfnkWH4vvKODFzg0=@vger.kernel.org
X-Received: by 2002:a05:6102:4426:b0:5a1:17e3:ea9d with SMTP id
 ada2fe7eead31-5a578c96363mr2082608137.25.1758719489139; Wed, 24 Sep 2025
 06:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
X-Gm-Features: AS18NWB3LiRE7h2GD3dAO4aR_IhRpZe13Ufoocoh6CaSUdYv9A8x5d9icvSRroc
Message-ID: <CAMuHMdUT2Nv9cEw1VsSeRQfNsK7-CxWqDN+S=Txkv6DXMDdCOQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
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

On Wed, 3 Sept 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> +/**
> + * rzv2h_dphy_find_timings_val - Find timing parameter value from lookup tables
> + * @freq: Input frequency in Hz
> + * @index: Index to select timing parameter table (see enum rzv2h_dsi_timing_idx)
> + *
> + * Selects the timing table for the requested parameter, finds the
> + * frequency range entry and returns the register value to program:
> + *
> + *   register_value = timings->base_value + table_index
> + *
> + * Note: frequency table entries are stored as small integers (units of 10):
> + *       threshold_in_hz = (unsigned long)table_entry * 10 * MEGA
> + *
> + * Return: timing register value to be programmed into hardware
> + */
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> +{
> +       const struct rzv2h_mipi_dsi_timings *timings;
> +       u16 i;
> +
> +       /* Get the timing table structure for the requested parameter */
> +       timings = &rzv2h_dsi_timings_tables[index];
> +
> +       /*
> +        * Search through frequency table to find appropriate range
> +        * timings->hsfreq[i] contains frequency values from HW manual
> +        * Convert to Hz by multiplying by 10 * MEGA.
> +        */
> +       for (i = 0; i < timings->len; i++) {
> +               unsigned long hsfreq = timings->hsfreq[i] * 10 * MEGA;
> +
> +               if (freq <= hsfreq)
> +                       break;
> +       }
> +
> +       /* If frequency exceeds table range, use the last entry */
> +       if (i == timings->len)
> +               i--;
> +
> +       /*
> +        * Calculate final register value:
> +        * - timings->base_value: base value for this timing parameter
> +        * - i: index into frequency table (0-based)
> +        * Combined they give the exact register value to program
> +        */
> +       return timings->base_value + i;
> +};

Unneeded semicolon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
