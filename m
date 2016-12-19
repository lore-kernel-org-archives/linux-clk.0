Return-Path: <andrew.smirnov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1481703262-16668-1-git-send-email-nikita.yoush@cogentembedded.com>
References: <1481703262-16668-1-git-send-email-nikita.yoush@cogentembedded.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sun, 18 Dec 2016 23:07:50 -0800
Message-ID: <CAHQ1cqE-wF0ceMHwgRpUonkbpoCpnk8Z+8aS6rH8igsPQfxF-Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx: pllv3: support fractional multiplier on
 vf610 PLL1/PLL2
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Dec 14, 2016 at 12:14 AM, Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> On vf610, PLL1 and PLL2 have registers to configure fractional part of
> frequency multiplier.
>
> This patch adds support for these registers.
>
> This fixes "fast system clock" issue on boards where bootloader sets
> fractional multiplier for PLL1.
>
> Suggested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> CC: Chris Healy <cphealy@gmail.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
> This version restructures the patch:
> - introduce explicit structure to store mf (multiply factor) consisting of
>   integer part, numenator and denumenator;

Spelling. See my comments in the actual code below.

> - provides routines that:
>   - calculate rate based on parent rate and mf,
>   - read mf from hw,
>   - write mf to hw,
>   - calculate best mf for wanted rate;

I do see the benefit of having calculation routines since those get to
be reused in multiple places, read/write subroutines, OTOH, are used
only once, so I'd encourage you to drop them and move that code back
to where it was in v1.

If you are going to make changes to this patch, I also would like to
urge you to consider naming you calculation routines in a more
consistent fashion. Right now what you have is
clk_pllv3_vf610_mf_for_rate and clk_pllv3_vf610_calc_rate, those two
functions are symmetric in what they do, but, IMHO, that symmetricity
is not very obvious in their names. I'd suggest converting it as such
(and yes, the second one does return struct clk_pllv3_vf610_mf by
value):

static unsigned long clk_pllv3_vf610_mf_to_rate(unsigned long
parent_rate, const struct clk_pllv3_vf610_mf *mf)

and

struct clk_pllv3_vf610_mf clk_pllv3_vf610_rate_to_mf(unsigned long
parent_rate, unsigned long rate)


That all being said, those all are just my personal preferences, so
take them with a grain of salt.


> - implement recalc_rate() / round_rate() / set_rate() based on these.
>
>  drivers/clk/imx/clk-pllv3.c | 110 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk-vf610.c |   4 +-
>  drivers/clk/imx/clk.h       |   1 +
>  3 files changed, 113 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index 7a6acc3e4a92..89ab42e7d6c0 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -21,6 +21,9 @@
>  #define PLL_NUM_OFFSET         0x10
>  #define PLL_DENOM_OFFSET       0x20
>
> +#define PLL_VF610_NUM_OFFSET   0x20
> +#define PLL_VF610_DENOM_OFFSET 0x30
> +
>  #define BM_PLL_POWER           (0x1 << 12)
>  #define BM_PLL_LOCK            (0x1 << 31)
>  #define IMX7_ENET_PLL_POWER    (0x1 << 5)
> @@ -292,6 +295,110 @@ static const struct clk_ops clk_pllv3_av_ops = {
>         .set_rate       = clk_pllv3_av_set_rate,
>  };
>
> +struct clk_pllv3_vf610_mf {
> +       u32 mfi;        /* integer part, can be 20 or 22 */
> +       u32 mfn;        /* numinator, 30-bit value */

s/numinator/numerator/

> +       u32 mfd;        /* denomenator, 30-bit value, must be less than mfn */

s/denomenator/denominator/

Anyway, regardless of my comments above:

Teseted-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Regards,
Andrey Smirnov
