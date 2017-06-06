Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:52402 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751200AbdFFQar (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2017 12:30:47 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 06 Jun 2017 09:29:40 -0700
From: Stefan Agner <stefan@agner.ch>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: sboyd@codeaurora.org, shawnguo@kernel.org, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, leonard.crestez@nxp.com,
        festevam@gmail.com
Subject: Re: [PATCH] clk: imx7d: Fix the DDR PLL enable bit
In-Reply-To: <1496763954-10981-1-git-send-email-fabio.estevam@nxp.com>
References: <1496763954-10981-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <14dcf8601d35d32124df7fbbd0ccc3d5@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2017-06-06 08:45, Fabio Estevam wrote:
> Commit ad14972422899b6 ("clk: imx7d: Fix the powerdown bit location
> of PLL DDR") used the incorrect bit for the IMX_PLLV3_DDR_IMX7 case.
> 
> Fix it accordingly to avoid a kernel hang.

Yeah that sneaked in with the rename of the define between v1 -> v2,
didn't saw that sorry.

FWIW,

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/clk/imx/clk-pllv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index 0039b16..9af62ee 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -453,7 +453,7 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type
> type, const char *name,
>  		ops = &clk_pllv3_enet_ops;
>  		break;
>  	case IMX_PLLV3_DDR_IMX7:
> -		pll->power_bit = IMX7_ENET_PLL_POWER;
> +		pll->power_bit = IMX7_DDR_PLL_POWER;
>  		ops = &clk_pllv3_av_ops;
>  		break;
>  	default:
