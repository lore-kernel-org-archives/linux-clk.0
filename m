Return-Path: <mturquette@baylibre.com>
Date: Sun, 11 Mar 2018 15:31:58 -0700
From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 0/8] clk: helpers and fixes
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180214134340.17242-1-jbrunet@baylibre.com>
In-Reply-To: <20180214134340.17242-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Message-Id: <1520807121.n44nt5z8tk.astroid@resonance.none>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Excerpts from Jerome Brunet's message of February 14, 2018 5:43 am:
> This changset is consist of various patches I have recently sent
> for the clock framework. They are gathered here for your convinience.
>=20
> The first two changes exports helpers of the generic clocks (divider and
> mux). The goal is to avoid code duplication when writing clock driver
> derived from these generic clock drivers.
>=20
> The rest fixes various issues found in the clock framework while working =
on
> a rework of meson's clock controllers [0]

Applied to clk-helpers towards v4.17.

Regards,
Mike

>=20
> Changes since the v1s:
>  * dropped lpc32xx divider read-only patches as requested by
>    Vladimir Zapolskiy [2]
>  * Squashed generic divider read-only patches
>  * Squashed mux documentations patches
>=20
> [0]: https://lkml.kernel.org/r/20180212145846.19380-1-jbrunet@baylibre.co=
m
> [2]: https://lkml.kernel.org/r/54782a8f-9735-a574-d8e1-7ff3e9173229@mleia=
.com
>=20
> Jerome Brunet (8):
>   clk: divider: export clk_div_mask() helper
>   clk: mux: add helper function for index/value translation
>   clk: fix determine rate error with pass-through clock
>   clk: migrate the count of orphaned clocks at init
>   clk: call the clock init() callback before any other ops callback
>   clk: fix mux clock documentation
>   clk: divider: read-only divider can propagate rate change
>   clk: qcom: use divider_ro_round_rate helper
>=20
>  drivers/clk/clk-divider.c             | 58 ++++++++++++++++++---------
>  drivers/clk/clk-mux.c                 | 75 ++++++++++++++++++++---------=
------
>  drivers/clk/clk.c                     | 63 ++++++++++++++++-------------
>  drivers/clk/qcom/clk-regmap-divider.c | 20 +++-------
>  include/linux/clk-provider.h          | 23 ++++++++++-
>  5 files changed, 146 insertions(+), 93 deletions(-)
>=20
> --=20
> 2.14.3
>=20
>=20
=
