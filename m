Return-Path: <shawnguo@kernel.org>
Date: Sun, 12 Jun 2016 21:29:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, anson.huang@nxp.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/11] clk: imx: refine the powerup_set bit of clk-pllv3
Message-ID: <20160612132928.GG20243@tiger>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
 <1465396420-27064-5-git-send-email-aisheng.dong@nxp.com>
 <20160612113627.GC20243@tiger>
 <20160612121303.GE32690@shlinux2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160612121303.GE32690@shlinux2>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jun 12, 2016 at 08:13:03PM +0800, Dong Aisheng wrote:
> I understand your point.
> How about using power_bit and powerup_set?
> * @power_bit:   pll power bit offset

I'm fine with the name, but the comment should be fixed, since we are
actually using it as a bit mask instead of offset.

Shawn

> * @powerup_set: set power_bit to power up the PLL
