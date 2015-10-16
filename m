Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jisheng Zhang <jszhang@marvell.com>, ulf.hansson@linaro.org,
 sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com,
 mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 sboyd@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1444628796-5484-6-git-send-email-jszhang@marvell.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Jisheng Zhang" <jszhang@marvell.com>
References: <1444628796-5484-1-git-send-email-jszhang@marvell.com>
 <1444628796-5484-6-git-send-email-jszhang@marvell.com>
Message-ID: <20151016124732.20687.35929@quantum>
Subject: Re: [PATCH 5/5] clk: berlin: bg2: remove CLK_IGNORE_UNUSED flag for sdio clk
Date: Fri, 16 Oct 2015 05:47:32 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jisheng Zhang (2015-10-11 22:46:36)
> The axi clock properties already exists, so there's no need to set this
> flag for sdio0 and sdio1 clk any more.
> =

> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Applied to clk-next.

Regards,
Mike

> ---
>  drivers/clk/berlin/bg2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/berlin/bg2.c b/drivers/clk/berlin/bg2.c
> index 73153fc..23e0e3b 100644
> --- a/drivers/clk/berlin/bg2.c
> +++ b/drivers/clk/berlin/bg2.c
> @@ -490,8 +490,8 @@ static const struct berlin2_gate_data bg2_gates[] __i=
nitconst =3D {
>         { "usb0",       "perif",        11 },
>         { "usb1",       "perif",        12 },
>         { "pbridge",    "perif",        13, CLK_IGNORE_UNUSED },
> -       { "sdio0",      "perif",        14, CLK_IGNORE_UNUSED },
> -       { "sdio1",      "perif",        15, CLK_IGNORE_UNUSED },
> +       { "sdio0",      "perif",        14 },
> +       { "sdio1",      "perif",        15 },
>         { "nfc",        "perif",        17 },
>         { "smemc",      "perif",        19 },
>         { "audiohd",    "audiohd_pll",  26 },
> -- =

> 2.6.1
>=20
