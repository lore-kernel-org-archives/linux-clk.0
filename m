Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB263A4AD4
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408951; cv=none; b=CQUm54vTJ+RJHt4thHSPldU/6JjCFvU4p8zObwK80Q0R6S4uaXOnNAaZFpqCos7MYwp0FWqpe/UQ893z+MSXo9XU43RbnOmsfDRIXmlc9ByYd/rPGtVOnAizQs6RiYRsP1IhFEiZc1Atx3RfJ/Zp3bONfuMdms4G9rHl66LhWdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408951; c=relaxed/simple;
	bh=CysL6xiruiSX67uvlyRqvQmCCx8IHf9xdy9dHvpB3oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YxFWbjMTMXrhGs0khWmI6cDtLpM8AO1+w0vAQoh3OYZv26W5W5hbbBYeOYkZ/91Ri60XGMopKi4X0dKU+f0PosyzOYAhg623mKwELfMvUJFh7siH2oja+HMteR5yt9QkXZet0TTiM3bbRbOexlSMfVHImGojtMxmyWJxAmAzpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5636f0cf5c3so6442e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 08:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768408948; x=1769013748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zAI1vAm8zyuEJBGK15rFf8mW6aC3AlXImIyYe4APAQ=;
        b=YYf0O2zaEtWvA4rUIqTct8StCm/bP8pFbUH26rZp/0iPLyvuuyw4MKIRTO6XBeGtO4
         amz4TYqn3ALYGQk7ya5bg6BGSFbqWISgm/01XTDEZ/fTUvc85BIZIKJ0z4i1fwiYBdg8
         BqqlSRGslSe/6iuD05PSrdEOQ9ML4E23Doid1oEIitvrSvkCO80oZynovaZpTRvugorN
         sJVV9dStV/O+kHCuqMKKIIEz7IzsUd1kPkYZn4ey7hgzhFn0vwrjG9LlmK+9HTKB8Inm
         I2AuytcQ3EerHVOdnW7/mD/EeQlfTWPXO2IEFy7jigAc0h4C+YaZU30NZXqFEkXJGwTx
         7YLw==
X-Forwarded-Encrypted: i=1; AJvYcCXTbzNkOR8X+8TDbyYVxa8bgLuqrOUyRP4HHHE99Doj/dszNT8LMtydp4P+QUWpn6L19ISdTSHJuAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYOK83N4qP3DYKvwuPd4bOLvFwrHiOW0Pv+O5lDTuE/3r9Pms
	wiEuGWRyQuPQyY5KOa7604URdHJMERQQ/Q8iZhDg/kC2NdEu2kgsNylV8hyJzCif
X-Gm-Gg: AY/fxX5sh+xfDaWa3nRA2Fn03CnCRncRJFYp2Cqotsr7qXaA+dQROrAy2PSIph6PmbH
	TyB0sMcc7oCVs4vIoDhbcz49xtjwwlB6hWOp1mRTs0x15W+lw6CkghYYaKeMKQd4QGEd8++f7MS
	Na+yF7Ek5i1cSqlVf8TSaDqweV6eUla/nVkC1vDVADih8pUzd3SStscXDEOoB5l0hAHvjzOMCBV
	YFJ0AXYHfeH+kVCdYoBAsSkj/QzzGGH0wtxc45FJSkswyOR49U7iKwGRtAQic1BnAvdGskbUWdg
	GePhLDfMgKL0dthHqOfFiCQ+sAME1+dfRc1RV56hhkD25tMvEt8efv0dezdYgvbqHa9fzY2wAj6
	kWzmG3lzzcC8y8WAd+ldEPfk01o8GMhGrsu57+dZuqV3HwqaAhop0UZYfAuWwuD1Uur1iMLZRRL
	jWFfwX4OsV/CAVKWP4EQNn75cl9rPJ713FMt4vD4n706Hv5uSv
X-Received: by 2002:a05:6122:2887:b0:559:7acd:1d3a with SMTP id 71dfb90a1353d-563a0924a58mr1179334e0c.2.1768408948554;
        Wed, 14 Jan 2026 08:42:28 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636106e953sm17682863e0c.8.2026.01.14.08.42.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 08:42:27 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5efa4229bd2so3537437137.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 08:42:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH4Ixcmc1yohLRw5HXEuhRqbS2R0YC018rpW50GFdCfRL64Ovx+aXirfzXLR1v3lCEf0ioBJM1d2M=@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ef:b3da:1634 with SMTP id
 ada2fe7eead31-5f17f68f312mr1450471137.43.1768408947433; Wed, 14 Jan 2026
 08:42:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124131003.992554-1-chris.brandt@renesas.com> <20251124131003.992554-2-chris.brandt@renesas.com>
In-Reply-To: <20251124131003.992554-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 17:42:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
X-Gm-Features: AZwV_QjWcqhv4BWp6yUPa3iKC9wMZIiturOyBbCVRUrZoIrQDIcjrKfTqR4MbTg
Message-ID: <CAMuHMdVRaP1JwDfxPy3LNS7FY_0pNMTBxYj-VNRiWz3c3SgTDA@mail.gmail.com>
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

Hi Chris,

On Mon, 24 Nov 2025 at 14:10, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -18,6 +18,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};

While applying, I will move this just above the functions it applies to...

> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -177,4 +182,10 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> +#else
> +static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
> +#endif
> +

... and this part up, just before the RZ/V2H parts.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
