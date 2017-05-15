Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:43550 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760043AbdEOJUI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2017 05:20:08 -0400
Date: Mon, 15 May 2017 11:20:01 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v7 05/13] drm/sun4i: abstract a engine type
Message-ID: <20170515092001.ik7qrqmg5pgtp2ct@flea.home>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uyxswgfiqviio6dj"
In-Reply-To: <20170514163045.40366-6-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--uyxswgfiqviio6dj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 12:30:37AM +0800, Icenowy Zheng wrote:
> As we are going to add support for the Allwinner DE2 engine in sun4i-drm
> driver, we will finally have two types of display engines -- the DE1
> backend and the DE2 mixer. They both do some display blending and feed
> graphics data to TCON, and is part of the "Display Engine" called by
> Allwinner, so I choose to call them both "engine" here.
>=20
> Abstract the engine type to a new struct with an ops struct, which contai=
ns
> functions that should be called outside the engine-specified code (in
> TCON, CRTC or TV Encoder code).
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes in v7:
> - Mention "Display Engine" for the name "engine".
> - Fixed some small issues found by Chen-Yu and added his ACK.
> Changes in v6:
> - Rebased on wens's multi-pipeline patchset.
> - Split out Makefile changes.

You also added a get_id callback here...

> +static const struct sunxi_engine_ops sun4i_backend_engine_ops =3D {
> +	.commit				=3D sun4i_backend_commit,
> +	.layers_init			=3D sun4i_layers_init,
> +	.apply_color_correction		=3D sun4i_backend_apply_color_correction,
> +	.disable_color_correction	=3D sun4i_backend_disable_color_correction,
> +};
> +

=2E.. that you don't populate ...

> @@ -477,7 +481,7 @@ static int sun4i_tcon_bind(struct device *dev, struct=
 device *master,
>  	dev_set_drvdata(dev, tcon);
>  	tcon->drm =3D drm;
>  	tcon->dev =3D dev;
> -	tcon->id =3D backend->id;
> +	tcon->id =3D sunxi_engine_get_id(engine);

=2E.. that you call to fill the TCON ID ...

> +/**
> + * sunxi_engine_get_id - Get the ID of the engine.
> + * @engine:	pointer to the engine
> + *
> + * If the ID is not necessary, just do not implement it in sunxi_engine_=
ops,
> + * and a default -1 will be returned.
> + */
> +static inline int
> +sunxi_engine_get_id(struct sunxi_engine *engine)
> +{
> +	if (engine->ops && engine->ops->get_id)
> +		return engine->ops->get_id(engine);
> +
> +	return -1;

=2E.. and will return -1 if not populated, which essentially means that
instead of having 0 or 1, we're now having -1 as our id.

This is a regression, and I'm even wondering if we can't just store
the ID in the sunxi_engine structure. Is anything preventing us to do
that, instead of using a callback?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uyxswgfiqviio6dj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZGXLAAAoJEBx+YmzsjxAgg2IQAI9v3T5SjR/OtBfDFOTdzuNv
E6V9jJj57X2yg6JA/PG7ALWsx/hePBJfXCJZ31Cmkjk/iDO1pFSa5DS52eRszUQT
1634g5aKs8sO3TGSzsmz+5Xb5rNqZXpAtZjnbakjsXhMN5jjqgbM/4n6ts6rIZfE
Q5WUFUZdh8Ua0wq/sxmTDcgaQhxttVxSFSc6aBwzaBbSyU8Qk1njfs3fwBWZilvD
D1xf03VSOmqlTTb5q7lzwnf9fB3ufUHxFc3no3diPCMM6PDettKVGODU9C2rPbNh
H22cDxQN6He5nuJAi3qfa5ZzEDJjgMY40s6FRukXpOh5PUyGE8QjZKRg4k5O5PYI
54an7VkcUcN1jwRpe/Y74SggSBDJkgxfQ9+GeCkawydEFd09/kOVPbbjSrH04mjF
DGdB7iDErMf50zxnmAiHjFdxf16BiCJv2EZEq60+XsFQc1K9GS+8vANORv23BJLq
32plwp7qtCimpA5k6uIFiiomHqfqQHk9t2e6X5xrdxJAp3HGp2/1QZbTGdv0qPiq
wVIcvShdhd2RdsPasNevKjhLgjigxjZkN/RVcV/c2kWnn2SDlc/9HO512tzmkBWO
eH57gR++NATdnrO4xfnGPYtKAkH7WhYQKSmHBVGfcUr0vhO47yBBc4yZ6d5ygSTO
KS+RHvYcZtrAAEFKozHH
=nwP+
-----END PGP SIGNATURE-----

--uyxswgfiqviio6dj--
