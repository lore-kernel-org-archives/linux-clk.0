Return-Path: <sboyd@codeaurora.org>
Date: Thu, 15 Oct 2015 11:02:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151015180240.GF4558@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
 <20151014170922.3027008a@free-electrons.com>
 <20151014182138.GD26883@codeaurora.org>
 <20151015102243.79d9e5ce@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151015102243.79d9e5ce@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/15, Thomas Petazzoni wrote:
> 
> Applied on top of 4.3-rc5, this patch fixes the problem for me, without
> any change to the Device Tree files.
> 
> It's probably the easiest option for 4.3. Do you want me to submit a
> patch, or will you apply it directly to your clk tree?

I've already applied it to clk-fixes, I'll send it off tomorrow
or the next day.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
