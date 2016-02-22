Return-Path: <dinguyen@opensource.altera.com>
Message-ID: <56CB834E.4010309@opensource.altera.com>
Date: Mon, 22 Feb 2016 15:53:18 -0600
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <dinh.linux@gmail.com>, <mturquette@baylibre.com>,
	<mgerlach@opensource.altera.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: socfpga: allow for multiple parents on Arria10 periph
 clocks
References: <1456170791-22718-1-git-send-email-dinguyen@opensource.altera.com> <20160222214700.GV4847@codeaurora.org> <20160222215029.GW4847@codeaurora.org>
In-Reply-To: <20160222215029.GW4847@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

On 02/22/2016 03:50 PM, Stephen Boyd wrote:
> 
> Oops, spoke too soon:
> 
> drivers/clk/socfpga/clk-periph-a10.c:113:27: warning: incorrect type in assignment (different base types)
> drivers/clk/socfpga/clk-periph-a10.c:113:27:    expected char const *const *[assigned] parent_names
> drivers/clk/socfpga/clk-periph-a10.c:113:27:    got char const *( *<noident> )[5]
>   CC      drivers/clk/socfpga/clk-periph-a10.o
> drivers/clk/socfpga/clk-periph-a10.c: In function ‘__socfpga_periph_init’:
> drivers/clk/socfpga/clk-periph-a10.c:113:20: warning: assignment from incompatible pointer type [enabled by default]
> 

Sorry about that. V2 is inbound.

Thanks,
Dinh
