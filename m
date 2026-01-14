Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4F397ADF
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396085; cv=none; b=orryXwUsKPWkmGW3Xb/AnuBSMdgeBbA4DWd3gxYfLEWTvJuuwi0wv7YYcyVbxO7ewIE8hRebWsvlgOw3+S3A5JZMTu1VH/x09Fi/l21gaXQK9rd391yIquxTVaZop/qzxqRofqF9wAJeI5tkk913+9OM0wA8MDdcLFakDm5I5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396085; c=relaxed/simple;
	bh=SgYrcZGPiUp1pJDcapGaJzmL2NW2465UduC8O2fyutI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=smWI2dZI/NukSGJqBA8lR9dA2YKTUIJDqb1RVHyRUX+CPykyWRAYF+XF5L6RX+orNm6rO0ndwq/Qx2sTOkH/bRTKbbqRYZi4OE85tLBZS5uSW7DMY/VwxnYyFE+qAihKY2tmfkC0vsp+lWAqKP77fXs5r9+vG+XAoFfTWQ4vOKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ef5c04151dso1923442137.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396083; x=1769000883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOnvgxequhkaVjnrcP/Abcj5FnEjgQ9Z6oOwYXqR9LY=;
        b=u+PRR7JP1F7H2QvWA7W13Mmit5zsEZ0/o8bKxwqC2a3XdgRPC6nuD0VljcE93QLIdb
         Uvx5AdJZ6NBuuPvd7NwggJrywGE7o2ahxyTgy09aHntrsWsoLVZzTshIafMNrpz97yvT
         fvBVM2/JshnnNfG3dvddj2L/aLJEy8zH91UUsJ6tLZ7V5spHeMqV07YYYhDQ2YBW9x/7
         cICk7Hxp4G8k4ZtU3Y87/igdRe9cniP5BjMyvh7xE6B5aeVifdvmPHEnJr66I3uaNmX5
         4IqM+Zg7Kqgbv5Rgx1h1jT7gE2QLxDtnsI7/C3ejjdZw5R5bl6CHCWTqqrZlZMN7Z6DG
         1tbA==
X-Forwarded-Encrypted: i=1; AJvYcCV9zY0YHEK6ivDObuJfNUF46CT0IuBi4IadZgpaDL+n08OhoRitkJEV7haig0mQ0GmJ0gvTsACtA1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+KAN+qr0S5TIwc1YDyTKQeMGztkPxjwH0UBtIwmk8Jd0DJd+
	a8G71YbxV9gzejoab+DtpvrtYh36qr/8oPewfJ2HzNTug+Qpyibed9GPqyh2P2F8
X-Gm-Gg: AY/fxX4dGJgHu3ve0s9gGO49DVgk6w+zHTyXGPZyUaffyoKRU1imfsHfYSZhmRFW446
	vNScQPG8vlvRfyM90kxm4gRZjGR4mfx8hxM1GqZXYJ6qneKanV1aZum5iiRWrGLOVOwdJbEJgbH
	QDwtgkTE9DYAHCw8pcSwCGYzYqx556vbXOfDnkMWOKmVu0zpL9ze5DFsIRXy7huls5CBbmEcEFJ
	vjx7MoZjs4kE48oUdM3+HWqfwBAgQQ5CZ/P/NmXWjda6rsCasgclQLKGpHFgleeiLX5cbcg3lrV
	EwvpU9cXN/ev7YmPuUfMe5HrIZvwHq0NFJZHw2IrY3s6wI16mDqQMBermn5Hu7FS1+chGpnmlnE
	Dx+Hy8AYp93Kd022YuvIDcx4Xei3xhrcnzrYa+NZZU5A9a5TEp4uynTDHJqLDJgvpg+QhpgUH1I
	4zqClWQtlFq8irFjy1Fk3Dg6n36TVoaBokBGRd7SBMXE7AfzLo
