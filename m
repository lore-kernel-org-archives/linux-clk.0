Return-Path: <sboyd@codeaurora.org>
Date: Thu, 13 Jul 2017 10:50:21 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Burton <paul.burton@imgtec.com>,
	Maarten ter Huurne <maarten@treewalker.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 01/18] clk: ingenic: Use const pointer to clk_ops in
 struct
Message-ID: <20170713175021.GA22780@codeaurora.org>
References: <20170607200439.24450-2-paul@crapouillou.net>
 <20170702163016.6714-1-paul@crapouillou.net>
 <20170702163016.6714-2-paul@crapouillou.net>
 <20170712232037.GR22780@codeaurora.org>
 <ca4da3fa3067a7301f8fc1539e9e4362@crapouillou.net>
 <20170713114916.GA17495@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170713114916.GA17495@linux-mips.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/13, Ralf Baechle wrote:
> On Thu, Jul 13, 2017 at 12:07:25PM +0200, Paul Cercueil wrote:
> 
> > > Sorry I forgot, did you want an ack for these clk patches or for
> > > me to take them through clk tree. If it's the ack case,
> > > 
> > > Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> > > 
> > > for patches 1 through 6.
> > 
> > I think ACK; then Ralf can take them in 4.13 :)
> 
> My pull request for 4.13 is already finalized so it'd be great if this
> could make it to 4.13 through the clk tree.  If that should be impossible
> I'd like to merge this via the MIPS tree for 4.14.
> 

It's too late for v4.13, so you can take it for v4.14.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
