Return-Path: <sboyd@codeaurora.org>
Date: Tue, 9 Feb 2016 10:18:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: commit 5146e0b05963 is causing a kernel crash on SoCFPGA
Message-ID: <20160209181833.GA24167@codeaurora.org>
References: <56B9507B.9000201@kernel.org>
 <CAK7LNASSex+Nfpzp-=FGbo7eKCteamvyX_DyZaeRenhpF72ZdQ@mail.gmail.com>
 <56B9BB41.3080001@kernel.org>
 <CAK7LNASt2GodpoH7qHu6yU4RxWbi42Qy=TSW=Cr5P0NgSrBdrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNASt2GodpoH7qHu6yU4RxWbi42Qy=TSW=Cr5P0NgSrBdrQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/09, Masahiro Yamada wrote:
> 2016-02-09 19:11 GMT+09:00 Dinh Nguyen <dinguyen@kernel.org>:
> 
> >
> > Yes, .get_parent call back is define when num_parents = 1. If you take a
> > look at socfpga.dtsi, the main_pll of type "altr,socfpga-pll-clk" only
> > has 1 parent, osc1. But the periph_pll and sdram_pll, also of type
> > "altr,socfpga-pll-clk" has > 1 parents.
> 
> 
> OK. Then, I understood the cause of the problem.
> 

The patch looks good as an optimization but is there also going
to be a fix for the socfpga code? It looks like we've exposed a
bug in the implementation there.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
