Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/7] clk: mediatek: Make reset_control_ops const
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
 <1456393512-26602-2-git-send-email-p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Barry Song <baohua@kernel.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
 kernel@pengutronix.de
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <56CEE27D.1030206@gmail.com>
Date: Thu, 25 Feb 2016 12:16:13 +0100
MIME-Version: 1.0
In-Reply-To: <1456393512-26602-2-git-send-email-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 25/02/16 10:45, Philipp Zabel wrote:
> The mtk_reset_ops structure is never modified. Make it const.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/clk/mediatek/reset.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 9e9fe4b..309049d 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -57,7 +57,7 @@ static int mtk_reset(struct reset_controller_dev *rcdev,
>   	return mtk_reset_deassert(rcdev, id);
>   }
>
> -static struct reset_control_ops mtk_reset_ops = {
> +static const struct reset_control_ops mtk_reset_ops = {
>   	.assert = mtk_reset_assert,
>   	.deassert = mtk_reset_deassert,
>   	.reset = mtk_reset,
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
