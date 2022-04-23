Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98441C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 09:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiDWJUb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 05:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiDWJUa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 05:20:30 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B4DFD23
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 02:17:32 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id C84663200DA8;
        Sat, 23 Apr 2022 05:17:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 23 Apr 2022 05:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1650705448; x=1650791848; bh=rlfnSpUfLU
        14bwpz0GPgcbe5Uw+m4kNHaJFTKwQ4VJk=; b=mNNZHRuQ/Lu3XLd3G3zsuQfPkn
        OBxuZI65y6vN3gi5UM5DH7X47OLFxWR8VqP4mgW72h85OriH2/pvaqwWk1rewdal
        wImvNOJJnDAN3w7WKFyonBR8JBszpPGRwNEFvHrBWjdQe8B/3bDfdIU2imQUvi3n
        JCidTcTPC1h84czUKS5I3Jsd4qe0YgUcpqrBi8Dr7jsMWqsHCEQhF4vism6SHN2C
        bvm134gwTMsWHTUpOKYDsVZGiVzzjc4WUWnjcpojLl2vbczgPmkfqq13OmcLvc5Y
        MDnrWASmSJ7Y8F2gXtT/uzujPs4dECvE+H/6gOFkpCiMPuYVJNAWVQa0wgwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650705448; x=
        1650791848; bh=rlfnSpUfLU14bwpz0GPgcbe5Uw+m4kNHaJFTKwQ4VJk=; b=W
        vy9h65/NLTMI0VSp7Uoc8dpxAluFInzR+Irht2cMAxzockRUl04QyX/l//cxEv3W
        1371BbBydzt6gsw1RrW2HoVEDI+eQfgB9NhzmCYn0Pu0sWqCh1YYnjkN5bD9Hnue
        ho+m6R0SROdQRvrmGXqfX0F4BdYwU219F0+2eMGAVUYjZLOembUb15vY1iAgMkQr
        mhj4Pa/sO27Bd+LTO38FyR2Rgc+sc5Or+kjuCx+R+Ysch0LItTuKitNBtKIE5VKS
        fA5GJSeIwtbgRQYlusIVTjv1nq0xFaGNz8Gml2FBdUaRQEFefEFzUzY2Uo8FRyyT
        67ajHeE7iyBV779Tlmkfw==
X-ME-Sender: <xms:J8RjYhT9FkL0JP6ClaUjDo8dBxikLt9OtTzH8JiaqN2fa38iE2i9BQ>
    <xme:J8RjYqzVj7lpU1dsBuRO922PrQqCvPToKOwE7dtLHsy7g2UxIMPEs0zqakeWbgbwE
    a4q69e_1yKJ3H0Lflc>
X-ME-Received: <xmr:J8RjYm3aJlYKl1C2wc9gD_E5wovDxr9WKFHnKnS7_2OVEGEx-b-s3ZprPDlNQWxwq51vTdQvoMtdBFgpoVOYdjOeH09VxPMNY56Viow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeigdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
    teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:J8RjYpBaKL6iLAMkgXL1sLQyS1SFFA8VIDT_xl3bW37DXnvp_aDupA>
    <xmx:J8RjYqizj9EYq3QDzam9mGRzZj-6vnOfm0rPJ2IIOfyVe9l_qJd66Q>
    <xmx:J8RjYtoKXyVbmN4z1uCAw85JdvedKhI0FSS74YX8P7ixbrXwQ6DLsA>
    <xmx:KMRjYjU4pT7M001unETaN7MeTCw6w_eUMHFvtxScK1TeFsP1oNx81A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 05:17:26 -0400 (EDT)
Date:   Sat, 23 Apr 2022 11:17:24 +0200
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
Message-ID: <20220423091724.crm7szplzidutxvd@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <20220423044228.2AA7AC385A0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="477gt67q42cccsyq"
Content-Disposition: inline
In-Reply-To: <20220423044228.2AA7AC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--477gt67q42cccsyq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 09:42:26PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-08 03:41:27)
> > On Fri, Apr 08, 2022 at 11:18:58AM +0200, Jerome Brunet wrote:
> > > On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > A rate of 0 for a clock is considered an error, as evidenced by the
> > > > documentation of clk_get_rate() and the code of clk_get_rate() and
> > > > clk_core_get_rate_nolock().
>=20
> Where?
>=20
> > > >
> > > > The main source of that error is if the clock is supposed to have a
> > > > parent but is orphan at the moment of the call. This is likely to be
> > > > transient and solved later in the life of the system as more clocks=
 are
> > > > registered.
> > > >
> > > > The corollary is thus that if a clock is not an orphan, has a paren=
t that
> > > > has a rate (so is not an orphan itself either) but returns a rate o=
f 0,
> > > > something is wrong in the driver. Let's return an error in such a c=
ase.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  drivers/clk/clk.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 8bbb6adeeead..e8c55678da85 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *=
core)
> > > >             rate =3D 0;
> > > >     core->rate =3D core->req_rate =3D rate;
> > > > =20
> > > > +   /*
> > > > +    * If we're not an orphan clock and our parent has a rate, then
> > > > +    * if our rate is 0, something is badly broken in recalc_rate.
> > > > +    */
> > > > +   if (!core->orphan && (parent && parent->rate) && !core->rate) {
> > > > +           ret =3D -EINVAL;
> > > > +           pr_warn("%s: recalc_rate returned a null rate\n", core-=
>name);
> > > > +           goto out;
> > > > +   }
> > > > +
> > >=20
> > > As hinted in the cover letter, I don't really agree with that.
> > >=20
> > > There are situations where we can't compute the rate. Getting invalid
> > > value in the register is one reason.
> > >=20
> > > You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 =
- all
> > > SoCs would be affected):
> > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/clk/meson/clk-pll.c#n82
> > > Yes, PLL that have not been previously used (by the ROMCode or the
> > > bootloader) tend to have the value of the divider set to 0 which in
> > > invalid as it would result in a division by zero.
> > >=20
> > > I don't think this is a bug. It is just what the HW is, an unlocked,
> > > uninitialized PLL. There is no problem here and the PLL can remain li=
ke
> > > that until it is needed.
> >=20
> > I think the larger issue is around the semantics of clk_get_rate(), and
> > especially whether we can call it without a clk_enable(), and whether
> > returning 0 is fine.
> >=20
> > The (clk.h) documentation of clk_get_rate() mentions that "This is only
> > valid once the clock source has been enabled", and it's fairly
> > ambiguous. I can see how it could be interpreted as "you need to call
> > clk_enable() before calling clk_get_rate()", but it can also be
> > interpreted as "The returned rate will only be valid once clk_enable()
> > is called".
>=20
> I enjoy the ambiguity! :) This question has come up before and it
> doesn't really matter. Drivers can call clk_prepare_enable() if they
> want to be sure that clk_get_rate() is meaningful to them, or they can
> not.

