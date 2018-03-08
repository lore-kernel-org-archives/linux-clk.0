Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:45061 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755559AbeCHOgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Mar 2018 09:36:07 -0500
Date: Thu, 8 Mar 2018 15:36:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Message-ID: <20180308143603.GI3529@ulmo>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.
>=20
> Changes in v4:
> * moved locking and clock control to tegra210_clk_handle_mbist_war()
> * propagate errors during WAR execution to user
> * rework error handling tegra210_mbist_clk_init() slightly
>=20
> Changes in v3:
> * fix compile problem on non-Tegra210 platforms
> * fix clock handling bug in tegra210_generic_mbist_war()
> * addressed minor comments
>=20
> Changes in v2:
> * Use readl for fence_delay() rather than readl_relaxed
> * clarify MBIST and WAR acronyms
>=20
> Peter De Schrijver (4):
>   clk: tegra: Add la clock for Tegra210
>   clk: tegra: add fence_delay for clock registers
>   clk: tegra: MBIST work around for Tegra210
>   soc/tegra: pmc: MBIST work around for Tegra210
>=20
>  drivers/clk/tegra/clk-tegra210.c         | 357 +++++++++++++++++++++++++=
+++++-
>  drivers/clk/tegra/clk.h                  |   7 +
>  drivers/soc/tegra/pmc.c                  |   7 +
>  include/dt-bindings/clock/tegra210-car.h |   2 +-
>  include/linux/clk/tegra.h                |   6 +
>  5 files changed, 376 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqhSlAACgkQ3SOs138+
s6FS9g//UCZIZoj318gwbBMJQ7KNHEtwkRi07WNzhw/oUftfV248aBr4Rdt6fBrU
P9iF84wJAWf3OzSxHuzKGZDjELNiwk/Gsw/tv6AVDgePpqvbgzfpLvN5WXNfCqxc
09b9UUM17VHaGmjwnbk59Kn740tyHf06g+d/8WiMWab+8LZiXO86y+y93JVmsMdN
jq7gzUkfnB0OfbvCC2j2XLtQnETJLpawxeRYza9e0XW1nRkTDiDeYQNqxBaukdio
sU9XZSiB6NUW6e/brZdIbGTOVNeXreT0PtDCmr8yo07uNG5oUzIMEeB04jijf3Ln
YiN+EQyoBRWOtqcu6fI/S9655OXTTJDCbG3rP/gLDuMLVVjSwMyFo1iMjoiBY54K
Ly3ck6n1aAN9dVbJiBUsD+4o1qyxysl2/byL/R43XeeeP/7fWM46MOI3hzSnyi5z
I7URkkyGoBB8IJu7H0gHfau8PeZ8CnfGdPcHf3GO5wqdEkvpktnrfIQe9+5cOPCQ
UsK97Z+9tKrIh9Ov4s45yAxgmJggZuq7n39c6Or533UbZgvGd0i59JXm4ErkxLBa
Js54UR0zZJJ4LPjsoYArUg7Mc27ilzLWRVYd5UiIfSGpcFaM5hocenHNHgFYrXhN
tRxGeczHoZwj8FieK6/fHmMzxfYpI2kazRHLymeT+hom1vMKBIw=
=KFqc
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
