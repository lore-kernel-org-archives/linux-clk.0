Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:47638 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751516AbdFGOi3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 10:38:29 -0400
Date: Wed, 7 Jun 2017 16:38:27 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Message-ID: <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nyvsidz2enc3iug6"
In-Reply-To: <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--nyvsidz2enc3iug6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 06:01:02PM +0800, Icenowy Zheng wrote:
> >I have no idea what this is supposed to be doing either.
> >
> >I might be wrong, but I really feel like there's a big mismatch
> >between your commit log, and what you actually implement.
> >
> >In your commit log, you should state:
> >
> >A) What is the current behaviour
> >B) Why that is a problem
> >C) How do you address it
> >
> >And you don't.
> >
> >However, after discussing it with Chen-Yu, it seems like you're trying
> >to have all the mixers probed before the TCONs. If that is so, there's
> >nothing specific to the H3 here, and we also have the same issue on
> >dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bit, but
> >the easiest solution would be to move from a DFS algorithm to walk
> >down the graph to a BFS one.
> >
> >That way, we would add all mixers first, then the TCONs, then the
> >encoders, and the component framework will probe them in order.
>=20
> No. I said that they're swappable, however, I don't want to
> implement the swap now, but hardcode 0-0 1-1 connection.

We're on the same page, it's definitely not what I was mentionning
here. This would require a significant rework, and the usecase is
still unclear for now.

> However, as you and Chen-Yu said, device tree should reflect the
> real hardware, there will be bonus endpoints for the swapped
> connection.

If by bonus you mean connections from mixer 0 to tcon 1 and mixer 1 to
tcon 0, then yes, we're going to need it.

> What I want to do is to ignore the bonus connection, in order to
> prevent them from confusing the code.
>=20
> If you just change the bind sequence, I think it cannot be
> prevented that wrong connections will be bound.

This is where I don't follow you anymore. The component framework
doesn't list connections but devices. The swapped connections do not
matter here, we have the same set of devices: mixer0, mixer1, tcon0
and tcon1.

The thing that does change with your patch is that before, the binding
sequence would have been mixer0, tcon0, tcon1, mixer1. With your
patch, it's mixer0, tcon0, mixer1, tcon1.

So, again, stating what issue you were seeing before making this patch
would be very helpful to see what you're trying to do / fix.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nyvsidz2enc3iug6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOA/jAAoJEBx+YmzsjxAg/1cQAKMt9w11OU12dksH5tU7Wxuz
ZbnxXAV0GVEY6AL2iNLKUBG+hYtcKRt8mm28jHod4ZH8LsYYfVJCCL4CWFNAGstX
B9ddgMl2rntonX0+3abFSUNG2BqUVvbUVOGGA7sB+ZhVz7ES2FPuig6uBK4Gtvab
Ld9b7fGRTtItLiDAfyrih4vjVNSrFe1gB2oIZKuEIihCKXRRsXq2MoQ713gFP2rh
EDS1AvhUj2SK5jGA7zcDffLoTykfKbG70s2r19PL7N8Ui1ZfX7ULYsPL1bAojKbC
teXrx7RIon4Ev2Ynoxsgqd7sllUSz11etEljxsH7mFww7gp2HBBVHOVWHE2P2BKE
kSRSkbTJC2eIMiDFgHxpyXKW6IJ2K29qurAMRHzFnTxxzZF+pZANpHbzPfxzHQpB
oqGCkTR+LaoV6nqLow5qhwHaGKOhZ0RQifmluX+g8rDMB/hKXft5Ibk6Q9AUXVTd
PD3R1f05BH0ujyA7mVlnM1qro1zYMiWY/6K/UynBOCQD+MmB2NCpabe7OSdRavob
7R33yKrYMTsYgbBEZu5Tex0FOyo3e15MzU7TgDYfrqRTrkoynS7mzQratHXh/wnA
oqGClYf7MwokhriXEqZRk3fPUcx3njyjxaZqlRMW9DZ7SfKhuV+x6qVepCfesgqQ
Kt6A7tBaUBZ3B2OJQY/S
=2ECh
-----END PGP SIGNATURE-----

--nyvsidz2enc3iug6--
