Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325B2C43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 08:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344111AbiF1I6W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 04:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344068AbiF1I6Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 04:58:16 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF82DB2B
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 01:58:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 313F85C0233;
        Tue, 28 Jun 2022 04:58:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 28 Jun 2022 04:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656406689; x=1656493089; bh=y2TzzewEX2
        yef2chZaotHlskon3tBW1KZfAx8L48zks=; b=lGnMHR6C5bKrdZdju+oKzBwClM
        rmVvlS02QyumcoQ2aJShbAhDMdrkt0fvMQgZJBe+bgiBSSEz3xP6yY0JJN3H1+xm
        7vzIpoXMAEnYtAVlV72Q4fRaYUkkFaQ8l9jGQFdZ6NznQMFTcVOMOtGsWldU7TzY
        /MB5jef1FehaCYL5rx9kpKYbiuaQtScU5mWxadpma0+0PFqJpFxBdU2DLrZQJ5KL
        dyVxcX+C3HdMcRlxxDnz2Kfm5BKkDxGvF4TVrZLhvrJpEdoqels6OktCRQ20Y1EA
        z2G9BZQgbeXPR+1rIrlXGikYS8AiPPnbMaAqc/KPhzjmOV0ZcvC+NjSKcxIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656406689; x=1656493089; bh=y2TzzewEX2yef2chZaotHlskon3t
        BW1KZfAx8L48zks=; b=peQqIusqySyO6w5bFNL7/211kc9CST4MaMXFbkdki1rz
        uwMqFkmGVXVHiW9a70NT+/TFCBINCGmepDDwAyHreJ/Xr1h5HMg81KdpBj2paGp9
        7JCrId2niVVvoLaLoSLlRRS6XSHSD/6f0iJTwLj15+Nj7/jvAT6D5MBF0gTVuoqC
        OvJAvUSKHkWD8//aN36l7AHUn3K077Ol0is1EhZwEjE2Kd08b8zwQ+fkc8wQuXez
        5bGp6yfa9W82JyMkY3CyX9bFoMqypFN/MBt8G2Jm8xsOeTiPozDQGgdfbIFOTxBi
        t248QQjYJVIcOrGIJIGkP4HCYxUcRhq3ppjIlARezA==
X-ME-Sender: <xms:oMK6YpJkLi8miSqQaWddqOfzJ5NkedFRxn9eRbbQLDmokMMGq_HUzg>
    <xme:oMK6YlIaql_gT2Mv1fxZfUIgxYtI74tBrXnrWv2DT0PfCvR8x9V_CaqhA4E0xnJHt
    Y7fPYwsBjge0yDIi3c>
X-ME-Received: <xmr:oMK6Yhs5C-Y4iJC7NGYhfnQaiZ25GMAjAkZIhREKYTopXdHZKfvX9QgWbUe4JuHioXYeDrhRC_tPJpZzshHsY7ijXVUleX5HlMAw6zY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeitdfgveffveffueduveejhfeludehffeuffeifeetvddvvdfgheeljedt
    tdevheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oMK6Yqb-3FsDKIVGOHodojU1baODQP2eeoZHZ1zLnBltUafvVbpHWQ>
    <xmx:oMK6YgZVLZux4Ye3GtPLwroktv6FtuAa3zS9u3puEH0LccHKszudbQ>
    <xmx:oMK6YuAzH-PVHZu-Idpk9JyuJAAXknEgpYVuoNkyfoF5lY7RjqDUng>
    <xmx:ocK6YukUZ827ecbqUoyzZ-wkU4me6oMs70pl9d9g2HWUHdBpaY5lgQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 04:58:08 -0400 (EDT)
Date:   Tue, 28 Jun 2022 10:58:06 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 02/28] clk: Skip clamping when rounding if there's no
 boundaries
Message-ID: <20220628085806.vwjnc6gdra2wgtz3@houat>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-3-maxime@cerno.tech>
 <20220627232200.C3ABDC34115@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ka6b4xwnuof6abu6"
Content-Disposition: inline
In-Reply-To: <20220627232200.C3ABDC34115@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ka6b4xwnuof6abu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thanks for reviewing these patches

On Mon, Jun 27, 2022 at 04:21:58PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-05-16 06:25:01)
> > Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
> > started to clamp the request rate in the clk_rate_request passed as an
> > argument of clk_core_determine_round_nolock() with the min_rate and
> > max_rate fields of that same request.
> >=20
> > While the clk_rate_requests created by the framework itself always have
> > those fields set, some drivers will create it themselves and don't
> > always fill min_rate and max_rate.
> >=20
> > In such a case, we end up clamping the rate with a minimum and maximum
> > of 0, thus always rounding the rate to 0.
> >=20
> > Let's skip the clamping if both min_rate and max_rate are set to 0 and
> > complain so that it gets fixed.
> >=20
> > Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 2a32fa9f7618..d46c00bbedea 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struc=
t clk_core *core,
> >         if (!core)
> >                 return 0;
> > =20
> > -       req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> > +       /*
> > +        * Some clock providers hand-craft their clk_rate_requests and
> > +        * might not fill min_rate and max_rate.
> > +        *
> > +        * If it's the case, clamping the rate is equivalent to setting
> > +        * the rate to 0 which is bad. Skip the clamping but complain so
> > +        * that it gets fixed, hopefully.
> > +        */
> > +       if (!req->min_rate && !req->max_rate)
> > +               pr_warn("%s: %s: clk_rate_request has initialized min o=
r max rate.\n",
> > +                       __func__, core->name);
>=20
> Is this going to trigger anytime soon?

drivers/clk/qcom/clk-rcg2.c was in this situation before
https://lore.kernel.org/all/20220419235447.1586192-1-dmitry.baryshkov@linar=
o.org/

Other than this one, there's a few other drivers doing this too:

* drivers/clk/clk-divider.c
  https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-divider.c#=
L389
  https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk-divider.c#=
L411

  That one isn't really critical. divider_ro_round_rate_parent isn't
  used by anyone (as of 5.19-rc4), and divider_round_rate_parent is only
  used by drivers/clk/sunxi-ng/ccu_div.c.

  This is then used by virtually all the Allwinner SoCs supported, but
  only for either internal bus clocks that are very unlikely to change
  their rate, DSI, CSI or I2S clocks. Fortunately for us, these are all
  fairly unusual on Allwinner devices. So the situation is likely to
  occur on those systems, but should still be fairly rare.

* drivers/clk/clk-composite.c
  drivers/clk/at91/clk-generated.c
  drivers/clk/at91/clk-master.c
  drivers/clk/at91/clk-peripheral.c

  All those will copy the request being passed. Since it comes from the
  framework, the boundaries are likely to be set but possibly wrong
  since they are the boundaries of the child clock, not the parent one.

  That part is addressed later in this series:
  https://lore.kernel.org/linux-clk/20220516132527.328190-23-maxime@cerno.t=
ech/

So all in all, the impact should be fairly minimal, but it could still
happen.

> I'd prefer we return an error from here if the min/max is 0. The
> warning can stay. Also probably needs to be a pr_warn_once() or
> ratelimited because sometimes rate setting code is called very often.

Yeah, that makes sense, I'll change it

Thanks!
Maxime

--ka6b4xwnuof6abu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrrCngAKCRDj7w1vZxhR
xbXqAPoCtAdYrzoO6N9+/B21rsqdt3s0hnkmMIdF6uThKUGbfwEAibcXLFH9v2yj
1jDexXRWsJRfnu/IEg9x+Z1peu5SPAc=
=37wB
-----END PGP SIGNATURE-----

--ka6b4xwnuof6abu6--
