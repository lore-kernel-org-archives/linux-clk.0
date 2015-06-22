Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59711 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753373AbbFVXE6 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 22 Jun 2015 19:04:58 -0400
Date: Mon, 22 Jun 2015 16:04:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: h8300: Fix signness bug
Message-ID: <20150622230456.GJ22132@codeaurora.org>
References: <1434785223.6159.3.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1434785223.6159.3.camel@ingics.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/20, Axel Lin wrote:
> of_clk_get_parent_count() may return negative error code, so num_parents
> needs to be int rather than unsigned int.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

Hmph. I don't recall being Cced on this clk driver and it looks
to be in linux-next via h8300 architecture tree. This patch
should probably be squashed into the patch that introduced the
problem.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe linux-clk" in
