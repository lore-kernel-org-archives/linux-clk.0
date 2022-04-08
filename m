Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6A2C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 12:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbiDHM16 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 08:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbiDHM1z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 08:27:55 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEC933D835
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 05:25:49 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 514063202120;
        Fri,  8 Apr 2022 08:25:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 08:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=rL/UduwWNFis5/BjAgBsWgnPge4ej/zfSD12Y/
        N9n1U=; b=mx/oomMnJ9Plz4F5/dOt12tIZ/S8rVZ/wcpqTZe2jutF9uOe4X1dVF
        zIdY6CXYReDsVDJ89xvyZ1iMMXBeC5Ny+mRIKnmiEmIly0R4hoiGzipy4IZh19ny
        3qwC+ZRtE6HXnobxa+rM1IXbXIlPTt1/JmLJ2nF9EvrSE6gwy3VB1HgEsT8LOksN
        QlG+puUppttZFb13AytfmAmHds2/p9RY9jKkevc7sy/T0b+xmYQUjYFkQQmHqIEQ
        XznpU5jXnGdtjy0VlDxed+Rr9r7LA8WLKwoHYp0P0IG8IHcI/4DXapPDyTrC0+WJ
        kKuR7Tb8locm6jpSsDj9oD5c7F6u031A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rL/UduwWNFis5/BjA
        gBsWgnPge4ej/zfSD12Y/N9n1U=; b=J4efr+1lX59DsLluugx0bzVOtTXyfZzWe
        sbusgKmzmegk9AwSMxIa/hfJg3oMZiLXVWPlCXY5HeCUM6WF+QbhdXA4j7arnPoK
        Z/fOXtNzcGoii/UQKrrt28BcVKMn1seoyOF+a093WK4HOA7gO91F4kNeuMdVjs/U
        PZl/wuy2WMRwTtp3DktT1j+FDx38+ug6fkjKcDlHfylXwL6yM8q4frLc3i1O1Z9V
        7Ms8U4JezYX6YZRxqndJMG+n/mBGGIxmOxwvHbYnJBuv4ATSYoRuLPLLQQrIRFDV
        YaSrD8dci8398WLT8lsdgZvqVj+8fvAZnBfQDDyMn8W/hob80a0MA==
X-ME-Sender: <xms:yClQYtgoP75jMOyJQYunfgSlqwdFJc3zSDYIUAL3oilDnQbYVpFzrw>
    <xme:yClQYiCQrP6EnKBU7IXNULwZ7RkonBIg9R_g6-WCzgKPnkLCRUD7zqkqbrLW-xvM7
    kaBVH51TCGGp6yehlU>
X-ME-Received: <xmr:yClQYtF11g1XdI5OBOveXiI8rIKFSAweaZZGSkelsSHh9YwB_dcbO1uGFqw8FHeN8j6J8NdJeLCFtcsCUBZ4shhHsiMi3nOXR9VnQpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
    jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yClQYiRcubG2sgl1CWpBAj8n0lnEQpBRKkNy_6nEr3CIhY_5t5G0tg>
    <xmx:yClQYqxXKJpKJ9BuhhCs2q4j121zYk7EHKjWNXo4y88wOv_jPa56Rw>
    <xmx:yClQYo54aF3y4dGWolL2vV5H2V8Hy_LDI2iF8de1UleTGNHuzPMgOA>
    <xmx:ySlQYpl0wioTaxhqf6sPEWxb9_iD5D2UY0Zys94a9pPUqBWDlN3KFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 08:25:44 -0400 (EDT)
Date:   Fri, 8 Apr 2022 14:25:42 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Message-ID: <20220408122542.jymybls42w3uzxpc@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <CGME20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925@eucas1p2.samsung.com>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <351cfb4a-7457-d4e1-8317-9ebf2a3167f8@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ucbudw3gt4ju3qw6"
Content-Disposition: inline
In-Reply-To: <351cfb4a-7457-d4e1-8317-9ebf2a3167f8@samsung.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ucbudw3gt4ju3qw6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 08, 2022 at 02:17:55PM +0200, Marek Szyprowski wrote:
> On 08.04.2022 11:18, Jerome Brunet wrote:
> > On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> >> A rate of 0 for a clock is considered an error, as evidenced by the
> >> documentation of clk_get_rate() and the code of clk_get_rate() and
> >> clk_core_get_rate_nolock().
> >>
> >> The main source of that error is if the clock is supposed to have a
> >> parent but is orphan at the moment of the call. This is likely to be
> >> transient and solved later in the life of the system as more clocks are
> >> registered.
> >>
> >> The corollary is thus that if a clock is not an orphan, has a parent t=
hat
> >> has a rate (so is not an orphan itself either) but returns a rate of 0,
> >> something is wrong in the driver. Let's return an error in such a case.
> >>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> ---
> >>   drivers/clk/clk.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index 8bbb6adeeead..e8c55678da85 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *cor=
e)
> >>   		rate =3D 0;
> >>   	core->rate =3D core->req_rate =3D rate;
> >>  =20
> >> +	/*
> >> +	 * If we're not an orphan clock and our parent has a rate, then
> >> +	 * if our rate is 0, something is badly broken in recalc_rate.
> >> +	 */
> >> +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
> >> +		ret =3D -EINVAL;
> >> +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
> >> +		goto out;
> >> +	}
> >> +
> > As hinted in the cover letter, I don't really agree with that.
> >
> > There are situations where we can't compute the rate. Getting invalid
> > value in the register is one reason.
> >
> > You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - =
all
> > SoCs would be affected):
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/meson/clk-pll.c#n82
> > Yes, PLL that have not been previously used (by the ROMCode or the
> > bootloader) tend to have the value of the divider set to 0 which in
> > invalid as it would result in a division by zero.
> >
> > I don't think this is a bug. It is just what the HW is, an unlocked,
> > uninitialized PLL. There is no problem here and the PLL can remain like
> > that until it is needed.
> >
> > IMO, whenever possible we should not put default values in the clocks
> > which is why I chose to leave it like that.
> >
> > The PLL being unlocked, it has no rate. It is not set to have any rate.
> > IMO a returning a rate of 0 is valid here.
>=20
> I agree that it should be possible to register so called unconfigured=20
> clock, which doesn't have any rate set yet. It might be used later by=20
> some drivers, which will do the whole initialization (set rate and or=20
> parents).

I think we should differentiate between the clock being fine from the
CCF point of view, and from the device point of view. I'm arguing about
the former, but the latter should definitely be up to other drivers to
set it up so that their hardware work.

But in both cases, we should return something valid under the CCF
semantics.

> I also wonder why the above patch triggers warning on the Amlogic
> Socs, while on Exynos I still have some unused clocks with 0 rate
> registered properly.

Most likely the clocks that return a rate of 0 are orphans (ie, their
parent isn't registered yet).

We can't expect all the parents to be registered before their children,
so this is fine, and that patch doesn't break it.

Did you test this series for exynos and meson then? Could you give your
tested-by if you did? :)

Maxime

--ucbudw3gt4ju3qw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlApxgAKCRDj7w1vZxhR
xUdpAP0YLBkaslfRKjk81FXtSdjxd8GPA3K2zHr+jW+drx5PUAEA5Yxlqa+JDO38
AXGpRBIodju3ZOidwTX+18ZPvvN+PQw=
=vBGP
-----END PGP SIGNATURE-----

--ucbudw3gt4ju3qw6--
