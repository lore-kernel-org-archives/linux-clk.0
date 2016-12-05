Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:49522 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751427AbcLEJgz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2016 04:36:55 -0500
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23992009AbcLEJgvRy4L0 (ORCPT <rfc822;linux-clk@vger.kernel.org>
        + 1 other); Mon, 5 Dec 2016 10:36:51 +0100
Date: Mon, 5 Dec 2016 10:36:49 +0100
From: Ladislav Michl <ladis@linux-mips.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Walmsley <paul@pwsan.com>, Tero Kristo <t-kristo@ti.com>,
        Richard Watts <rrw@kynesim.co.uk>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Kinzer <a.kinzer@plusoptix.de>
Subject: Re: [PATCH v3] clk: ti: omap36xx: Work around sprz319 advisory 2.1
Message-ID: <20161205093649.GA31898@localhost.localdomain>
References: <1480713278-6884-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <20161205082210.GA2901@localhost.localdomain>
 <2239782.MNuANFihMe@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2239782.MNuANFihMe@avalon>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Laurent,

On Mon, Dec 05, 2016 at 10:46:43AM +0200, Laurent Pinchart wrote:
> Hi Ladislav,
> 
> On Monday 05 Dec 2016 09:22:10 Ladislav Michl wrote:
[snip]
> > Table 36 list two options with 26MHz clocks: m=443, n=11 and m=480, n=12
> > with a statement: "The choice between these two options with a 26 MHz input
> > should be based on characterization on the end system."
> > 
> > Shall we care about that?
> 
> I'd like to, but at the moment I don't see how. Proposals are welcome :-) I 

One of proposals raised earlier was DT property, but that idea was scratched
later.

> don't think addressing that issue should be a blocker to get this patch merged 
> though.

Of course not. I'd like to even see it in stable ;-)

[snip]
> I had tried that, but I find the code less readable :-S

Oh... Please reconsider (I really do not like that extra test and extra
assignment to local variables (also I had 'precomputed' as mixed definition,
but Tero did not quite like that)) :-) Also, checked if the same values
are written to clk as with my patch, so here's my:
Tested-by: Ladislav Michl <ladis@linux-mips.org>

Best regards,
	ladis
