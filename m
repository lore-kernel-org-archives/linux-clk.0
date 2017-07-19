Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:39727 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752190AbdGSIK3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 Jul 2017 04:10:29 -0400
Date: Wed, 19 Jul 2017 10:10:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] clk: renesas: rcar-gen3-cpg: refactor accessing
 the SD div table
Message-ID: <20170719081025.wl7wsr4qnzuwbocc@ninjato>
References: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdU+Sgk_TGDqGRfOVHy6cByw1au0cBzmK_t_zTS00Fu2OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h5u3unejlp4qvrwx"
In-Reply-To: <CAMuHMdU+Sgk_TGDqGRfOVHy6cByw1au0cBzmK_t_zTS00Fu2OA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--h5u3unejlp4qvrwx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Please let me know if this is what you had in mind and if you can think of
> > other ways of testing this change.

Glad you like it :)

I forgot to mention that I checked 'clk_summary' with the different
SD card types and the applied values were as before.


--h5u3unejlp4qvrwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllvE+0ACgkQFA3kzBSg
Kbayrg//XhXW/Z/KZmAYG0UiwaOx6Bp1iUoZI1ZrfUxdH8AKoxI3DHub0ArzCGsM
6A7dTDLaFkNBLucezUnAnblgFvCpPbHiu79cHYAzkAmxvF1/EZu5t6nCG3PDnSjq
lpMFTdKbUW7pPtSp37FJe+1h+KFQVVQn8UGEiDb5UHqhjGsV85vNDuBzZw8lTYfv
uQjM7IOPbU1cUpWABvs8XRT0TDjIRKnY+A6iMWTjK9ChKAnsuU/J01H9j3u8cXZ2
iHG8Ggs7W+kwHINYMBSNWfu6V/qkYBEl9MPrzQfIBokVUoeLNcfiu6dGfP6sbEc/
tFRv54nAuTYw6exahpDO+rqkTNJD9ip9WJTeCIH3Q8trEaKwHm64BCYLcXyKq+tp
Rg4twvsKTK8HYrz8NYQVZJhvqsvzqPLkDfxK44OGbRkI9CxMEm7sdCNFwRMROjOs
JTTQ9cOHELPjNMv3HFw5T6JJhmLYzNv5nipayCW4Ak5UsRE9SJya/0bLGth3BrRq
LSxeYX02G4JXylFimNRnkYUBjxan7qijU0XDLyGlBQp1iwNd4CBOYYFX73LDk4J0
z6m3hZEWQUk0rnpBLVzbl9o3HCXPHQOgAMw1maZsHNsnuS4bamBCsviBGLZgTNPd
Ezzv7NWv4p9OD6xCL9svVj7QxteOm3dXwfncW2FYDvOIA0rirJk=
=ktb8
-----END PGP SIGNATURE-----

--h5u3unejlp4qvrwx--
