Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
MIME-Version: 1.0
To: Michael Niewoehner <linux@mniewoehner.de>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <8804658D-175F-4668-BC12-4AC439438B61@mniewoehner.de>
References: <5400BEF8-5245-4F7B-845B-D326A7BC56B5@mniewoehner.de>
 <5275855.eah07vmf4I@phil>
 <9DBF9CCE-196E-43FB-BA76-BFB4B5F47A22@mniewoehner.de>
 <10213368.VjAQGt7Kjq@phil>
 <F5234F5E-2A91-4B63-B260-3F20A4D16A9D@mniewoehner.de>
 <20150825185931.31346.26497@quantum>
 <8804658D-175F-4668-BC12-4AC439438B61@mniewoehner.de>
Message-ID: <20150827165244.30921.8929@quantum>
Subject: Re: [PATCH v3] clk: rockchip: add pclk_cpu to the list of rk3188
 critical clocks
Date: Thu, 27 Aug 2015 09:52:44 -0700
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, linus.walleij@linaro.org,
 sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Michael Niewoehner (2015-08-25 13:22:07)
> pclk_cpu needs to keep running because it is needed for devices like
> the act8865 regulator but with the recent gpio clock handling this is
> not always the case anymore. So add it to the list of critical clocks.
> 
> Signed-off-by: Michael Niewoehner <linux@mniewoehner.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Michael Turquette <mturquette@baylibre.com>

This patch applies cleanly to clk-next, so I guess the patch formatting
issues have been resolved ;-)

Note that I did NOT apply this to the clk tree, just locally for
testing.

Regards,
Mike

> ---
> Changes in v3:
> - fix git format-patch problem
> 
> Changes in v2:
> - adapt commit message
> - add Linus Walleij to recipients, as the patch is related to the gpio clock
>  change in the rockchip pinctrl driver it should go through his tree as well
> 
>  drivers/clk/rockchip/clk-rk3188.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
> index ed02bbc..f63a642 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> +++ b/drivers/clk/rockchip/clk-rk3188.c
> @@ -716,6 +716,7 @@ static const char *const rk3188_critical_clocks[] __initconst = {
>         "aclk_cpu",
>         "aclk_peri",
>         "hclk_peri",
> +       "pclk_cpu",
>  };
>  
>  static void __init rk3188_common_clk_init(struct device_node *np)
> -- 
> 2.5.0
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
