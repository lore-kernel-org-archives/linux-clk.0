Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160621013022.GR1521@codeaurora.org>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
 <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com>
 <20160616004419.GQ28218@codeaurora.org> <CAPybu_3=Zm8w16_3jtKZDhoFafUz-tYcnpFJmTHT8riwjpCSpA@mail.gmail.com>
 <20160621013022.GR1521@codeaurora.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 21 Jun 2016 10:38:53 +0200
Message-ID: <CAPybu_3q1W0WG1s8J=rM1aKaF86Lv0XFp=eviPBR3fwpJcx0gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: Add new function of_clk_is_provider()
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen

On Tue, Jun 21, 2016 at 3:30 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> (Please don't top post)

Sorry about that

>
> I was thinking that of_clk_init() would mark any nodes that
> matched and provided clk providers as OF_POPULATED. That way,
> when of_platform_populate() ran, it would *not* add platform
> devices for clk providers that we registered during the
> of_clk_init() phase. Then we could have platform drivers and
> CLK_OF_DECLARE drivers for the same compatible strings, but we
> wouldn't probe random platform drivers for the nodes that we
> handled early on and we wouldn't need to litter
> of_clk_is_provider() in driver probe routines.
>

Ok, now I get it. I didn't realised that you wanted to set the flag.

I have prepared two new patches.  now setup does something like:

void __init of_fixed_factor_clk_setup(struct device_node *node)
{
        if (!_of_fixed_factor_clk_setup(node))
                  of_node_set_flag(node, OF_POPULATED);
}

If we probe this method to be valid, on a future stage I can make a MACRO like:

CLK_OF_DECLARE_PLATFORM(fixed_factor_clk, "fixed-factor-clock",
_of_fixed_factor_clk_setup, clk_unregister_fixed_factor);

That sets the flag, instantiate MODULE_DEVICE_TABLE,
builtin_platform_driver,  and does the platform_set_drvdata.....

Driver developers can choose to use CLK_OF_DECLARE_PLATFORM or CLK_OF_DECLARE


Thanks!

-- 
Ricardo Ribalda
