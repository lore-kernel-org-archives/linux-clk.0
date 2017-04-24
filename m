Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:51248 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1167405AbdDXJGf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2017 05:06:35 -0400
Date: Mon, 24 Apr 2017 11:06:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 09/11] ARM: dts: sun8i: add DE2 nodes for V3s SoC
Message-ID: <20170424090633.7pn46u63qzeoxjrl@lukather>
References: <20170423103754.50012-1-icenowy@aosc.io>
 <20170423103754.50012-10-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pvw7qhbjggs2ywpx"
In-Reply-To: <20170423103754.50012-10-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--pvw7qhbjggs2ywpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2017 at 06:37:52PM +0800, Icenowy Zheng wrote:
> +				tcon0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +
> +

There's one too many newline here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pvw7qhbjggs2ywpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY/cAZAAoJEBx+YmzsjxAgnxcP/3k6VMFcQOxcz5ls8ezYCvWS
m62u7knA/I9D6WsZQEVuSnaYspr++E+hsHvvFgbRvQBFkYNcNawmPWtbl83J6JTn
F2OI6CYumm64AUth0y/LJ9Q8HRyYYtxRHq9frOgp0R6jklojvO97XzLafzIzJm8D
D+jsBl6uMwjypqyQRxcVZJzH8d+YemibJR8LcNuLZ8MQKYAAa4+aUujuuKS5TxOp
T5/Hz3efitHS+gAB/e+CWShRHWPQq/W5D749iDCi9Drrifu0BORwGmihUBYG0bOd
ofCjddbVSddI19IV3Vyl4K/SxIT5yEqjMzevZ4ATAmq9cqsYe5rv2gZzZ3Y6JOuF
h1oaKijEgQ67NPgsftYnDDrUhaAcuTRDNAyTxZJeVYFWSt0BtVQXDb1lUAouGaLk
zi1xC6/vO911KGxtKr1CCiFPeAl9GeIFqFXnioYdPxiHZOgt1BjEyRfPqNfd/khB
7H4mFTGssI8J8haXAWkxxmvzPic8C0giRhtv+OlBOG0HQCorD3C/x9Z5HknANeC8
GgrJOMDaa67S7rCLTBbTMObmW9FumMcWUz2toIqWQK8zhsOu4AvgPq13NzPTqkjT
f2uGA/aXYRugOpd7/19CAWVq9gQVYSXbBKBZwU/ugjzve4sO3/OH/pfC8SruUcy6
DxH2/Odm5pI++303xI6W
=Q/yG
-----END PGP SIGNATURE-----

--pvw7qhbjggs2ywpx--
