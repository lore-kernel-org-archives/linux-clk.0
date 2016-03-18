Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 18 Mar 2016 18:47:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mason <slash.tmp@free.fr>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160318174720.GP30977@lukather>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
 <20160303191604.GW24999@codeaurora.org>
 <20160304152711.GR8418@lukather>
 <20160304171841.GF24999@codeaurora.org>
 <20160308221320.GI8418@lukather>
 <20160315221601.GJ25972@codeaurora.org>
 <56E91EA4.7030603@free.fr>
 <20160316203018.GQ25972@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tm6VLls/w6NsRApE"
In-Reply-To: <20160316203018.GQ25972@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--Tm6VLls/w6NsRApE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2016 at 01:30:18PM -0700, Stephen Boyd wrote:
> On 03/16, Mason wrote:
> > On 15/03/2016 23:16, Stephen Boyd wrote:
> > >=20
> > > Applied to clk-next.
> >=20
> > For the record, I will state again that I find it quite sub-optimal
> > to resort to dynamic allocation for small temporary pointer arrays.
> >=20
> > A fortiori when one considers that getting the patch right required
> > several attempts.
> >=20
>=20
> Feel free to send the patch and then we can discuss and test. For
> the record, I was waiting for Maxime or Chen-Yu to speak up if
> they would prefer that approach, but nothing happened. Usually
> patches spur discussions better than comments.

Yeah, I don't really care about which solution you choose, as long as
it makes LLVM happy.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Tm6VLls/w6NsRApE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW7D8oAAoJEBx+YmzsjxAg2P4QAIJG1bA1YwlGLuNqI5xGRKYf
F0ZDDul6nAnz00sa4Fl4lHuggMCNB43BF0HVSRU2NgfvhVnDHNS8fulyTlu+hP7D
z8YKIOcZDYY5J64rPt3HJoqtxx/uLwe0G/5yiABcRGfdVy9Pmtfp5sVvYWV4t6Yc
OrHnWsYy/+DZBIJV/0v5bQ13Hcgjs7GzsihJUnw8EIbCXUzZnHmrMPQIXJqFCzi/
Y8IaWIVfv+JdJIcDNHcJHDYg9SfNW+a5f4bIm/pCSdviUmDvxQsPksJknP033MUY
8tLLXm/SwZo0GvecWR+omcUDnwYmPA/xs40H/ckqfjLr7TCjhhjoOCOWp5kw9Ks0
QCnSOzVLI/wbJdJ4AiXrHkwRmhNg2wVaYwjc4D/AxUcIM57Pc1V482Vgok3iAujd
CIPa9uO2EA4ihi/pv+hBEdz4S3LWQO4dxXZm0UYmniiR6shgQA2pzfOCFi9dPbZb
mBWzdQx0DEn4nZCHgKYDU0kL3QlsOsPLGMSz0rqMMxmzBYvNSbfyL0y2y4rROYjq
vUoZmtF7TM5b48rwzhRrGFrfUtQBdQV9R/G2pU+p26PVcQ5gYDaxMv/wW65VQHUY
LMsiYHOMNMPmdX8JYn+6mU/5A2Hog9IU9IiwuhHEt8Qm4bnscHKGIgfbIBtxvJad
/X73glOB8ldfkVVQUrAr
=gZ82
-----END PGP SIGNATURE-----

--Tm6VLls/w6NsRApE--
