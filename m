Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33829 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752844AbcLEX7h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2016 18:59:37 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Walmsley <paul@pwsan.com>, Tero Kristo <t-kristo@ti.com>,
        Richard Watts <rrw@kynesim.co.uk>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Kinzer <a.kinzer@plusoptix.de>
Subject: Re: [PATCH v3] clk: ti: omap36xx: Work around sprz319 advisory 2.1
Date: Tue, 06 Dec 2016 01:59:56 +0200
Message-ID: <3238104.GnrXpa3VZc@avalon>
In-Reply-To: <20161205093649.GA31898@localhost.localdomain>
References: <1480713278-6884-1-git-send-email-laurent.pinchart@ideasonboard.com> <2239782.MNuANFihMe@avalon> <20161205093649.GA31898@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Ladislav,

On Monday 05 Dec 2016 10:36:49 Ladislav Michl wrote:
> On Mon, Dec 05, 2016 at 10:46:43AM +0200, Laurent Pinchart wrote:
> > On Monday 05 Dec 2016 09:22:10 Ladislav Michl wrote:
> [snip]
> 
> >> Table 36 list two options with 26MHz clocks: m=443, n=11 and m=480, n=12
> >> with a statement: "The choice between these two options with a 26 MHz
> >> input should be based on characterization on the end system."
> >> 
> >> Shall we care about that?
> > 
> > I'd like to, but at the moment I don't see how. Proposals are welcome :-)
> > I
> 
> One of proposals raised earlier was DT property, but that idea was scratched
> later.
> 
> > don't think addressing that issue should be a blocker to get this patch
> > merged though.
> 
> Of course not. I'd like to even see it in stable ;-)
> 
> [snip]
> 
> > I had tried that, but I find the code less readable :-S
> 
> Oh... Please reconsider (I really do not like that extra test and extra
> assignment to local variables (also I had 'precomputed' as mixed definition,
> but Tero did not quite like that)) :-)

I've tested both versions with gcc 4.7.3 [1] and 4.8.5 [2]. With 4.7.3 my 
version is 4 bytes longer, and with 4.8.5 it's 4 bytes shorter. Interestingly 
enough the "break + test after loop" pattern doesn't make a difference, it's 
only the intermediate variable that results in changes to the generated code.

[1] arm-linux-gnueabihf-gcc (crosstool-NG 
linaro-1.13.1-4.7-2013.02-01-20130221 - Linaro GCC 2013.02) 4.7.3 20130205 
(prerelease)

[2] arm-buildroot-linux-uclibcgnueabihf-gcc.br_real (Buildroot 2016.08-dirty) 
4.8.5

> Also, checked if the same values are
> written to clk as with my patch, so here's my:
> Tested-by: Ladislav Michl <ladis@linux-mips.org>

-- 
Regards,

Laurent Pinchart

