Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1520542640-9185-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com> <1520542640-9185-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Mar 2018 16:10:01 +1030
Message-ID: <CACPK8Xcx4P2kF8ryg=-WgZjjkVo3uzv+G2JGPiZiU3UGWV+4yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: aspeed: Fix is_enabled for certain clocks
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, Lei YU <mine260309@gmail.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 9, 2018 at 7:27 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Some of the Aspeed clocks are disabled by setting the relevant bit in
> the "clock stop control" register to one, while others are disabled by
> setting their bit to zero. The driver already uses a flag per gate  to
> identify this behavior, but doesn't apply it in the clock is_enabled
> function.
>
> Use the existing gate flag to correctly return whether or not a clock
> is enabled in the aspeed_clk_is_enabled function.
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Fixes: 6671507f0fbd ("clk: aspeed: Handle inverse polarity of USB port
1 clock gate")

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>  drivers/clk/clk-aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 9f7f931..1687771 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -259,11 +259,12 @@ static int aspeed_clk_is_enabled(struct clk_hw *hw)
>  {
>         struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
>         u32 clk = BIT(gate->clock_idx);
> +       u32 enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>         u32 reg;
>
>         regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
>
> -       return (reg & clk) ? 0 : 1;
> +       return ((reg & clk) == enval) ? 1 : 0;
>  }
>
>  static const struct clk_ops aspeed_clk_gate_ops = {
> --
> 1.8.3.1
>
