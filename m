Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] clk: rockchip: fix a typo for rockchip_rk3399_pll_set_params
Date: Sat, 12 Mar 2016 17:45:09 +0100
Message-ID: <3768709.fnQSsPk3or@diego>
In-Reply-To: <1457799962-3308-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com> <1457799962-3308-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,

Am Sonntag, 13. M=E4rz 2016, 00:26:02 schrieb Shawn Lin:
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -733,7 +733,7 @@ static int rockchip_rk3399_pll_set_params(struct
> rockchip_clk_pll *pll, /* wait for the pll to lock */
>  =09ret =3D rockchip_rk3399_pll_wait_lock(pll);
>  =09if (ret) {
> -=09=09pr_warn("%s: pll update unsucessful, trying to restore old par=
ams\n",
> +=09=09pr_warn("%s: pll update unsuccessful, trying to restore old pa=
rams\n",
>  =09=09=09__func__);
>  =09=09rockchip_rk3399_pll_set_params(pll, &cur);
>  =09}

I've folded that fix into the original pll addition [0]

Thanks for catching that
Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/commit/?h=3Dv4.7-clk/next&id=3D95e0c473a0ac1bdac25f55678dc602eb50dae=
684
