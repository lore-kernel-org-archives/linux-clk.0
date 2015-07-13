Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A38710.20406@ti.com>
Date: Mon, 13 Jul 2015 12:38:24 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 34/45] clk: ti: Include clk.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-35-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-35-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/11/2015 02:33 AM, Stephen Boyd wrote:
> This clock provider uses the consumer API, so include clk.h
> explicitly.
>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/clk/ti/apll.c            | 1 +
>   drivers/clk/ti/clk-33xx.c        | 1 +
>   drivers/clk/ti/clk-3xxx-legacy.c | 1 +
>   drivers/clk/ti/clk-3xxx.c        | 1 +
>   drivers/clk/ti/clk-43xx.c        | 1 +
>   drivers/clk/ti/clk-dra7-atl.c    | 1 +
>   drivers/clk/ti/clk.c             | 1 +
>   drivers/clk/ti/clockdomain.c     | 1 +
>   drivers/clk/ti/dpll.c            | 1 +
>   drivers/clk/ti/fapll.c           | 1 +
>   10 files changed, 10 insertions(+)
>
> diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
> index 49baf3831546..671f4d89db93 100644
> --- a/drivers/clk/ti/apll.c
> +++ b/drivers/clk/ti/apll.c
> @@ -15,6 +15,7 @@
>    * GNU General Public License for more details.
>    */
>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
> diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
> index 028b33783d38..9616bcdba220 100644
> --- a/drivers/clk/ti/clk-33xx.c
> +++ b/drivers/clk/ti/clk-33xx.c
> @@ -16,6 +16,7 @@
>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk/ti.h>
>
> diff --git a/drivers/clk/ti/clk-3xxx-legacy.c b/drivers/clk/ti/clk-3xxx-legacy.c
> index 0b61548d569b..0fbf8a917955 100644
> --- a/drivers/clk/ti/clk-3xxx-legacy.c
> +++ b/drivers/clk/ti/clk-3xxx-legacy.c
> @@ -15,6 +15,7 @@
>    */
>
>   #include <linux/kernel.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk/ti.h>
>
> diff --git a/drivers/clk/ti/clk-3xxx.c b/drivers/clk/ti/clk-3xxx.c
> index 757636d166cf..5df21b258658 100644
> --- a/drivers/clk/ti/clk-3xxx.c
> +++ b/drivers/clk/ti/clk-3xxx.c
> @@ -16,6 +16,7 @@
>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk/ti.h>
>
> diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
> index 3795fce8a830..39a594c0d100 100644
> --- a/drivers/clk/ti/clk-43xx.c
> +++ b/drivers/clk/ti/clk-43xx.c
> @@ -16,6 +16,7 @@
>
>   #include <linux/kernel.h>
>   #include <linux/list.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clk/ti.h>
>
> diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
> index 19e543a32e2b..2e14dfb588f4 100644
> --- a/drivers/clk/ti/clk-dra7-atl.c
> +++ b/drivers/clk/ti/clk-dra7-atl.c
> @@ -16,6 +16,7 @@
>    */
>
>   #include <linux/module.h>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/slab.h>
>   #include <linux/io.h>
> diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
> index 64bb5e8a3b8c..7132cec33f00 100644
> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -15,6 +15,7 @@
>    * GNU General Public License for more details.
>    */
>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/clkdev.h>
>   #include <linux/clk/ti.h>
> diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
> index b82ef07f3403..41eb5d105846 100644
> --- a/drivers/clk/ti/clockdomain.c
> +++ b/drivers/clk/ti/clockdomain.c
> @@ -15,6 +15,7 @@
>    * GNU General Public License for more details.
>    */
>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/slab.h>
>   #include <linux/of.h>
> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> index 2aacf7a3bcae..74e94b9bae55 100644
> --- a/drivers/clk/ti/dpll.c
> +++ b/drivers/clk/ti/dpll.c
> @@ -15,6 +15,7 @@
>    * GNU General Public License for more details.
>    */
>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/slab.h>
>   #include <linux/err.h>
> diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
> index 730aa62454a2..f158c2ab019d 100644
> --- a/drivers/clk/ti/fapll.c
> +++ b/drivers/clk/ti/fapll.c
> @@ -9,6 +9,7 @@
>    * GNU General Public License for more details.
>    */
>
> +#include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/delay.h>
>   #include <linux/err.h>
>

