Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 Feb 2016 13:50:29 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: dinh.linux@gmail.com, mturquette@baylibre.com,
	mgerlach@opensource.altera.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: socfpga: allow for multiple parents on Arria10
 periph clocks
Message-ID: <20160222215029.GW4847@codeaurora.org>
References: <1456170791-22718-1-git-send-email-dinguyen@opensource.altera.com>
 <20160222214700.GV4847@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160222214700.GV4847@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/22, Stephen Boyd wrote:
> On 02/22, dinguyen@opensource.altera.com wrote:
> > From: Dinh Nguyen <dinguyen@opensource.altera.com>
> > 
> > There are some Arria10 clocks of type "altr,socfpga-a10-perip-clk" that can
> > have multiple parents. Fix up the __socfpga_periph_init() to call
> > of_clk_parent_fill() that will return the appropriate number of parents.
> > 
> > Also, update __socfpga_gate_init() to call of_clk_parent_fill() helper
> > function.
> > 
> > Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> > ---
> 
> Applied to clk-next
> 

Oops, spoke too soon:

drivers/clk/socfpga/clk-periph-a10.c:113:27: warning: incorrect type in assignment (different base types)
drivers/clk/socfpga/clk-periph-a10.c:113:27:    expected char const *const *[assigned] parent_names
drivers/clk/socfpga/clk-periph-a10.c:113:27:    got char const *( *<noident> )[5]
  CC      drivers/clk/socfpga/clk-periph-a10.o
drivers/clk/socfpga/clk-periph-a10.c: In function ‘__socfpga_periph_init’:
drivers/clk/socfpga/clk-periph-a10.c:113:20: warning: assignment from incompatible pointer type [enabled by default]


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
