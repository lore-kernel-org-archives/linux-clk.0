Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/7] clk: rockchip: cleanup some code duplication
Date: Mon, 09 May 2016 16:28:16 +0200
Message-ID: <1846515.jCoz32uTXP@phil>
In-Reply-To: <20160506225645.GG3492@codeaurora.org>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de> <20160506225645.GG3492@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 6. Mai 2016, 15:56:45 schrieb Stephen Boyd:
> On 04/28, Heiko Stuebner wrote:
> > This tries to generalize code paths that contain some (nearly)
> > duplicate code. While it's only a bit noticeable now for 3 different
> > plls, the effect should be more pronounced when the next pll-type
> > shows up.
> 
> Looks ok. Are you sending another pull? Or I can apply them
> directly.

I've sent a pull request with the first 3 patches of the series - see comment 
to your doubts to patch 4 and further. Also including one other fix from Doug 
as well).


Heiko
