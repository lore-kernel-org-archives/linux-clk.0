Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 17 Jan 2017 10:05:49 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 1/4] arm: sunxi: add support for V3s SoC
Message-ID: <20170117090549.uqwsiwmclzhx7456@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170116180116.36729-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Zepan <715805855@qq.com>,
 linux-doc@vger.kernel.org, linux-sunxi@googlegroups.com,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2072468263035632966=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2072468263035632966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dctuwbv46e3jpg3o"
Content-Disposition: inline


--dctuwbv46e3jpg3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 02:01:13AM +0800, Icenowy Zheng wrote:
> Allwinner V3s is a low-end single-core Cortex-A7 SoC, with 64MB
> integrated DRAM, and several peripherals.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v2:
> - Used linux-sunxi.org wiki hosted address of V3s datasheet.
>=20
> Note: the V3s datasheet contains its user manual.

That would be great to use User Manual in the filename rather than
datasheet then. The datasheet is something different.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dctuwbv46e3jpg3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfd5tAAoJEBx+YmzsjxAg8XsQALZGuB73kAyxf01CoC+QE7xl
n1/Snxyu+u1MIwJNNEkgERxbBXutVLJT20XAe7WUFS8D0vcGwig2/r4ejmQkbE/r
MxSkKcwomiU/w3FTvsHZTNgFRWvbpvZNfLpEG1jPU0uMJn/mp03siGERWZaWdfEI
CxIQ8Pk2lF3CTtnEq+aQwDDta14U8bLvFHjEJ/xTsU/G8CpqCD8hBEBxNpaytuJm
E9/YJLi0xQoTsMsp6pmG7Xqz8ugcUGv+n5iSU9oOrZubPxNTeHqFSPcMY3piLRaJ
aj/TQnZG0CmcdVHGc7MUSHsqblEpQ47ncjCe0Z6dEhW/kPEPbBenqsoKf62GOwIG
RaxQI4lN4Bu+V/KURO4CT5CoV0WAybuiEeIsGnm/QVs0qNQ3WRZaF4qK6NcXXDoK
nA/Jjj8yoRSpsdEBVaj8Mp46f1HfA6wh2IWH4l+hsNWV7T/uu0AFiNMOddhoFyT5
UKixblNRkLPlhJOwytkvENxgPDEti2UQ8h8qE3NiPSerF3FomB7as+5yEqdR7Y9N
oJLI6ZiZ9H6mXeAC6oVRMbgXncNSNJoFuhugZwcwirqNRYTDQEEDrCxVzpUt/FM4
ibRSOHqm4WGI75dSTtQslmrdBbG96LdkoyRG51CoWaKYo84q+hC8PUPdqBygD39P
vzzNxAS2i8I5aKt/nEtI
=67pK
-----END PGP SIGNATURE-----

--dctuwbv46e3jpg3o--


--===============2072468263035632966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2072468263035632966==--
