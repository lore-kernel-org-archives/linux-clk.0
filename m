Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mleia.com ([178.79.152.223]:52421 "EHLO mail.mleia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753872AbcAHECS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 7 Jan 2016 23:02:18 -0500
Message-ID: <568F34C7.6000905@mleia.com>
Date: Fri, 08 Jan 2016 06:02:15 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
CC: linux-clk@vger.kernel.org
Subject: Re: clk: lpc32xx: add common clock framework driver
References: <20160105114452.GA31494@mwanda>
In-Reply-To: <20160105114452.GA31494@mwanda>
Content-Type: text/plain; charset=windows-1252
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Dan,

On 05.01.2016 13:44, Dan Carpenter wrote:
> Hello Vladimir Zapolskiy (and other clk devs as well),
> 
> The patch f7c82a60ba26: "clk: lpc32xx: add common clock framework
> driver" from Dec 6, 2015, leads to the following static checker
> warning:
> 
> 	drivers/clk/nxp/clk-lpc32xx.c:1019 clk_mux_get_parent()
> 	warn: signedness bug returning '(-22)'

oops, I blindly missed it, which static checker do you use by the way?

GCC and sparse haven't produced this error, may be I have to upgrade
them...

> drivers/clk/nxp/clk-lpc32xx.c
>   1003  static u8 clk_mux_get_parent(struct clk_hw *hw)
>                ^^
>   1004  {
>   1005          struct lpc32xx_clk_mux *mux = to_lpc32xx_mux(hw);
>   1006          u32 num_parents = clk_hw_get_num_parents(hw);
>   1007          u32 val;
>   1008  
>   1009          regmap_read(clk_regmap, mux->reg, &val);
>   1010          val >>= mux->shift;
>   1011          val &= mux->mask;
>   1012  
>   1013          if (mux->table) {
>   1014                  u32 i;
>   1015  
>   1016                  for (i = 0; i < num_parents; i++)
>   1017                          if (mux->table[i] == val)
>   1018                                  return i;
>   1019                  return -EINVAL;
>                         ^^^^^^^^^^^^^^
>   1020          }
>   1021  
>   1022          if (val >= num_parents)
>   1023                  return -EINVAL;
>                         ^^^^^^^^^^^^^^
> This obviously doesn't work since this is a u8 function.

Definitely, thank you for reporting.

"Negative" values may be returned here only if the driver has
another kind of error, namely if description of some mux clock parents
does not correspond to the actual hardware. It may happen due to
a typo in the code or a typo in the spec for example, but if
there is no first class error, then the underlined returns are dead
code. To my best knowledge there is no such problem in this
particular driver code.

However it is worth to mention that this piece of code is practically
a regmap version of common clock framework clk-mux.c clk_mux_get_parent()
function, which is commonly used and has the same problem spread over
multiple drivers.

Moreover talking about CCF this kind of a problem touches other
hardware querying functions:
* .is_prepared (clamped return value to bool in the framework code),
* .is_enabled (clamped return value to bool in the framework code),
* .recalc_rate (fallback to 0 seems to be a valid workaround),
* .get_parent (discussed here),
* .get_phase (this one looks okay).

I've found other potentially faulty examples from this class, e.g.

* clk_is_enabled_regmap() from qcom/clk-regmap.c -- clamped to bool,
* omap2_init_dpll_parent() from ti/clkt_dpll.c,
* mux_get_parent() from clk-qoriq.c -- fallback to index 0,
* wm831x_clkout_get_parent() from clk-wm831x.c -- fallback to index 0,
* kona_peri_clk_get_parent() from bcm/clk-kona.c -- fallback to index 0,
* etc.

> I looked at how this was called to see what we should return on error.
> This is called from __clk_init().  It tests for negative error codes.

Well, not exactly, but more or less. It is important to say that the
function (and the second user of .get_parent() __clk_init_parent) will
be significantly reworked in v4.6 (not in clk tree yet), I have started
to work on the fix on basis of that future version of clk.c.

> Ooops.  Also there is no static checker warning for that but I will
> create one.  

Sounds great, thank you in advance.

> I'm not sure what to do here.  I bet the correct thing is
> to convert all the get_parent() function to return int.

I agree with you, I'm implementing this fix now, when it is ready
I'll share the change with the CCF maintainers and the list for review.

> Another option
> might be to add documentation, but I feel like in the kernel int returns
> are self documenting and that's the best option.

Hopefully Mike and Stephen agree also, let see their comments.

Thank you again for reporting.

--
With best wishes,
Vladimir
