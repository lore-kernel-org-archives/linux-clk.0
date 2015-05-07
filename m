Return-Path: <horms@verge.net.au>
Date: Thu, 7 May 2015 14:31:44 +0900
From: Simon Horman <horms@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Takashi Yoshii <takasi-y@ops.dti.ne.jp>,
	Magnus Damm <damm@opensource.se>
Subject: Re: [PATCH 09/19] clk: emev2: Silence sparse warnings
Message-ID: <20150507053144.GA7072@verge.net.au>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
 <1430897996-11597-10-git-send-email-sboyd@codeaurora.org>
 <20150507043607.GI28846@verge.net.au>
 <20150507051724.GA32399@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150507051724.GA32399@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 06, 2015 at 10:17:24PM -0700, Stephen Boyd wrote:
> On 05/07, Simon Horman wrote:
> > On Wed, May 06, 2015 at 12:39:46AM -0700, Stephen Boyd wrote:
> > > drivers/clk/shmobile/clk-emev2.c:37:14: warning: symbol 'smu_base' was not declared. Should it be static?
> > > 
> > > Cc: Takashi Yoshii <takasi-y@ops.dti.ne.jp>
> > > Cc: Magnus Damm <damm@opensource.se>
> > > Cc: Simon Horman <horms+renesas@verge.net.au>
> > > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > 
> > Acked-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > Stephen, I'm assuming that you or Mike will merge this.
> 
> Yep we'll take this series through clk-next. Thanks.

Great, thanks.
