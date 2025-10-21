Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF172F5492
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055353; cv=none; b=VDRClcgE2ETCcERJK3PCJqSL6etdlziLx6JfDX+cCMBx4s44nbsZeey8s7OwjHT1F2RSMHeRZxvyyU7s+4KcDELCPpVRravaADpHtZ5PfN4Eyk6AMrgFR8PrfnvlPsheMHTy+RThSHwn4yz4ZeoVAGk1e5E3/S4Stq6Yvy+Bgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055353; c=relaxed/simple;
	bh=myPKEpFCfK6VNdq1OrXL5rHyz8ZZmJYmfPQNIlpMmNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sb6fFHsl3zSf5PBa4uTi3Yw8DqAGPNNjO8K0ZPCSYHO7jYpAuLfXbpequFD8bctgeVgk99lIFyY4MhGcIrEBpQssdDC0asg8s6KVNRTEpnlq1VfJ9BUuudbWxGGxbyi++1Hp9Roe3FNci6/SyDvXsIuTdOHICfctwdBmpKdnsbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so4719165137.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 07:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055350; x=1761660150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXugAlNcvucEYnbbLM3xKX3aXFg6Ylpfx0k5Z7y5qH4=;
        b=Pdsp9x9fDPqrZph/8sk9SEIyGGxe7d6BxLoVs5eLaXt7V+KnaLV9YhDx7JMAO47Qi9
         uDtGGN5PJ+t+Pyb+vWi2C+mu6koSCu5+SvRI/Z03dCjfHnNcw4fnYHrwzZFOBSIv8oJ0
         P+sYvY6VFJmD4yH1/0gJHcozfy8hu94OPT47TV5Wk9KTWsRp6SEfm0LJjML4VFSSpZNK
         OoTQnL5sv5sXGv3QE1MYxmn36641ePqauhQwXsHbJ/alI0JVFI4tr3itRBB1fDDATI8R
         zbtmRU7GXRoM5sTTeh1tBDtyZtruNvmbgr+Xf71bcQFUh/COtVSMro/hrnrAm/px7C9m
         JpGw==
X-Forwarded-Encrypted: i=1; AJvYcCU4hvSHg2mCxtR50j0CWMBvWr600d3r8kzlGGZOBpCOvEHZUnyYD8SLOvCYpBEKlDEbW2mkj2asLuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNI7QXq+kdth54kyIYQQylwLCT0OOY4HB7y8QmBaoTwGUdTRx
	pWLZ5aCSiJqUSo3mgRVoo+ENLhlRx2Lplhm4oeJzzKqN4ZDopp5M+9uz5uVY72wM
X-Gm-Gg: ASbGncu+ILbK3Z4il5vye4l44BDUU6GCK95RUfNYLomZb3Dsz5CaDtYRLo5YCzcgX0s
	fPHhbsCa14aqau5Yu7UJR8eZrS3AaLc7iTIYMmRGJj2Te+mEA8A5cro/M/BNzlegZBSSMSp0U8e
	SEi9SWkO+aDLnWBzoPwlT7isNqzoOKSKhxiMFnynodJ6NLoVLvz0jiJuN0ogjeKYwtHTsm9aRRo
	QmBXS6iUxS3WZP+FEf0/quFeIwoF/3DmyLhdADQrT6deQUl8rLwbV9aj1NB2FOG+o60XDHD0tsd
	dSTpbbNur5+2enCdLwCfy7MvH0Khz4gZuUe4xAQZN5ABGtTqTxzvXDsNcKZkdZEhfOEtbTWRymd
	WHVlZiH085x6PDGHqabnAQnj8EHhmxp76kA8Y5337sKptYzrw+x+lo31fDUZlhIGx96mm95Xq8Z
	wuldIcmYgT81Kk6pL79uMZavg+QGR0HzfOggEPlw==
X-Google-Smtp-Source: AGHT+IEwtrUCmba+5Oz52xkeYDZ9YkMxWgxfw2yPDPYUnAk58zkOD5le2luSm1QClnNQDIToN7YLAA==
X-Received: by 2002:a05:6102:3f4d:b0:5d6:85a:229f with SMTP id ada2fe7eead31-5d7ce7b9c91mr7182676137.15.1761055345626;
        Tue, 21 Oct 2025 07:02:25 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932f13f3217sm326092241.3.2025.10.21.07.02.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 07:02:24 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so3113562241.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 07:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6mNvGS9pLkKfDf6ydOscsEHYkHCNniPXfF2IFcaJCUd+MZQSwhS6JVdlcFlW7GwZ0B8kIb5H95Vw=@vger.kernel.org
