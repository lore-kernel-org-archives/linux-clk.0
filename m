Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C339BCCA483
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 08:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbiF2Ist (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbiF2Isr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 04:48:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156C53CFE2
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 01:48:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9FD5061DC9
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 08:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E750CC34114;
        Wed, 29 Jun 2022 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656492525;
        bh=Hf8xvb7EW2dIXc85BRGJqTZPrbdJNzWbMyZUkT2ll60=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hi9J6ZqQXsxMu27ubDm00GOxryqEwU+HPYIcay3tTtgmL1r+RksHZw4pPZmOZQ34e
         OCD4hVauUJI3C3StEKpWaBOmF6wO42+O+UYgrbHxGQqpUd990E0+ndvNT6E3kn0Xso
         zWuGHsZmPP6XEdEmCW+E3laZLg173ROaZozXOrB7KlNJ0QTM0/53pb7KqbS37lkDZD
         NbEEGUkZFvedKST+fNeKvmDP9/igeAbJXn4wn132nSuaD/8N+q7vl1Qdl3OZ3rRx5Y
         QEGBewgl6ToNla/hyxW3/T1pSOsOBM7WR+IuAg2LlczG3GDVLUEQ7Ehl3Nl59ZaOsD
         0BnR/jELzJ5eA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220628094753.l6m65dhhj3wzqjtb@houat>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-5-maxime@cerno.tech> <20220627233106.646B0C34115@smtp.kernel.org> <20220628094753.l6m65dhhj3wzqjtb@houat>
Subject: Re: [PATCH v5 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
From:   Stephen Boyd <sboyd@kernel.org>
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
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Wed, 29 Jun 2022 01:48:42 -0700
User-Agent: alot/0.10
Message-Id: <20220629084844.E750CC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-06-28 02:47:53)
> Hi,
>=20
> On Mon, Jun 27, 2022 at 04:31:04PM -0700, Stephen Boyd wrote:
> >=20
> > Ok, so this driver must want the new API.
> >=20
> > What is happening here though? The driver is setting 'disable_4kp60' at
> > bind/probe time based on a clk_round_rate() returning a frequency.
>=20
> The main issue that we're trying to address is that whether or not HDMI
> modes with a rate over 340MHz (so most likely 4k/60Hz but others are
> affected) need a bootloader parameter to be set. If it isn't set, we
> can't output those modes.
>=20
> Since it's a bootloader parameter though the kernel can't access it. The
> main hint that we can use to figure out whether it's been enabled is
> that the maximum clock frequency reported by the firmware will be
> higher. So this code will try to round a frequency higher than the
> maximum allowed when that setting isn't there, and thus figure out
> whether it's enabled or not.

So the kernel is at least able to ask for the max frequency during
rounding and figure out that the frequency can't be larger than that. Is
that right?

>=20
> If it's not, we prevent any of these modes from being exposed to
> userspace or being used.
>=20
> > That returned value could change at runtime though based on rate
> > constraints, or simply because the clk driver decides that the wind is
> > blowing differently today and thus calling clk_set_rate() with that
> > frequency will cause the clk to be wildly different than before.
>=20
> Yeah, that's true
>=20
> > I don't understand how we can decide to disable 4kp60 at probe time.
>=20
> We're trying to infer a bootloader/firmware parameter, so the only way
> it can change is through a reboot.

Got it.

>=20
> > Why doesn't the driver try to set the rate it wants (or the rate range
> > it wants) and then if that succeeds it knows 4kp60 is achievable and
> > if not then it rejects the attempt by userspace to set such a
> > resolution.
>=20
> We can't really do that. The clock here drives the HDMI output so it can
> only change when we change the mode. However, because of the atomic
> commits in KMS, we can't fail when we actually change the mode, we have
> to fail beforehand when we check that the new state is sane.

Alright. I feel like we've discussed this before.

>=20
> We also can't change the clock rate then, because there's no guarantee
> that the state being checked is actually going to be committed, and
> because we still have the hardware running when we check it so we would
> modify the clock while the hardware is running.
>=20
> I had another go in the RaspberryPi downstream kernel for this:
> https://github.com/raspberrypi/linux/commit/df368502ecbe1de26cf02a9b7837d=
a9e967d64ca
>=20

It really looks to me like we're trying to hide the firmware API behind
the clk API. When the clk API doesn't provide what's needed, we add an
API to expose internal clk details that the clk consumer should already
know because it sets them. That's my main concern here. The driver is
querying an OPP table through the clk framework.

Why can't we either expose the firmware API directly to this driver or
have the firmware driver probe and populate/trim an OPP table for this
display device so that it can query the OPP table at probe time to
determine the maximum frequency supported. The clk framework isn't in
the business of exposing OPP tables, that's what the OPP framework is
for.
