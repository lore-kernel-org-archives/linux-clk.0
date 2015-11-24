Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [PATCH v2 2/4] clk: ti816x: Add missing dmtimer clkdev entries
To: Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>
References: <56461006.5080309@baylibre.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <56542FBD.8090404@ti.com>
Date: Tue, 24 Nov 2015 11:37:01 +0200
MIME-Version: 1.0
In-Reply-To: <56461006.5080309@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: fisaksen@baylibre.com, linux-kernel@vger.kernel.org,
 Brian Hutchinson <b.hutchman@gmail.com>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 11/13/2015 06:29 PM, Neil Armstrong wrote:
> Add missing clkdev dmtimer related entries for dm816x.
> 32Khz and ext sources were missing.
>
> Cc: Brian Hutchinson <b.hutchman@gmail.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Your own sign-off should be at the top of the list, fixed this locally 
myself.

Queued for 4.4-rc-fixes, thanks.

-Tero

> ---
>   drivers/clk/ti/clk-816x.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
> index 1dfad0c..2a5d84f 100644
> --- a/drivers/clk/ti/clk-816x.c
> +++ b/drivers/clk/ti/clk-816x.c
> @@ -20,6 +20,8 @@ static struct ti_dt_clk dm816x_clks[] = {
>   	DT_CLK(NULL, "sys_clkin", "sys_clkin_ck"),
>   	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>   	DT_CLK(NULL, "sys_32k_ck", "sys_32k_ck"),
> +	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
> +	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
>   	DT_CLK(NULL, "mpu_ck", "mpu_ck"),
>   	DT_CLK(NULL, "timer1_fck", "timer1_fck"),
>   	DT_CLK(NULL, "timer2_fck", "timer2_fck"),
>


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