X-Received: by 2002:a05:6102:2ad3:b0:5d5:f6ae:3914 with SMTP id
 ada2fe7eead31-5d7dd6dae8amr6635478137.22.1761055331143; Tue, 21 Oct 2025
 07:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912142056.2123725-1-chris.brandt@renesas.com> <20250912142056.2123725-2-chris.brandt@renesas.com>
In-Reply-To: <20250912142056.2123725-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 16:02:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
X-Gm-Features: AS18NWAilKOsk0msuDZD61x0CWnEgj86O5ttkvj001Q_uv_hFWGEg6rSKnFmYMU
Message-ID: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
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

On Fri, 12 Sept 2025 at 16:22, Chris Brandt <chris.brandt@renesas.com> wrote:
> Convert the limited MIPI clock calculations to a full range of settings
> based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from external
> sources before calculations, expose a new API to set it.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,22 @@
>  #define MSTOP_OFF(conf)                FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)       FIELD_GET(GENMASK(15, 0), (conf))
>
> +#define PLL5_FOUTVCO_MIN       800000000
> +#define PLL5_FOUTVCO_MAX       3000000000
> +#define PLL5_POSTDIV_MIN       1
> +#define PLL5_POSTDIV_MAX       7
> +#define PLL5_POSTDIV_DEF       1
> +#define PLL5_REFDIV_MIN                1
> +#define PLL5_REFDIV_MAX                2

Documentation says 1..63?

> +#define PLL5_REFDIV_DEF                1
> +#define PLL5_INTIN_MIN         20
> +#define PLL5_INTIN_MAX         320
> +#define PLL5_INTIN_DEF         125
> +#define PLL5_FRACIN_DEF                0
> +
> +#define PLL5_TARGET_DPI                0
> +#define PLL5_TARGET_DSI                1

These two should become an enum in include/linux/clk/renesas.h,
as their values are passed (as magic numbers) from outside.

> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
>         u8 pl5_spread;
>  };
>
> +/* PLL5 output will be used for DPI or MIPI-DSI */
> +static int dsi_div_target = PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on resolution and lanes. */
> +static int dsi_div_ab;

unsigned int

> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>         u8 clksrc;
>         u8 dsi_div_a;
> @@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core_clk *core,
>  }
>
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +                              struct rzg2l_pll5_param *params,
>                                unsigned long rate)
>  {
>         unsigned long foutpostdiv_rate, foutvco_rate;
> +       u8 div = 1;
> +       bool found = 0;
> +       int a, b;

unsigned int

> +
> +       if (priv->mux_dsi_div_params.clksrc)
> +               div = 2;
> +
> +       /* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +       for (a = 0; a < 4; a++) {
> +
> +               if (dsi_div_target == PLL5_TARGET_DPI && a == 0)
> +                       continue;       /* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +               for (b = 0; b < 16; b++) {
> +
> +                       if (dsi_div_target == PLL5_TARGET_DPI && b != 0)
> +                               continue;       /* Only 1/1 div supported for DIV_DSI_B in DPI */
> +
> +                       if (((1 << a) * (b + 1)) == dsi_div_ab) {

"(b + 1) << a"?

> +                               priv->mux_dsi_div_params.dsi_div_a = a;
> +                               priv->mux_dsi_div_params.dsi_div_b = b;
> +
> +                               goto found_dsi_div;
> +                       }
> +               }
> +       }
> +
> +found_dsi_div:
> +       /*
> +        * Below conditions must be set for PLL5 parameters:
> +        * - REFDIV must be between 1 and 2.
> +        * - POSTDIV1/2 must be between 1 and 7.
> +        * - INTIN must be between 20 and 320.
> +        * - FOUTVCO must be between 800MHz and 3000MHz.
> +        */
> +       for (params->pl5_postdiv1 = PLL5_POSTDIV_MIN;
> +            params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +            params->pl5_postdiv1++) {
> +               for (params->pl5_postdiv2 = PLL5_POSTDIV_MIN;
> +                    params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +                    params->pl5_postdiv2++) {
> +                       foutvco_rate = rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *

rate * ... << priv->mux_dsi_div_params.dsi_div_a;

> +                                              (priv->mux_dsi_div_params.dsi_div_b + 1)) *
> +                                             div * params->pl5_postdiv1 * params->pl5_postdiv2;
> +                       if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
> +                           foutvco_rate > PLL5_FOUTVCO_MAX - 1)
> +                               continue;
> +
> +                       for (params->pl5_refdiv = PLL5_REFDIV_MIN;
> +                            params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
> +                            params->pl5_refdiv++) {
> +                               params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
> +                                                   (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +                                   params->pl5_intin > PLL5_INTIN_MAX - 1)
> +                                       continue;
> +                               params->pl5_fracin = div_u64(((u64)
> +                                                    (foutvco_rate * params->pl5_refdiv) %
> +                                                    (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,

Please move the cast to u64 outside the modulo operation, else
the latter becomes a 64-by-32 modulo, which requires using a helper
from <linux/math64.h> when compile-testing for a 32-bit platform.

> +                                                    EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +                               found = 1;
> +                               goto found_clk;
> +                       }
> +               }
> +       }
> +
> +found_clk:
> +       if (!found) {
> +               params->pl5_intin = PLL5_INTIN_DEF;
> +               params->pl5_fracin = PLL5_FRACIN_DEF;
> +               params->pl5_refdiv = PLL5_REFDIV_DEF;
> +               params->pl5_postdiv1 = PLL5_POSTDIV_DEF;
> +               params->pl5_postdiv2 = PLL5_POSTDIV_DEF;
> +       }
>
> -       params->pl5_intin = rate / MEGA;
> -       params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);

(u64)(rate % MEGA)

> -       params->pl5_refdiv = 2;
> -       params->pl5_postdiv1 = 1;
> -       params->pl5_postdiv2 = 1;
>         params->pl5_spread = 0x16;
>
>         foutvco_rate = div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -                                          (params->pl5_intin << 24) + params->pl5_fracin),
> -                              params->pl5_refdiv) >> 24;
> +                      (params->pl5_intin << 24) + params->pl5_fracin),
> +                      params->pl5_refdiv) >> 24;
>         foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,

foutvco_rate is unsigned long, but the division uses the _ULL() macro variant?

>                                                  params->pl5_postdiv1 * params->pl5_postdiv2);
>
> +       /* If foutvco is above 1.5GHz, change parent and recalculate */
> +       if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> +               priv->mux_dsi_div_params.clksrc = 0;
> +               dsi_div_ab *= 2;
> +               dsi_div_target = PLL5_TARGET_DSI;       /* Assume MIPI-DSI */
> +               return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +       }
> +
>         return foutpostdiv_rate;
>  }
>
> @@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(struct clk_hw *hw,
>         struct rzg2l_pll5_param params;
>         unsigned long parent_rate;
>
> -       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +       parent_rate = rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
>
>         if (priv->mux_dsi_div_params.clksrc)
>                 parent_rate /= 2;
> @@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
>         return 0;
>  }
>
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target)

unsigned int divider

> +{
> +       dsi_div_ab = divider;
> +       dsi_div_target = target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>                                       unsigned long rate,
>                                       unsigned long parent_rate)
> @@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>
>         vclk_rate = rzg2l_cpg_get_vclk_rate(hw, rate);
>         sipll5->foutpostdiv_rate =
> -               rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +               rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>
>         /* Put PLL5 into standby mode */
>         writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY);
> @@ -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>         priv->mux_dsi_div_params.clksrc = 1; /* Use clk src 1 for DSI */
>         priv->mux_dsi_div_params.dsi_div_a = 1; /* Divided by 2 */
>         priv->mux_dsi_div_params.dsi_div_b = 2; /* Divided by 3 */
> +       dsi_div_ab = (1 << priv->mux_dsi_div_params.dsi_div_a) *
> +                    (priv->mux_dsi_div_params.dsi_div_b + 1);

(priv->mux_dsi_div_params.dsi_div_b + 1) << priv->mux_dsi_div_params.dsi_div_a

>
>         return clk_hw->clk;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
