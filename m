Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C330C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 15:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378207AbiD2Pse (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 11:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378147AbiD2Psd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 11:48:33 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544E02495D
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 08:45:12 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E8F653200942;
        Fri, 29 Apr 2022 11:45:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 29 Apr 2022 11:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1651247108; x=1651333508; bh=xiocpT/Zrn
        AW4XGVvx0W+hsqmEZ8ShLkOs0zeidy29U=; b=t9OgJ5A8dCa0p/9OqVFSvrUhtE
        9muBxzzWyKkqYuhmM7D15wAvWjh4VetY4tlhfhmNU97td08E9ClvvAmKIRnFdaqy
        n8CH7jkJ2nrTT/WsvxfiTzp0OEnLV+HgQSD9wxcGcfFf+XaZPj+1OY49WU48xAi+
        3iksSh4oi9wyOYrsSkXAdBlwQsAdmCpPdc48PkyGEsPwyuyTvA0f8DxCrNwz0VHf
        e1uRObrJUlOukD61I7DFRBw2lQnnLIqElInVggJe5QctnmjVAf5ZyXzHfW/oRUrh
        VxRe8lf7GiVYMYD6I/9zYBfjkQVPvhMT0A7XhEkempyVf3SRKX1FOVRGY54A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651247108; x=
        1651333508; bh=xiocpT/ZrnAW4XGVvx0W+hsqmEZ8ShLkOs0zeidy29U=; b=e
        K51H3iQbevvQIDINKhTYiW4P60P4rjQdBd62xRHhXzFIihRxBgv444+LK+6T6ufZ
        1Au+UanEdUPnPXH+t4w7B/FR0+GzhvXF84jyehVEbTCBRzoxY4tNY6CbDdiaT4ip
        /v5ZeK0pwED+E01e0E04S/EM5e9xPi25sI8xaIoNdu08qEqCzKvUPJlJW59wFn4a
        l4x1pd/n8u7KB5gQPxtplAU9LMbnMFhLnkk6KYnOH7z4yDY1gWWp0NT0WQgXcYXe
        WVKtEl0uhuRBLGxzq5ElJLpO4RT++CPcQ1JyqRiVsO+kNni1SkKmBOjq+HvyutgZ
        pJcH0vkfpkryKpbE90LsA==
X-ME-Sender: <xms:AwhsYv2jqAkEhXCOPU-sTGdH-CGMI0MBwk_PLK-tUWMf1p8NFWKfQw>
    <xme:AwhsYuE8VXvVKi6szQvQZgXL6T-cKJIYBfc5Q2-hpTRYbG2Ul2f9mLB7OIzJYAAGH
    KeQta2nKf8b6aucSK4>
X-ME-Received: <xmr:AwhsYv5pyUzawLQ0nk8Bmx7KrCWxde6Avt3X_sFDzY2NzXrta62sRJg6prwuQErKCrKmcRqX_uUDb65kLUhHgdZhpjDvwCJPZn_TYKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
    vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AwhsYk3BB-akdoFxZitiqk3e5aoz4xt9KXJFPKK0QPSitEHMNDzF9w>
    <xmx:AwhsYiFAOB5vUzy8OA0kdiTz2MhixYdTnKtIdCc1nwOACdJTaGTQog>
    <xmx:AwhsYl-Q46R13li1ebGUDNnrziKCeDCbtoshnC-45Q6zWUFsJEziJQ>
    <xmx:BAhsYgbOvpATd00Eb7_zuux17NgiPGsswvDIR4ddiHJ2KOizVwmvUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 11:45:07 -0400 (EDT)
Date:   Fri, 29 Apr 2022 17:45:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Message-ID: <20220429154505.5sefwsh3wz5clwu2@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <20220423044228.2AA7AC385A0@smtp.kernel.org>
 <20220423091724.crm7szplzidutxvd@houat>
 <20220429020812.B5E5DC385AA@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a5py2ba3eaxx2rnd"
Content-Disposition: inline
In-Reply-To: <20220429020812.B5E5DC385AA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--a5py2ba3eaxx2rnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 07:08:10PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-23 02:17:24)
> > On Fri, Apr 22, 2022 at 09:42:26PM -0700, Stephen Boyd wrote:
> > > I enjoy the ambiguity! :) This question has come up before and it
> > > doesn't really matter. Drivers can call clk_prepare_enable() if they
> > > want to be sure that clk_get_rate() is meaningful to them, or they can
> > > not.
> >=20
> > Right, but that alone already removes the ambiguity :)
> >=20
> > If not calling clk_enable() prior to calling clk_get_rate() is ok, then
> > we don't *need* to call it, both are valid.
> >=20
> > Therefore, the "you need to call clk_enable() before calling
> > clk_get_rate()" interpretation isn't the right one, right?
>=20
> It depends. The CCF isn't the only implementation of the clk API, so
> some drivers want to maintain API compatibility and call clk_enable()
> before getting the rate to make sure the rate is valid. If all other clk
> API implementations are removed or made to work without calling
> clk_enable() we should be able to update the clk.h documentation.
>=20
> >=20
> > > The CCF returns a rate that it gets from calling recalc_rate, which
> > > could be inaccurate for others reasons, either because some driver has
> > > called clk_set_rate() after the clk_get_rate()
> >=20
> > Right, but I guess that's ok, the CCF never claimed to support atomicity
> > in any way. That could also be the result of a parent changing its rate,
> > or a reparenting, etc.
> >=20
> > Still, it means that it was the best estimate we could do when
> > clk_get_rate() was called. It just turned out to be short-lived.
> >=20
> > > or because the clk is an orphan still and clk_get() succeeded
> >=20
> > In this case, core->parent is NULL, so we could argue that it's the same
> > case than clk_get_rate(NULL). It makes sense.
> >=20
> > > or because the clk_op couldn't calculate it at the time of caching.
> >=20
> > I guess this is what the discussion is all about, whether it's actually
> > something that we should find it acceptable or not.
> >=20
> > From what you're saying, it is indeed acceptable and thus clk_get_rate()
> > can return 0 not only from a NULL clock, but also if it's incapable of
> > figuring out a rate for that clock. We should thus document that
> > recalc_rate can indeed return 0 in such a case, and that users should
> > take this into account and not always expect a valid rate.
>=20
> I don't think there's anything to update.
>=20
> >=20
> > Would a documentation for recalc_rate like that:
> >=20
> > Recalculate the rate of this clock, by querying hardware. The parent
> > rate is an input parameter. It is up to the caller to ensure that the
> > prepare_mutex is held across this call. Returns the calculated rate. If
> > the driver cannot figure out a rate for this clock, it must return 0.
>=20
> What would the driver return besides 0 if the rate can't be calculated?
> UINT_MAX?

