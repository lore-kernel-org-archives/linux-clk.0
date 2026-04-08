Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728230DECC
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654369; cv=none; b=Ai7ovLG9lkK5WRMQ+5WrCZ8PrdwQ0ah1BcrUktzK+XIc1y/0en7d6DYXLLBnGGDohdMI1rpYMB2bisoKzJf372soNn8tvNbkVo8KMihUx3wkvyehSQ2CHBhZHSVwKe3veoBLLvnncdQldSg5oGbVeCQCSnmA+pXA0DVzL7DaCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654369; c=relaxed/simple;
	bh=eDPl1BxiRe/fUMVm6v8nPkG76S8YwwEBsYa94mj/dvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exQfjeDQUIAXS1dIXXToF2siNOZpSgHCPlRxYl63qpr8eZcPouHhMkp34UAbbFIbaI5D7ctgn3aT31UNBiHAh99cezx5+0gfwVYxMlvlog9ILEWm6AtjkEfWHFjbAXkWuHWtry1zF6iWVFTQOwZT0vT/xqzuwSYYHygA9kagc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so1864886241.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654367; x=1776259167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11iAo9dki9YzQOZbHMLoGuCa0VnV6ePIcYUznc5FWP8=;
        b=LF/duwZkM6gLbc90cg9rmBB9dbAAZuSJO73MHWSJowZS19qU+CfwwJ8azUDIzgGhlM
         xcL4vPBy+vCriKfCgD54E7gGUZxt+yRwdRTw/rTziQLaHRJaeg/GZqt7XeqUjc/eaKa3
         hHA3OM1X3XuXIMShLXuDKJuDkfBfQwsOMT7c0wjkFkHb2NQ0Za4ADv4606Vb6fP+aRDd
         iPkUP1iNZz4lgZIfnapTavFaZRJvbR+qinBS5680GJNeg0hyDw/JE8ZAON4Lbq8vciKj
         FwQNNAH2MgzVTnhegl+y4Bi0vXWtFJ/csGMQg7Ndf0vOzIOF/GbmuILAdgrJC6W5w8Zc
         FkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW2nW65+/rVyDPA2wTkedwrixUBw+Hop6tqdhuJxUhkPq/LunuuVBNCcN/83nvx6A/ZZyEZau8wN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDwQJPC+JHFdCNtnLelJAl0RFCpQ4NpCjw9shMWb9u9fcqEvw
	bzZNsn9GRBtj8PbFb5LfrJNb9Yt2YV070QStStBe1dmifviL3Fom9qLNwRGgKE4t
X-Gm-Gg: AeBDietROmwUYPgwcEev9nuPj7IsIiO9vlB9cmQWxnrn6iiA0zVa4eVf1m1dX2C0O6G
	nRv0/nGZZU2ytXj1VBsjGhlVBxO/EoxQOZlF/OJYK6F1+fALWQcV4/0YaczXzuzkhYwPE2Yfb33
	UvC8Uv2BMtAFx2EGVU7QMHZENU9Ijo4NFBUPTlaHj8VDbLSS+on/d0O8K/2ZvXOHeZ4nnMYNSGf
	gt9vrEAMgtCC2D1rt404VOoBb7Uh/ftLlciqSiAPqZhWWdvnN89ZTyepix3J7N5SapwHLQF3pt5
	6FQCWIOGT8ESp92TuXp02JSfTR9tTiO6ZwXxT1wg57pL7yM8CGk2eLdRr0ssWunZ70nCb7O2SEL
	KUPlVNLbNugZKNv3LIis1DTqxNbHH0NQvmhiVqpHr8gtGMSM29cCqrsRadW2vahNHikW0ona88Q
	NRUzI0+6x/ajBFcxCiuAxTVg0tv2dgq4p3Pl9Q5fhD1/FIknmDE+ck7EQrUF4/
X-Received: by 2002:a05:6122:78a:b0:56f:1ea2:8609 with SMTP id 71dfb90a1353d-56f1ea286b6mr866152e0c.3.1775654366598;
        Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9b8d22b4sm20332046e0c.0.2026.04.08.06.19.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so1864877241.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQo2lIeF+NuVPF70bQOZMsIj1KE66VFUxkh2FSwd14RU/B84etOnYu0CVqJqFbgAhyNOX1+Q2COEc=@vger.kernel.org
X-Received: by 2002:a05:6122:4b05:b0:56d:3b69:87d2 with SMTP id
 71dfb90a1353d-56dab9df26emr8767911e0c.11.1775654366102; Wed, 08 Apr 2026
 06:19:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <24d3853ca2522df21e6a071a23e23ba4ca4b7276.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
X-Gm-Features: AQROBzC36oVu26dy7QAue_JJJeRvfbuifO9CcFeX81T2keIzqU6JIH81ayIbX9M
Message-ID: <CAMuHMdV-GrDWaKzxf09DRKwDkcY7W_cZrnubBWqD0w1iAYc8Kw@mail.gmail.com>
Subject: Re: [PATCH v6 01/21] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 12:38, Tommaso Merciai
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
> The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> with different duty cycles:
>
> - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
>
> Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> allow the DRM driver to query and configure the appropriate clock path
> based on the required output duty cycle.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Fixed rzv2h_cpg_plldsi_smux_clk_register() removed u8 width, mask
>    variables and replaced with direct use of smux.width and clk_div_mask(smux.width).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
