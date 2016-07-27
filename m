Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 08:43:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] clk: sunxi-ng: mux: Increase fixed pre-divider div
 size
Message-ID: <20160727064344.GB6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-4-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
In-Reply-To: <1469516671-19377-4-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:25PM +0800, Chen-Yu Tsai wrote:
> Some clocks have a predivider value that is larger than what u8 can
> store. One such example is the OUT clk found on A20/A31, which has
> a /750 pre-divider on one of the osc24M parents.
>=20
> Increase the size of the div field to u16.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmFggAAoJEBx+YmzsjxAg3aoQALlJruhYRF9x4Yh2OMW3pUFj
rQ9XRQ4E7wps9CF3jUkhSkmBvb5rEpO02OQPMpjC2wV7SJZ7PbdiOlLFbBJ71KtZ
m2dcsfLLmrwaf6+k5aSHbInOBQz9okQA2IqRM3/6M1n8SXIb/MfDd1CAkEQS3NLx
kiNuOwqFdfQVOu40S/IiBZETSPOLgDbnFhJhpd6lCUzk5sK8C1dEyKPLcgLDRE1P
LMZTqwAYS9tE+tIEzlSy8D2YYNKwWCh2UKPY9e8Ez3RfHDSiQ9/zyczFgBaiINqK
Q8OtJ2bNppuAtUD8kj6ZBmTZx9iA+2/PmHCrDsEp2f49kaCtnouHj28HI4DD+drI
B80+qX7Vpm2oTONlPMo/8lNHrCdBYW32oo8UaUjGCRPKUB+5saT2bMnP29ZRD6ql
jT4S8XfwqzjbzwiPFC/+Y2bCY0uKKgJeewwKJJRWkayxfAQfuB6Q+xlYNgp5gGsl
LBiaKlQYl7CL1+rSjZ2VgWFCbcDQbOGiPkfqS8nHP/QzAAswUx+PFZo8we12eId0
FYIWvDbUHSeOTXT4XbUYrVKsr+aHOY8jXuEIoSKPqn5+11EOAvEnqSjslT66BxSJ
+2yir/H7HkMHMB26Ps9he3hux7fJkDo+HqZLum3LApvNCVuymwlSAIwNcm2Ao8yh
TPkwVJNXg8mfscPNS5hv
=m+NG
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
