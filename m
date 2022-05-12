Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A625EC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 08:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351784AbiELIyb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 04:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351696AbiELIxw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 04:53:52 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC8162134
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 01:53:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 26C305C0174;
        Thu, 12 May 2022 04:53:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 12 May 2022 04:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652345630; x=1652432030; bh=jRRueRTseH
        IEoYyor53AFbsdWKwjwDqqSyrG4DRd5R8=; b=QW46sflIOBvpg8w8pxzjzEy2k3
        ZGvq3mwZgKdjWKw6dxicwF+8n+WjDgLOq02g3ps5ZBWvHVsJ+Z3p5GhPlX1T6JZu
        SR/yS7BbNzZAvRd5gt8pNM+lWLgD1MXXL4J4+xslInpfX6f4YtVHqN6JuvwaPTs2
        25Kh3dB0GEjZXMB+/y0J8yrM8i7wrh4RNpArB+FeAHTZj4am/plkFfyK2Aldjn/f
        /rRX++jBHNtDIa9eFpVsqCC+llhuJrZPv84JxjesP+YIxukyxa4r9xLVJkHh3qqp
        C84dEziz1/yZ9TzeNdikF1d3C9VRGWm/2hRxssbEOhJ86ZX+Lq25WEfEJgwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652345630; x=
        1652432030; bh=jRRueRTseHIEoYyor53AFbsdWKwjwDqqSyrG4DRd5R8=; b=e
        aRtfsFRXmqBC4ahsoEJyeDg8T3hggyVtYm0P2orhrTHLisXo5amXiEWfi1UqY0dT
        moanI4+KYTGnxdL0hpTjqChfyjr0j2cNfz/9/ZA+emfAhpmdgQjCoCVn+GHHnGTi
        BCLJF7Qv6eP41YGsVTE3UiYgLlFRZizUgJFGsNg8MJxUvS9lusK6k/hPmWrr4/W5
        gW7kGWA7f+Rtlh1RQLMFu1UySY3s+gTbjvCnUy77Jv7uORFma6FdxAszrH601tb+
        BxGv0pb9tLUv8T4jTotTpCkWtUDzrf7gpBRpnAi6z279x0B2NHRKbYDbI8nelsBQ
        +bUDEmByVem14j3to8Tgw==
X-ME-Sender: <xms:Hct8YhQVhxiroC9i1MXCexGwmj3BAv91HvQGSjGqVG-mbqDwVyEjsQ>
    <xme:Hct8YqwN2tyT8VWseXTAfTfsxJRcgi5WMV1eML1P3eBCq3auMQzIwLPjD0p6poPqO
    o9OzsPffJh8g1bCL7U>
X-ME-Received: <xmr:Hct8Ym2yEKvzlwaniKHfdhzm2luPWOvXob3haRkujdYxsV1uHI3MXU5gc3sVqIKVAYHGeAZAaHmcYmehwgMWIwA_1xfuuEoVca3wfu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
    vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Hct8YpBSyR0ZDmaFl6yplz4N84K0ZZMFi0Viq5SEFKILaMbPkIVd_Q>
    <xmx:Hct8YqhL6cerIEKJsDd1OlUYpdGAzJ_2F9r2htDtQy7oaNarWgv7vA>
    <xmx:Hct8YtrCFKiOt9c6TBhKxPWtTQ2xi8K33ocTH45KSwpzORWIudOR3Q>
    <xmx:Hst8YhpAKSAxDOt_cha9-I3eezVuKu-m8dgy1aWpo1y_s65xZsFHQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 04:53:48 -0400 (EDT)
Date:   Thu, 12 May 2022 10:53:47 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ivan Ivanov <iianov@suse.de>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Message-ID: <20220512085347.lu3cyeiitfsgaljn@houat>
References: <20220428065743.94967-1-iivanov@suse.de>
 <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
 <20220510133019.h2urxj3feponfuku@houat>
 <6066bd9d-b53b-0a91-7440-98244c2d55c2@i2se.com>
 <20220512075737.mpipy7rmixwfwpyl@houat>
 <EA46E084-07A4-4BC9-B9FB-A64102F03867@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xw6evx5hsu6dr6c2"
Content-Disposition: inline
In-Reply-To: <EA46E084-07A4-4BC9-B9FB-A64102F03867@suse.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--xw6evx5hsu6dr6c2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 11:10:00AM +0300, Ivan Ivanov wrote:
> Hi,
>=20
> > On 12 May 2022, at 10:57, Maxime Ripard <maxime@cerno.tech> wrote:
> >=20
> > On Wed, May 11, 2022 at 08:10:50AM +0200, Stefan Wahren wrote:
> >> Am 10.05.22 um 15:30 schrieb Maxime Ripard:
> >>> Hi,
> >>>=20
> >>> On Tue, May 10, 2022 at 01:20:18PM +0000, Guillaume Gardet wrote:
> >>>> May I ask what's the status/plan of  this patch series?
> >>> As far as I know it hasn't been merged yet.
> >>>=20
> >>>> It seems it has not been merged yet, and I know we are a bit late in
> >>>> the 5.18 schedule, but I think this is a good fix for 5.18.
> >>> Fix for what? I don't think this series fix any bug?
> >>=20
> >> This seems to be a "fix" for the Frankenstone scenario: mainline kerne=
l +
> >> vendor DT
> >=20
> > Did we ever support this?
> >=20
> > I don't think we did, so even though it can be nice to improve that
> > situation, I don't think it's worth sending this to stable
>=20
> Yes, maybe not stable material, but considering support for devices
> which are shipped with upstream Linux and vendor device tree blobs,
> saved somewhere on them, should be pretty normal to expect, right?

Not really?

If the vendor in question uses a binding that has never been reviewed,
accepted, and supported by upstream, then I don't see what upstream
should be doing to accommodate for that situation?

Maxime

--xw6evx5hsu6dr6c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnzLGwAKCRDj7w1vZxhR
xchRAPwMuapKuWMfzPeS0Wn02MmuMUaUPT+AaH3Gr0R+lcOmkwEArqnFnVqQOW69
NWUAtYhUSv7emVzbHJ2unk8vqCJVtQI=
=busC
-----END PGP SIGNATURE-----

--xw6evx5hsu6dr6c2--
