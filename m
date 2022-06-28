Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26021C43334
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 09:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344425AbiF1JtM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 05:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344386AbiF1JsE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 05:48:04 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8622E2C130
        for <linux-clk@vger.kernel.org>; Tue, 28 Jun 2022 02:47:57 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E4A695C002F;
        Tue, 28 Jun 2022 05:47:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 28 Jun 2022 05:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656409676; x=1656496076; bh=Rv929ML6+Y
        IyVkhYWtQ/dlcYz/sqBoS6GSqk7T4sC+o=; b=kPSoVC/td95YLYPcYC0+stv84T
        oI1femOQVbmezmNLrvWYHyjKrhJmvljCWJFfiDtQfSRiJN4apw6NDYGLwI4HaBd2
        AzfqAhD9RU0mXsPmBygRnNncRSPik0yAP+PliZh/0mhgsww/fbMljtPD4V56jOOE
        759f+SGdN854b/YOmtm5/d9BKADrKu6ARR/MM2CCjyYRnEo6uK4Qz1aOkQN8L97L
        p0jKq4WuSWEOv4TDf9c+ym7H21+jH6XywXeF88UnNoAZs9R+P/XzTAL7hkeunrzw
        JIr8wL/YwlWZKM+MQUAaHXacejulqIm6Uuo1llKcbwpHJzzWBsIMaQnJlJfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656409676; x=1656496076; bh=Rv929ML6+YIyVkhYWtQ/dlcYz/sq
        BoS6GSqk7T4sC+o=; b=Ysdtrr2ilzIsA5dUJuVwjb/KrQiislt+JcTQZAdg+Utd
        GV7Jy2Pm8Krrj4kquC6z8FvyYnKPaSPI9lBZMwWz4uFojgRD/UYTgxp4KwQ5kW4T
        4vJx/Kd0tuVctXvfMm56AhoX9ffhmnBMsiw0xu/DaE8m8ksGalcXPLQ6/6Jcavd1
        eVzI5GyaPvS45HisD1pIzpGofKiftxNsVpR4apCbCfGOXfwAj19H1fA46NVciW+B
        U4A6khMzH8CtW23czo+3dvCljig7Sk5kpQhMvv1kcd5Gu5Y1ZkaSMzCrm7/dzsxt
        0WSViPVhoeKU7MocL44I6yaLptyIcIn0zOgbsOCKzw==
X-ME-Sender: <xms:S866Yl9H_XpG6PAQDDEGMIFmjE1yH5Q538kgvOEWeyn1Sw0YER1kDQ>
    <xme:S866YpvZgGGIuO9lghRFwCBid7immW8wO9UFMuwu01su3ar0DqS7sbnyjXRJzOva8
    2IxpVvqaeA0tv7Brgo>
X-ME-Received: <xmr:S866YjBBokNMqeqGdMEUPoilNoy9rG-HCtiLdqGkai41KOgSwrY4SpQzPXNhrrXsMAQ3CjCCRINZCfRXdr7sD2OEmWy7_zHO378hj_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
    ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:S866YpdNyo9xka970OfxI002ZgujJP9wEfecpwyxRwarRiDhi2BF9w>
    <xmx:S866YqN3ULBP755GPgs9Bg36j-uo5wuNl5Z6dBR3ltJBkhdO_sen9A>
    <xmx:S866Yrn-6YKOAB6u3NiJj1qnat6FtsKH1Q0uzV92o_f07isERrWYoQ>
    <xmx:TM66YhoCevx1clTEVWYkoEXTCThkKzQxuA7bDO7JmlibpFms2ELYjQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 05:47:55 -0400 (EDT)
Date:   Tue, 28 Jun 2022 11:47:53 +0200
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
Subject: Re: [PATCH v5 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60
 detection
Message-ID: <20220628094753.l6m65dhhj3wzqjtb@houat>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-5-maxime@cerno.tech>
 <20220627233106.646B0C34115@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="62xmz6dostocolwn"
Content-Disposition: inline
In-Reply-To: <20220627233106.646B0C34115@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--62xmz6dostocolwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 27, 2022 at 04:31:04PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-05-16 06:25:03)
> > In order to support higher HDMI frequencies, users have to set the
> > hdmi_enable_4kp60 parameter in their config.txt file.
> >=20
> > We were detecting this so far by calling clk_round_rate() on the core
> > clock with the frequency we're supposed to run at when one of those
> > modes is enabled. Whether or not the parameter was enabled could then be
> > inferred by the returned rate since the maximum clock rate reported by
> > the firmware was one of the side effect of setting that parameter.
> >=20
> > However, the recent clock rework we did changed what clk_round_rate()
> > was returning to always return the minimum allowed, and thus this test
> > wasn't reliable anymore.
> >=20
> > Let's use the new clk_get_max_rate() function to reliably determine the
> > maximum rate allowed on that clock and fix the 4k@60Hz output.
> >=20
> > Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rat=
e allowed")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index 6aadb65eb640..962a1b9b1c4f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2891,7 +2891,7 @@ static int vc4_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
> > =20
> >         if (variant->max_pixel_clock =3D=3D 600000000) {
> >                 struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> > -               long max_rate =3D clk_round_rate(vc4->hvs->core_clk, 55=
0000000);
> > +               unsigned long max_rate =3D clk_get_max_rate(vc4->hvs->c=
ore_clk);
>=20
> Ok, so this driver must want the new API.
>=20
> What is happening here though? The driver is setting 'disable_4kp60' at
> bind/probe time based on a clk_round_rate() returning a frequency.

The main issue that we're trying to address is that whether or not HDMI
modes with a rate over 340MHz (so most likely 4k/60Hz but others are
affected) need a bootloader parameter to be set. If it isn't set, we
can't output those modes.

Since it's a bootloader parameter though the kernel can't access it. The
main hint that we can use to figure out whether it's been enabled is
that the maximum clock frequency reported by the firmware will be
higher. So this code will try to round a frequency higher than the
maximum allowed when that setting isn't there, and thus figure out
whether it's enabled or not.

If it's not, we prevent any of these modes from being exposed to
userspace or being used.

> That returned value could change at runtime though based on rate
> constraints, or simply because the clk driver decides that the wind is
> blowing differently today and thus calling clk_set_rate() with that
> frequency will cause the clk to be wildly different than before.

Yeah, that's true

> I don't understand how we can decide to disable 4kp60 at probe time.

We're trying to infer a bootloader/firmware parameter, so the only way
it can change is through a reboot.

> Why doesn't the driver try to set the rate it wants (or the rate range
> it wants) and then if that succeeds it knows 4kp60 is achievable and
> if not then it rejects the attempt by userspace to set such a
> resolution.

We can't really do that. The clock here drives the HDMI output so it can
only change when we change the mode. However, because of the atomic
commits in KMS, we can't fail when we actually change the mode, we have
to fail beforehand when we check that the new state is sane.

We also can't change the clock rate then, because there's no guarantee
that the state being checked is actually going to be committed, and
because we still have the hardware running when we check it so we would
modify the clock while the hardware is running.

I had another go in the RaspberryPi downstream kernel for this:
https://github.com/raspberrypi/linux/commit/df368502ecbe1de26cf02a9b7837da9=
e967d64ca

Would that be preferable?

Maxime

--62xmz6dostocolwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrrOSQAKCRDj7w1vZxhR
xe//AP9nHqfS0AH11tZcL49DGPxodyQSek5xSOReplWI9LhxHAD/V2dDYA71Wtsb
d5ty1XhFnC7b2GeGLS75rP4D4QpHRwI=
=fr0h
-----END PGP SIGNATURE-----

--62xmz6dostocolwn--
