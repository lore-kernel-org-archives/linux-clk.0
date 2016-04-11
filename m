Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49105 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191AbcDKWEH (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2016 18:04:07 -0400
Date: Mon, 11 Apr 2016 15:04:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: Add Oxford Semiconductor OXNAS Standard Clocks
Message-ID: <20160411220405.GC14441@codeaurora.org>
References: <1459520791-13269-1-git-send-email-narmstrong@baylibre.com>
 <1459520791-13269-2-git-send-email-narmstrong@baylibre.com>
 <20160402005045.GX18567@codeaurora.org>
 <5701210A.4060807@baylibre.com>
 <20160407233113.GI18567@codeaurora.org>
 <570BADE3.8080201@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <570BADE3.8080201@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/11, Neil Armstrong wrote:
> On 04/08/2016 01:31 AM, Stephen Boyd wrote:
> > On 04/03, Neil Armstrong wrote:
> >> On 04/02/2016 02:50 AM, Stephen Boyd wrote:
> > 
> > Ok. I was hoping that we could make simple-mfd look to see if
> > there's a syscon and then attach it to the parent device, but it
> > seems that simple-mfd is not actually a driver and it might not
> > even make a parent device for the children nodes?
> > 
> 
> It seems so, I will look at the device hierarchy next week.
> Syscon is only used by these syscon_node_to_regmap() or similar calls, and they are the only APIs available.
> 
> This call is at least used by clk-mtk, nxp and at91 clocks, is there a plan for these to change to another API ?

No plans. I'm just complaining.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
