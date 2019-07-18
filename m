Return-Path: <SRS0=f356=VP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB2BC7618F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 16:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6689221849
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563467891;
	bh=K7meXXjYyqnlzFMrv9ruLArIEJv9/k7mncV9ahtFaCI=;
	h=In-Reply-To:References:Subject:To:Cc:From:Date:List-ID:From;
	b=zm2R102kbGv4u4WNej6UmkEOX0G4DhRc3iMnkDipRH9UzJ7yJAP2iqT32mvzvhwTc
	 7Nj5vHsQqWu40M3/kEcG/I4eFujCIYadjwTTjN8PIEBbEhlp/uHJ1CqMdbUdtNuGbY
	 i3hyzzbuAqjjB13wgZ2/EJt12yCxRc11d7LWfoDY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbfGRQiL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Jul 2019 12:38:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbfGRQiK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Jul 2019 12:38:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D25D217F4;
        Thu, 18 Jul 2019 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563467889;
        bh=K7meXXjYyqnlzFMrv9ruLArIEJv9/k7mncV9ahtFaCI=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=NW0FgVPtksE6PaWqreV/FSqVjgryxwQIHd+9a+1BNx6usHg+ghnR7rOPjh++hA+Qf
         tWdtj/vFoNv0cma8UIyZYRBgiPpU3l4Ada4FasGQuBQ2x3jR5LBaGqJDPy9wU3bp2x
         vhu7fUSQQseLvY8GdjlZ+/prIfZj7NEH6oZWE42U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E1hhAN0-0007Jn-NP@rmk-PC.armlinux.org.uk>
References: <E1hhAN0-0007Jn-NP@rmk-PC.armlinux.org.uk>
Subject: Re: [PATCH] ARM: sa1100: convert to common clock framework
To:     Michael Turquette <mturquette@baylibre.com>,
        Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 18 Jul 2019 09:38:08 -0700
Message-Id: <20190718163809.9D25D217F4@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Russell King (2019-06-29 03:14:10)
> Convert sa1100 to use the common clock framework.
>=20
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> Please ack; this is part of a larger series.  Thanks.

Just a few minor comments but otherwise looks good to me.

> diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
> index 6199e87447ca..523ef25618f7 100644
> --- a/arch/arm/mach-sa1100/clock.c
> +++ b/arch/arm/mach-sa1100/clock.c
> +static const char * const clk_tucr_parents[] =3D {
> +       "clk32768", "clk3686400",
>  };

It would be great if you used the new way of specifying clk parents with
direct pointers instead of strings. See commit fc0c209c147f ("clk: Allow
parents to be specified without string names") for some details.

> =20
> -struct clk {
> -       const struct clkops     *ops;
> -       unsigned int            enabled;
> -};
> -
> -#define DEFINE_CLK(_name, _ops)                                \
> -struct clk clk_##_name =3D {                             \
> -               .ops    =3D _ops,                         \
> -       }
> -
> -static DEFINE_SPINLOCK(clocks_lock);
> -
> -/* Dummy clk routine to build generic kernel parts that may be using the=
m */
> -long clk_round_rate(struct clk *clk, unsigned long rate)
> -{
> -       return clk_get_rate(clk);
> -}
> -EXPORT_SYMBOL(clk_round_rate);
> -
> -int clk_set_rate(struct clk *clk, unsigned long rate)
> -{
> -       return 0;
> -}
> -EXPORT_SYMBOL(clk_set_rate);
> -
> -int clk_set_parent(struct clk *clk, struct clk *parent)
> -{
> -       return 0;
> -}
> -EXPORT_SYMBOL(clk_set_parent);
> +static DEFINE_SPINLOCK(tucr_lock);
> =20
> -struct clk *clk_get_parent(struct clk *clk)
> +static int clk_gpio27_enable(struct clk_hw *hw)
>  {
> -       return NULL;
> -}
> -EXPORT_SYMBOL(clk_get_parent);
> +       unsigned long flags;
> =20
> -static void clk_gpio27_enable(struct clk *clk)
> -{
>         /*
>          * First, set up the 3.6864MHz clock on GPIO 27 for the SA-1111:
>          * (SA-1110 Developer's Manual, section 9.1.2.1)
>          */
> +       local_irq_save(flags);
>         GAFR |=3D GPIO_32_768kHz;
>         GPDR |=3D GPIO_32_768kHz;
> -       TUCR =3D TUCR_3_6864MHz;
> +       local_irq_restore(flags);
> +
> +       return 0;
>  }
> =20
> -static void clk_gpio27_disable(struct clk *clk)
> +static void clk_gpio27_disable(struct clk_hw *hw)
>  {
> -       TUCR =3D 0;
> +       unsigned long flags;
> +
> +       local_irq_save(flags);

Why just disable irqs here?

>         GPDR &=3D ~GPIO_32_768kHz;
>         GAFR &=3D ~GPIO_32_768kHz;
> +       local_irq_restore(flags);
>  }
> =20
> -static void clk_cpu_enable(struct clk *clk)
> -{
> -}
> +static const struct clk_ops clk_gpio27_ops =3D {
> +       .enable =3D clk_gpio27_enable,
> +       .disable =3D clk_gpio27_disable,
> +};
> =20
> -static void clk_cpu_disable(struct clk *clk)
> -{
> -}
> +static const char * const clk_gpio27_parents[] =3D {
> +       "tucr-mux",
> +};
> =20
> -static unsigned long clk_cpu_get_rate(struct clk *clk)
> +static const struct clk_init_data clk_gpio27_init_data __initconst =3D {
> +       .name =3D "gpio27",
> +       .ops =3D &clk_gpio27_ops,
> +       .parent_names =3D clk_gpio27_parents,
> +       .num_parents =3D ARRAY_SIZE(clk_gpio27_parents),
> +       .flags =3D CLK_IS_BASIC,

CLK_IS_BASIC is gone. Please don't use it.

> +};
> +
> +/*
> + * Derived from the table 8-1 in the SA1110 manual, the MPLL appears to
> + * multiply its input rate by 4 x (4 + PPCR).  This calculation gives
> + * the exact rate.  The figures given in the table are the rates rounded
> + * to 100kHz.  Stick with sa11x0_getspeed() for the time being.
[...]
> +static const struct clk_init_data clk_mpll_init_data __initconst =3D {
> +       .name =3D "mpll",
> +       .ops =3D &clk_mpll_ops,
> +       .parent_names =3D clk_mpll_parents,
> +       .num_parents =3D ARRAY_SIZE(clk_mpll_parents),
> +       .flags =3D CLK_IS_BASIC | CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL,

Please add a comment about these last two flags so we know why the rate
can't be cached and the clk is critical.

