Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FE6C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 03:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C14F864E32
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 03:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhBKDOw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 22:14:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229672AbhBKDOw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Feb 2021 22:14:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2614864E31;
        Thu, 11 Feb 2021 03:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613013251;
        bh=gUAM9NEyk9JRkYbrgN4x6EeU5RnVoD1G/TDMZ8AdraY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=H4mOeDPRVT7oO0wc65gnbksUOSB2eDwN3urO7P8Qr/rk0RdhcAJ67z/rNuuRxCYGW
         u0IsMS+jyBnfA/KiIkworSNN+4s+5IzLZxFt6cl7yJSq2nTyPINmUoNuCzIBAXGamO
         yA2luZppCZu6VIASJl34We34ZpKl3nyVoUqax0bXBps76GcsVV/Gjv4yuDL7tB9JAC
         KuQd8cx0oxHL+cWLATGDCI0p6c6oXxLoC/xUOUU9B2CJ9HEPJjZ4tcSfvBTFMGl6JS
         HG18JlGkKnGuJgfFMYRRdfnOnwRVGAnDXpSqwHnWA/31pqfGODOoEAnE4rDH636I1a
         z1e9z/U4TpPQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de> <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
To:     Michael Turquette <mturquette@baylibre.com>,
        <u.kleine-koenig@pengutronix.de>
Date:   Wed, 10 Feb 2021 19:14:09 -0800
Message-ID: <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Uwe (2021-01-13 00:30:42)
> <linux/clk.h> claims that clk_get_rate() must only be called for enabled
> clocks. So emit a warning if a consumer calls this function without
> ensuring the clock being on.
>=20
> ---
> Hello,
>=20
> I didn't hear back, so went on to create a proper patch now.
>=20
> On Mon, Dec 21, 2020 at 10:27:13AM +0100, Uwe wrote:
> > the documentation about clk_get_rate in include/linux/clk.h reads:
> >=20
> >       [...] obtain the current clock rate (in Hz) for a clock source.
> >       This is only valid once the clock source has been enabled.
> >=20
> > The second part isn't enforced and (I think) there are many consumers
> > who don't ensure the clock being enabled. (I just stumbled over
> > rockchip_pwm_get_state().)
> >=20
> > I wonder if it would be sensible to add a development check to
> > clk_get_rate, something like:
> >=20
> >       if (WARN(!clk->usecount, "Trying to get rate of a disabled clk"))
> >               return 0;
> >=20
> > (or something less consequent like not returning 0 but the value it also
> > returns today).
>=20
> This conservative approach is what I implemented now, and I only emit 1
> warning to not overflow systems that trigger that problem several times.
>=20
> I'm unsure if I really must take the enable_lock, but it is not
> completely wrong.

I'm not totally opposed to this but I'm curious if you have a plan to
fix various drivers that are violating the documentation? I'm more
inclined to leave the documentation as is, which indicates that it isn't
promised to work but sometimes does work. Given that we've supported it
for quite some time I don't see the downside to keeping supporting it
vs. the many downsides of implementing a check like this and having to
fix various places that now WARN_ON() (and if you have many on some
particular device then you'll have to work through them one by one?)

What problem are you trying to address? Is there some issue you've
encountered in the kernel that would have been fixed by having this
warning? If so, please point to it in the commit text! Then we can all
see the value of this patch. Right now I don't see much value.

>=20
>  drivers/clk/clk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8c1d04db990d..7558753883dc 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1614,6 +1614,16 @@ static void __clk_recalc_rates(struct clk_core *co=
re, unsigned long msg)
> =20
>  static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
>  {
> +       unsigned long flags;
> +       unsigned int enable_count;
> +
> +       flags =3D clk_enable_lock();
> +       enable_count =3D core->enable_count;
> +       clk_enable_unlock(flags);
> +
> +       WARN_ONCE(enable_count =3D=3D 0,
> +                 "A clock must be enabled to determine its rate\n");
> +
>         if (core && (core->flags & CLK_GET_RATE_NOCACHE))
>                 __clk_recalc_rates(core, 0);
>
