Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 17:04:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
	linux-sh@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Greg Ungerer <gerg@uclinux.org>, linux-clk@vger.kernel.org,
	Russell King <linux@arm.linux.org.uk>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wan ZongShun <mcuos.com@gmail.com>, Steven Miao <realmz6@gmail.com>,
	adi-buildroot-devel@lists.sourceforge.net,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-m68k@lists.linux-m68k.org, Simon Horman <horms@verge.net.au>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	John Crispin <blogic@openwrt.org>,
	Eric Miao <eric.y.miao@gmail.com>, Ryan Mallon <rmallon@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-renesas-soc@vger.kernel.org,
	Hartley Sweeten <hsweeten@visionengravers.com>
Subject: Re: [PATCH v2] clk: let clk_disable() return immediately if clk is
 NULL or error
Message-ID: <20160416000443.GA26353@codeaurora.org>
References: <1459821083-28116-1-git-send-email-yamada.masahiro@socionext.com>
 <20160408003328.GA14441@codeaurora.org>
 <CAK7LNASW+D0B_k97r__AZeYDR5UqNPqn_j1aoQepHz-bGgV2ng@mail.gmail.com>
 <20160414003341.GH14441@codeaurora.org>
 <CAK7LNARbzRLq_NGWJ8CFBBf6w4cVGCNh45fo6JO=+F7FACBSxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAK7LNARbzRLq_NGWJ8CFBBf6w4cVGCNh45fo6JO=+F7FACBSxA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/14, Masahiro Yamada wrote:
> 
> OK, now I notice another problem in my code;
> if foo_clk_init() fails for reason [2],
> clk_disable() WARN's due to zero enable_count.
> 
> if (WARN_ON(core->enable_count == 0))
>          return;
> 
> 
> 
> Perhaps, I got screwed up by splitting clock init stuff
> into a helper function.

Yep! Can't we just split the enable/disable out into another
function separate from the clk_get/put part? That would make
things more symmetric and avoid this problem.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
