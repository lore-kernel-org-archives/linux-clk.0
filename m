Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Aug 2016 16:15:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Marcin Wojtas <mw@semihalf.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com,
 sebastian.hesselbarth@gmail.com, andrew@lunn.ch, jason@lakedaemon.net,
 gregory.clement@free-electrons.com, nadavh@marvell.com, alior@marvell.com,
 tn@semihalf.com, jaz@semihalf.com
Subject: Re: [PATCH 2/2] clk: mvebu: dynamically allocate resources in
 Armada CP110 system controller
Message-ID: <20160830161532.0770bdff@free-electrons.com>
In-Reply-To: <1471933609-8456-3-git-send-email-mw@semihalf.com>
References: <1471933609-8456-1-git-send-email-mw@semihalf.com>
	<1471933609-8456-3-git-send-email-mw@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Tue, 23 Aug 2016 08:26:49 +0200, Marcin Wojtas wrote:
> Original commit, which added support for Armada CP110 system controller
> used global variables for storing all clock information. It worked
> fine for Armada 7k SoC, with single CP110 block. After dual-CP110 Armada 8k
> was introduced, the data got overwritten and corrupted.
> 
> This patch fixes the issue by allocating resources dynamically in the
> driver probe and storing it as platform drvdata.
> 
> Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system ...")

Adding:

CC: <stable@vger.kernel.org>

here would be useful.

> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>

Other than that:

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 (on Armada 8K hardware)
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks a lot for fixing the crap that I initially wrote :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
