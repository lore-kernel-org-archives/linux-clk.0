Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44865 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753518AbeGDG4J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jul 2018 02:56:09 -0400
Received: by mail-qk0-f195.google.com with SMTP id i188-v6so2355762qkc.11
        for <linux-clk@vger.kernel.org>; Tue, 03 Jul 2018 23:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c31c3652829e8e7064f750d219237c4eb32773e4.camel@linux.vnet.ibm.com>
References: <c31c3652829e8e7064f750d219237c4eb32773e4.camel@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Jul 2018 16:55:48 +1000
Message-ID: <CACPK8XdCue-uDh5po8cZCRoP2FszZ4bPKqXEAFeK0WOu+S7k6A@mail.gmail.com>
Subject: Re: [PATCH] clk: aspeed: Treat a gate in reset as disabled
To: Benjamin Herrenschmidt <benh@linux.vnet.ibm.com>
Cc: linux-clk@vger.kernel.org,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 3 July 2018 at 17:24, Benjamin Herrenschmidt <benh@linux.vnet.ibm.com> wrote:
> On some systems, we come out of the bootloader with some
> gates set with the clock "enabled" but the reset also
> asserted.
>
> Since 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
> we check that enabled bit in aspeed_clk_enabled(), and do
> nothing if already set.
>
> This breaks when the above scenario occurs, as the clock
> is enabled, but the reset still needs to be lifted.
>
> This patch fixes it by also checking the reset bit (if any)
> and treating a gate in "reset" as being disabled.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Fixes: 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
> CC: Eddie James <eajames@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Ben.

> ---
>  drivers/clk/clk-aspeed.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index c17032bc853a..c555eac2c528 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -212,9 +212,22 @@ static int aspeed_clk_is_enabled(struct clk_hw *hw)
>  {
>         struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
>         u32 clk = BIT(gate->clock_idx);
> +       u32 rst = BIT(gate->reset_idx);
>         u32 enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>         u32 reg;
>
> +       /*
> +        * If the IP is in reset, treat the clock as not enabled,
> +        * this happens with some clocks such as the USB one when
> +        * coming from cold reset. Without this, aspeed_clk_enable()
> +        * will fail to lift the reset.
> +        */
> +       if (gate->reset_idx >= 0) {
> +               regmap_read(gate->map, ASPEED_RESET_CTRL, &reg);
> +               if (reg & rst)
> +                       return 0;
> +       }
> +
>         regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
>
>         return ((reg & clk) == enval) ? 1 : 0;
>
