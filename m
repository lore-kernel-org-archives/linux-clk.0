Return-Path: <webczat_200@poczta.onet.pl>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs node
 is disabled
To: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
Message-ID: <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
Date: Sat, 7 Jan 2017 01:44:08 +0100
MIME-Version: 1.0
In-Reply-To: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uWE6BCvLJbUHDPIVRXm88Ht8Mrm9rVDIX"
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uWE6BCvLJbUHDPIVRXm88Ht8Mrm9rVDIX
Content-Type: multipart/mixed; boundary="BM4KFiPFFdPP2cPk6P4waiDPaVluPV7Kp";
 protected-headers="v1"
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
To: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs node
 is disabled
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
In-Reply-To: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>

--BM4KFiPFFdPP2cPk6P4waiDPaVluPV7Kp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

seems the patch works as intended.

W dniu 06.01.2017 o 13:34, Sudeep Holla pisze:
> Currently we add the virtual cpufreq device unconditionally even when
> the SCPI DVFS clock provider node is disabled. This will cause cpufreq
> driver to throw errors when it gets initailised on boot/modprobe and
> also when the CPUs are hot-plugged back in.
>=20
> This patch fixes the issue by adding the virtual cpufreq device only if=

> the SCPI DVFS clock provider is available and registered.
>=20
> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device=
")
> Reported-by: Micha=C5=82 Zegan <webczat_200@poczta.onet.pl>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/clk/clk-scpi.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
> index 2a3e9d8e88b0..96d37175d0ad 100644
> --- a/drivers/clk/clk-scpi.c
> +++ b/drivers/clk/clk-scpi.c
> @@ -290,13 +290,15 @@ static int scpi_clocks_probe(struct platform_devi=
ce *pdev)
>  			of_node_put(child);
>  			return ret;
>  		}
> -	}
> -	/* Add the virtual cpufreq device */
> -	cpufreq_dev =3D platform_device_register_simple("scpi-cpufreq",
> -						      -1, NULL, 0);
> -	if (IS_ERR(cpufreq_dev))
> -		pr_warn("unable to register cpufreq device");
> =20
> +		if (match->data !=3D &scpi_dvfs_ops)
> +			continue;
> +		/* Add the virtual cpufreq device if it's DVFS clock provider */
> +		cpufreq_dev =3D platform_device_register_simple("scpi-cpufreq",
> +							      -1, NULL, 0);
> +		if (IS_ERR(cpufreq_dev))
> +			pr_warn("unable to register cpufreq device");
> +	}
>  	return 0;
>  }
> =20
>=20


--BM4KFiPFFdPP2cPk6P4waiDPaVluPV7Kp--

--uWE6BCvLJbUHDPIVRXm88Ht8Mrm9rVDIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEE8PeJXyv9t1Bfiq63mRxoPZnIFPkFAlhwOdkbHHdlYmN6YXRf
MjAwQHBvY3p0YS5vbmV0LnBsAAoJEJkcaD2ZyBT51zgIAIXPE0I9BvTwzOeSChpy
X2kbHMCsxifxPP+08O+24G47TUUuAHp92ZxyEjSzg02V/cL6LuQv9SrvBvpSS6NE
7tKXKby2sC31byLyuX49hRhHH6XiuVmqdyS44f8t9aUfNpdtupFM1yhy+KeiqGOJ
yQUkUHm+OTbY+xYgzOlCka0Alu+dqsmPBVPy481ss+rVywY+ml1cgG5gaz+Ehaqo
s7owYQyvTXjcLRVDSwOppSwqH01i9UQMmCdCxu0iGB6U+tMJa+7WySsTP1aYWQBu
0eQY3pxGIeUJ+q0wKVIT/yn8btHzyjgkm8h3t8FHdtBeLTRUckfOnwDN72VRqtCU
iLo=
=jqqe
-----END PGP SIGNATURE-----

--uWE6BCvLJbUHDPIVRXm88Ht8Mrm9rVDIX--
