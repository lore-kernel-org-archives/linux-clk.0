Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA83815FC
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216999; cv=none; b=h3dFIBKtDkAKfd7Z1cBgWsjN2ff2tbEkeSlWDDFLca3OxDSUcT+xp1ZeirIZD+Xfvr1NyDpq0/1ulGy9Eaud+limT6JAjGShdDdPS8riirznZXKE8kW63dGOW35azlHcJfu41DOiz7HX9czmlLfA1J59t4pxWxq08/9oGFVWmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216999; c=relaxed/simple;
	bh=8ZyYUZqdYO9RtAGZXJ34dn6k/pDj0jGAodzQsrEhkvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyiSIeIa9FW829Nyz0KWQvzEYbDDxDT0jzDIt2n2r82qmOSrZJQECp7Ugo3Kp/qKP5hkh0YDSmPnyAQaOeHm0jY6qMJL3upXqfsJMSrkp2GVAn6WLCuIaStAJkt4Y3sJ1GPJxhBgvEg8Pg0ucmH5Kn3dWuqg8G1vVoU3gh2R2jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56739adfa1aso1941063e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 10:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772216996; x=1772821796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcd8Oic1Sc8ZJu2YAJkZaSOQYT6Z1q9h1yoGvFgoj60=;
        b=uPODFbqJ/WlWMlLNm46Bjtc579Y9TCDlFvlmxGe1Z/lRz1MbaA6ZZ73fF7GcTFHigd
         UZzlXAu0l2pf6ZyoruQtcPHUho709sZl8JKeEnjy7w3A4/Jv26W1c3AElITiV84D8Gd+
         QNNixfCOL+uG35uuSXKMUs9FmgQEGExgMQiADisl9aOejI0as/2+MVH4Rrd/JatDOQ1o
         iSFOnE1MTi6jzuVkfR+0iqKjMonFQKbPma1FQDFfzXoUzsE7AyxovDHu8uQaup7x0Nff
         +zzYeovbuxDwETqKY0/7Meg0owf5blg9hVS7yGK7pEi2l1TstzG7jWNMDzUM1mO27bbu
         VHSg==
X-Forwarded-Encrypted: i=1; AJvYcCWeicd+OjMZwNli1OuQoz0P2B6nLXN+aLaX6AQrSJ5Gs4uDfoqrTSsIBLSXWthnyQ4DEcY3OzymzVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVU+bSDkfoGRAS9yJY1FTlOuKE/WVZRlyH9MsKRs1zEvaUiuD
	nokrZatdM597jIgmurRw3ugYK+Wj2C+qv1rlrY5+4iEOFvByPpAhufS5r6zXChjcUvQ=
X-Gm-Gg: ATEYQzwA2MYZgub2DzLtINzsYZRrRQegJT1M+mgHewKj/bO55sPNZx+jDTupn4Zo+q/
	UbBQyA+isj+l2QHvtDqaLsDLplIZsBS2T3neOvXKKPlNDL2bnfddgbIRKr2uIitLOLmu8RJjc1j
	DWnkz+dGcxv94Qu0Le1UDQfsN6k2amIu52FcxKNGuz47twkkI864wWOq8RZrzCRVdVav8hFM2Z+
	KjleMiliS2PzjGVas7K6lYu1ung7d6kxdyKzzWTRhUw+mIkRfMZSf42zt1WlHFuR0eBycgasnHB
	fL0ZZXDrXBsSqGgslkG3mXiBqZvG08YT53v0uUk8yqkF/VSPZIQrzvOnmH1Luo3T6HqFGvN/Tpe
	JHQWw7dKK3+FPma4df4KSV4ZW9PhUfFX4csFHS8BjtrXjV9P8B1txXR25ZKwxrbIKQzLvHCBrya
	BgjVb3ZN7ccF+2aJqX3zQ+YfCUmx86iS68lo4JmvsQqXzsHq9m0QQ8zuhx0Pji
X-Received: by 2002:a05:6102:c47:b0:5f1:7aad:7c04 with SMTP id ada2fe7eead31-5ff325b4810mr2115496137.41.1772216996525;
        Fri, 27 Feb 2026 10:29:56 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6417a98sm5614377241.4.2026.02.27.10.29.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 10:29:55 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so1439855241.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 10:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4o71H4G9nQctyl/wjNmEwkVChLNpKNU66MMOVZ0uXsJRjauo5lGbtJcS9z6aW79iB6YU+r45UIDM=@vger.kernel.org
X-Received: by 2002:a05:6102:3ed6:b0:5f8:e2eb:43d with SMTP id
 ada2fe7eead31-5ff32331547mr2540585137.10.1772216995065; Fri, 27 Feb 2026
 10:29:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com> <aaHTMGQHZwutlBIv@tom-desktop>
In-Reply-To: <aaHTMGQHZwutlBIv@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 19:29:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
X-Gm-Features: AaiRm50fiYKFClgCr0aKEdOOuTixihvNu690WG65tXaKE8BtTScAymOURaJQ5yg
Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Fri, 27 Feb 2026 at 18:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Feb 27, 2026 at 11:47:58AM +0100, Geert Uytterhoeven wrote:
> > On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
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
> > > The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> > > with different duty cycles:
> > >
> > > - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> > > - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
> > >
> > > Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> > > allow the DRM driver to query and configure the appropriate clock path
> > > based on the required output duty cycle.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c

> > > +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> > > +       if (!clk_hw_data)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       clk_hw_data->priv = priv;
> > > +
> > > +       init.name = core->name;
> > > +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> > > +       init.flags = core->flag;
> > > +       init.parent_names = core->parent_names;
> > > +       init.num_parents = core->num_parents;
> > > +
> > > +       clk_hw_data->mux.reg = priv->base + smux.offset;
> > > +
> > > +       clk_hw_data->mux.shift = smux.shift;
> > > +       clk_hw_data->mux.mask = smux.width;
> >
> > Again, smux.width is not a mask.
> > Perhaps GENMASK_U16(smux.shift - 1, 0)?
>
> Or maybe we can use:
>
>         clk_hw_data->mux.mask = clk_div_mask(smux.width);
> ?

Thanks, I forgot about clk_div_mask(), which is definitely a better
choice here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
