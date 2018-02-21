Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:51266 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751131AbeBUUq0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Feb 2018 15:46:26 -0500
Date: Wed, 21 Feb 2018 21:46:24 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
Message-ID: <20180221204624.khi3vjcymt77auid@katana>
References: <20180119133842.11135-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="auzqbvtazzlxmyxd"
In-Reply-To: <20180119133842.11135-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--auzqbvtazzlxmyxd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Simon,

sorry for the delay in checking this. I refreshed my memory about the
issues here this evening and will be able to do educated tests tomorrow.

However, one question already:

> - In M3N, HS400 mode and HS200 mode use the same clock setting.

a) I did not find any code handling this speciality for M3N, neither
   here nor in the SDHI driver. Did you notice something in the BSP?

b) do you know the reasons for this? Looking at the datasheet I have,
   sdsrc is 800MHz for all Gen3 SoC.

> On H3 ES1.0 / Salvator-X I do not see any problems either with or without
> this patch.

I assume this is because the speed is 200MHz instead of 400MHz. The
sdsrc clk is half speed on Salvator-X-H3-ES1.0. I hope I can confirm my
assumption tomorrow.

> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/hs400-v2

Thanks, that was useful!

Regards,

   Wolfram


--auzqbvtazzlxmyxd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqN2psACgkQFA3kzBSg
KbYASA//ZX2S8Xjx5iUrsk/OlvX/UNWGqE6yy/WErOnlyldj98TGwK3YYjOV4YgS
J1aFiSQ7bX18EpSBoRMf8xXr+JytSdlZJjTi3NQ55Z5bs89YOqedZ9ARTsPg11uz
jjU2MZ5zGKLoYgMAoJlUQFOIjPbXurPO0Fd4eKLbd7QecSxiWo/zq5RvEicR+Q4/
T1/ERfSn3W2+x8b5WUoSPEqMt14T3On8muPcQlUV3UbVz8h1GCTSld2BQgtIYucW
C1J3dA/Qhq0IzjEJs1QqSlURkrdTuGVZ6NIGtiLDcntlivDtWwRJVMtwpkEwCmiU
m/4ZATbIN0AQa87OGVIe7/THnzl0mFKE4HYQki66ir8L+U5bV5zC3GNeH3w/F/ur
s3UMolZ+cVeadetHpFSG8Un3G9Gdw30hHP7LtlzWWOOACjdzPX/Ldq3+52HnDELY
cqYS/whPXLVrMlILLqR9kH4O5+SxFgX77LlHm9Inse4LOtEMIeIRZWPzA+pYU5TE
Y3v42/HVeljfBL5WMHkjMC6Jc8rJj1kUez5lW5mWdqgj5Bqqf/ikMvt9KmFeiNla
wwrh3+nmZ/vj9MUg6xjXmkIPi23/cGs/rixgoWxCmXsmt60dFhqTYB1p2GtvPm/V
7dxL1G2iKvEfcclpHR7xmhYk9F9CZ2va/tHQ33ATFjTuxHRwuv4=
=Mlmw
-----END PGP SIGNATURE-----

--auzqbvtazzlxmyxd--
