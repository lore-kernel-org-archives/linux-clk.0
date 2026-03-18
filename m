Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899723BA22B
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845695; cv=none; b=mjyKSwSwqD+cv05XbkkPRQtZM74ILwMSHm3yKaFVDeR0XJuVDsNNozLFDNoNGWGbMye+K+r/tuDmNXXnIi37yhsURsUivzvlcplNwXMn7zsbX0brBNlMHladIWhI8b3zxJ2+rbLFb5iNy/IQRO9c9YCu7JeJhbkQTAzqlY5TcUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845695; c=relaxed/simple;
	bh=dAi6IZesHxnAmUwcmtHAHa1sgnlJ4W6rUQVDgY8jnKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFhbx3oI3q2V+AtmFG8gEha/3BInYzbhGYGj3mmxsOcgXNFZHOfc0dpLRDYggHCZiSbloBWhV6mANFLVJkn7CLfzUxyppZghbRuB38Ytsj0n2L164j806CS7d69/YrccsLe2LUF5Um7Oc1upl+m3A1uaHuSEWW5azWz3IiKokjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-600404dbea3so4026138137.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845692; x=1774450492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/Qg5QrFMlprD3b/zTBt1MydRArt+JmYG67GEAUxq7Q=;
        b=BLg7iSZ0U4NngNaac6ymIRWWOdiDV5h1FBhuGyERhwJq2jWNrndayfRF3Lc7aoA6EB
         NJQp46SHX9TEQ8CtQ0UYWtmDvzh990UruSRibLI845NfRdySAz6oIgX6l3gwlJnuZe4G
         xvdGU8STkPBExPWOenGY7Vkt8BnCBom+odfu4Ox06KDo4JJWVz/iYEFEzLNBMC0CCqky
         zy5hx0MbkL4WUinJoqblmel0wy+VcM+GCRpMgf3x03OJAWvu1wsSDFksbQl80ZaEdibq
         YmWvdc8gRuugHsCmY/Y2pOjXDF0NBzJBbzp+CaoCuxB/Huq9UuAfg7/72G13caRy6GkY
         JbBw==
X-Forwarded-Encrypted: i=1; AJvYcCU+C4kqCnDfxx2yg9Wv12j93+n3FlBM/MeNI+5osA925xogmNZoqBHR79wzR1Pr3SQG2A3WnQlzZ2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZfisE0BpiEc2403+8I12pIbNjtgsB4p7RJCl+8D/AyW6qW5Q
	lTsqJ03n4RDTGZ3kTqqAheKOyqq6pYaLPTJ87RnV0B7m42awipn+PONl9MtRGt0MQDc=
X-Gm-Gg: ATEYQzwLiv7MBdLRMFRtYHAxd12mG+TEQJ2L+zOTYF/b/FdnC0qp1Fm0jlakUoF7P/U
	luwS9hJo3G+PC6SBhG7Rm+fJ4KNX1qCp/KjkaFdSDj39g2RcABMrWZKYMPrmUH5UwRETVzrHrdL
	Z7NwgGhlj3UQ+YMeay0ct/lxxukay6DGYetD4yCMDoQ7DF9aaHfMLBt2rldA3yTVcw2OiBxdiv+
	yby6ugTU7bHrjfQUDiWYRFeV/QorsX3/VEWegYEvvl7Fg6fKrGzB4LVg/FXfDFTM8ySkx6j1YDB
	gLk0CceVaXBu/7/B9bS7SBs2B2w1RC2++0tz6Aw+XAYN6p5rXuh8S/SVNFU/Y9DwBJbbQVFr0vg
	gezhwcv8/PcRJ5w702r0vMxAcsIU6xBgQzfowO2hFPF9MqsWASrZynCRPOUJ1CQtPFywLAl4a2j
	2rshg/HQedPS+Sp0kX1jz0301lS1tK8EvQYrX5TPikgMatxjtyxBb7v436mEYIb1tKfodBYP1IO
	wQ=
X-Received: by 2002:a05:6102:510c:b0:5ff:e0be:f518 with SMTP id ada2fe7eead31-6027d099c0fmr1929801137.6.1773845692351;
        Wed, 18 Mar 2026 07:54:52 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95112e39b5bsm482029241.12.2026.03.18.07.54.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:54:51 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56b91ead558so2356671e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW44sn49VTImtibwNW++7rUt3xx0cUMQM9ymC+ZRAmF0z+B/5rmfEpnOqf1MWSeTur7N7eMPpQeg7k=@vger.kernel.org
X-Received: by 2002:a05:6102:3906:b0:5ff:e25c:9285 with SMTP id
 ada2fe7eead31-6027d12f8c6mr2071916137.15.1773845691435; Wed, 18 Mar 2026
 07:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
X-Gm-Features: AaiRm534vCHGPCtrnB-8VlpCeb3tHeDCk7nE1s-NfRCX77If37iIL3qBCG4cSVg
Message-ID: <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
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

On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks may be left disabled
> as the hardware state is not automatically restored. Unlike regular clocks
> which are re-enabled by their respective drivers, critical clocks
> (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
> must take responsibility for re-enabling them on resume.
>
> Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
> entries in a singly-linked list anchored at crit_clk_hw_head in
> rzg2l_cpg_priv. Populate the list during module clock registration by
> checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
>
> On resume, walk the list and re-enable any critical module clock that is
> found to be disabled, before deasserting critical resets, ensuring the
> correct clock-before-reset restore ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -130,6 +130,12 @@ struct div_hw_data {
>         u32 width;
>  };
>
> +/* Critical clk list  */
> +struct rzg2l_crit_clk_hw {
> +       struct clk_hw *hw;
> +       struct rzg2l_crit_clk_hw *next;
> +};
> +
>  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
>
>  struct rzg2l_pll5_param {
> @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
>   * @info: Pointer to platform data
>   * @genpd: PM domain
>   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> + * @crit_clk_hw_head: Head of the linked list critical clk entries
>   */
>  struct rzg2l_cpg_priv {
>         struct reset_controller_dev rcdev;
> @@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
>         struct generic_pm_domain genpd;
>
>         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> +
> +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
>  };
>
> +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> +                                          struct clk_hw *hw)
> +{
> +       struct rzg2l_crit_clk_hw *node;
> +
> +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);

This ends up allocating quite some memory to store just a single
clk_hw pointer.   Alternatively, you could use an array and size,
and grow that using devm_krealloc().

Another alternative would be saving and restoring all clocks during
suspend/resume, like renesas-cpg-mssr.c does.
Thoughts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
