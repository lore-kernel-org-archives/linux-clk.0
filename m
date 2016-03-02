Return-Path: <treding@nvidia.com>
Date: Wed, 2 Mar 2016 15:55:51 +0100
From: Thierry Reding <treding@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Rhyland Klein
	<rklein@nvidia.com>
Subject: Re: [PATCH 17/41] clk: tegra: Remove CLK_IS_ROOT
Message-ID: <20160302145550.GC2316@ulmo.nvidia.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-18-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1456858826-28541-18-git-send-email-sboyd@codeaurora.org>
Return-Path: treding@nvidia.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
List-ID: <linux-clk.vger.kernel.org>

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 11:00:02AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
>=20
> Cc: Rhyland Klein <rklein@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/tegra/clk-audio-sync.c  |  2 +-
>  drivers/clk/tegra/clk-dfll.c        |  1 -
>  drivers/clk/tegra/clk-tegra-fixed.c |  6 ++----
>  drivers/clk/tegra/clk-tegra114.c    |  3 +--
>  drivers/clk/tegra/clk-tegra20.c     | 10 ++++------
>  5 files changed, 8 insertions(+), 14 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1v72AAoJEN0jrNd/PrOhxugP/iF7bHG4zgLp6s5sumjhEkbX
DYcnucqSI5L1nV838Xj6zfDlvAakaklHaQLpAy9H26KrEfHzf2eErVC3MZStTR56
I6JeNlceHYfDzS6TalGUaL+9ir/erhkKGCzt8ngHiP+JfYx3uPJm/ET2GESk8rJm
pPpfAS2dGupprZfYgkJWHZ1RpfddHoV+C/a90nxFQw2swjxT5opo1jIJDym/SNBs
KmKqMUtzoc6Nr9iZBJxx9qrpzu6rOD7Vwn4Fdky4AagUMFmJFflQD5eDRxXAr+XL
PedCBuiyAlqVaobcL4E8P0ewxRlrctzMBcCZSb7855lRKOBArGh8U7aM0CFukN5t
ac3uGUNMZpHEkmk0433CovhHGqPto76D1fD8+rjVAc6Gx3JxcMsi/gXuE/hLyeun
bmAIs8H5SJC4a4XGTOrOiu60xEg+PJp21F42VjmN+0LVxv5DeHYd5+WuCEdNmAJI
cQW94OSAwTxbC/P0W1Nb4Vk0X8266gmVjfrwQS7bs1zxZCFHmg4iPI9eNtaemV4j
XGmEjv4ao2GdtHTnk8MLQ/75m/lLzjL9TVmr4TtEk4rqQ5GqEiKqqtqDIa/FbQKH
/xnLwWq2l+GvbQHKvOSaAa94/eSXY9F+LhpK6tpgxmSPMnq+9/61Bis9BjsrwB0C
zz9XtUKyPwPqFe90oKGh
=gVtQ
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
