Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52078 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753968AbdGNOXK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Jul 2017 10:23:10 -0400
Date: Fri, 14 Jul 2017 16:23:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix error return code in
 cpg_sd_clock_recalc_rate
Message-ID: <20170714142307.5iyfvje7pkm3b6w5@ninjato>
References: <20170713210656.31911-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="devwsyjdoctrvvw5"
In-Reply-To: <20170713210656.31911-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--devwsyjdoctrvvw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 11:06:56PM +0200, Wolfram Sang wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
> error occurs, but -EINVAL is returned. This patch fixes it.
>=20
> Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 s=
upport code")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I just saw that Kaneko-san posted this patch as well:

https://patchwork.kernel.org/patch/9688509/

Please pick his patch, I'll add my Rev-by there.


--devwsyjdoctrvvw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllo08cACgkQFA3kzBSg
KbZ6bw//ZV/byUt4Z7ASswdrcVUDNu1WP6x/eBECCAoDPoVlkKRPLqhMjozkyx+a
kIrT+mKjUqyCh1UcMwZ18UfAS0IacvmbXJcyD10bK31UQjJAe4y2OWsr3P4jqyJm
ucHXAEHxlkLGAMD+T07NxeTld38lblO1esGE0DcOgXMBbFzLhmdixH4kbYhC4WWC
dQF6KT2ZErdPA9eoVaUIyHEDECWMa9l+SwCQsKFKtLBGMUm/hi7MtA9XLgp2YRXa
j02GtCiSK5CwDopJjl0higLhMx1vGKxby+TIrk3jzP/zKys4Zj7qRXwR5dYuhZUZ
oNqXtWyTkUo4vqXBuNQgspMOlmMNUr8PxrF+F8TlFMIReC0MNDGQ3yzphKVgv831
1JHG+4vkKZP5grR7CEUYFXRz4Qu2bpDekz1YfNsiESknKE6oeNFIg0naHrQPzcBZ
bm6/AS0QAU1sM88gkwKStQALwxf4ijBLDKbQoCL/v4ClR2h60jPlmyUL9px9DTOq
QYiDAe8PvSpDCi9Lu+i8cZKWdBvwImWIvyh/jQ9/1AjiRP9VOmQlU4Ylr5mR2jJZ
m08gJhsr9Xo53ckHELKjgOx0ZfOYE8/N/f0xJ/s7KmYgGIhT/yiRrB977jpE6oBM
GSisYZXiIfXsMNKdXNkfKNf23FgLD08YgECCwud2nQwMQmvtczY=
=6fMn
-----END PGP SIGNATURE-----

--devwsyjdoctrvvw5--
