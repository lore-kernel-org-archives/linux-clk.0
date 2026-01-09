Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B62264A7
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983698; cv=none; b=ZqxSDWyvM+z+bTCbXLq/EYPBULxq1a6Q3N4aK2vk4bLVjKHP/hhxJwHWzflG0SvdWyoyWioeQEEGYUmNeBcEoc2Lcr6+Rg69+w166cW3p1R4yXZeBr5z7rjC1JDK3a7icHk5Qkw9y7XHAn7dCKNYh+WMW0jnrlIuGvPaveNsw60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983698; c=relaxed/simple;
	bh=8NvlTqu6j0EpjloynCSX8IQE4vxB8/H2cpLGf91EbfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDE1tBldOnkBeVRRcOWC0jZztPFgIrSkaGrFfjMurBJNml9Yq6WcnsKqXq7XjYFOYNOZD2MMxjYot7k6RKtLCQk9o2o9VGMJOFmGRmmX9dQsZmxLr4uXXuF/wl8bJxyloMsxCvQZElT4dCZLOWdY5SvbJEg3qdAPIMWsccoQyJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c7613db390so2747244a34.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983696; x=1768588496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcttSXs7hZcQIHZPsbTRNE9EfXDmld5bm3jzlnDASfE=;
        b=qV9GA0EWnYDM4F9B0LqPwl7OfLSaLr8F3wHTm0f4+2/ZjIwdXsnEOEGJ0+tDEhsOT7
         s5Cyv2LBir5lhcxzSrO2aU2gUgVtljW8Crr86ZQBuv86fYPQBCctVQxydVo1yhyE0RJB
         W9dC4Pu3nolEs5M5ucJik54z2bEdM32r6+8glNmOxGv2R3tXB0jd8FqyQXxB/3RRGth6
         rmrcWEactzDrbZSnGs0GFQ+hBUBMclcDZLLM8wmq1JV3xRqw/VmhxMLGM1ur0WOjjYx3
         6pGKOzRYBYGl1+eP3yD45rCLrYlV4P2M01ZoIeakjWAleQtglBZXJ3FFl/YwkuiU5aHu
         I4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtgjMv9aJ75LCrvVvDNT5KfJ+PNnVEYFt6kXVfyAdZdbcEAVucoJsrYlTkUDZIL1jFXe6NHW14FmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOoDghB62Is0CW+h4SAJZE/q/gdWOjcuK8SnpkK0QZBzO9wg+7
	lkc5UgMSOOcJfsc2v8uZ7h4rDaSEYzOMC4w9awpVEq3TyC1ensSAQSLVRLCJpbNG
X-Gm-Gg: AY/fxX5Ic1yN8MmLZVhjPH7lWptRW4+0Itlc8SbbcEujZLBtYXEahpJe5DcPSh0LQu0
	BOTk1xcMt6rTlC2+6SdF0mEtXvQfq/CJpM8RfbiWLWU5o2DucvFTEZ1jYz4tmdFBCxhFZS44oHs
	8kXYsnoOdyuKJT6xNAP6Y3+wN4vYsxCYucPbaEZNjdWDraIwELUgEk5F5/ZaY9ZlAd5IVDlf7Ny
	L4rMSRBntfmk4iKj8g2Fh10scMnXGQp/xIMjgN2G/9mOsBw6c0cmg+IVf9jbs7vnlXK1GK6YKXV
	tgbQFkHU2s8nh6WpX1HuLQi1o4FMNkGVxzbMfN26I2LDyJzcyAiFQvRqxi1IFVJ6le8U5Wyyl3e
	G6lvCsBgw16iBQ/in0B70c5/E0tb3LVX1x7bURZtar7a5S+vQMy//txyvlYRVonPzz6T5vPsNfX
	GBzEWxOTfgVLegDoQ4+OztPdCamoe3cGVdCuDvz4eWZuKSLnuc
X-Google-Smtp-Source: AGHT+IFojJwwjh8rGw15VUAgHEA1G4E6xx4ddH9PBF8q4viu5ySJRdkHNcIjBTl3Z0BbLp0+SAIQGA==
X-Received: by 2002:a05:6830:2e05:b0:7c7:da3:ed27 with SMTP id 46e09a7af769-7ce50c3d832mr5409186a34.35.1767983695856;
        Fri, 09 Jan 2026 10:34:55 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9c17sm7817264a34.22.2026.01.09.10.34.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:34:55 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-659848c994bso2375045eaf.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:34:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ+Xr3HIA5P7Wxa1e8WjFVWO0UtXlIXCHaefjEWtQu+id6MGty3KtzaGEGTsvSC0vavnKxvxAJikg=@vger.kernel.org
X-Received: by 2002:a05:6102:3908:b0:5ee:a6f8:f925 with SMTP id
 ada2fe7eead31-5eea6f90e16mr2088665137.8.1767983235950; Fri, 09 Jan 2026
 10:27:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:27:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
X-Gm-Features: AZwV_QiFWie1jtTH6cP5clrt_EyRli2uQRED0h6evUp71Jo1c1Hn9WoeLwyfMeU
Message-ID: <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

[...]

>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
>  {
>         struct pll_clk *pll_clk = to_pll(hw);
> @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>         case CLK_TYPE_PLLDSI_DIV:
>                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
>                 break;
> +       case CLK_TYPE_PLLDSI_SMUX:
> +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> +               break;
>         default:
>                 goto fail;
>         }
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index dc957bdaf5e9..5f6e775612e7 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -203,6 +203,7 @@ enum clk_types {
>         CLK_TYPE_SMUX,          /* Static Mux */
>         CLK_TYPE_PLLDSI,        /* PLLDSI */
>         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
>  };
>
>  #define DEF_TYPE(_name, _id, _type...) \
> @@ -241,6 +242,13 @@ enum clk_types {
>                  .dtable = _dtable, \
>                  .parent = _parent, \
>                  .flag = CLK_SET_RATE_PARENT)
> +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> +                .cfg.smux = _smux_packed, \
> +                .parent_names = _parent_names, \
> +                .num_parents = ARRAY_SIZE(_parent_names), \
> +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> +                .mux_flags = CLK_MUX_HIWORD_MASK)
>
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions

Why do you need a completely new clock type, and can't you just use
the existing CLK_TYPE_SMUX?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
