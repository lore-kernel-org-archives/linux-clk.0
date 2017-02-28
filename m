Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Feb 2017 00:05:58 -0800
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: core: Copy connection id
Message-ID: <20170228080558.GL25384@codeaurora.org>
References: <60d115f6c11bc51cd8bc10c64cd222c3cdb43cc7.1487596492.git.leonard.crestez@nxp.com>
 <20170224204439.GD25384@codeaurora.org>
 <1488014402.6461.3.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1488014402.6461.3.camel@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/25, Leonard Crestez wrote:
> On Fri, 2017-02-24 at 12:44 -0800, Stephen Boyd wrote:
> > On 02/20, Leonard Crestez wrote:
> > > Some drivers use sprintf to build clk connection id names but the
> > > clk
> > > core will save those strings and occasionally print them back.
> > > Duplicate
> > > the con_id strings instead of fixing all the users.
> > 
> > Good catch. What about dev_id though? That could also have the
> > same problem if some device is removed and we're still holding a
> > reference to the kobject's name. This is probably more rare than
> > what is happening here, but still seems possible that we might
> > trip over that later.
> 
> A device should normally free the clks it uses before it is destroyed.
> This means that if dev_id is pointing to freed memory then the clk
> itself was probably leaked, right?

Sure. clk_get_sys() could be called and then we could have
something sprintf the dev_id there. A quick grep doesn't show any
place where that happens though so it seems safe right now.

That said, it would be nice to clearly document that we don't
expect dev_id to be freed or changed during the lifetime of the
clk structure, but we do allow con_id to change. Perhaps the copy
shows that, but a comment would also be useful so we don't have
people wondering why dev_id isn't copied as well.

> 
> This is obvious misuse of the API, not like sprintf-ing a con_id in a
> complex driver. I don't really think it's worth copying strings for it.
> 

Ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
