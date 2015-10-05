Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39010 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbJESK7 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 5 Oct 2015 14:10:59 -0400
Date: Mon, 5 Oct 2015 11:10:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] Add driver for the si514 clock generator chip
Message-ID: <20151005181057.GC12338@codeaurora.org>
References: <1442487891-20477-1-git-send-email-mike.looijmans@topic.nl>
 <1443770129-7757-1-git-send-email-mike.looijmans@topic.nl>
 <20151002191804.GS12338@codeaurora.org>
 <56121372.6040109@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <56121372.6040109@topic.nl>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/05, Mike Looijmans wrote:
> ﻿On 02-10-15 21:18, Stephen Boyd wrote:
> >On 10/02, Mike Looijmans wrote:
> >>This patch adds the driver and devicetree documentation for the
> >>Silicon Labs SI514 clock generator chip. This is an I2C controlled
> >>oscillator capable of generating clock signals ranging from 100kHz
> >>to 250MHz.
> >>
> >>Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >>---
> >
> >Applied to clk-next. We can handle any stuff about assigned rates
> >in a follow up patch.
> >
> >Also, I squashed in this for some cleanup.
> >
> >diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
> >index 779aebcd884b..6af7dce54241 100644
> >--- a/drivers/clk/clk-si514.c
> >+++ b/drivers/clk/clk-si514.c
> >@@ -16,7 +16,6 @@
> >   * GNU General Public License for more details.
> >   */
> >
> >-#include <linux/clk.h>
> 
> Interesting - I only added this include because of your comment:
> "I'd expect some sort of linux/clk.h include here if we're using
> clk APIs."
> 
> Could you elaborate on that, I'm confused now...
> 

The driver is only using the clk provider APIs that are in
clk-provider.h, because you removed the part that was calling
clk_set_rate() (which is a clk consumer API). So before that
change we would have needed the clk.h include, but now it
compiles fine without it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