Well, we could expect the driver to never fail, and always be able to
calculate its rate (provided its parent is there). This is what this
patch is doing essentially, and it was working fine on a number of
platforms, so it doesn't seem unfeasible.

Either way, I'm not sure what your pushback is about here. Whether or
not the driver can or cannot return 0 on failure, that should be made
clear in the documentation, and for now it isn't.

If we want to maintain the status quo, then it means that recalc_rate
can return 0 on error, what's the harm in clearly stating that?

> Does the framework care that the rate couldn't be calculated?

I'd say to some extent, yes. The clk_set_rate_range() rework could just
ignore the call to clk_set_rate() if the current rate is 0. That would
have saved us from a couple of regressions.

> Weakening "must" to "should" or saying it "will most likely return 0" is
> better. But again I don't see much point in clarifying here. 0 Hz is a
> valid frequency. Maybe we should just say that 0 is valid?

Ok, so it's about the "must" part.

Yeah, maybe that's the best solution? I don't know, but the current
comment hints a bit at the "0 is an error" part with the reference to a
NULL clk.

> > Optional, but recommended - if this op is not set then clock rate will
> > be initialized to 0.
> >=20
> > And for clk_get_rate() (in drivers/clk/clk.c):
> >=20
> > Simply returns the cached rate of the clk, unless CLK_GET_RATE_NOCACHE
> > flag is set, which means a recalc_rate will be issued. Can be called if
> > the clock is enabled or not. If clk is NULL, or if an error occurred,
> > then returns 0.
>=20
> We should remove the clk_get_rate() documentation in clk.c and let the
> clk.h documentation be the one that is used. That will clarify that
> clk.c implements the API in clk.h. I've been meaning to clean up the
> documentation so I'll hack on that tomorrow and see if I can make this
> better.

