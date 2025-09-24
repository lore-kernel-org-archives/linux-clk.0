Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70D2DF703
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719138; cv=none; b=Vc2I5U7GAXvz7rXfSNJqgJs1Tw3yoZOh13eeUAS51P3NSaKhE9Emgnld5pf3TdvpIHNy4dBbYPbuJropX8dMVtIwy0iRyhx5j1N4K77ZgnHjJStOKhoxbYxd9pIAh43wb1lV0RPfXcELjP6wzNOSUi4H5F2/QqPLQAaVmOYnR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719138; c=relaxed/simple;
	bh=5CKhCzt8uwTRTXN1dt78wJGzG2xEgCNEZ1R79yBCn7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIhoqiWGPpI+JjAHl5NDV7GHFsj+itnTPNmj6K9rRTrufyg+FIyvZFm5AzhmV8zRtbOEC7VbX22j+rfE3TepVa8YEOvGKrccASZo1FHomsQ00PwDo9QVOg6LNAB6wn8VaYhxQqUmVpjgvrDdPutJvTI88u6JI4RLiq1v6qgjv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea5c8833b15so5433866276.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719135; x=1759323935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt3FE+JEfBgU4GvIduSmfD+mr673puEsHTiT0sBkYwI=;
        b=cAUCDx+pHnwtYUqsZpfp9ZjQGQMIybH8Gw7AnLtdFTxgomgkGVC4On2bczN8c9Ldz9
         qyCV3itcq9+D86SJ5NwkUH9v5HNPZ7+CPQ+e02uun3UzbtQsfJneUi/BKsmVnWMq+njA
         2fWX5MJv1nA3L0MKZJzLr2ZL8DolJ5IsFusZhfxaM3DURqnXwkk/pRdJYR9wVqsPCd8d
         yYCHdHM2qGbZwJII/joSh57Z79WkrYROXsseG/m6rOGTw5TzBFIM/5Vx21hBRcJG6pyW
         INmn8Cezc+HGfOL78H5vq5FeVErx0xXDD8twdU+1QBQ8LMnqj5ei/bxRD1z9Cz/vRYD9
         d47Q==
X-Forwarded-Encrypted: i=1; AJvYcCVD0w+Iui8ZP44pB5GRUUm51mjjI3Ugjm+xNpeVrHVW0qxUgIZSM0XpGEV7ml8UESqu/w4+m1Ey/7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGbxpPdZjHwU1DGrOfoU3i/zr9WKlG0MqMd2MZO6kJOXpBFHds
	EirZ2fbuf5J6tSDtfosJEotX3CbTOVhtSZF2KyFv3bi8LtggblkzXqGI8eLs68d6
X-Gm-Gg: ASbGncvPhd+AVDVSfXWO9eHpoUSehGF+tF0RzB6zP3jiSd8eCJVVzROCNSU/L9JZTvO
	zesrGgH7ydV/rONiWiK03uQLwyTVTWKMAcGhruaw8DIbUQgJlzAGsTzRPJbtwll/dUCzdn8wbM2
	JxvTSkeAgJYf3pQnBWlcirv0dTRZNELkc8XADQVOsH2nQNohj911uxkD7i3nVGbdsutRYq/evS2
	XxZpMwBBIXOOdV4NQnUDI8rLlEynwZFrR49UcwnSmKLLMqrMYHFzmbZ1ZvdXycJAvxNpOk2C6EH
	tdOfp/NIpwiR+MgmhigGgqa1pVjLNq87P3WnPgAMVymPcterUmYdn9RZ7mbypKs+2n2MYkZRaaQ
	6bi8CFlpoJ2VqbTAcPmYKWcW42kfccPQUAW0IYn55mPBNCbMjw5cmwOXJNN7w
X-Google-Smtp-Source: AGHT+IGbj66BjJOTecjyXJf3laS6Ju33BVGe3mx5MCLeXhuyzQsIdeFD/vuP3THJT4l5Fqm7VWjhlw==
X-Received: by 2002:a05:6902:1024:b0:eaf:ac70:2948 with SMTP id 3f1490d57ef6-eb330773abfmr4941602276.29.1758719133784;
        Wed, 24 Sep 2025 06:05:33 -0700 (PDT)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-ea5ce974212sm5919824276.26.2025.09.24.06.05.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 06:05:32 -0700 (PDT)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6354a4b4871so1932978d50.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 06:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVH4DElqkH/egwOYYb1j+h81T931YQ86rW+o4fIqGdv7By4IVGGt+kQYXHErgudn1OdaEZvBeXwDg=@vger.kernel.org
X-Received: by 2002:a05:690e:2593:b0:5fc:53ab:a49c with SMTP id
 956f58d0204a3-636045f7a94mr3388326d50.11.1758719130471; Wed, 24 Sep 2025
 06:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 15:05:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
X-Gm-Features: AS18NWC94EGYcxjMXs4Deenf7S5F9QjlUjLF0OPIzRnfMxCF0EhsIC5PeV3xDXg
Message-ID: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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
> Add support for PLLDSI and PLLDSI divider clocks.
>
> Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> PLLDSI related data structures, limits, and algorithms between the
> RZ/V2H(P) CPG and DSI drivers.
>
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly
> different parameter limits and omits the programmable divider present in
> CPG. To ensure precise frequency calculations, especially for milliHz-level
> accuracy needed by the DSI driver, the shared algorithm allows both drivers
> to compute PLL parameters consistently using the same logic and input
> clock.
>
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +                                              struct clk_rate_request *req)
> +{
> +       struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
> +       struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
> +       struct rzv2h_cpg_priv *priv = dsi_div->priv;
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
> +               goto exit_determine_rate;
> +
> +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_params, dsi_div->dtable,
> +                                      rate_millihz)) {
> +               dev_err(priv->dev,
> +                       "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +exit_determine_rate:
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate * dsi_params->div.divider_value;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate;
> +
> +       return 0;
> +};

Unneeded semicolon (there are three more below).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
