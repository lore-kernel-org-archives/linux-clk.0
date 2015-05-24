Return-Path: <Paul.Burton@imgtec.com>
Date: Sun, 24 May 2015 16:02:48 +0100
From: Paul Burton <paul.burton@imgtec.com>
To: Michael Turquette <mturquette@linaro.org>, Lars-Peter Clausen
	<lars@metafoo.de>
CC: <linux-mips@linux-mips.org>, Lars-Peter Clausen <lars@metafoo.de>, "Ralf
 Baechle" <ralf@linux-mips.org>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 28/37] MIPS, clk: move jz4740 UDC auto suspend
 functions to jz4740-cgu
Message-ID: <20150524150248.GQ13811@NP-P-BURTON>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-29-git-send-email-paul.burton@imgtec.com>
 <20150513030652.20636.98939@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
In-Reply-To: <20150513030652.20636.98939@quantum>
List-ID: <linux-clk.vger.kernel.org>

--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 08:06:52PM -0700, Michael Turquette wrote:
> Hi Paul,
>=20
> Quoting Paul Burton (2015-04-24 06:17:28)
> > -void jz4740_clock_udc_disable_auto_suspend(void)
> > -{
> > -       jz_clk_reg_clear_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> > -}
> > -EXPORT_SYMBOL_GPL(jz4740_clock_udc_disable_auto_suspend);
> > -
> > -void jz4740_clock_udc_enable_auto_suspend(void)
> > -{
> > -       jz_clk_reg_set_bits(JZ_REG_CLOCK_GATE, JZ_CLOCK_GATE_UDC);
> > -}
> > -EXPORT_SYMBOL_GPL(jz4740_clock_udc_enable_auto_suspend);
>=20
> I couldn't find a caller for these functions. Where and how are they
> used?
>=20
> Thanks,
> Mike

Good question. Lars?

Thanks,
    Paul

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYegYAAoJENzvn0paErs5D3wP/AhhX9azBUwBrfK8XxL5bDkN
IBTaa04qBr8wXtgQsswtViqDUP8jB2DPT+9UrH1h6HbrDHWpjc4f4ED6J4DS8Iad
5oYyJivTC6G8Te8tj6n7Bgnq56aTMtGEZqy5NL0WbCUirbFof+1+chqEDLLCNWL3
HwLVzqeC212KmPN14q+3Cif1cSSwUCr5eU01MJ7H2RCTq8BVH7wofcoTe7auebui
ai5UlvWmh7pmrtjsVZKtZkhWtcerGgEMRt4HGI4Jyea56jxJK23AOW2n8yuHL/71
tervek0i2YwM9VrjHDzEeSvJMyWRnkdHbt0N4fZ8oy1knhnqdyqJCkanwhCICmLK
qxJwvByeNc7wSEIyOpfBadXk2c0dXQrWNr2uISEumJBLpQ9sPPv2mIipZ3R1Iyga
I/ufzKf/0BXaCzCPW6MH784XKpzDgYlX7HuMAbZR39C8vjSHR7cskV3x4EGWIxA4
eSosmrNIhXlj0l/PymNGPGU0AgXvKyPRNiownJ7onPAuEXeUFP+/ciCtOrrDC+H1
o7dK5LLnv+j/Pi59tYofa3RlHmugGvTOvAjDl1+yAPqsIr1+rXRVFM0Zs0ucs16e
yC6uQx8iHoEJri1SUsx5okn4lH5CpV7feynhpJ1y74+fYa4ORRSF1IQuu472rj+q
vD6jl/8GAiuMAqdmeH58
=Rv2T
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
