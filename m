Return-Path: <wsa@the-dreams.de>
Date: Tue, 28 Aug 2018 22:51:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/11] clk: renesas: use SPDX identifier for Renesas
 drivers
Message-ID: <20180828205134.3bmxpeex5d3la2f6@katana>
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com>
 <20180821220233.9202-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWcrpzit40X_z_hJrCSgupnnucPF0nciPiAiJP8EOX+TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rkq5zhg47yznmgpf"
In-Reply-To: <CAMuHMdWcrpzit40X_z_hJrCSgupnnucPF0nciPiAiJP8EOX+TA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--rkq5zhg47yznmgpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Any specific reason you skipped all other files in that directory?

In the first batch, I only worked on files where 'git grep' returned
success on somthing like '(c).*Renesas'. In a later batch, I wanted to
work on Renesas specific directories.


--rkq5zhg47yznmgpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluFtdEACgkQFA3kzBSg
KbYFyQ/8Dp/bfqlHVUcnwpC982Up9FAPDJKHj1br6UCzV9sheqU4eq3KkdVw8scs
Oz6olEAIYP+egqh3PVpy1XVDb8146btFla9PLt0v7/8zrJNUKUU0Wjm6QZaWMMaT
iHse7ub7oK2UfpTuTB9+fvzeu1B70SMUTAwWVxrzwG5RybM/HeUUUv5paSwT6fSi
IB8VKDGphK3IQ0K/qndbAC5V7huK+4Av5wlrT7P1A7EOyLnxCMa9YUUcVjE2zktd
k8kVlbs0uM/zpTuB7yShXugJQVvDUk6uenKmfgmxC9vRMAMoIGJmzFadnmnZyIac
uegytGCsM08EWZ4RIyJU6HKI5gxbA4I8Reaji203vO4HmH9YJsf50DdUaMSRMy/+
q+1uZ3YgkMwKNMqlVxbCwBUapoWOLgky0lLOBTaC24T3HHGDtPBX+6yz6UI/Rwtx
ARAf663APOsGlkrz5QJWvIsILDVznFECLied+L6JcZwX9G5b3bQIDyS5qcFRb5EZ
QH20AXWugMC+g4oIQsKrJA8MmJ3CozirZDhHJyDuTAkmRYzLQp7PoWFdsUotxeDF
DJOeNMBCNDVPR9uIjl1/XfEXNDF1h9aom3MZQHyUsoJ8fL0Y/MKBXw5noZueOa1T
oXsY9HkTy2MSw+mAK1xrPj6QFVOTFZI2gbXRu5puhCBFHeilVAM=
=1x73
-----END PGP SIGNATURE-----

--rkq5zhg47yznmgpf--
