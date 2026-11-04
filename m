Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810751;
	b=fMFBoGFNEozD1AlWd3H2iPDTtiFcd3s7axTccX2EJLsbejtpY0rRWvvj/kZprdj0c4dj
	 0NWfUFSNwhydsI5FzYvccDMrkhU3VsMTuvgNYQtYyPHnV1NVCi8Vg7yyBcHAioQJrubLt
	 WkIVVmqQ7lkIrwEVghTchtkRiCy/o7aL1g8K+5L6yF+iM5gazVYfSTNmkjOmZQVX2VzkE
	 pvy0UOOWiqhQbmkQp4MMOO/icYcofFS/JlMEcVhxZH8dt0rxp98VT/Y+UpVw/UkNqp4Aa
	 Rk2/ip8+qSiTBhi8qnY6HbDKAF4e8jziBgVX3UpmG83ktS2VIcDkV+uMG1Kl4WUBdAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810751;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
	b=zhf3YqqDnQWteJrT8k+GbRRVkZfA9pzbOolzG2HCn3Id+UETbq+YIw0vBLQh+E5wcDk7
	 qBsZ75a2D9fn0nBL3Nagrt07V+FNTTnaBbvYh3Iq9y0xsgjToG9rkxyCJ7xVHZ8gNA2fo
	 SwdB6xj8kXIc4ajOYwy7vRZWlfl1hGYiGJd0QsxLlAhH8eWvtnu6qigingEhq1AxTG4E3
	 vpN6vV4rz2CmSno1eKiAjAdL2Yk9Rwc8IEET31Og1tlLpTvTHC63BsUdq6wfwibMR8iSd
	 YGoI+UndhRvygMLejZ8AY4OzdG+h2HPMhcCNqHL+Yge5BU6g4qrRT3lsW8jeeKQm4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0B606A31B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc365db987so577216137.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810750; x=1794415550;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7/PYDWmtNB1AMn5wxCKpnTjNlOxtiG/bHQ8Qe7AN3rc=;
        b=Zb6BQubK7LsXgVW9qG+fjJT8B6a2qGRfV2wcCNJhBgK2LSIfvFYhB9HCx/TfS3EOpf
         isiQMpKM/6ieHXMe6ZRqDqAiGPgI7WRF+fc0JnHv7aW8XIcOh5j4icAdXhWioGzD3uMa
         +fEHg17sfzKOmSiDboORhnCuzjlE9FT7FEbgBQsRTeh9lIX1vZ48jLGeem+N360rqAk9
         LYtrCz6w5nHFOH0wJrpFIlLplH0k52PJDgtn/O4Ak6LqL552BEjoSKvXVi6UOTr9xIUq
         SC/s2ym6vS2y5retY78C5ZsQvXNThLu+Py8/pES7jfre5o8Fw9KZs+XcNUMsM252yihS
         291w==
X-Forwarded-Encrypted: i=1; AKwUvByjIQtTH7UZQqXeNKM/lSnuHMPSg8PYiiGNCqMRx+5gw6ChVxI+pkC6+V4y0VVYSEw6gGAuNLx984s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F4zLLONSMOcEwKII9QQhdUdn9wYyODJrtN/AEmlxXG1Sjg6O3
	pwiSjVmjP58qhxmUsNkFr+8wHmhB/N49jUTShgG4k/tBApy7pLlQJyTmZ+idS+DBUBg=
X-Gm-Gg: AYBFou2yVkt2+johP3lvvzn59giQNJHLf8V5JUrw3lS60rMmqRJVqbH8Oiheq8VU3C8
	IgSzOx/GFKZYKlN6U3U220WWYDhYSmkcQzqEu5B2642k50ku3FCBl2AZYjrV68yrORVmTb1cpoK
	Xlwqmj45TylnoQZuY9SZyxvYkjqZj6eJguF60XOLOPG+tRSGsgZGmDSACpPikLKjmQlqWCbIdEl
	LvgoCnEBUzmhAiyr9FHCUma/CsXO97m7kXkC/qNk26LlfkOMG9Kb9pPTSElglkwQ5k20OLQUPbM
	TjX25oGMugmuzjk4UqGuoPhhhWanx0rAjzheQ5UgCfdcMDoCWffFq5LKxqJvbhRzTQF8nbCqHp1
	bDCUUYKQPH9s7nwR1z8Qkz/04Xf/yPKDqs99yy2i9Aecxai96KKsWXUu1M0Ght6TEvrMBtt4Hfp
	cfE0PtbXq4VXY8V1qtQZsVAUIxDKbNzTu9ShaG/6dPaKt/kyTKdeuwQTvNcA19U2fE4w/9isEtl
	vLuLA460FjkeN+orxzOcfJ3msg0cgq4TxLyszcVo2WPsVSCujSh/+h5wTiw4zv6MAPhJslk9a+C
	lVuZpXc7GsCtyu30FAFObN7/SmJiNc9Fpn61oGWO/Q63XeByRYy8BI+EqhDbf55WFw==
X-Received: by 2002:a05:6102:6107:20b0:7d2:7be1:271f with SMTP id ada2fe7eead31-7d27be12fabmr792411137.31.1793810750115;
        Wed, 04 Nov 2026 08:45:50 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fe8f991sm2001068137.9.2026.11.04.08.45.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:45:46 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990703f817fso464523241.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:45:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzztl1dGAcW0l97LRMdPR9NYXnLbcjPeRM0fr/oNBu9FSHdDz4AKeos7eTU7EFpzvGMVV1j8ExdN14=@vger.kernel.org
X-Received: by 2002:a05:6102:b04:b0:7a7:198b:6747 with SMTP id
 ada2fe7eead31-7d072713841mr7188563137.28.1793810744356; Wed, 04 Nov 2026
 08:45:44 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:45:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
X-Gm-Features: AclHuK8CcANpUVtg31h47wbirSO92khOvhLt-OHr-CDqoYw8N4PrzA7mWxauNt0
Message-ID: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
clocks and reset".

> --- a/drivers/clk/renesas/r9a09g056-cpg.c
> +++ b/drivers/clk/renesas/r9a09g056-cpg.c

> @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
>                                                 BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DIV2, 16, 7, 8, 7,
> +                                               BUS_MSTOP(3, BIT(9))),
> +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_GEAR, 16, 8, 8, 8,
> +                                               BUS_MSTOP(3, BIT(9))),
>         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9,
>                                                 BUS_MSTOP(5, BIT(2))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
> @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
there are 3 sets of clocks and resets, one for each ADC instance,
but this does not seem to be reflected in the register bits?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
