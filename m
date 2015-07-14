Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44072 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbbGNAWa (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jul 2015 20:22:30 -0400
Date: Mon, 13 Jul 2015 17:22:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: h8300: Fix signness bug
Message-ID: <20150714002228.GK30412@codeaurora.org>
References: <1434785223.6159.3.camel@ingics.com>
 <20150622230456.GJ22132@codeaurora.org>
 <CAFRkauDqtytL9xq_+pjJ3WWdYnZoSk86uMJozmOe9+Mrr7QX7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAFRkauDqtytL9xq_+pjJ3WWdYnZoSk86uMJozmOe9+Mrr7QX7w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/07, Axel Lin wrote:
> 2015-06-23 7:04 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> > On 06/20, Axel Lin wrote:
> >> of_clk_get_parent_count() may return negative error code, so num_parents
> >> needs to be int rather than unsigned int.
> >>
> >> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> >> ---
> >
> > Hmph. I don't recall being Cced on this clk driver and it looks
> > to be in linux-next via h8300 architecture tree. This patch
> > should probably be squashed into the patch that introduced the
> > problem.
> Hi Stephen,
> This driver is already in Linus' tree.
> So would you pick up this patch?
> 

Yep. Applied to clk-fixes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