ok, thanks :)

> > Work for everyone?
> >=20
> > > Indeed the CCF doesn't try to recalc the rate after enabling the clk.
> > > Maybe we should do that? It would mean that we have to schedule a work
> > > from the enable path to update the rate accounting outside of any
> > > atomic context.
> > >=20
> > > Just thinking out loud, the simpler solution is to probably drop all
> > > rate caching in the CCF and get the frequency on a clk_get_rate() cal=
l.
> >=20
> > The above is just enough for me. recalc_rate returning 0 is valid, and
> > should be taken properly into account.
> >=20
> > Longer term I guess it makes sense to drop the rate caching, but I've
> > introduced enough clock regressions already for a couple of releases :)
>=20
> Ok.
>=20
> >=20
> > > It complicates some of the core though when we check to see if we need
> > > to update clk rates. We could have some middle ground where drivers
> > > indicate that they want to update their cached rate because it's valid
> > > now (either from their enable path or from somewhere else). This may =
be
> > > nice actually because we could have clk providers call this to force a
> > > recalc down the tree from where they've updated. I think the qcom
> > > DisplayPort phy would want this.
> >=20
> > A good workaround for now would be to set CLK_GET_RATE_NOCACHE for those
> > clocks.
>=20
> It's not a good workaround. The clk flag isn't used internally. That's
> the problem. It's only used for callers of clk_get_rate(), but we have
> rate setting logic where a child doesn't know that the rate should be
> recalculated for the parent. It's also not a transitive flag, so if a
> clk with the flag set has children we don't care that clk_get_rate() is
> called on those children when it should really call up to the parent and
> figure out how high to go before calculating the frequency down. This is
> where an API that pushes the information to the framework makes sense so
> that we can push the update instead of pull it on clk_get_rate().

Ah, I see what you mean, thanks

> Anyway, it's a problem for another day.

Yeah, I have a can of worms big enough as it is :)

> > > > I think the latter is the proper interpretation though based on wha=
t the
> > > > drivers are doing, and even the CCF itself will call recalc_rate wi=
thout
> > > > making sure that the clock is enabled (in __clk_core_init() for exa=
mple).
> > > >=20
> > > > Then there is the question of whether returning 0 is fine. Again
> > > > clk_get_rate() (clk.c) documentation states that "If clk is NULL th=
en
> > > > returns 0.". This is indeed returned in case of an error condition =
(in
> > > > clk_get_rate() itself, but also in clk_core_get_rate_nolock()).
> > >=20
> > > A NULL clk isn't an error. We use NULL in the CCF to indicate that it=
's
> > > an optional clk. Returning 0 from clk_get_rate() is not an error. If
> > > clk_get() returns an error pointer then it's an error. And NULL isn't=
 an
> > > error value per PTR_ERR() (because NULL =3D=3D 0 when casted, this is=
n't
> > > golang).
> >=20
> > Ok. So we can either group both the "we couldn't figure out a rate" and
> > the "our clock is NULL" case as the same case in clk_get_rate(), or we
> > can convert clk_get_rate() to return signed integers and a negative
> > error code. The latter seems much more intrusive to me and will probably
> > lead to a whole bunch of regressions, so I'd be more inclined to stick
> > to the former. Especially since drivers seem to either don't care or
> > treat 0 as an error already.
>=20
> Agreed. We can try to work around the "not ready to figure out the rate"
> problem by implementing EPROBE_DEFER for clks that are orphans. That
> needs some thought around cases where clks have parents that aren't
> described in the kernel and we want to reparent them via clk_set_rate()
> or clk_set_parent() or their parent is provided by the driver getting
> the clk (this latter case is a head spinner). In general indicating this
> not fully registered state through clk_get_rate() is wrong though, hence
> the decision to make clk_get_rate() always return something valid and
> have the "don't know" case be returning zero.

Ok

maxime

--a5py2ba3eaxx2rnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmwIAQAKCRDj7w1vZxhR
xb0YAQD/4h2gw+RG1P1btGdwQE7D8nj81AzFByABRAiUCHwzNAEA6jypgX1wp2Eg
yBdfpFSv76T5uy/IuC7PtRTJehZaDQs=
=Ox89
-----END PGP SIGNATURE-----

--a5py2ba3eaxx2rnd--
