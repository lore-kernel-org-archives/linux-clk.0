Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60870 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbeERJ6C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 May 2018 05:58:02 -0400
Date: Fri, 18 May 2018 11:57:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Add CR clock
Message-ID: <20180518095758.3mguoq3ufjc7fp5q@verge.net.au>
References: <1526552462-3476-1-git-send-email-geert+renesas@glider.be>
 <20180517143904.GA24534@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20180517143904.GA24534@bigcity.dyn.berto.se>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 17, 2018 at 04:39:04PM +0200, Niklas Söderlund wrote:
> Hi Geert,
> 
> Thanks for your patch.
> 
> On 2018-05-17 12:21:02 +0200, Geert Uytterhoeven wrote:
> > Add the CR core clock, which is used by the Secure Engine (SCEG).
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

