Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Mar 2016 11:22:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [git pull] clk: shmobile: Updates for v4.6 (take two)
Message-ID: <20160303192222.GX24999@codeaurora.org>
References: <1456502304-24631-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456502304-24631-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 02/26, Geert Uytterhoeven wrote:
> 	Hi Mike, Stephen,
> 
> The following changes since commit f099aa075749c6fadb79554ce175fbdc31c45d7a:
> 
>   clk: shmobile: r8a7795: Add INTC-EX clock (2016-02-18 09:01:46 +0100)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-shmobile-for-v4.6
> 
> for you to fetch changes up to a080c8c346d650c84adfd5ff16ac2160b646d73e:
> 
>   clk: shmobile: r8a7795: Add CAN FD peripheral clock (2016-02-26 12:04:30 +0100)
> 
> Summary:
>   - Fix a bug in the div6 clock driver that was exposed by CAN support
>     on R-Car H3,
>   - Add more module clocks for R-Car H3.
> 
> Thanks for pulling!

Thanks. Pulled. Please consider using a signed tag next time
though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
