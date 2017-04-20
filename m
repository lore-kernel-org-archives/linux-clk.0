Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:43490 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S946435AbdDTOj7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2017 10:39:59 -0400
Date: Thu, 20 Apr 2017 16:39:57 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 05/11] drm/sun4i: abstract a engine type
Message-ID: <20170420143957.t4vppaeydlaeocgh@lukather>
References: <20170416120849.54542-1-icenowy@aosc.io>
 <20170416120849.54542-6-icenowy@aosc.io>
 <20170418085548.4cisone2yfcuizcp@lukather>
 <5F52665D-8A24-40D3-B84B-E8991B3BE457@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="52falea6r2qekzsn"
In-Reply-To: <5F52665D-8A24-40D3-B84B-E8991B3BE457@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--52falea6r2qekzsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 07:05:12PM +0800, Icenowy Zheng wrote:
> >> @@ -56,7 +55,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc
> >*crtc,
> >> =20
> >>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> >> =20
> >> -	sun4i_backend_commit(scrtc->backend);
> >> +	scrtc->engine_ops->commit(scrtc->engine);
> >
> >You rely on the backend having setup things properly, which is pretty
> >fragile. Ideally, you should have a function to check that engine_ops
> >and commit is !NULL, and call it, and the consumers would use that
> >function...
>=20
> If it's really NULL how should the function return?

It depends on the return code. ENOSYS if it returns an int, and simply
does nothing if it's a void. I don't think any of the current
functions return an error code at the moment though, so I'd just keep
the current behaviour and just call the function if it's set.

You cannot fail in atomic_flush anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--52falea6r2qekzsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+Mg8AAoJEBx+YmzsjxAgrCEP/0mm+8kAM9NuwW4p7aB4fCXo
PcOnhUvpRIiEaD56JE7eIBfczIZTxW45aucXBFHGVFlEmC5pMnAsUVM21LGkd+Ub
jnVuIucc5T08VekSo51y7TGa+daRWgPzkKCgQvPAJ27yS/z7lfQTXlxGxEC3a5os
gCw520/meEWKPoU/IAm4gMiAMcfXPrKuZ7lOIoOrRfdCci4mfWg6VEXNSmYsz7qv
4cXzSkidlhBehGGOCzJ9rd+7SXNzDMQBLO8SxDrlgfNPbZzLwJbHetGCX8ZEml0w
r9ElwrTH10MqfmlQOdyW5KF5gdUpbt7urkXT0hRNxnYblXuxd7hYWA0DU1t5SiiO
kzvzLdMeYoIZbYVLCWWBMh77Oj0/sulX+8xjE/wxJP/JBkozla8nwUyGPZYs/fRq
FJ6ipW36yuRgxvMJOxjdnpYVkmYlKPVp85cajze5SNbu2fC9g/fzT/TKHz+DIMrX
MJzpNjDLGG4ELVn4ChXMka0eF9F8FlzsKOXDDXuN63j8onBtHsie0JsHepP4GMmP
0kXzX6SGs7asilf0VDQRPhQIPJwT53vPSKxzJOat9W+UAHNmGCkKWOG4MIEg/KcT
hJiruiDyuFGrCAcmqaVLMUTBSXe/jStNcskQzEQiEWyiB1Lr0KGFvSiAAh1CPFAU
QvpGTMRJWSqe5sNPPyw3
=XTQO
-----END PGP SIGNATURE-----

--52falea6r2qekzsn--
