Return-Path: <sboyd@codeaurora.org>
Date: Fri, 30 Oct 2015 12:10:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mason <slash.tmp@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	clk <linux-clk@vger.kernel.org>, Rob Herring <robh@kernel.org>,
	Marc Gonzalez <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH v4] clk: tango4: clkgen driver for Tango4 platforms
Message-ID: <20151030191024.GE19782@codeaurora.org>
References: <562A5506.2070402@sigmadesigns.com>
 <20151029005658.GA19782@codeaurora.org>
 <563361B8.7090300@sigmadesigns.com>
 <20151030162925.GC19782@codeaurora.org>
 <5633BB93.7010701@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5633BB93.7010701@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/30, Mason wrote:
> On 30/10/2015 17:29, Stephen Boyd wrote:
> 
> > You should add sigma to the vendor prefix file
> > Documentation/devicetree/bindings/vendor-prefixes.txt
> > 
> > Send that patch to the DT maintainers (Rob has been applying
> > most vendor prefix patches).
> 
> Hmmm, Mans took care of that a month ago... Did the patch fall
> through the cracks perhaps?
> 
> http://thread.gmane.org/gmane.linux.kernel/2052776
> 
> Should I be looking in Rob's tree?
> https://git.kernel.org/cgit/linux/kernel/git/robh/linux.git/
> 

Probably to both questions.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
