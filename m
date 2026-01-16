Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0152E1758
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555150; cv=none; b=NdnB0vtv4XEEbx6qZDsV8UDWkinuH64a5yHqhIVMwW+ACbBQXl48KACbAMzN6EGNdCBQs1Vb7ekq02hpmTC696YOQO6FCCJffi/Ug5IF/gasR1hQxDCDX6CRaVONuSaie2onT+nV8jAl3Pq3pUQmG9+rzbLC5AL+FCy4Mh30vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555150; c=relaxed/simple;
	bh=adQ7kRR/hOR8vS5q2nkrEXnEC+zF11Zil7OX1SmuyTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQV539FNJCIEnyVEMnUN61rBUSW+f9oO/d4kpl2KzmYlKpCGZv0O6sjM64xtVt/20k0ke2D0cMflfuYAvegCSZf3irsyKQkNUIproJPCOOFWfcMe/CowwlG1QH+MPOLvqXDXU9lImkbFTv8dAwMy9uoGON3/uX51fUca92lfecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8765b7f4c0so304406166b.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 01:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555147; x=1769159947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fAWD8ppvWG1L3aS+Ni46WWzgwRQSiQawC+eewqOXMM=;
        b=i0sIECoFulE6PgBdy7nDBt+8vS6erXFh6yE0uRTMHSY0vuaw0Bq/2jNrW5czeHfIJP
         JYeYNqB8EJoyrgPjgysEFYqMFf6zUIg3y5xO43BdIiQM4ULRMghrnfXYQQRThzDDQZyL
         LMm4y9Rdg/rGNToXxyCNoT/47nX7wSeU2djtLFJW0eMQoYtc66cRpjBzgu1gP8Q69Waj
         J5SBiZUlFx1BOZWpzXacv7P5IzRAxumT9kCPtftSZtqZchWyus3aee5Z50Sv9SBzcZcf
         mcjqubmlkGjQ+hi6ZPcaYg19HMDzcUK7lxkc7XmejdDX6pg+rrD8u5VOT1lfENctTSeG
         3AvA==
X-Forwarded-Encrypted: i=1; AJvYcCUEwvI21bo/pq+s9R3sljcH4U9yt0m5D9eB6jIo21rwCxc1+Sz9AET0BkqYy52oPddChTFmfgBpyQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgArPNxZ6dD+LWyspMR86mSdS0LDyUZQfRoiTMQw19CNnX0vA
	snCroODddjLSxteWAuJIcBaVyorhx5ZgsNG+/6DQj/qv+ifVIjnxtKXXhXBEv0YTT3o=
X-Gm-Gg: AY/fxX4z0KPqSmLgF49r+sU0/xIFXL5Q2AY9F+SP5G31DFtiKY9a9mnJaYU8ANpHXlW
	3Q6fa50FYO/0xo0KkSKnEK2Xm1s6jA9ngXI8iWSwggTLzHCgX2vxevoUO52/xrJrqYuk/8eYdTp
	WgD/da1+DlMxXfj1YpD3OaGNqZVLr7oXDuEwO6yiRliiTKgN/1mEMvtN9++vvczcxY10PmcKn6z
	GVvv+G2YvEO39yvxtOZyTbtyDYtjCkpuwgtwmZ7omqp8G6Mp3SMSakVwnPshKBK/0hLAiAosBNw
	ywTqxzuIpynGQ9HKEA1E5+B8E6akVwYT38g8If0m5yptoyY5EQdUgfD2WZ7Dyh+8jmmR9OLA6lY
	xhqLh2PEm2cB23fhxQxrAonFI1gIqQt3ZZ1btkTFp1EU6AqRP9wYfi+/rAv/277vemAJ0h+UdUR
	ACIlCqd4QauYFo4c8F/AtUkdcltpMFSGDoGzgTIqxn0M/jaoAk
X-Received: by 2002:a17:907:3e29:b0:b87:fc5:40bd with SMTP id a640c23a62f3a-b8793287f88mr197109066b.65.1768555147388;
        Fri, 16 Jan 2026 01:19:07 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm179007166b.45.2026.01.16.01.19.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:19:05 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso2725993a12.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 01:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXw0syIfQM7Bn1JvyaJrfDzvkMrtzeGa66zMNj+NNpAaGmr/pPJyl15QzYmyX6NQz9b7GxS6NZN3o=@vger.kernel.org
X-Received: by 2002:a17:907:9454:b0:b73:8b79:a31a with SMTP id
 a640c23a62f3a-b8792ddad96mr210546566b.16.1768555145608; Fri, 16 Jan 2026
 01:19:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com> <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 10:18:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
X-Gm-Features: AZwV_QjnMR0z1U9X8PF-mj2vaxUL5fQhBMQoJnoEgWxMLhhMV_w20Nq1yc7r5Cw
Message-ID: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	Hugo Villeneuve <hugo@hugovil.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -556,17 +579,114 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +/*
> + * VCO-->[POSTDIV1,2]--FOUTPOSTDIV--------------->|
> + *                          |                     |-->[1/(DSI DIV A * B)]--> MIPI_DSI_VCLK
> + *                          |-->[1/2]--FOUT1PH0-->|
> + *                          |
> + *                          |------->[1/16]--------------------------------> hsclk (MIPI-PHY)
> + */
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
> -       unsigned long foutpostdiv_rate, foutvco_rate;
> +       const u32 extal_hz = EXTAL_FREQ_IN_MEGA_HZ * MEGA;
> +       unsigned long foutpostdiv_rate;
> +       unsigned int a, b, odd;
> +       unsigned long hsclk;
> +       u8 dsi_div_ab_calc;
> +       u64 foutvco_rate;

As foutvco_rate is changed to u64...

> +clk_valid:
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
                                             (params->pl5_intin << 24)
+ params->pl5_fracin),
                                 params->pl5_refdiv) >> 24;
          foutpostdiv_rate = DIV_ROUND_CLOSEST(foutvco_rate,
                                               params->pl5_postdiv1 *
params->pl5_postdiv2);

... this division needs to be updated to DIV_U64_ROUND_CLOSEST,
to fix build failures on 32-bit, as reported by the kernel test robot.
I will fold in the fix.

          return foutpostdiv_rate;

   }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
