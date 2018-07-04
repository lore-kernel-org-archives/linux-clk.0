Return-Path: <avienamo@nvidia.com>
Date: Wed, 4 Jul 2018 10:51:48 +0300
From: Aapo Vienamo <avienamo@nvidia.com>
To: Peter Geis <pgwipeout@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/3] clk: tegra: refactor 7.1 div calculation
Message-ID: <20180704105148.1e32d307@dhcp-10-21-25-168>
In-Reply-To: <46bc7178-f8a4-cc4e-ebe3-507671ffb735@gmail.com>
References: <1530617721-5767-1-git-send-email-avienamo@nvidia.com>
	<46bc7178-f8a4-cc4e-ebe3-507671ffb735@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-Path: avienamo@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 3 Jul 2018 11:10:21 -0400
Peter Geis <pgwipeout@gmail.com> wrote:

> Good Morning,
>=20
> Just a heads up.
> During compilation with your patches, I get the following warning:
>=20
> In file included from ./arch/arm/include/asm/div64.h:127:0,
>                   from ./include/linux/kernel.h:174,
>                   from drivers/clk/tegra/div71.c:17:
> drivers/clk/tegra/div71.c: In function =E2=80=98div71_get=E2=80=99:
> ./include/asm-generic/div64.h:222:28: warning: comparison of distinct=20
> pointer types lacks a cast
>    (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
>                              ^
> drivers/clk/tegra/div71.c:40:2: note: in expansion of macro =E2=80=98do_d=
iv=E2=80=99
>    do_div(divider_ux1, rate);
>    ^~~~~~
>=20
> Very Respectfully,
> Peter Geis
>=20
=20
That's indeed true. Looks like this warning is produced only on 32-bit
arm as it uses a different variant of the do_div macro than arm64.

Thanks,
 -Aapo
