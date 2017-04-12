Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51598 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752650AbdDLPOG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2017 11:14:06 -0400
Date: Wed, 12 Apr 2017 08:14:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: cs2000: use existing priv_to_dev() to getting
 struct device
Message-ID: <20170412151404.GL7065@codeaurora.org>
References: <87fuhfyedq.wl%kuninori.morimoto.gx@renesas.com>
 <87efwzyebu.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87efwzyebu.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/11, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
