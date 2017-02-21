Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 21 Feb 2017 14:53:41 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/9] pinctrl: sunxi: rename sun7i-a20 driver to
 sunxi-a20-r40
Message-ID: <20170221225341.cknbz34xji2d3jkp@lukather>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
 <20170217173722.6477-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0467640487301676761=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0467640487301676761==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xejyx2ceqjen3e5m"
Content-Disposition: inline


--xejyx2ceqjen3e5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 18, 2017 at 01:37:15AM +0800, Icenowy Zheng wrote:
> The new R40 SoC come with a largely similar version of the pin
> controller in A20.
>=20
> Rename the driver, in order to extend it with R40 support.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

I'm not too fond of renaming this. This is going to be renamed over
and over again, will break the configurations every time.

We're not doing that for the other drivers, I'm not sure why we would
need it specifically for the pinctrl drivers.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xejyx2ceqjen3e5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMTxAAoJEBx+YmzsjxAg990P/jcRcjfRIcVpTGl1JN3L/eXG
XvX5MOlDHwhywH8pRK23RxY8Qtpm5GRNeDDrZAJdXHURQEI/r8jNIRKXTh1/zDC0
B9s1cg9kc5fLo8TBR1WIYKE91d3Zx1mnLEYwyUw1xQAdmWS9EZcnxcYDiul7/LXB
E8c/Gns+Eyf0gDPRTBJ4J5dp+M5u8BPdL0TIB1WZ2euIpujtMqG4i0jnnw4CaIDa
lha81MvctZMfoWMo9WhfE7kCEO3N5h3f02Kns9SGYUfGJhc2g50izzSrSzF4m9CI
KYhFL6ovC3wDlV7Es4eolfc0efKEuAC+k7T3fD6mlNWiFi87t49s60Xo8ZhMoBSU
RHCMTfpnwa0RSqYJGk574/KoBwWmBCjgKrPeHvcPXjYd5kczcOi5IsxQNmrji8+B
1Gm8i9l2yGhPG2vpj2QiusNSbUq+Qa/TpqIhQ25mEIHExW51PerYasCZqDheRwWF
0uCOgZnZxtrlIM82ZQMxnluiFrTdiMWTbOi44w13QO0/u4oPu4LVGkzVxepRY3ER
jc/mUSqxIMTQi2Y0fZgpyqPezx3qKnS9sl+f9kBrvS9pcw0abQ0/ZGVFKiDXy0ob
2LDCKCwQHikS969Gl+Y+tKHg7TbNVkDiVzXIsuD7m7lx2YIyIJMVgiZ7hVQWtBzj
qWdiN6VuFuzfGAVPX1fz
=fnDL
-----END PGP SIGNATURE-----

--xejyx2ceqjen3e5m--


--===============0467640487301676761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0467640487301676761==--
