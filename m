Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 25 Sep 2017 12:27:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Message-ID: <20170925102744.qixfwlheeimemhcf@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
MIME-Version: 1.0
In-Reply-To: <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6737746378181053406=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6737746378181053406==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nxscyzcqnjj4fs3l"
Content-Disposition: inline


--nxscyzcqnjj4fs3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
6:10:27, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >Hi,
> >
> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
> >>=20
> >> As the thermal sensor driver is not yet implemented and some boards
> >> have still no AXP PMIC support, now only two OPPs are present --
> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
> >>=20
> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
> >> set up the device tree bits of the DVFS on Pine64.
> >
> >How has this been tested?
> >
> >What tasks did you run, with what governor, etc...
>=20
> I only tested manual frequency switching between 648MHz and
> 816MHz, and tested the PLL stuck issue by change the OPPs to
> some random value.

Ideally, we should test that it's actually reliable. Poorly chosen
OPPs might lead to corrupt data that you might not get before a while.

Please test using:
https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufreq_v=
oltage.2Ffrequency_settings

And post the report.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nxscyzcqnjj4fs3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyNofAAoJEBx+YmzsjxAgqJYP/1c9nmqaw6mmDXypmQuZuJh1
qkBbTji6a44h0XX5YBMISpevLFM9pgIT5+i9DkaZfK1AnJG6PSowsSUra7KEBnrZ
Paf9e/QDNAabVYz1ZF6SScIykYpHoJ9Ab2FVeKB50TJzvD2nOUL+kLP99iddPqSq
pcPey+q/INY1/MhgRfi7V0zJdqkKeU+VfDfoOmrSoL8HihVz2TxNfktfpaYPNgSG
409nqaKx0eOqI61YJzvsfavlJVHH+th6iO+qkJAT+JyP9aSsnjJvbjek0SNbzOgx
y1tT/QW90/I2mONbsyPdpubdZDjh0DJZKuerM1FK9CObIDjzvoXkD78ERQq5gOaV
IIV20x9a1BA9k6HO2WikSRkB71YSjLglvIItqkSdpfc6Ey0CX+VRp5WmOv5mqBwS
frXjpeZOiG5RerfUpB294GNzdwuNKJ8BcmYtT9nEmNt/ycm9z/IXzK38WXkvILzW
fY/hXbfB1TVjqjZ4rexp04z9DPF0ura61IHywplje8V0ZHavELTI1axRQsrQYYis
x0r3aos8Pgt5EL23X7yPuJdqMpXJN4y2BKt5HNvKjMBudRfBP8dS6omT8caCchbb
nJpdRbAIXd4iUco5ekT2V64sy43Ec3QNC2dOt2AzEuglWFqLFO0XFi9InzhnhGuB
vRqvNSo6aZGKesWR2ezz
=80g5
-----END PGP SIGNATURE-----

--nxscyzcqnjj4fs3l--


--===============6737746378181053406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6737746378181053406==--