X-Received: by 2002:a05:6102:1612:b0:5ee:a1e5:6504 with SMTP id ada2fe7eead31-5f17f65c006mr890605137.36.1768396082616;
        Wed, 14 Jan 2026 05:08:02 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94412404678sm22014523241.8.2026.01.14.05.08.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:08:01 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ed0b2f1fccso1730798137.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 05:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlKVk6PYTUKhLaMzVqJWBaFg+i8jQNYcIpr3kW2HNaJ911a7nh5NTviSP1euz6zNyDPiGS44zeYGU=@vger.kernel.org
X-Received: by 2002:a05:6102:1497:b0:5d5:dbbb:5b86 with SMTP id
 ada2fe7eead31-5f17f5c4c63mr892720137.25.1768396080489; Wed, 14 Jan 2026
 05:08:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com> <aWSs75UPtTezytxQ@tom-desktop>
In-Reply-To: <aWSs75UPtTezytxQ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 14:07:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
X-Gm-Features: AZwV_QjFXX-xMGPOrl95tfVFxAWP1NtPnSeHetQ4hnMLWm1TvwJXuiUd8szKzi8
Message-ID: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 09:13, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > sources.
> > >
> > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > them in the clock driver.
> > >
> > > Extend the determine_rate callback to calculate and propagate PLL
> > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> >
> > [...]
> >
> > >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> > >  {
> > >         struct pll_clk *pll_clk = to_pll(hw);
> > > @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> > >         case CLK_TYPE_PLLDSI_DIV:
> > >                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> > >                 break;
> > > +       case CLK_TYPE_PLLDSI_SMUX:
> > > +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> > > +               break;
> > >         default:
> > >                 goto fail;
> > >         }
> > > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> > > index dc957bdaf5e9..5f6e775612e7 100644
> > > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > > @@ -203,6 +203,7 @@ enum clk_types {
> > >         CLK_TYPE_SMUX,          /* Static Mux */
> > >         CLK_TYPE_PLLDSI,        /* PLLDSI */
> > >         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> > > +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
> > >  };
> > >
> > >  #define DEF_TYPE(_name, _id, _type...) \
> > > @@ -241,6 +242,13 @@ enum clk_types {
> > >                  .dtable = _dtable, \
> > >                  .parent = _parent, \
> > >                  .flag = CLK_SET_RATE_PARENT)
> > > +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> > > +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> > > +                .cfg.smux = _smux_packed, \
> > > +                .parent_names = _parent_names, \
> > > +                .num_parents = ARRAY_SIZE(_parent_names), \
> > > +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> > > +                .mux_flags = CLK_MUX_HIWORD_MASK)
> > >
> > >  /**
> > >   * struct rzv2h_mod_clk - Module Clocks definitions
> >
> > Why do you need a completely new clock type, and can't you just use
> > the existing CLK_TYPE_SMUX?
>
> From reference manual (Table 4.4-10 Specifications of the CPG_SSELm
> Registers)
>
> We have the following:
>
>  - SMUX2_DSI0_CLK*2
>         0b: CDIV7_DSI0_CLK (default)
>         1b: CSDIV_2to16_PLLDSI0
>
>  - SMUX2_DSI1_CLK*2
>         0b: CDIV7_DSI1_CLK (default)
>         1b: CSDIV_2to16_PLLDSI1
>
> Note 2.If LVDS0 / LVDS1 is used, be sure to set 0b.
>
> For this reason these clocks needs an ad hoc determine_rate function:
>         - rzv2h_cpg_plldsi_smux_determine_rate()
>
> For that CLK_TYPE_PLLDSI_SMUX has been introduced.
> What do you think?

OK, your solution sounds good to me.  Still, as this is used from the
DRM driver, I would like to get some feedback from the DRM people, too.

BTW, I just noticed in the RZ/G3E clock system diagram that
CDIV7_DSI0_CLK has a duty cycle "DUTY H/L=4/3", while all other clocks
use the symmetrical 50%.  Perhaps the DRM driver can request a duty
cycle of 4/7 when using LVDS? Currently the DRM driver communicates
its requirements by explicitly setting the parent.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
