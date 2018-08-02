Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47463 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbeHBMlU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Aug 2018 08:41:20 -0400
Date: Thu, 2 Aug 2018 12:50:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Rename rint to .r
Message-ID: <20180802105040.raop4rmkl6nzsbcy@verge.net.au>
References: <20180726152524.9393-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180726152524.9393-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 26, 2018 at 05:25:24PM +0200, Geert Uytterhoeven wrote:
> All other internal clock names have a period prepended.
> 
> Hence rename the internal RCLK from "rint" to ".r", and move it to the
> section where all other internal clocks are defined.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in clk-renesas-for-v4.20.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

