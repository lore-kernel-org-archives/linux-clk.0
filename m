Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5A3CBE7B
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846445; cv=none; b=tJRgEvN3dkTZpdsIB4Y6HXWggAygy1rZENlyHPDPYzL1ZAKOadrFwJ6fsp1xp1DlAaPQEmDUcx2AvxWVVI9Wm3Yp+A4bCm6Vc1nXYPEdq8KRaDKuPf3GJFrF55xhTMotdLIT1uRkRK+tB7FYTIrVfc4pgOoN+iBiuCYdbAb+CUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846445; c=relaxed/simple;
	bh=w5SynmARfyiLassiucnWkac4zh9wFX4zi6/ROoiMUbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRCSW62s8GutvXVVXOj91To1ilM8bOOHokeAl1amIJbMwegkP4k+u+FoOWdgZGPQGnJzoG2SYdRoDPRDKwjcuJgiMs/Zo8ag6LhQWl9YHhGXWNs/LZHvI4h/ZKFgilpdvbL0w8hWhakL7sncbexqQ/zZaLcITeNlYg1vD4nWm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9076813bso372145e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846443; x=1774451243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73LeJjEwTLLE4Vs26fAXvp+ddqR+qpQNawBkw/M6YWU=;
        b=H4mYQFkrmZxqpI9gwWywwxWnab9sRi1yrt6+xqo/h7w78/Aqvqqzu5TDKbIiIMu9K2
         eb0gM8o4BT7Uh20Kh3gc6gJoY4fLylLRotxYDK5VUFyQ6nvyrg2h2RKAuea0J53W3qVA
         UMuBgAZjj0pK608/I2xkHRc711ph8b5q4gldmBX3Ei+XDFQuu6Idmu1BnxXBxlrg9DcS
         BL1Rqxs3N6FrxxVb4eBInNJgsSEYT3QfpcUs0tjwUEjG4QTST+GNgS/Q5DhJ/Nk87w84
         VpygBieqqpQUN99DbHzgVk9nWxQ3X7EfIWnJsoudVX163E7bIudMXk/CFNUGF5jlhStX
         Xxxw==
X-Forwarded-Encrypted: i=1; AJvYcCVedNCb4kWefBMLbB2o8Ge+cVyw4+oK90Ozl+xDeA2GV1bPiW/qYerhWoIdcK8VaGgZblPj4XxfTfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WQRkNCfOBJaAg8tjpNuOqUDtgf5M9p64URXz8/Uf0Puz/7sz
	jnIu0e7JKrsVsNmaW1rNtOncJThTCPwTRZYkGIbP5xRq7TgImmS6MHSKbB+GOqwcuLM=
X-Gm-Gg: ATEYQzwZwRicr/5dYpmt1Ipa9GX+HnVE9eTNV3aODthrv/tmjEfPB38rE4JoB3hG/I1
	FV7BTD9dsDOUn77OaBJg8Ru6Bcd1/XDkxhRXbUYFym3liGNAttl4q4PzI/5hKYPzefSjbz54Il2
	rhdVjgqj5azWTq8JhBmr6Jpnk1IbLrHSAFhdwdSpnSCLXLsyjYwhSrtHLKW+wk9qt0AaZsExzL1
	4hAYCrzHduwLgOV+xEjymXDLQzSMygjCYPUrDNSM0viJnw0HaXY27fOYCKYhmmCfn104jcn5w01
	Z/gbBUyNruU3MDiIprtoyrF9cX1ilG5Py7ySQ4R1NTg7mkEXvUz7ArTPA9uFZTgRrggr8hQkil6
	gu5XljHUTvXddGJ80b9Qdo9B8aev7+R41A9L+qThH/bhwKmaGdSLldceMpygXan3NLF+Zw+E3TO
	a64Rx+U5xIzojRagSAg0XPj5oUkQAcns6Zdvh9DO+uGrpbStiMpfsi32Alj1tkGHeF
X-Received: by 2002:a05:6122:3d14:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-56ba708c587mr361661e0c.8.1773846443394;
        Wed, 18 Mar 2026 08:07:23 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e81827sm1856555e0c.7.2026.03.18.08.07.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:07:23 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9076813bso372125e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL0xj+/JLYgeTNtrMf/1JA/F10XHnsQZU8JxXAxNr68lcOTa5iKrjy3fcViOxZdFKUHbFxpPO0+Zg=@vger.kernel.org
X-Received: by 2002:a05:6122:134d:b0:56b:982f:1265 with SMTP id
 71dfb90a1353d-56ba7079b27mr2142947e0c.7.1773846442482; Wed, 18 Mar 2026
 08:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com> <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 16:07:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
X-Gm-Features: AaiRm50hTSX-3ra7FH3b3E2dvjm1YgbyNHZb0fG6gXGXgf4WcB_o6nVGdJBlD5I
Message-ID: <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 18 Mar 2026 at 15:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > After a suspend/resume cycle, critical module clocks may be left disabled
> > as the hardware state is not automatically restored. Unlike regular clocks
> > which are re-enabled by their respective drivers, critical clocks
> > (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
> > must take responsibility for re-enabling them on resume.
> >
> > Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
> > entries in a singly-linked list anchored at crit_clk_hw_head in
> > rzg2l_cpg_priv. Populate the list during module clock registration by
> > checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
> >
> > On resume, walk the list and re-enable any critical module clock that is
> > found to be disabled, before deasserting critical resets, ensuring the
> > correct clock-before-reset restore ordering.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -130,6 +130,12 @@ struct div_hw_data {
> >         u32 width;
> >  };
> >
> > +/* Critical clk list  */
> > +struct rzg2l_crit_clk_hw {
> > +       struct clk_hw *hw;
> > +       struct rzg2l_crit_clk_hw *next;
> > +};
> > +
> >  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
> >
> >  struct rzg2l_pll5_param {
> > @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
> >   * @info: Pointer to platform data
> >   * @genpd: PM domain
> >   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> > + * @crit_clk_hw_head: Head of the linked list critical clk entries
> >   */
> >  struct rzg2l_cpg_priv {
> >         struct reset_controller_dev rcdev;
> > @@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
> >         struct generic_pm_domain genpd;
> >
> >         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> > +
> > +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
> >  };
> >
> > +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> > +                                          struct clk_hw *hw)
> > +{
> > +       struct rzg2l_crit_clk_hw *node;
> > +
> > +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
>
> This ends up allocating quite some memory to store just a single
> clk_hw pointer.   Alternatively, you could use an array and size,
> and grow that using devm_krealloc().

Upon second thought, you already know how many there are upfront,
thanks to rzg2l_cpg_info.num_crit_mod_clks? You even already have an
array (but it's __initconst).

> Another alternative would be saving and restoring all clocks during
> suspend/resume, like renesas-cpg-mssr.c does.

Another alternative: rzg2l_mod_clock_init_mstop() already iterates
over all module clocks during resume, so it could be modified to also
force-enable all critical module clocks.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
