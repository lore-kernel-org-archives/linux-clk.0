Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78428D8DA
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291080; cv=none; b=WIAsahhXQ1SsediTSTG6dQx8bWfjbkYVJCzpqgOfVmEYxtbs/8+/DccZaMMVPfcEnYqFkBkHQIBkzcbT6jRHVpOoVEcfQ2e3BKQgQiYU5vPxeSFm3Zsg+t/VefCoPdCnBcGu+3ni/lckO6rNsWBP2HLrVj1bVOoAiEXsTdXVYIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291080; c=relaxed/simple;
	bh=gUGiB1llxABWmePU3+TscZZyVisC3oSIs+3uF6fFgTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYfwU9lwieEvVazlrNt8UPRojye68TktrGVCWDRHsO6OghCXrK2iuiwyYxQCaFDEYpT1IesJyFdnLMW/xZCdyD57tl3aUSJH8zqwcv8pUZ2s+96xYrj2yHDIuVNFegYRveFPHtzRLqY4rHI0fakxZGskAZ8T1LPCmRBhH5J2yhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5db4006eb0fso295490137.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 00:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291077; x=1761895877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbjF3fYBru7mg7PwcFMgCH2adsCiWE8jEZcxNXnQxiE=;
        b=BQmOTdgzbmsWo/ZObnTwvhWZVW6eLKQZO9vBBzBAnoDUSVvtalH5QzzALxa6URhvcn
         qD012CrX9pzdYMW1WibQKlZ0l9Jk4psuNOrzWipkpWEpIbkqsIexz82HlVd/iQoBO6wm
         sm6O3zDHcFc+0LFc4AC73W1zuTQqmXXrbFg0N7R4U38VojZyKC3Htw+BEb8Qki2RYl5E
         zEOhc35X0XcgwUoSp8XeJFYg9IT3AfEOt+oxF/fXjwJ3F0kCOPxrpZK5yz7Y7UgxgXpe
         12Db5N/I7+8lnvY+tvei/O0vY8UNRtzqeBadD6hbvHNzlPOX0XyCkmUiocPblurzuJF+
         b+bw==
X-Forwarded-Encrypted: i=1; AJvYcCWoGYPgVTD7OK4SEixr/SkBAP3fyGjeDaFKx/60jl+rKpOGI7SOU26NV1e1as6XIX8JzrQUxTa4Tm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyShPoVOvuYmNOoA/p/2SmSswgaais3rUsdQWRkwhBEZ1WzNfSv
	hA+OiHXaEUb8dwGeuqjAzg7YylsPKn4pth6J6n7vraP+vctElE1DQ7MAiemkR742
X-Gm-Gg: ASbGncv/CMgyfRBun5CAZW3sEpqkeHlsEaUkYwChHmvjCOR5D2G/uY30LXnjDIYxEUh
	EpLCG3RcAxLc+P8AGTOeyDCiuGtGgN23ElYO/EXThyeI02+0bS3qrSSD2UHA1dltbXVm3bfiThI
	5tzUrmTUpBa27TyJakvgXGP8XuLGxSbC5ADpe+ylwyZB5+x1REj2YKjWe+/syjZgsT9Bev/miHN
	DJbqa7IPPMs+mXg8Zz+JQPSt81PNoqYsLvyzc4r8EWKTJFKaden/iEGloky3FGxEW1OezQFqf5Y
	UqvPMdZoWOsuwxqgp3KddhmLKVLI6fi9H8L7lbE+awARJ6HymAK3gYqVvPTi7eigrAArSfNrZrF
	TWaEHc500ZmIIrELcIqArHWcnJgnozBcXWLDgS25/FYUX0s+YkoXmtgBbv23c1I5oLBNxwxmIzn
	dVSxiOB9ozAdFZbXQfYhrGNBFdZvGvdFchxSkpbJq2XiH9+9Yk
X-Google-Smtp-Source: AGHT+IE1PgR7QA5BC9WxKgThbQyp/Yxmq/w7FzDaiTweIlJUDgaCTRbQFg3gl2uf0p2AV289vU+FtQ==
X-Received: by 2002:a05:6102:512c:b0:5db:293e:f074 with SMTP id ada2fe7eead31-5db293ef4cdmr2737807137.32.1761291077439;
        Fri, 24 Oct 2025 00:31:17 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934abba2c67sm1770520241.14.2025.10.24.00.31.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:31:16 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db4006eb0fso295459137.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 00:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiDGHIIcNXd89WXDQ7aoO47CyAal6AkQ5pm9KIijiiPgLeFXRHdHS7TZwEQX6N40tl9X9+nlTruEA=@vger.kernel.org
X-Received: by 2002:a05:6102:c08:b0:5db:2b3c:eb9e with SMTP id
 ada2fe7eead31-5db2b3cf1b1mr2162722137.37.1761291075525; Fri, 24 Oct 2025
 00:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022235903.1091453-1-chris.brandt@renesas.com> <20251022235903.1091453-2-chris.brandt@renesas.com>
In-Reply-To: <20251022235903.1091453-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
X-Gm-Features: AWmQ_bl2d7bwxn3o_AI0y5I2A2WSBvgxEYlOh2d7MohygC2Sb449e6tQyb1BgRI
Message-ID: <CAMuHMdWONtGp=jdaDYzU1D4WO7KO-zU8zLX--5fQOAiKDpNw=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
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

On Thu, 23 Oct 2025 at 01:59, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> v2->v3:
> - Removed Empty lines (Hugo)
> - Add dummy for compile-testing CONFIG_CLK_RZG2L=n case (Geert)
> - Renamed label found_dsi_div to calc_pll_clk (Hugo)
> - Renamed label found_clk to clk_valid (Hugo)
> - Removed 'found' var because not needed
> - Move 'foutpostdiv_rate =' after if(foutvco_rate > 1500000000) (Hugo)
> - Move PLL5_TARGET_* for new API to renesas.h (Hugo,Geert)
> - Convert #define macros PLL5_TARGET_* to enum (Geert)
> - static {unsigned} int dsi_div_ab; (Geert)
> - {unsigned} int a, b;  (Geert)
> - Change "((1 << a) * (b + 1))" to "(b + 1) << a"  (Geert)
> - Change "foutvco_rate = rate * (1 << xxx ) * ..." to " = rate * ... * << xxx (Geert)
> - Move (u64) outside of modulo operation to avoid helper on 32-bit compiles (Geert)
> - Change DIV_ROUND_CLOSEST_ULL() to DIV_ROUND_CLOSEST() (Geert)
> - void rzg2l_cpg_dsi_div_set_divider({unsinged} int divider, int target)
> - Change "dsi_div_ab = (1 << AAA) * (BBB + 1)" to " = (BBB + 1) << AAA (Geert)
> - Added Reviewed-by and Tested-by (Biju)'

Thanks for the update!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -16,6 +16,11 @@ struct device;
>  struct device_node;
>  struct generic_pm_domain;
>
> +enum {
> +       PLL5_TARGET_DPI,
> +       PLL5_TARGET_DSI
> +};
> +
>  void cpg_mstp_add_clk_domain(struct device_node *np);
>  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
>  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> @@ -32,4 +37,10 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
>  #define cpg_mssr_attach_dev    NULL
>  #define cpg_mssr_detach_dev    NULL
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
> +#else
> +#define rzg2l_cpg_dsi_div_set_divider  NULL

static inline void rzg2l_cpg_dsi_div_set_divider(int divider, int target) { }

For cpg_mssr_attach_dev and friends, NULL is suitable because these
are only used to populate function pointers.

> +#endif

Blank line please.

>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
