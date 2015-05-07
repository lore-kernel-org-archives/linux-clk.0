Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Thu, 7 May 2015 17:16:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
Message-ID: <20150507151649.GC25866@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-20-git-send-email-rklein@nvidia.com>
 <20150506145113.GH22098@ulmo.nvidia.com>
 <554A4D82.80307@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
In-Reply-To: <554A4D82.80307@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 01:21:06PM -0400, Rhyland Klein wrote:
> On 5/6/2015 10:51 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, May 04, 2015 at 12:37:39PM -0400, Rhyland Klein wrote:
> > [...]
> >> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-=
tegra210.c
> > [...]
> >> +static struct div_nmp plld_nmp =3D {
> >> +	.divm_shift =3D 0,
> >> +	.divm_width =3D 8,
> >> +	.divn_shift =3D 11,
> >> +	.divn_width =3D 8,
> >> +	.divp_shift =3D 20,
> >> +	.divp_width =3D 3,
> >> +};
> >=20
> > I think we need to add the SDM shift and width fields here:
> >=20
> > 	.sdm_shift =3D 0,
> > 	.sdm_width =3D 16,
> >=20
> > Otherwise pll_d can't take advantage of the fractional divider.
> >=20
> Actually, sdm_shift/width aren't used. I originally added them to handle
> SDM data, but eventually I switched to using a reg/mask combo. So this
> isn't needed.

Right, I hadn't noticed that this had changed from your earlier drafts.

Thierry

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVS4HhAAoJEN0jrNd/PrOhdA0P/iSgaOu8DgOGSm701AafETM1
u0RN45BeqIU8HGcF6t7KFh2rU3hW/SaIbL0Ug7VJQz4z9+6eZxufLPt2WUSKkt4u
d+3SkBCbtqB2EqmYT7PtRnvvITu/VQjm+xN35TgQ1/d3jGZ46euEYuVK6uftNs86
VfspzsNWuDsoM6QPKMsUhL04btR49kAzTEIMZfWqDuMJG8S8XDzNBGKqKMuYMzK8
Tjd6QeamQ6zrxEJ3/BEyGtlRe+ePLQU04ttfJHkMrBpdzO4v/uosEc5JV+7pf7yw
4zlHXWvQiMagrTfFrfcke0O2TYgPDzzuXMvz3/DDRx9PT2nvGA96cAvsyFAQICwg
Rl0G8X+DA/NODESBeLb9FbW3MxyfPXqZoucvAqGZfucl9tbImSdH5zQHTQXofVU2
N+00FyKh5us8sQrOgBk4+/gXXJ3WOJYg7Yxn3kSfdIWX2OxBL48337OBoh3ZM7Ut
/Fa426dU1lEILemQwgAKpLH1Exw6EdQbPxBYdit7mIDzF4aS8fdHXcuII2acEiSZ
ObllCghriWwLo3xhY3EJ2+6h4GnJSXZ9ZEjRKVBhPcuF7AOF2XymNgtF9WkkE8eo
VWX/aRMuYw4YJZ2F2NJRrVEzTtucfk2OjzQKDxa44Zz6eNUokrA9UfMXGB5JPEXF
auPFH6/Mm+Wrhy6uqy0E
=Bobx
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
