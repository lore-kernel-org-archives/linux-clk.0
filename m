Return-Path: <mturquette@baylibre.com>
Date: Sun, 11 Mar 2018 18:28:35 -0700
From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: update cached phase to respect the fact when setting
 phase
To: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, Stable
	<stable@vger.kernel.org>
References: <1520491781-132529-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1520491781-132529-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Message-Id: <1520818089.ojh5tew3kt.astroid@resonance.none>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Excerpts from Shawn Lin's message of March 7, 2018 10:49 pm:
> It's found that the final phase set by driver doesn't match that of
> the output from clk_summary:
>=20
> dwmmc_rockchip fe310000.dwmmc: Successfully tuned phase to 346
> mmc0: new ultra high speed SDR104 SDIO card at address 0001
>=20
> cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
> sdio_sample	0        1        0    50000000 0 0
>=20
> It seems the cached core->phase isn't updated after the clk was
> registered. So fix this issue by updating the core->phase if setting
> phase successfully.
>=20
> Fixes: 9e4d04adeb1a ("clk: add clk_core_set_phase_nolock function")
> Cc: Stable <stable@vger.kernel.org>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Applied to clk-phase towards v4.17.

Regards,
Mike

> ---
>=20
>  drivers/clk/clk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0f686a9..617e562 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2309,8 +2309,11 @@ static int clk_core_set_phase_nolock(struct clk_co=
re *core, int degrees)
> =20
>  	trace_clk_set_phase(core, degrees);
> =20
> -	if (core->ops->set_phase)
> +	if (core->ops->set_phase) {
>  		ret =3D core->ops->set_phase(core->hw, degrees);
> +		if (!ret)
> +			core->phase =3D degrees;
> +	}
> =20
>  	trace_clk_set_phase_complete(core, degrees);
> =20
> --=20
> 1.9.1
>=20
>=20
>=20
=
