Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50020 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbcDTSkx (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Apr 2016 14:40:53 -0400
Date: Wed, 20 Apr 2016 11:40:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: Add Oxford Semiconductor OXNAS Standard
 Clocks
Message-ID: <20160420184044.GJ15324@codeaurora.org>
References: <1460973696-5977-1-git-send-email-narmstrong@baylibre.com>
 <1460973696-5977-2-git-send-email-narmstrong@baylibre.com>
 <20160419212944.GF15324@codeaurora.org>
 <57174151.8040806@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <57174151.8040806@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/20, Neil Armstrong wrote:
> On 04/19/2016 11:29 PM, Stephen Boyd wrote:
> > On 04/18, Neil Armstrong wrote:
> >> +		struct clk_oxnas *_clk;
> >> +
> >> +		if (!clk_oxnas_init[i].clk_init)
> >> +			continue;
> > 
> > New design is fine, really it's up to you, but then this check
> > isn't needed anymore, right?
> > 
> 
> it's not needed for sure, but do I need to send a v3 to remove this ?
> 

No worries. I'll remove these two lines while applying.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
