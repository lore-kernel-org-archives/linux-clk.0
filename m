Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 9 Jul 2016 10:26:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: weiyj_lk@163.com
Cc: emilio@elopez.com.ar, mturquette@baylibre.com, sboyd@codeaurora.org,
	wens@csie.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] clk: sunxi: Fix return value check in
 sun8i_a23_mbus_setup()
Message-ID: <20160709082649.GH4522@lukather>
References: <1467807707-32039-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
In-Reply-To: <1467807707-32039-1-git-send-email-weiyj_lk@163.com>
List-ID: <linux-clk.vger.kernel.org>


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 12:21:47PM +0000, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> In case of error, the function of_io_request_and_map() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgLVJAAoJEBx+YmzsjxAgaSoQALoQYvGINhSC1wyQ7qw9T9lI
BNfQZ9dIRz8wk4mIeCBxC6ro/tRFtInnGtKwJho89hDl5YHuBR4Wdvma9NLpC66p
G2zakiRcYXy0Z0d7jkBDS+YylFyFGO22HCTCH0IrYMR2ZM+DtxcE3G8wU0L0GY7y
sJgEEvap/T5ptOGctxCEpKIGsURzfhTY0IV8IKwOjvW998TDYDQYPIDwPSDYv4NY
vUnW+keI2HDfDwUNV94B3/l38Cxo5+sgJl1mE6ZqjidWnwQbOEDcxrCkzGYGTfpn
/gjvS6+BDeKnjtEm4bf4+y8/7+Agcdr6rEUJDYaCID02FXUG5zpb3SNR4HrctY41
6DPIBd6ukeXL7Gns4Onko0ebV+XutCqPqYlmW93MgriOtrnMHspkVkhIGxUA53It
Fhgto7aXck4CcURqe0kXTRdynre1Xb0L2goa9A/kZ/KgxVKdpvTjd92KpDLRv9lc
uSuHLQt5R25jX0TolfyVijQefgoPHPyowTq1+7Lc+V1xZtQchJATABsNheLnUfBv
aRZ9Kflqfgv3HJAFGyf722POXKZ1iZjj3SSBpvbbvAu3NrlMPWa/I02iNdCrZUb+
a5t5GsuCIBY47aLQ4RRQIfsfoIUavpASyx5CHFaV4rYY33S7tHLN4kaM9XNUDF21
YUZOvYKpdfNgc50ZD6/A
=2E9n
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
