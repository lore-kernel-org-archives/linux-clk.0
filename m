Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4A366823
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189294; cv=none; b=j7VHyQp8ZRSDqf0NdGjh9f5ejL1XIr+h/RZdr2/8FzmzTWSZmKVhd9X2Wo+/5YtOmcsVwUPQP42cD/udeaapQJSkZlpla8j4uuhl0hiHKXkUbeD57nm3/h6WY3c2KQy1UnKustGO40XytK4HI5Fk0ZRakjwvjceHzcVmaW5LQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189294; c=relaxed/simple;
	bh=2dyKtNyh+VYQgv3RdAGTDcERo7pDX5CfMVIb/NziIdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMAdZeWBgNa5LUX1gCe/mo7pX73Iopcudco/7Cd97O0WIqaiNpvc/4/7wMMGEgLtmsVWZwsSN0wVykg7ayfmAWb2SL0MIrFZUQFnxv7k5HZRaDSyqtLs9n76543L6xHVVQK1sqVwmO5Xyh7Z9bkmDc4zu7pK/PH3yRHgV+Buo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a87098868so665791e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 02:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189292; x=1772794092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FlwDAQHs4Ab188Hz8URDAmWORYubm2PaVsA0iFMwu0=;
        b=ET61gvNHLAATLkFBjJ5H8cxzKbgwLWQQ9zkB52s96cI+FZWjfHbDPz8GNC2S3Jeb15
         HBb5D8BtJjZ1W9q0r2azud+Wa2JRJF9he2Uelff7srH3kjZ5JvymVv5rE9I/cx+cUPcE
         kbVCcCVJOQt/SR4CNqv/KjY766cdh8Bq/PBPLY5i8lUv1jc827z2F9qP2IDv46XdVC2U
         SxKatbojMG9cf8M2+0JC8KCRFevABeGnARrKTIRVLPyDq17XDHZRYPtgjBQRacNc2LPL
         MV2KEJFAcEh3KKeoNRtLFgSvtkkqTBdkT6fYpUq4G2+2dCko432mnQjSrRAkHM6wpA0x
         RWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpx7Mkt7IhDww3o0k3X6bql3DKn/ZNl8FkoJayFVR8ILQVHG33B5uEzv66qNTrP47EsHrIGUcy0Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49/micm1D981AgfJBHKlD4d6Nm5wsC67XU5OWXvkZYIF3QhN6
	jY7TCSJx3z988SYx0HUgkF+frwRzpQDsAh0Ti4fzbeUZRwqAj1L0prpJ2Mqz14nKFPU=
X-Gm-Gg: ATEYQzyp00IwOroUmu2hUX3+ZCfCFkfeZ5CQ1hXxFBpfoPBK10e6OH+OZJuWXmZ6lVy
	7PYhfF27X52YWQVwtShr2QPeRJx12gHR3Zv+2IoseKjwv/BJqmu7DRVNzLNkzEuffTT3Q4KoPCP
	2V+acHdVUZiVfAvagKRsHjZlrSogtSs8TYmdx650jJcs3un+GqvAybQG89W+NdHZVvZQsgSxeYO
	pMzVHWxMTKgHPh+WAJWwtLHYlI+t5yEUT0v9mnFFqPYaCPzo+YwizqBBZuCmIX3sQp6Y1IybBaQ
	LNlE2UmwGVOK7jVS97Js1Rzsg8mMU0Uy3fKdJSHkaX4LOL6V0g94UQEElf9/qex76J3l7/Hi+Sw
	u8w34MLVwtfuuuUNNhDpLdD2wopn5cUb4aS7AJXwi7FmxK8KSUh2Od7b5lela3HWwrySSKlYjIH
	8Nkku8Xhx39OFSMfbLXgoisO0kzRVU3n8fmMUvjnTRzjHrLh3KNOj/UdZsKgaw
X-Received: by 2002:a05:6122:1792:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56aa0acb005mr1096819e0c.15.1772189291902;
        Fri, 27 Feb 2026 02:48:11 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm5651659e0c.6.2026.02.27.02.48.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:48:09 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff1836b4b5so545331137.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 02:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8VBY8FwpY9dKVNFynMaRpG8EIfvAV22JcV04IY4YVLb6fae9DyaFYePOM7ctfaZ4rJQy75bvcLnE=@vger.kernel.org
X-Received: by 2002:a05:6102:3583:b0:5f9:3a74:e17b with SMTP id
 ada2fe7eead31-5ff3232afd6mr1008069137.13.1772189289126; Fri, 27 Feb 2026
 02:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com> <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 11:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
X-Gm-Features: AaiRm51h4Q-XTgbNeUvH0Ox5Heqc-6O0OJ_Dv-XNFtKtSDZR5vc0E3M-GeWzDIs
Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
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

On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
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

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct clk * __init
> +rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
> +                                  struct rzv2h_cpg_priv *priv)
> +{
> +       struct rzv2h_plldsi_mux_clk *clk_hw_data;
> +       struct clk_init_data init;
> +       struct clk_hw *clk_hw;
> +       struct smuxed smux;
> +       u8 width, mask;
> +       int ret;
> +
> +       smux = core->cfg.smux;
> +       mask = smux.width;
> +       width = fls(mask) - ffs(mask) + 1;
> +
> +       if (width + smux.width > 16) {
> +               dev_err(priv->dev, "mux value exceeds LOWORD field\n");
> +               return ERR_PTR(-EINVAL);
> +       }

I am totally confused by this: smux.width is not a mask, but the size
of a register bitifield.
Perhaps:

    if (smux.shift + smux.width > 16) { ... }

?

> +
> +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> +       if (!clk_hw_data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk_hw_data->priv = priv;
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> +       init.flags = core->flag;
> +       init.parent_names = core->parent_names;
> +       init.num_parents = core->num_parents;
> +
> +       clk_hw_data->mux.reg = priv->base + smux.offset;
> +
> +       clk_hw_data->mux.shift = smux.shift;
> +       clk_hw_data->mux.mask = smux.width;

Again, smux.width is not a mask.
Perhaps GENMASK_U16(smux.shift - 1, 0)?

> +       clk_hw_data->mux.flags = core->mux_flags;
> +       clk_hw_data->mux.lock = &priv->rmw_lock;
> +
> +       clk_hw = &clk_hw_data->mux.hw;
> +       clk_hw->init = &init;
> +
> +       ret = devm_clk_hw_register(priv->dev, clk_hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return clk_hw->clk;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