Right, but that alone already removes the ambiguity :)

If not calling clk_enable() prior to calling clk_get_rate() is ok, then
we don't *need* to call it, both are valid.

Therefore, the "you need to call clk_enable() before calling
clk_get_rate()" interpretation isn't the right one, right?

> The CCF returns a rate that it gets from calling recalc_rate, which
> could be inaccurate for others reasons, either because some driver has
> called clk_set_rate() after the clk_get_rate()

Right, but I guess that's ok, the CCF never claimed to support atomicity
in any way. That could also be the result of a parent changing its rate,
or a reparenting, etc.

Still, it means that it was the best estimate we could do when
clk_get_rate() was called. It just turned out to be short-lived.

> or because the clk is an orphan still and clk_get() succeeded

In this case, core->parent is NULL, so we could argue that it's the same
case than clk_get_rate(NULL). It makes sense.

> or because the clk_op couldn't calculate it at the time of caching.

I guess this is what the discussion is all about, whether it's actually
something that we should find it acceptable or not.

=46rom what you're saying, it is indeed acceptable and thus clk_get_rate()
can return 0 not only from a NULL clock, but also if it's incapable of
figuring out a rate for that clock. We should thus document that
recalc_rate can indeed return 0 in such a case, and that users should
take this into account and not always expect a valid rate.

Would a documentation for recalc_rate like that:

Recalculate the rate of this clock, by querying hardware. The parent
rate is an input parameter. It is up to the caller to ensure that the
prepare_mutex is held across this call. Returns the calculated rate. If
the driver cannot figure out a rate for this clock, it must return 0.
Optional, but recommended - if this op is not set then clock rate will
be initialized to 0.

And for clk_get_rate() (in drivers/clk/clk.c):

Simply returns the cached rate of the clk, unless CLK_GET_RATE_NOCACHE
flag is set, which means a recalc_rate will be issued. Can be called if
the clock is enabled or not. If clk is NULL, or if an error occurred,
then returns 0.

Work for everyone?

> Indeed the CCF doesn't try to recalc the rate after enabling the clk.
> Maybe we should do that? It would mean that we have to schedule a work
> from the enable path to update the rate accounting outside of any
> atomic context.
>=20
> Just thinking out loud, the simpler solution is to probably drop all
> rate caching in the CCF and get the frequency on a clk_get_rate() call.

The above is just enough for me. recalc_rate returning 0 is valid, and
should be taken properly into account.

Longer term I guess it makes sense to drop the rate caching, but I've
introduced enough clock regressions already for a couple of releases :)

> It complicates some of the core though when we check to see if we need
> to update clk rates. We could have some middle ground where drivers
> indicate that they want to update their cached rate because it's valid
> now (either from their enable path or from somewhere else). This may be
> nice actually because we could have clk providers call this to force a
> recalc down the tree from where they've updated. I think the qcom
> DisplayPort phy would want this.

A good workaround for now would be to set CLK_GET_RATE_NOCACHE for those
clocks.

> >=20
> > I think the latter is the proper interpretation though based on what the
> > drivers are doing, and even the CCF itself will call recalc_rate without
> > making sure that the clock is enabled (in __clk_core_init() for example=
).
> >=20
> > Then there is the question of whether returning 0 is fine. Again
> > clk_get_rate() (clk.c) documentation states that "If clk is NULL then
> > returns 0.". This is indeed returned in case of an error condition (in
> > clk_get_rate() itself, but also in clk_core_get_rate_nolock()).
>=20
> A NULL clk isn't an error. We use NULL in the CCF to indicate that it's
> an optional clk. Returning 0 from clk_get_rate() is not an error. If
> clk_get() returns an error pointer then it's an error. And NULL isn't an
> error value per PTR_ERR() (because NULL =3D=3D 0 when casted, this isn't
> golang).

Ok. So we can either group both the "we couldn't figure out a rate" and
the "our clock is NULL" case as the same case in clk_get_rate(), or we
can convert clk_get_rate() to return signed integers and a negative
error code. The latter seems much more intrusive to me and will probably
lead to a whole bunch of regressions, so I'd be more inclined to stick
to the former. Especially since drivers seem to either don't care or
treat 0 as an error already.

Maxime

--477gt67q42cccsyq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmPEJAAKCRDj7w1vZxhR
xWgVAP0QKghBAGNcVbhjX8fksgFFZyTV2JAiUtaJm6L/7WRwWQEAunP6Qhz61tr2
jK4GG4n9tPUn4adY5YGzvDFW8QyJ4QI=
=UjIc
-----END PGP SIGNATURE-----

--477gt67q42cccsyq--
