Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:60477 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752009AbdGUHUE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2017 03:20:04 -0400
Date: Fri, 21 Jul 2017 09:19:48 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 02/10] clk: sunxi-ng: Add MP_MMC clocks that support
 MMC timing modes switching
Message-ID: <20170721071948.jofji4lwbq6s4ims@flea>
References: <20170720034452.15920-1-wens@csie.org>
 <20170720034452.15920-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qsfqqpu77stq6c7r"
In-Reply-To: <20170720034452.15920-3-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--qsfqqpu77stq6c7r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 11:44:44AM +0800, Chen-Yu Tsai wrote:
> +/* Special class of M-P clock that supports MMC timing modes */
> +
> +#define SUNXI_CCU_MP_MMC_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +				       _mshift, _mwidth,		\
> +				       _pshift, _pwidth,		\
> +				       _muxshift, _muxwidth,		\
> +				       _gate, _flags)			\
> +	struct ccu_mp _struct =3D {					\
> +		.enable	=3D _gate,					\
> +		.m	=3D _SUNXI_CCU_DIV(_mshift, _mwidth),		\
> +		.p	=3D _SUNXI_CCU_DIV(_pshift, _pwidth),		\
> +		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_MMC_TIMING_SWITCH, \
> +			.hw.init	=3D CLK_HW_INIT_PARENTS(_name,	\
> +							      _parents, \
> +							      &ccu_mp_mmc_ops, \
> +							      _flags),	\
> +		}							\
> +	}
> +
> +extern const struct clk_ops ccu_mp_mmc_ops;
> +

I guess we can simplify a lot that macro, all the new-timings MMC
clocks have the same register layout.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qsfqqpu77stq6c7r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcasUAAoJEBx+YmzsjxAgix8P/3h7pXXTQUdNTXQmOI+DhMvt
JucwAJL1qtFtz4OIaFRj4dcvg/IsfbSvNJMdVH+6Rr42GFD8hi13AgwnxYmCf850
y/ClLGImMYm0stlIU0xh3NIxU3Szibjbpr4myfqbmfMHbhiyRiaTz7tFfe+Gyq6r
nPZfufGViAt7LxaGAJ6nHDyYtDNQWg9MfseiPmloshB6Y/EJoR0LHO5yejIPOX9d
AKUmOZBQwLbYJbH/XH7KaFOc8mj/E/Q0YeDR3WorgKQgim1DUCe6qqy/Ody3Q+vX
INMliqZ2iTVG04xYwKx40hIfaAXCv0a6RGoS9LwvRPMtk2ayxv7TAhD0bwhs5hCu
LYqgnuYXB+hv3K8zfAvBUpMUmS+RjTempeY9l1dVrH/VtZcf/E1YY0wjq5USsB5S
K2jFFWMbp68IXfoNWBWRZ+/PekN0mIqQSEZijDxTYtZiM9jNEhXCIKFTOqCooeXn
vQxvUKVz6wcbzihDNahGzO0iCgA6XPqRvOqBkvRehqj9M7JtELc8nfqKQpnESBms
mmN0JC2gZoSoYzcC3x0yKHP5wx9of4RcwdyFdgsH+xybieyk1ZKUS8E6IKGIgRfG
a4pVOZlzEZ08lqKfLrRxlC7MBpjy8M4AP18no0RB7gSsIkC1f/H5qHx4cQmCjHi+
J4NsGMuWivDH+dR2O9YN
=5O1J
-----END PGP SIGNATURE-----

--qsfqqpu77stq6c7r--
