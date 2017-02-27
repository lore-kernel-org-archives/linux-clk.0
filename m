Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 27 Feb 2017 09:25:14 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v5 1/7] arm64: allwinner: Kconfig: add essential pinctrl
 driver for H5
Message-ID: <20170227082514.54umfltn5xmdcpv3@lukather>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-2-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170226011956.53581-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3333941534658203013=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3333941534658203013==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tkxmchuhxcbqiygm"
Content-Disposition: inline


--tkxmchuhxcbqiygm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2017 at 09:19:50AM +0800, Icenowy Zheng wrote:
> H5 SoC has two pin controllers, one (in user manual called "CPUx") needs
> a slightly advanced driver, and the other (called "CPUs") is just equal
> to the on in H3, and the H3 driver can be just reused.
>=20
> Select the two necessary pinctrl drivers when building kernel for
> Allwinner SoCs.
>=20
> Also add H5 in the option's description.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm64/Kconfig.platforms | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 129cc5ae4091..81f0d6149c2e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -5,8 +5,11 @@ config ARCH_SUNXI
>  	select GENERIC_IRQ_CHIP
>  	select PINCTRL
>  	select PINCTRL_SUN50I_A64
> +	select PINCTRL_SUN50I_H5
> +	select PINCTRL_SUN8I_H3_R

Why not add those options as def_bool instead?

Being able to remove them certainly have values if you want to strip
them down.

>  	help
> -	  This enables support for Allwinner sunxi based SoCs like the A64.
> +	  This enables support for Allwinner sunxi based SoCs like the A64
> +	  and H5.

There's no point in having an ever growing list of SoCs here. You can
just remove the mention of the A64.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tkxmchuhxcbqiygm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYs+JiAAoJEBx+YmzsjxAgHIkP/AxTse0KHcrPyZwvLAC1yoyc
mrlQG8ag4wSqGODkn5X2Wf/gqjt/AX58ctlHmEsNBhAZDhhGi83op7jvZDaWcsyD
AxNoQom3iU41EMvgKSo8uS/go+1vxo4q51nBms1iW59vAHtQOPGeDvf0XOvzGndk
av8LzKjepzqkCVq/DB4leD6+6zxF0h+TkWAYrb7TkcxyjeFBFKc+z5zlIx9rXrGN
ibf08OOv5a3dodXJJZkinI7J7NSqgMwh3RvNurixdu1m0aPsLly3Zkm6YeYCIyJ8
pLQDY6DY5TQuDM6h+rHoRA21xlR8xX20r27OKiNjPL4CNdhlWzCMJDjXTXQOGF4N
g6emJfyEE71CZ9L5szwFUmuWNpMnHpt8zk+69UHmUe1aDyfERvnEZcj+2T69lXu+
uJYFOQnGuxwARJHBMjm0yOL8oKnOq/957twmVSouGuq71RedznD5rU3XmGAf2vvg
KZi84ld6e46fOm9jnMbvrQSa78Of19B2xQnnLBp+SENhR5pjMQEjOSgNF6VDKpfD
XTTgdljkd8WYcrsWA+wVjhQLF2F/9N+6qkFeYxFfbEOmsb7+QrWnJTfIU9qJWsxU
2RfzZF2+IGvby0lFpfwHucADDYPlobcFnPDF7/gUxmf+PXcmDHheBNnStcXApd+z
P6HrisqmkprhEJVaPg2j
=3Vbr
-----END PGP SIGNATURE-----

--tkxmchuhxcbqiygm--


--===============3333941534658203013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3333941534658203013==--
