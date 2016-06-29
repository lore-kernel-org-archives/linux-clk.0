Return-Path: <sboyd@codeaurora.org>
Date: Wed, 29 Jun 2016 10:57:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [git pull] clk: renesas: Updates for v4.8 (take two)
Message-ID: <20160629175755.GK1521@codeaurora.org>
References: <1466690683-28949-1-git-send-email-geert+renesas@glider.be>
 <20160628233504.GH1521@codeaurora.org>
 <CAMuHMdXshxJMkHXHGo8gCujfNsqJU=LeZPjtB9tjNErKwn7_Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXshxJMkHXHGo8gCujfNsqJU=LeZPjtB9tjNErKwn7_Cg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/29, Geert Uytterhoeven wrote:
> 
> Thanks, but it seems something went wrong: commit d9cce3a8ebb871c5 is not a
> merge commit, but the combination of all 7 commits from the pull request?

Hmm... weird. I fixed it now.

> 
> > unless you really need it. Just use readl/writel directly. I
> > should put a big fat warning over those functions that they
> > shouldn't be used.
> 
> Hence all users under drivers/clk/renesas/ should be converted to readl()?

Probably.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
